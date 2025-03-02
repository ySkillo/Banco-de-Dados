CREATE DATABASE game_store;

DROP DATABASE game_store;
DROP DATABASE gamestore;

	CREATE TABLE tbJogo(
		id_Jogo INT PRIMARY KEY AUTO_INCREMENT,
		nome_Jogo VARCHAR(30),
	 	diretor_Jogo VARCHAR(30),
	 	genero_Jogo VARCHAR(30),
	 	dtLanc_Jogo DATE,
	 	nota_Jogo INT,
	 	qntUnidade_Jogo INT
	);

SELECT * FROM tbJogo;



-- 1. Insira pelo menos 5 registros para a tabela. 
INSERT INTO tbJogo (
    id_Jogo, nome_Jogo, diretor_Jogo, genero_Jogo, dtLanc_Jogo, nota_Jogo, qntUnidade_Jogo
) VALUES
    (default, 'The Last of Us Part II', 'Neil Druckmann', 'Ação', '2020-06-19', 9, 4000000),
    (default, 'Elden Ring', 'Hidetaka Miyazaki', 'RPG', '2022-02-25', 9, 20000000),
    (default, 'Age of Empires IV', 'Adam Isgreen', 'Estratégia', '2021-10-28', 8, 3000000),
    (default, 'The Legend of Zelda', 'Hidemaro Fujibayashi', 'Aventura', '2017-03-03', 10, 31000000),
    (default, 'FIFA 21', 'Aaron McHardy', 'Esporte', '2020-10-09', 7, 12000000),
    (default, 'Resident Evil 2 Remake', 'Kazunori Kadoi', 'Terror', '2019-01-25', 9, 11000000);



/* 2. Altere a tabela para inserir uma coluna que represente o tipo de mídia que 
deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”. */

ALTER TABLE tbJogo ADD COLUMN tipoMidia_Jogo VARCHAR(20) CONSTRAINT chkMidia
	CHECK (tipoMidia_Jogo IN ('Física', 'Digital'));

-- 3. Atualize os registros dos jogos inseridos anteriormente. 

UPDATE tbJogo SET tipoMidia_Jogo = 'Digital'
	WHERE id_Jogo = 1;
UPDATE tbJogo SET tipoMidia_Jogo = 'Digital'
	WHERE id_Jogo = 2;
UPDATE tbJogo SET tipoMidia_Jogo = 'Física'
	WHERE id_Jogo = 3;
UPDATE tbJogo SET tipoMidia_Jogo = 'Digital'
	WHERE id_Jogo = 4;
UPDATE tbJogo SET tipoMidia_Jogo = 'Física'
	WHERE id_Jogo = 5;
UPDATE tbJogo SET tipoMidia_Jogo = 'Física'
	WHERE id_Jogo = 6;

-- 4. Exiba apenas os jogos com data de lançamento a partir de 2015. 

SELECT * FROM tbJogo
	WHERE dtLanc_Jogo LIKE '2015%';

SELECT * FROM tbJogo
	WHERE dtLanc_Jogo LIKE '2020%';

-- 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física. 

SELECT * FROM tbJogo
	WHERE nome_Jogo LIKE '%A%' AND tipoMidia_Jogo = 'Física';

-- 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”. 
SELECT * FROM tbJogo 
	WHERE diretor_Jogo NOT LIKE '%E%';

-- 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor 
-- não pode ser menor que 0 e nem maior que 10. 

ALTER TABLE tbJogo MODIFY COLUMN nota_Jogo INT CONSTRAINT chkNota
	CHECK (nota_Jogo BETWEEN '0' AND '10');

-- 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque. 
SELECT * FROM tbJogo
	WHERE genero_Jogo = 'Aventura' AND qntUnidade_Jogo > 0;



-- 9. Exclua os jogos que não têm mais unidades disponíveis em estoque. 
DELETE FROM tbJogo WHERE qntUnidade_Jogo = 0;

-- 10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da 
-- tabela. 

