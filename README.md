# Jos-Victor---Atividade-2---IAAD
## Modelo de Dados Relacional; Restrições de Integridade; Introdução à SQL Atividade prática utilizando o Banco de Dados Relacional MySQL


### Universidade Federal Rural de Pernambuco
### Departamento de Estatística e Informática - DEINFO
### Bacharelado em Sistemas de Informação
### Disciplina: Introdução ao Armazenamento e Análise de Dados - IAAD
### Professora: Roberta Macêdo Marques Gouveia

Modelo de Dados Relacional; Restrições de Integridade; Introdução à SQL
Atividade prática utilizando o Banco de Dados Relacional MySQL
Estudante (nome completo): José Victor Nascimento da Cruz


QUESTÃO 1 (5,0 PONTOS)
Considere as seguintes restrições de integridade: 
O atributo “data_nascimento” é do tipo DATE, e o “gênero” é do tipo CHAR(1). O tipo (também conhecido como domínio) dos demais atributos pode ser escolhido livremente.
A data de nascimento e e-mail do(a) programador(a) não pode ser nula. 
O e-mail do(a) programador(a) tem que ser único, ou seja, não podem ter dois ou mais programadores(as) com o mesmo e-mail cadastrado.
Nenhuma linguagem de programação pode ser excluída caso exista algum(a) programador(a) associado(a) a ela. 
Ao excluir um (ou mais) programador(a), as informações sobre as linguagens em que ele(ela) programa devem ser excluídas automaticamente.
Ao alterar o código de uma startup, todos(as) os(as) programadores(as) que estão associados(as) a este código devem ter seus códigos de startup atualizados automaticamente.

A) Apresente o link (google drive ou github) contendo o script SQL com as instruções/comandos de criação das 4 tabelas ilustradas na Figura 1, considerando as restrições de integridade (itens I a VI) impostas ao banco de dados Startup. Lembre-se de especificar as chaves primárias e estrangeiras das tabelas.
Observação: no script deve constar também a carga (inserção dos dados) do BD Startup. 
Dica: para implementar as restrições III a VI devem ser utilizadas as ações de disparo referencial 'on delete' e/ou 'on update'.

B) Com base no estado do banco de dados Startup da Figura 1, apresente exemplos de comandos SQL (podendo ser inserção, remoção ou atualização) que violem as cinco restrições de integridade elencadas abaixo, e dessa forma constate que a referida restrição está sendo aplicada corretamente pelo SGBD. (Atenção: deverão constar 5 comandos SQL, isto é, um comando para cada restrição.)
Restrição de integridade de chave (singularidade).
Restrição de integridade de entidade.
Restrição de integridade de domínio.
Restrição de integridade de vazio (null).
Restrição de integridade referencial.
(observação: a restrição de integridade semântica (regras de negócio) só será abordada na atividade 3, com o uso de gatilhos (trigger) e  procedimentos armazenados (stored procedures)).

C) Especifique as consultas em SQL indicadas abaixo e apresente as tabelas resultantes: 
Listar o nome de cada programador(a) e o nome da respectiva startup em que ele(ela) trabalha.
Listar o nome e data de nascimento (no formato dd/mm/aaaa) de cada programadora cadastrada no BD Startup (apenas gênero feminino).
Listar os nomes dos(as) programadores(as) que programam em Python e JavaScript.
Listar os nomes dos(as) programadores(as) que programam em PHP e nasceram entre 1980 e 1990.
Listar os nomes dos(as) programadores(as) vinculados à startup “BSI Next Level” que tem menos de 30 anos.
Para cada startup cuja cidade sede inicia com a letra 'A', listar o nome da startup e os nomes dos programadores que atuam na startup.



QUESTÃO 2 (5,0 PONTOS)
Considere o banco de dados relacional Empresa, cujo script (arquivo “Script_Empresa.sql”) para criação e carga do referido banco encontra-se disponível no Classroom, no Guia de Estudos das Semanas 03 e 04. A figura 3.6 (página 48) do livro “Sistemas de Banco de Dados - 6ª Edição” ilustra o estado do BD Empresa. 
Especifique os comandos SQL abaixo e apresente as tabelas resultantes:


A) Retornar os nomes de todos(as) funcionários(a) que possuem dependente(s) do gênero/sexo feminino.
B) Retornar os nomes de todos(as) funcionários(as) que são supervisionados diretamente por Jorge.
C) Retornar os nomes dos gerentes dos departamentos localizados em São Paulo.
D) Retornar os nomes dos funcionários do departamento “Administração” que trabalham entre 15 e 35 horas por semana no projeto “NovosBenefícios”.
E) Inserir na tabela "dependente” as informações abaixo, em seguida executar novamente o comando da letra A e apresentar o novo resultado.
Fcpf:
98765432168
Nome_dependente:
Fernanda
Sexo:
F
Datanasc:
03/08/1975
Parentesco:
Filha

	
F) Modificar o cpf do gerente do departamento Administração para '99988777767', bem como a data de início da gerência para 01/03/2022. Em seguida, criar outro comando que modifique o salário de Alice, adicionando 80% ao salário informado.
G) Modificar o supervisor do funcionário Fernando para o cpf 55689742328. 
Explique a violação de integridade que ocorre ao executar esse comando.
H) Deletar as informações do funcionário Ronaldo da tabela “funcionario”. 
Explique a violação de integridade que ocorre ao executar esse comando.
I) Deletar as informações do funcionário Ronaldo da tabela “trabalha_em”. 
Explique por que não ocorre violação de integridade ao executar esse comando.
J) Após remoção das informações do funcionário Ronaldo da tabela “trabalha_em”, deletar novamente as informações do funcionário Ronaldo da tabela “funcionario”.
Explique por que dessa vez não ocorreu violação de integridade.
K) Adicionar o atributo Telefone na tabela “funcionario”. Que tipo/domínio (numérico ou caracter/alfanumérico, tais como: int, varchar, char etc.) é mais apropriado para definir o atributo telefone? Justifique!
L) Discuta as vantagens e desvantagens do uso das seguintes chaves primárias:
Chave Natural (exemplo: coluna CPF da tabela “funcionario”).
Chave Gerada ou Substituta ou Artificial (do inglês: Surrogate Key) (exemplos: colunas “Dnumero” da tabela “departamento”; coluna “id_programador” (com autoincremento) da tabela Programador)




