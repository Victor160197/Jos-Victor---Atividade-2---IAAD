-- 2)
-- A) Retornar os nomes de todos(as) funcionários(a) que possuem dependente(s) do gênero/sexo feminino.
SELECT DISTINCT F.Pnome, F.Unome
FROM FUNCIONARIO AS F
JOIN DEPENDENTE AS D
ON D.Fcpf = F.Cpf
WHERE D.Sexo = 'F';

-- B) Retornar os nomes de todos(as) funcionários(as) que são supervisionados diretamente por Jorge.
SELECT F.Pnome
FROM FUNCIONARIO AS F
WHERE F.Cpf_supervisor = '88866555576';

-- C) Retornar os nomes dos gerentes dos departamentos localizados em São Paulo.
SELECT D.Dnome
FROM DEPARTAMENTO AS D
JOIN LOCALIZACAO_DEP AS LD
ON LD.Dnumero = D.Dnumero
WHERE LD.Dlocal = "São Paulo";

-- D) Retornar os nomes dos funcionários do departamento “Administração” que trabalham entre 15 e 35 horas por semana no projeto “NovosBenefícios”.
SELECT F.Pnome, F.Unome 
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON D.Dnumero = F.Dnr -- chave primaria = chave estrangeira
JOIN TRABALHA_EM AS TE
ON TE.Fcpf = D.Cpf_gerente
JOIN PROJETO AS P
ON P.ProjNumero = TE.Pnr
WHERE D.Dnome = 'Administração' AND 15 <= TE.Horas <= 35 AND P.Projnome = 'Novosbenefícios';

-- E)Inserir na tabela "dependente” as informações abaixo, em seguida executar novamente o comando da letra A e apresentar o novo resultado.
INSERT INTO DEPENDENTE values
	('98765432168', 'Fernanda','F', '1975-08-03', 'Filha');	
SELECT DISTINCT F.Pnome, F.Unome FROM FUNCIONARIO AS F
JOIN DEPENDENTE AS D
ON D.Fcpf = F.Cpf
WHERE D.Sexo = 'F';

-- F)Modificar o cpf do gerente do departamento Administração para '99988777767', bem como a data de início da gerência para 01/03/2022. Em seguida, criar outro comando que modifique o salário de Alice, adicionando 80% ao salário informado.
UPDATE DEPARTAMENTO
SET Cpf_gerente = '99988777767',
	Data_inicio_gerente = '2022/03/01'
WHERE Dnumero = 4;

UPDATE FUNCIONARIO
SET Salario = Salario + (Salario * 0.8)
WHERE Cpf = '99988777767';

-- G)Modificar o supervisor do funcionário Fernando para o cpf 55689742328.Explique a violação de integridade que ocorre ao executar esse comando.
UPDATE FUNCIONARIO
SET Cpf_supervisor = '55689742328'
WHERE Cpf = '33344555587';
-- Ocorreu um erro pois aconteceu uma violação da integridade referencial onde não se pode alterar por uma chave que não exista na tabela pai.

-- H) Deletar as informações do funcionário Ronaldo da tabela “funcionario”.Explique a violação de integridade que ocorre ao executar esse comando.
DELETE FROM FUNCIONARIO
WHERE Cpf = '66688444476'; 
 -- Essa questão viola a integridade de entidade pois ao deletar a informação do funcionário Ronaldo ocorreu um erro pois ele esta trabalhando em um projeto com a sua chave primaria em uso 
 
 -- I) Deletar as informações do funcionário Ronaldo da tabela “trabalha_em”. Explique por que não ocorre violação de integridade ao executar esse comando.
 DELETE FROM TRABALHA_EM
 WHERE Fcpf = '66688444476';
-- Dessa vez o erro não aconteceu por que ao invés de ter tentado deletar essa numa coluna onde não é sua tabela de origem agora foi deletado na tabela pai na qual é a sua tabela de origem.
 
 -- J) Após remoção das informações do funcionário Ronaldo da tabela “trabalha_em”, deletar novamente as informações do funcionário Ronaldo da tabela “funcionario”.Explique por que dessa vez não ocorreu violação de integridade
 DELETE FROM FUNCIONARIO
 WHERE Cpf = '66688444476'; 
 -- Pois o funcionario não está mais utilisando a sua chave primaria na tabela TRABALHA_EM.
 
 -- K)
ALTER TABLE FUNCIONARIO
ADD telefone VARCHAR(20);
-- O tipo de dado que eu escolheria seria VARCHAR pela facilidade na questão da manipulação e consulta

-- L) Discuta as vantagens e desvantagens do uso das seguintes chaves primárias:
-- Chave Natural (exemplo: coluna CPF da tabela “funcionario”).
-- Chave Gerada ou Substituta ou Artificial (do inglês: Surrogate Key) (exemplos: colunas “Dnumero” da tabela “departamento”; coluna “id_programador” (com autoincremento) da tabela Programador)

-- Em grande parte das situações, é dificil saber que elas são as melhores aternativas em todas as situações. 
-- Chaves artificiais possuem a maior vantagem por serem basicamente imunes a variações de negócio.Em contrapartida, 
-- o uso de chaves naturais normalmente economiza joins  o que faz com que otimize situações performáticas. 
-- Normalmente a perda de desempenho por conta de um JOIN é algo tratável através de índices, 
-- views indexadas, etc.