SELECT id_Jogo, 
	nome_Jogo, 
	diretor_Jogo AS 'Criador', 
	genero_Jogo, 
	dtLanc_Jogo, 
	nome_Jogo, 
	qntUnidade_Jogo FROM tbJogo;









/*

*** EXERCICIO 02 *** 

*/


CREATE DATABASE olimpiadas;

USE olimpiadas;

CREATE TABLE tbEsporte (
	id_Esporte INT PRIMARY KEY AUTO_INCREMENT,
	nome_Esporte VARCHAR(40),
	categoria_Esporte VARCHAR(20),
	CONSTRAINT chkEsporte 
		CHECK (categoria_Esporte IN ('Individual','Coletivo')),
	numJogadores_Esporte INT,
	estreia_Esporte DATE,
	paisOrigin_Esporte VARCHAR(30)
);

INSERT INTO tbEsporte (
    id_Esporte, nome_Esporte, categoria_Esporte, numJogadores_Esporte, estreia_Esporte, paisOrigin_Esporte
) VALUES
    (default, 'Futebol', 'Coletivo', 11, '1863-10-26', 'Inglaterra'),
    (default, 'Basquete', 'Coletivo', 5, '1891-12-21', 'Estados Unidos'),
    (default, 'Vôlei', 'Coletivo', 6, '1895-02-09', 'Estados Unidos'),
    (default, 'Tênis', 'Individual', 1, '1873-06-01', 'Inglaterra'),
    (default, 'Beisebol', 'Coletivo', 9, '1839-06-19', 'Estados Unidos'),
    (default, 'Hóquei no Gelo', 'Coletivo', 6, '1875-03-03', 'Canadá'),
    (default, 'Rugby', 'Coletivo', 15, '1845-01-01', 'Inglaterra'),
    (default, 'Golfe', 'Individual', 1, '1744-05-14', 'Escócia'),
    (default, 'Automobilismo', 'Individual', 1, '1906-06-26', 'França'),
    (default, 'Ciclismo', 'Individual', 1, '1868-05-31', 'França'),
    (default, 'Boxe', 'Individual', 1, '1681-07-01', 'Inglaterra'),
    (default, 'Judô', 'Individual', 1, '1882-02-28', 'Japão'),
    (default, 'MMA', 'Individual', 1, '1993-11-12', 'Estados Unidos'),
    (default, 'Surfe', 'Individual', 1, '1778-01-01', 'Havaí'),
    (default, 'Natação', 'Individual', 1, '1896-04-06', 'Grécia'),
    (default, 'Handebol', 'Coletivo', 7, '1917-01-01', 'Alemanha'),
    (default, 'Esgrima', 'Individual', 1, '1896-04-06', 'França'),
    (default, 'Hipismo', 'Individual', 1, '1900-05-23', 'França'),
    (default, 'Tênis de Mesa', 'Individual', 1, '1880-01-01', 'Inglaterra'),
    (default, 'Taekwondo', 'Individual', 1, '1955-01-01', 'Coreia do Sul'),
    (default, 'Skateboarding', 'Individual', 1, '1950-01-01', 'Estados Unidos'),
    (default, 'Levantamento de Peso', 'Individual', 1, '1896-04-06', 'Grécia'),
    (default, 'Polo Aquático', 'Coletivo', 7, '1869-01-01', 'Inglaterra'),
    (default, 'Badminton', 'Individual', 1, '1873-01-01', 'Inglaterra'),
    (default, 'Xadrez', 'Individual', 1, '1475-01-01', 'Índia'),
    (default, 'Luta Livre', 'Individual', 1, '1904-07-01', 'Estados Unidos'),
    (default, 'Ginástica Artística', 'Individual', 1, '1896-04-06', 'Alemanha'),
    (default, 'Curling', 'Coletivo', 4, '1541-01-01', 'Escócia'),
    (default, 'Arco e Flecha', 'Individual', 1, '1900-07-01', 'França');

