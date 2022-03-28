-- B) 

-- Restrição de integridade de chave (singularidade).
-- A chave primária 30003 já existe.
INSERT Programador (id_programador, nome_programador, genero, data_nascimento, email) values
	(30003,'José Victor','M', '1997-01-16', 'jvncruz@mail.com');
    
-- Restrição de integridade de domínio
-- no campo genero está ocupando mais memória do que já estava definido na criação da tabela programador
INSERT Programador (id_programador, nome_programador, genero, data_nascimento, email) values
	(30009,'José Victor','Masculino', '1997-01-16', 'jvncruz@mail.com');

-- Restrição de integridade de vazio (null).
-- no campo de email da tabela programador foi definido com not null ou seja ele não pode ser nulo
INSERT Programador (id_programador, nome_programador, genero, data_nascimento, email) values
	(30009,'José Victor','Masculino', '1997-01-16');

-- Restrição de integridade referencial.
-- ao tentar referênciar a coluna id_startup = 10009 onde o id_programador = 30009 nenhuma alteração foi feita pois 
-- o id_startup = 10009 e o id_programador = 30009 não foi inserido
UPDATE Programador SET id_startup = 10009 WHERE id_programador = 30009;
