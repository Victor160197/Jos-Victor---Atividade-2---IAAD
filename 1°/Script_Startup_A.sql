-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 
-- O comando 'create database' é semelhante ao comando 'create schema'

begin;
-- Criando a Base de Dados
CREATE SCHEMA startupVictorNascimento;

USE startupVictorNascimento;

-- Criação da tabela Startup
CREATE TABLE Startup(
	id_startup INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_startup VARCHAR(15),
	cidade_sede VARCHAR (15));
-- Aplicando auto incremento da chave primária    
ALTER TABLE Startup AUTO_INCREMENT=10001;

-- Populando a tabela Startup
INSERT INTO Startup (nome_startup, cidade_sede) VALUES
	('Tech4Toy','Porto Alegre'),
	('Smart123','Belo Horizonte'),
	('knowledgeUp','Rio de Janeiro'),
	('BSI Next Level','Recife'),
	('QualiHealth','São Paulo'),
	('ProEdu','Florianopolis');	

-- FIM DA CRIAÇÃO DA TABELA STARTUP --

-- Criação da tabela Linguagem_programacao
CREATE TABLE Linguagem_Programacao(
	id_linguagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_linguagem VARCHAR(15),
	ano_lançamento VARCHAR (15),
	UNIQUE(nome_linguagem));
    
-- Aplicando auto incremento das chaves primárias
ALTER TABLE Linguagem_Programacao AUTO_INCREMENT=20001;

-- Populando a tabela linguagem_programacao
INSERT INTO Linguagem_Programacao (nome_linguagem, ano_lançamento) VALUES
	('Python', '1991'),
    ('PHP', '1995'),
    ('Java', '1995'),
    ('C', '1972'),
	('JavaScript', '1995'),
	('Dart', '2011');	
-- FIM DA CRIAÇÃO DA TABELA Linguagem_programacao
    
-- Criando a tabela Programador
CREATE TABLE Programador(
	id_programador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_programador VARCHAR(15),
    genero CHAR(1),
    data_nascimento DATE NOT NULL,
    email VARCHAR(60) NOT NULL,
	UNIQUE(email),
    id_startup INT,
    CONSTRAINT fk_id_startup FOREIGN KEY (id_startup)
    REFERENCES Startup(id_startup)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Aplicando auto incremento da chave primária
ALTER TABLE Programador AUTO_INCREMENT=30001;

-- Populando a tabela Programador
INSERT INTO Programador (nome_programador, genero, data_nascimento, email) VALUES
	('João Pedro','M', '1993-06-23', 'joaop@mail.com'),
	('Paula Silva','F', '1986-01-10', 'paulas@mail.com'),
	('Renata Vieira','F', '1991-07-05', 'renatav@mail.com'),
	('Felipe Santos','M', '1976-11-25', 'felipes@mail.com'),
	('Ana Cristina','F', '1968-02-19', 'anac@mail.com'),
	('Alexandre Alves','M', '1988-07-07', 'alexandrea@mail.com'),
	('Laura Marques','F', '1987-10-04', 'lauram@mail.com');	

-- Populando a coluna id_startup
UPDATE Programador SET id_startup = 10001 WHERE id_programador = 30001;
UPDATE Programador SET id_startup = 10002 WHERE id_programador = 30002;
UPDATE Programador SET id_startup = 10003 WHERE id_programador = 30003;
UPDATE Programador SET id_startup = 10004 WHERE id_programador = 30004;
UPDATE Programador SET id_startup = 10001 WHERE id_programador = 30005;
UPDATE Programador SET id_startup = 10004 WHERE id_programador = 30006;
UPDATE Programador SET id_startup = 10002 WHERE id_programador = 30007;
-- FIM DA CRIAÇÃO DA TABELA Programador

-- Criação da tabela Programador_linguagem
CREATE TABLE Programador_Linguagem(
	id_programador INT,
	id_linguagem INT);
    
-- Populando a tabela Programador_Linguagem
INSERT INTO Programador_Linguagem VALUES
	(30001, 20001),
    (30001, 20002),
    (30002, 20003),
    (30003, 20004),
    (30003, 20005),
    (30004, 20005),
    (30007, 20001),
    (30007, 20002);    

-- Criando as chaves estrangeiras com ON DELETE RESTRICT
ALTER TABLE Programador_Linguagem ADD FOREIGN KEY (id_programador) REFERENCES Programador(id_programador) ON DELETE RESTRICT ;
ALTER TABLE Programador_Linguagem ADD FOREIGN KEY (id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem) ON DELETE RESTRICT;


commit;