ALTER TABLE  tbEsporte ADD COLUMN popularidade_Esporte DECIMAL(3,1) CONSTRAINT chkPopularidade
	CHECK (popularidade_Esporte BETWEEN 0 AND 10);

DESC tbEsporte;

SELECT * FROM tbEsporte;

UPDATE tbEsporte SET popularidade_Esporte = 10 WHERE id_Esporte = 1;
UPDATE tbEsporte SET popularidade_Esporte = 9 WHERE id_Esporte = 2;
UPDATE tbEsporte SET popularidade_Esporte = 8 WHERE id_Esporte = 3;
UPDATE tbEsporte SET popularidade_Esporte = 7 WHERE id_Esporte = 4;
UPDATE tbEsporte SET popularidade_Esporte = 6 WHERE id_Esporte = 5;
UPDATE tbEsporte SET popularidade_Esporte = 5 WHERE id_Esporte = 6;
UPDATE tbEsporte SET popularidade_Esporte = 6 WHERE id_Esporte = 7;
UPDATE tbEsporte SET popularidade_Esporte = 4 WHERE id_Esporte = 8;
UPDATE tbEsporte SET popularidade_Esporte = 8 WHERE id_Esporte = 9;
UPDATE tbEsporte SET popularidade_Esporte = 7 WHERE id_Esporte = 10;
UPDATE tbEsporte SET popularidade_Esporte = 5 WHERE id_Esporte = 11;
UPDATE tbEsporte SET popularidade_Esporte = 9 WHERE id_Esporte = 12;
UPDATE tbEsporte SET popularidade_Esporte = 6 WHERE id_Esporte = 13;
UPDATE tbEsporte SET popularidade_Esporte = 8 WHERE id_Esporte = 14;
UPDATE tbEsporte SET popularidade_Esporte = 7 WHERE id_Esporte = 15;
UPDATE tbEsporte SET popularidade_Esporte = 9 WHERE id_Esporte = 16;
UPDATE tbEsporte SET popularidade_Esporte = 5 WHERE id_Esporte = 17;
UPDATE tbEsporte SET popularidade_Esporte = 4 WHERE id_Esporte = 18;
UPDATE tbEsporte SET popularidade_Esporte = 3 WHERE id_Esporte = 19;
UPDATE tbEsporte SET popularidade_Esporte = 7 WHERE id_Esporte = 20;
UPDATE tbEsporte SET popularidade_Esporte = 6 WHERE id_Esporte = 21;
UPDATE tbEsporte SET popularidade_Esporte = 8 WHERE id_Esporte = 22;
UPDATE tbEsporte SET popularidade_Esporte = 5 WHERE id_Esporte = 23;
UPDATE tbEsporte SET popularidade_Esporte = 4 WHERE id_Esporte = 24;
UPDATE tbEsporte SET popularidade_Esporte = 6 WHERE id_Esporte = 25;
UPDATE tbEsporte SET popularidade_Esporte = 9 WHERE id_Esporte = 26;
UPDATE tbEsporte SET popularidade_Esporte = 5 WHERE id_Esporte = 27;
UPDATE tbEsporte SET popularidade_Esporte = 8 WHERE id_Esporte = 28;
UPDATE tbEsporte SET popularidade_Esporte = 3 WHERE id_Esporte = 29;

