-- C) Especifique as consultas em SQL indicadas abaixo e apresente as tabelas resultantes: 

-- 1 Listar o nome de cada programador(a) e o nome da respectiva startup em que ele(ela) trabalha.
SELECT Programador.nome_programador, Startup.nome_startup
FROM Programador
JOIN Startup
ON Programador.id_startup = Startup.id_startup;

-- 2 Listar o nome e data de nascimento (no formato dd/mm/aaaa) de cada programadora cadastrada no BD Startup (apenas gênero feminino).
SELECT Programador.nome_programador, DATE_FORMAT (Programador.data_nascimento , '%d/%m/%Y')
FROM Programador
WHERE Programador.genero = 'F';

-- 3 Listar os nomes dos(as) programadores(as) que programam em Python e JavaScript.
SELECT P.nome_programador FROM Programador AS P
JOIN Programador_Linguagem AS PL
ON P.id_programador = PL.id_programador -- chave primaria = chave estrangeira
JOIN Linguagem_Programacao AS LP
ON LP.id_linguagem = PL.id_linguagem
WHERE LP.nome_linguagem = 'JavaScript' OR LP.nome_linguagem = 'Python';

-- 4 Listar os nomes dos(as) programadores(as) que programam em PHP e nasceram entre 1980 e 1990.
SELECT P.nome_programador FROM Programador AS P
JOIN Programador_Linguagem AS PL
ON P.id_programador = PL.id_programador -- chave primaria = chave estrangeira
JOIN Linguagem_Programacao AS LP
ON LP.id_linguagem = PL.id_linguagem
WHERE LP.nome_linguagem = 'PHP' AND P.data_nascimento >= '1980/01/01' AND P.data_nascimento <= '1990/12/31';

-- 5 Listar os nomes dos(as) programadores(as) vinculados à startup “BSI Next Level” que tem menos de 30 anos.
SELECT P.nome_programador
FROM Programador AS P
JOIN Startup AS S
ON P.id_startup = S.id_startup
WHERE S.nome_startup = 'BSI Next Level' AND P.data_nascimento >= 1993/01/01;

-- 6 Para cada startup cuja cidade sede inicia com a letra 'A', listar o nome da startup e os nomes dos programadores que atuam na startup.
SELECT P.nome_programador, S.nome_startup
FROM Programador AS P
JOIN Startup AS S
ON P.id_startup = S.id_startup
WHERE S.cidade_sede LIKE 'A%'