+------------+-----------------------+-------------------+----------------------+-----------------+--------------------+----------------------+
| id_Esporte | nome_Esporte          | categoria_Esporte | numJogadores_Esporte | estreia_Esporte | paisOrigin_Esporte | popularidade_Esporte |
+------------+-----------------------+-------------------+----------------------+-----------------+--------------------+----------------------+
|          1 | Futebol               | Coletivo          |                   11 | 1863-10-26      | Inglaterra         |                 10.0 |
|          2 | Basquete              | Coletivo          |                    5 | 1891-12-21      | Estados Unidos     |                  9.0 |
|          3 | Vôlei                 | Coletivo          |                    6 | 1895-02-09      | Estados Unidos     |                  8.0 |
|          4 | Tênis                 | Individual        |                    1 | 1873-06-01      | Inglaterra         |                  7.0 |
|          5 | Beisebol              | Coletivo          |                    9 | 1839-06-19      | Estados Unidos     |                  6.0 |
|          6 | Hóquei no Gelo        | Coletivo          |                    6 | 1875-03-03      | Canadá             |                  5.0 |
|          7 | Rugby                 | Coletivo          |                   15 | 1845-01-01      | Inglaterra         |                  6.0 |
|          8 | Golfe                 | Individual        |                    1 | 1744-05-14      | Escócia            |                  4.0 |
|          9 | Automobilismo         | Individual        |                    1 | 1906-06-26      | França             |                  8.0 |
|         10 | Ciclismo              | Individual        |                    1 | 1868-05-31      | França             |                  7.0 |
|         11 | Boxe                  | Individual        |                    1 | 1681-07-01      | Inglaterra         |                  5.0 |
|         12 | Judô                  | Individual        |                    1 | 1882-02-28      | Japão              |                  9.0 |
|         13 | MMA                   | Individual        |                    1 | 1993-11-12      | Estados Unidos     |                  6.0 |
|         14 | Surfe                 | Individual        |                    1 | 1778-01-01      | Havaí              |                  8.0 |
|         15 | Natação               | Individual        |                    1 | 1896-04-06      | Grécia             |                  7.0 |
|         16 | Handebol              | Coletivo          |                    7 | 1917-01-01      | Alemanha           |                  9.0 |
|         17 | Esgrima               | Individual        |                    1 | 1896-04-06      | França             |                  5.0 |
|         18 | Hipismo               | Individual        |                    1 | 1900-05-23      | França             |                  4.0 |
|         19 | Tênis de Mesa         | Individual        |                    1 | 1880-01-01      | Inglaterra         |                  3.0 |
|         20 | Taekwondo             | Individual        |                    1 | 1955-01-01      | Coreia do Sul      |                  7.0 |
|         21 | Skateboarding         | Individual        |                    1 | 1950-01-01      | Estados Unidos     |                  6.0 |
|         22 | Levantamento de Peso  | Individual        |                    1 | 1896-04-06      | Grécia             |                  8.0 |
|         23 | Polo Aquático         | Coletivo          |                    7 | 1869-01-01      | Inglaterra         |                  5.0 |
|         24 | Badminton             | Individual        |                    1 | 1873-01-01      | Inglaterra         |                  4.0 |
|         25 | Xadrez                | Individual        |                    1 | 1475-01-01      | Índia              |                  6.0 |
|         26 | Luta Livre            | Individual        |                    1 | 1904-07-01      | Estados Unidos     |                  9.0 |
|         27 | Ginástica Artística   | Individual        |                    1 | 1896-04-06      | Alemanha           |                  5.0 |
|         28 | Curling               | Coletivo          |                    4 | 1541-01-01      | Escócia            |                  8.0 |
|         29 | Arco e Flecha         | Individual        |                    1 | 1900-07-01      | França             |                  3.0 |
+------------+-----------------------+-------------------+----------------------+-----------------+--------------------+----------------------+

SELECT * FROM tbEsporte
	ORDER BY popularidade_Esporte ASC;
	+------------+-----------------------+-------------------+----------------------+-----------------+--------------------+----------------------+
| id_Esporte | nome_Esporte          | categoria_Esporte | numJogadores_Esporte | estreia_Esporte | paisOrigin_Esporte | popularidade_Esporte |
+------------+-----------------------+-------------------+----------------------+-----------------+--------------------+----------------------+
|         19 | Tênis de Mesa         | Individual        |                    1 | 1880-01-01      | Inglaterra         |                  3.0 |
|         29 | Arco e Flecha         | Individual        |                    1 | 1900-07-01      | França             |                  3.0 |
|          8 | Golfe                 | Individual        |                    1 | 1744-05-14      | Escócia            |                  4.0 |
|         18 | Hipismo               | Individual        |                    1 | 1900-05-23      | França             |                  4.0 |
|         24 | Badminton             | Individual        |                    1 | 1873-01-01      | Inglaterra         |                  4.0 |
|          6 | Hóquei no Gelo        | Coletivo          |                    6 | 1875-03-03      | Canadá             |                  5.0 |
|         11 | Boxe                  | Individual        |                    1 | 1681-07-01      | Inglaterra         |                  5.0 |
|         17 | Esgrima               | Individual        |                    1 | 1896-04-06      | França             |                  5.0 |
|         23 | Polo Aquático         | Coletivo          |                    7 | 1869-01-01      | Inglaterra         |                  5.0 |
|         27 | Ginástica Artística   | Individual        |                    1 | 1896-04-06      | Alemanha           |                  5.0 |
|          5 | Beisebol              | Coletivo          |                    9 | 1839-06-19      | Estados Unidos     |                  6.0 |
|          7 | Rugby                 | Coletivo          |                   15 | 1845-01-01      | Inglaterra         |                  6.0 |
|         13 | MMA                   | Individual        |                    1 | 1993-11-12      | Estados Unidos     |                  6.0 |
|         21 | Skateboarding         | Individual        |                    1 | 1950-01-01      | Estados Unidos     |                  6.0 |
|         25 | Xadrez                | Individual        |                    1 | 1475-01-01      | Índia              |                  6.0 |
|          4 | Tênis                 | Individual        |                    1 | 1873-06-01      | Inglaterra         |                  7.0 |
|         10 | Ciclismo              | Individual        |                    1 | 1868-05-31      | França             |                  7.0 |
|         15 | Natação               | Individual        |                    1 | 1896-04-06      | Grécia             |                  7.0 |
|         20 | Taekwondo             | Individual        |                    1 | 1955-01-01      | Coreia do Sul      |                  7.0 |
|          3 | Vôlei                 | Coletivo          |                    6 | 1895-02-09      | Estados Unidos     |                  8.0 |
|          9 | Automobilismo         | Individual        |                    1 | 1906-06-26      | França             |                  8.0 |
|         14 | Surfe                 | Individual        |                    1 | 1778-01-01      | Havaí              |                  8.0 |
|         22 | Levantamento de Peso  | Individual        |                    1 | 1896-04-06      | Grécia             |                  8.0 |
|         28 | Curling               | Coletivo          |                    4 | 1541-01-01      | Escócia            |                  8.0 |
|          2 | Basquete              | Coletivo          |                    5 | 1891-12-21      | Estados Unidos     |                  9.0 |
|         12 | Judô                  | Individual        |                    1 | 1882-02-28      | Japão              |                  9.0 |
|         16 | Handebol              | Coletivo          |                    7 | 1917-01-01      | Alemanha           |                  9.0 |
|         26 | Luta Livre            | Individual        |                    1 | 1904-07-01      | Estados Unidos     |                  9.0 |
|          1 | Futebol               | Coletivo          |                   11 | 1863-10-26      | Inglaterra         |                 10.0 |
+------------+-----------------------+-------------------+----------------------+-----------------+--------------------+----------------------+




SELECT * FROM tbEsporte
	WHERE estreia_Esporte >= '1900-01-01';

SELECT * FROM tbEsporte
	WHERE estreia_Esporte >= '2000-01-01';

DELETE FROM tbEsporte
WHERE estreia_Esporte <= '1896-04-01' OR estreia_Esporte > '2025-02-17';
SELECT * FROM tbEsporte;



ALTER TABLE tbEsporte ADD CONSTRAINT chkEstreia CHECK (estreia_Esporte > '1896-04-01' AND estreia_Esporte <= '2025-02-17');

DROP TABLE tbEsporte;

/*Altere a tabela para excluir a regra de inserção de categoria, assim 
podendo colocar valores além de "Individual" ou "Coletivo".*/
ALTER TABLE tbEsporte DROP CONSTRAINT chkEsporte;







