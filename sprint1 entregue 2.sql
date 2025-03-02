CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE tbAtleta(
	id_Atleta INT PRIMARY KEY AUTO_INCREMENT,
	nome_Atleta VARCHAR(40) NOT NULL,
	modalidade_Atleta VARCHAR(40) NOT NULL,
	qntdMedalha_Atleta INT
);

INSERT INTO tbAtleta (nome_Atleta, modalidade_Atleta, qntdMedalha_Atleta) VALUES 
	('Jonas Geronimo','Futebol',8),
	('Alan Silva','Basquete',6),
	('Ana Clara','Volei', 3),
	('Jessica Oliveira','Futebol', 10),
	('Matias Santos','Volei', 5);


SELECT * FROM tbAtleta;


-- Table após SELECT * FROM
+-----------+------------------+-------------------+--------------------+
| id_Atleta | nome_Atleta      | modalidade_Atleta | qntdMedalha_Atleta |
+-----------+------------------+-------------------+--------------------+
|         1 | Jonas Geronimo   | Futebol           |                  8 |
|         2 | Alan Silva       | Basquete          |                  6 |
|         3 | Ana Clara        | Volei             |                  3 |
|         4 | Jessica Oliveira | Futebol           |                 10 |
|         5 | Matias Santos    | Volei             |                  5 |
+-----------+------------------+-------------------+--------------------+


-- • Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE tbAtleta SET qntdMedalha_Atleta = 16
	WHERE id_Atleta = 1;

-- • Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE tbAtleta SET qntdMedalha_Atleta = 19
	WHERE id_Atleta IN (2,3);
+-----------+----------------+-------------------+--------------------+---------------+
| id_Atleta | nome_Atleta    | modalidade_Atleta | qntdMedalha_Atleta | dtNasc_Atleta |
+-----------+----------------+-------------------+--------------------+---------------+
|         1 | Jonas Geronimo | Futebol           |                 16 | 2000-01-24    |
|         2 | Alan Silva     | Basquete          |                 19 | 2000-01-24    |
|         3 | Ana Clara      | Volei             |                 19 | 2000-01-24    |
|         4 | Cadu Santana   | Futebol           |                 10 | 2000-01-24    |
|         5 | Matias Santos  | Volei             |                  5 | 2000-01-24    |
+-----------+----------------+-------------------+--------------------+---------------+

-- • Atualizar o nome do atleta com o id=4;
UPDATE tbAtleta SET nome_Atleta = 'Cadu Santana'
	WHERE id_Atleta = 4;
+-----------+----------------+-------------------+--------------------+
| id_Atleta | nome_Atleta    | modalidade_Atleta | qntdMedalha_Atleta |
+-----------+----------------+-------------------+--------------------+
|         1 | Jonas Geronimo | Futebol           |                 16 |
|         2 | Alan Silva     | Basquete          |                  6 |
|         3 | Ana Clara      | Volei             |                  3 |
|         4 | Cadu Santana   | Futebol           |                 10 |
|         5 | Matias Santos  | Volei             |                  5 |
+-----------+----------------+-------------------+--------------------+


-- • Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE tbAtleta 
	ADD COLUMN dtNasc_Atleta DATE;
+-----------+----------------+-------------------+--------------------+---------------+
| id_Atleta | nome_Atleta    | modalidade_Atleta | qntdMedalha_Atleta | dtNasc_Atleta |
+-----------+----------------+-------------------+--------------------+---------------+
|         1 | Jonas Geronimo | Futebol           |                 16 | NULL          |
|         2 | Alan Silva     | Basquete          |                  6 | NULL          |
|         3 | Ana Clara      | Volei             |                  3 | NULL          |
|         4 | Cadu Santana   | Futebol           |                 10 | NULL          |
|         5 | Matias Santos  | Volei             |                  5 | NULL          |
+-----------+----------------+-------------------+--------------------+---------------+



-- • Atualizar a data de nascimento de todos os atletas; ASSIM ATUALIZA DE TODOS 
-- para fazer um por um precisa fazer pos id
UPDATE tbAtleta SET dtNasc_Atleta = '2000-01-24';
+-----------+----------------+-------------------+--------------------+---------------+
| id_Atleta | nome_Atleta    | modalidade_Atleta | qntdMedalha_Atleta | dtNasc_Atleta |
+-----------+----------------+-------------------+--------------------+---------------+
|         1 | Jonas Geronimo | Futebol           |                 16 | 2000-01-24    |
|         2 | Alan Silva     | Basquete          |                 19 | 2000-01-24    |
|         3 | Ana Clara      | Volei             |                 19 | 2000-01-24    |
|         4 | Cadu Santana   | Futebol           |                 10 | 2000-01-24    |
|         5 | Matias Santos  | Volei             |                  5 | 2000-01-24    |
+-----------+----------------+-------------------+--------------------+---------------+

--**** Atualizar 1 por 1 ****--
UPDATE tbAtleta SET dtNasc_Atleta = '2001-01-21'
	WHERE id_Atleta = 1;
UPDATE tbAtleta SET dtNasc_Atleta = '2002-02-22'
	WHERE id_Atleta = 2;
UPDATE tbAtleta SET dtNasc_Atleta = '2003-03-23'
	WHERE id_Atleta = 3;
UPDATE tbAtleta SET dtNasc_Atleta = '2004-04-24'
	WHERE id_Atleta = 4;
UPDATE tbAtleta SET dtNasc_Atleta = '2005-05-25'
	WHERE id_Atleta = 5;


-- • Excluir o atleta com o id=5;
DELETE FROM tbAtleta WHERE id_Atleta = 5;
+-----------+----------------+-------------------+--------------------+---------------+
| id_Atleta | nome_Atleta    | modalidade_Atleta | qntdMedalha_Atleta | dtNasc_Atleta |
+-----------+----------------+-------------------+--------------------+---------------+
|         1 | Jonas Geronimo | Futebol           |                 16 | 2000-01-24    |
|         2 | Alan Silva     | Basquete          |                 19 | 2000-01-24    |
|         3 | Ana Clara      | Volei             |                 19 | 2000-01-24    |
|         4 | Cadu Santana   | Futebol           |                 10 | 2000-01-24    |
+-----------+----------------+-------------------+--------------------+---------------+	



-- • Exibir os atletas onde a modalidade é diferente de natação;

SELECT * FROM tbAtleta
	WHERE modalidade_Atleta != 'natação';

+-----------+----------------+-------------------+--------------------+---------------+
| id_Atleta | nome_Atleta    | modalidade_Atleta | qntdMedalha_Atleta | dtNasc_Atleta |
+-----------+----------------+-------------------+--------------------+---------------+
|         1 | Jonas Geronimo | Futebol           |                 16 | 2000-01-24    |
|         2 | Alan Silva     | Basquete          |                 19 | 2000-01-24    |
|         3 | Ana Clara      | Volei             |                 19 | 2000-01-24    |
|         4 | Cadu Santana   | Futebol           |                 10 | 2000-01-24    |
+-----------+----------------+-------------------+--------------------+---------------+



-- • Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;

-- Aterando para que fique ainda mais visivel
UPDATE tbAtleta SET qntdMedalha_Atleta = 2
	WHERE id_Atleta = 1;

 SELECT * FROM tbAtleta 
 	WHERE qntdMedalha_Atleta >= 3;
+-----------+--------------+-------------------+--------------------+---------------+
| id_Atleta | nome_Atleta  | modalidade_Atleta | qntdMedalha_Atleta | dtNasc_Atleta |
+-----------+--------------+-------------------+--------------------+---------------+
|         2 | Alan Silva   | Basquete          |                 19 | 2000-01-24    |
|         3 | Ana Clara    | Volei             |                 19 | 2000-01-24    |
|         4 | Cadu Santana | Futebol           |                 10 | 2000-01-24    |
+-----------+--------------+-------------------+--------------------+---------------+


-- • Modificar o campo modalidade do tamanho 40 para o tamanho 60;

ALTER TABLE tbAtleta MODIFY COLUMN modalidade_Atleta VARCHAR(60);
+--------------------+-------------+------+-----+---------+----------------+
| Field              | Type        | Null | Key | Default | Extra          |
+--------------------+-------------+------+-----+---------+----------------+
| id_Atleta          | int         | NO   | PRI | NULL    | auto_increment |
| nome_Atleta        | varchar(40) | NO   |     | NULL    |                |
| modalidade_Atleta  | varchar(60) | YES  |     | NULL    |                |
| qntdMedalha_Atleta | int         | YES  |     | NULL    |                |
| dtNasc_Atleta      | date        | YES  |     | NULL    |                |
+--------------------+-------------+------+-----+---------+----------------+


--• Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESCRIBE tbAtleta;
+--------------------+-------------+------+-----+---------+----------------+
| Field              | Type        | Null | Key | Default | Extra          |
+--------------------+-------------+------+-----+---------+----------------+
| id_Atleta          | int         | NO   | PRI | NULL    | auto_increment |
| nome_Atleta        | varchar(40) | NO   |     | NULL    |                |
| modalidade_Atleta  | varchar(60) | YES  |     | NULL    |                |
| qntdMedalha_Atleta | int         | YES  |     | NULL    |                |
| dtNasc_Atleta      | date        | YES  |     | NULL    |                |
+--------------------+-------------+------+-----+---------+----------------+

TRUNCATE TABLE tbPessoa;



/******

	EXERICO 02

******/

USE sprint1;

CREATE TABLE tbMusica(
	id_Musica INT PRIMARY KEY AUTO_INCREMENT,
	titulo_Musica VARCHAR(40) NOT NULL,
	artista_Musica VARCHAR(40) NOT NULL,
	genero_Musica VARCHAR(20) NOT NULL
);

INSERT INTO tbMusica (titulo_Musica, artista_Musica, genero_Musica) VALUES 
	('Proibido terminar','Donatelo','Rap'),
	('Revoadinha','Moraes e Candido','Funk'),
	('Sujeito Homem','Mc Lagosta','Funk'),
	('Mentirosa','Fundo de quintal','Pagode'),
	('Eu sou sentimento','Ana Raimunda','Sertanejo'),
	('Mulamba','Raimundo Neto','Samba'),
	('Exalta','Samatha Vellar','Gospel'),
	('Temporal','Didi e Cazuza','Pagode'),
	('Vida longa','Raça','Rap'),
	('Gun','Lil izi','Hip-hop'),
	('Bilu','Calcinha Preta','Forro'),
	('Bandoleiro','Largados','Forro'),
	('Camisa 9','Mc Sid','Funk');

-- a) Exibir todos os dados da tabela.
SELECT * FROM tbMusica;
+-----------+-------------------+------------------+---------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica |
+-----------+-------------------+------------------+---------------+
|         1 | Proibido terminar | Donatelo         | Rap           |
|         2 | Revoadinha        | Moraes e Candido | Funk          |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |
|         4 | Mentirosa         | Fundo de quintal | Pagode        |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |
|         6 | Mulamba           | Raimundo Neto    | Samba         |
|         7 | Exalta            | Samatha Vellar   | Gospel        |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |
|         9 | Vida longa        | Raça             | Rap           |
|        10 | Gun               | Lil izi          | Hip-hop       |
|        11 | Bilu              | Calcinha Preta   | Forro         |
|        12 | Bandoleiro        | Largados         | Forro         |
|        13 | Camisa 9          | Mc Sid           | Funk          |
+-----------+-------------------+------------------+---------------+

-- b) Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE tbMusica 
	ADD COLUMN curtidas_Musica INT;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id_Musica       | int         | NO   | PRI | NULL    | auto_increment |
| titulo_Musica   | varchar(40) | NO   |     | NULL    |                |
| artista_Musica  | varchar(40) | NO   |     | NULL    |                |
| genero_Musica   | varchar(20) | NO   |     | NULL    |                |
| curtidas_Musica | int         | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE tbMusica SET curtidas_Musica = 50;
+-----------+-------------------+------------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica | curtidas_Musica |
+-----------+-------------------+------------------+---------------+-----------------+
|         1 | Proibido terminar | Donatelo         | Rap           |              50 |
|         2 | Revoadinha        | Moraes e Candido | Funk          |              50 |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |              50 |
|         4 | Mentirosa         | Fundo de quintal | Pagode        |              50 |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |              50 |
|         6 | Mulamba           | Raimundo Neto    | Samba         |              50 |
|         7 | Exalta            | Samatha Vellar   | Gospel        |              50 |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |              50 |
|         9 | Vida longa        | Raça             | Rap           |              50 |
|        10 | Gun               | Lil izi          | Hip-hop       |              50 |
|        11 | Bilu              | Calcinha Preta   | Forro         |              50 |
|        12 | Bandoleiro        | Largados         | Forro         |              50 |
|        13 | Camisa 9          | Mc Sid           | Funk          |              50 |
+-----------+-------------------+------------------+---------------+-----------------+

-- Altera 1 por 1.
UPDATE tbMusica SET curtidas_Musica = 8957
	WHERE id_Musica = 1;
UPDATE tbMusica SET curtidas_Musica = 9876
	WHERE id_Musica = 2;
UPDATE tbMusica SET curtidas_Musica = 6543
	WHERE id_Musica = 3;
UPDATE tbMusica SET curtidas_Musica = 5314
	WHERE id_Musica = 4;
UPDATE tbMusica SET curtidas_Musica = 6514
	WHERE id_Musica = 5;
UPDATE tbMusica SET curtidas_Musica = 7468
	WHERE id_Musica = 6;
UPDATE tbMusica SET curtidas_Musica = 9843
	WHERE id_Musica = 7;
UPDATE tbMusica SET curtidas_Musica = 2355
	WHERE id_Musica = 8;
UPDATE tbMusica SET curtidas_Musica = 7425
	WHERE id_Musica = 9;
UPDATE tbMusica SET curtidas_Musica = 4378
	WHERE id_Musica = 10;
UPDATE tbMusica SET curtidas_Musica = 3421
	WHERE id_Musica = 11;
UPDATE tbMusica SET curtidas_Musica = 1324
	WHERE id_Musica = 12;
UPDATE tbMusica SET curtidas_Musica = 6534
	WHERE id_Musica = 13;

+-----------+-------------------+------------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica | curtidas_Musica |
+-----------+-------------------+------------------+---------------+-----------------+
|         1 | Proibido terminar | Donatelo         | Rap           |            8957 |
|         2 | Revoadinha        | Moraes e Candido | Funk          |            9876 |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |            6543 |
|         4 | Mentirosa         | Fundo de quintal | Pagode        |            5314 |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto    | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar   | Gospel        |            9843 |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |            2355 |
|         9 | Vida longa        | Raça             | Rap           |            7425 |
|        10 | Gun               | Lil izi          | Hip-hop       |            4378 |
|        11 | Bilu              | Calcinha Preta   | Forro         |            3421 |
|        12 | Bandoleiro        | Largados         | Forro         |            1324 |
|        13 | Camisa 9          | Mc Sid           | Funk          |            6534 |
+-----------+-------------------+------------------+---------------+-----------------+




-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE tbMusica MODIFY COLUMN artista_Musica VARCHAR(80);

mysql> desc tbMusica;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id_Musica       | int         | NO   | PRI | NULL    | auto_increment |
| titulo_Musica   | varchar(40) | NO   |     | NULL    |                |
| artista_Musica  | varchar(80) | YES  |     | NULL    |                |
| genero_Musica   | varchar(20) | NO   |     | NULL    |                |
| curtidas_Musica | int         | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

-- e) Atualizar a quantidade de curtidas da música com id=1;
UPDATE tbMusica SET curtidas_Musica = 3046
	WHERE id_Musica = 1;
+-----------+-------------------+------------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica | curtidas_Musica |
+-----------+-------------------+------------------+---------------+-----------------+
|         1 | Proibido terminar | Donatelo         | Rap           |            3046 |
|         2 | Revoadinha        | Moraes e Candido | Funk          |            9876 |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |            6543 |
|         4 | Mentirosa         | Fundo de quintal | Pagode        |            5314 |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto    | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar   | Gospel        |            9843 |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |            2355 |
|         9 | Vida longa        | Raça             | Rap           |            7425 |
|        10 | Gun               | Lil izi          | Hip-hop       |            4378 |
|        11 | Bilu              | Calcinha Preta   | Forro         |            3421 |
|        12 | Bandoleiro        | Largados         | Forro         |            1324 |
|        13 | Camisa 9          | Mc Sid           | Funk          |            6534 |
+-----------+-------------------+------------------+---------------+-----------------+

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE tbMusica SET curtidas_Musica = 1999
	WHERE id_Musica IN (2,3);
+-----------+-------------------+------------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica | curtidas_Musica |
+-----------+-------------------+------------------+---------------+-----------------+
|         1 | Proibido terminar | Donatelo         | Rap           |            3046 |
|         2 | Revoadinha        | Moraes e Candido | Funk          |            1999 |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |            1999 |
|         4 | Mentirosa         | Fundo de quintal | Pagode        |            5314 |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto    | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar   | Gospel        |            9843 |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |            2355 |
|         9 | Vida longa        | Raça             | Rap           |            7425 |
|        10 | Gun               | Lil izi          | Hip-hop       |            4378 |
|        11 | Bilu              | Calcinha Preta   | Forro         |            3421 |
|        12 | Bandoleiro        | Largados         | Forro         |            1324 |
|        13 | Camisa 9          | Mc Sid           | Funk          |            6534 |
+-----------+-------------------+------------------+---------------+-----------------+

-- g) Atualizar o nome da música com o id=5;
UPDATE tbMusica SET titulo_Musica = 'De fininho'
 WHERE id_Musica = 1;
+-----------+-------------------+------------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica | curtidas_Musica |
+-----------+-------------------+------------------+---------------+-----------------+
|         1 | De fininho        | Donatelo         | Rap           |            3046 |
|         2 | Revoadinha        | Moraes e Candido | Funk          |            1999 |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |            1999 |
|         4 | Mentirosa         | Fundo de quintal | Pagode        |            5314 |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto    | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar   | Gospel        |            9843 |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |            2355 |
|         9 | Vida longa        | Raça             | Rap           |            7425 |
|        10 | Gun               | Lil izi          | Hip-hop       |            4378 |
|        11 | Bilu              | Calcinha Preta   | Forro         |            3421 |
|        12 | Bandoleiro        | Largados         | Forro         |            1324 |
|        13 | Camisa 9          | Mc Sid           | Funk          |            6534 |
+-----------+-------------------+------------------+---------------+-----------------+

-- h) Excluir a música com o id=4;
DELETE FROM tbMusica WHERE id_Musica = 4;
+-----------+-------------------+------------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica   | genero_Musica | curtidas_Musica |
+-----------+-------------------+------------------+---------------+-----------------+
|         1 | De fininho        | Donatelo         | Rap           |            3046 |
|         2 | Revoadinha        | Moraes e Candido | Funk          |            1999 |
|         3 | Sujeito Homem     | Mc Lagosta       | Funk          |            1999 |
|         5 | Eu sou sentimento | Ana Raimunda     | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto    | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar   | Gospel        |            9843 |
|         8 | Temporal          | Didi e Cazuza    | Pagode        |            2355 |
|         9 | Vida longa        | Raça             | Rap           |            7425 |
|        10 | Gun               | Lil izi          | Hip-hop       |            4378 |
|        11 | Bilu              | Calcinha Preta   | Forro         |            3421 |
|        12 | Bandoleiro        | Largados         | Forro         |            1324 |
|        13 | Camisa 9          | Mc Sid           | Funk          |            6534 |
+-----------+-------------------+------------------+---------------+-----------------+

-- i) Exibir as músicas onde o gênero é diferente de funk;
SELECT * FROM tbMusica
	WHERE genero_Musica != 'Funk';
+-----------+-------------------+----------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica | genero_Musica | curtidas_Musica |
+-----------+-------------------+----------------+---------------+-----------------+
|         1 | De fininho        | Donatelo       | Rap           |            3046 |
|         5 | Eu sou sentimento | Ana Raimunda   | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto  | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar | Gospel        |            9843 |
|         8 | Temporal          | Didi e Cazuza  | Pagode        |            2355 |
|         9 | Vida longa        | Raça           | Rap           |            7425 |
|        10 | Gun               | Lil izi        | Hip-hop       |            4378 |
|        11 | Bilu              | Calcinha Preta | Forro         |            3421 |
|        12 | Bandoleiro        | Largados       | Forro         |            1324 |
+-----------+-------------------+----------------+---------------+-----------------+

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
-- como fiz o update de curtidas com valor alto irei fazer maior ou igual a 5000

SELECT * FROM tbMusica
	WHERE curtidas_Musica >= 5000;
+-----------+-------------------+----------------+---------------+-----------------+
| id_Musica | titulo_Musica     | artista_Musica | genero_Musica | curtidas_Musica |
+-----------+-------------------+----------------+---------------+-----------------+
|         5 | Eu sou sentimento | Ana Raimunda   | Sertanejo     |            6514 |
|         6 | Mulamba           | Raimundo Neto  | Samba         |            7468 |
|         7 | Exalta            | Samatha Vellar | Gospel        |            9843 |
|         9 | Vida longa        | Raça           | Rap           |            7425 |
|        13 | Camisa 9          | Mc Sid         | Funk          |            6534 |
+-----------+-------------------+----------------+---------------+-----------------+

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;

DESCRIBE tbMusica;
mysql> DESCRIBE tbMusica;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id_Musica       | int         | NO   | PRI | NULL    | auto_increment |
| titulo_Musica   | varchar(40) | NO   |     | NULL    |                |
| artista_Musica  | varchar(80) | YES  |     | NULL    |                |
| genero_Musica   | varchar(20) | NO   |     | NULL    |                |
| curtidas_Musica | int         | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

-- l) Limpar os dados da tabela;
TRUNCATE TABLE tbMusica;


/******

	EXERICO 03

******/


USE sprint1;

CREATE TABLE tbFilme(
	id_Filme INT PRIMARY KEY AUTO_INCREMENT;
	titulo_Filme VARCHAR(50),
	genero_Filme VARCHAR(40),
	diretor_Filme VARCHAR(40)
);

INSERT INTO tbFilme (titulo_Filme, genero_Filme, diretor_Filme) VALUES
('O Poderoso Chefão', 'Crime', 'Francis Ford Coppola'),
('A Vida é Bela', 'Drama', 'Roberto Benigni'),
('Pulp Fiction', 'Crime', 'Quentin Tarantino'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Aventura', 'Peter Jackson'),
('Forrest Gump', 'Drama', 'Robert Zemeckis'),
('Matrix', 'Ficção Científica', 'Lana Wachowski, Lilly Wachowski'),
('O Rei Leão', 'Animação', 'Roger Allers, Rob Minkoff');

SELECT * FROM tbFilme;

ALTER TABLE tbFilme ADD COLUMN protagonista_Filme VARCHAR(50);


UPDATE tbFilme SET protagonista = ''
	WHERE id_Filme = 1;

ALTER TABLE tbFilme MODIFY COLUMN diretor_Filme VARCHAR (150);

-- • Atualizar o diretor do filme com id=5;

UPDATE tbFilme SET diretor_Filme = 'Cadu'
	WHERE id_Filme = 5;

-- • Atualizar o diretor dos filmes com id=2 e com o id=7;

UPDATE tbFilme SET diretor_Filme = 'Marcio'
	WHERE id_Filme IN (2,7);

-- • Atualizar o título do filme com o id=6;
UPDATE tbFilme SET titulo_Filme = 'A Chamada'
	WHERE id_Filme = 6;


--• Excluir o filme com o id=3;

DELETE FROM tbFilme WHERE id_Filme = 3;


-- • Exibir os filmes em que o gênero é diferente de drama;

SELECT * FROM tbFilme
 WHERE genero_Filme != 'drama';


-- • Exibir os dados dos filmes que o gênero é igual ‘suspense’;

SELECT * FROM tbFilme
	WHERE genero_Filme = 'suspense';


-- • Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
DESCRIBE tbFilme;

--• Limpar os dados da tabela;

TRUNCATE TABLE tbFilme;





/******

	EXERICO 04

******/

USE sprint1;

CREATE TABLE tbProfessor(
	id_Professor INT PRIMARY KEY AUTO_INCREMENT,
	nome_Professor VARCHAR(50),
	especialidade_Professor VARCHAR(40),
	dtNasc_Professor DATE
);
INSERT INTO tbProfessor (nome_Professor, especialidade_Professor, dtNasc_Professor) VALUES
('Carlos Silva', 'Matemática', '1980-05-12'),
('Ana Costa', 'História', '1975-03-22'),
('Ricardo Oliveira', 'Física', '1987-07-30'),
('Patrícia Almeida', 'Química', '1990-11-10'),
('Fernanda Souza', 'Literatura', '1985-02-15'),
('Marcos Pereira', 'Geografia', '1978-09-25'),
('Juliana Santos', 'Biologia', '1992-04-07'),
('Eduardo Lima', 'Filosofia', '1983-06-18');

-- Exibir todos os dados da tabela.
SELECT * FROM tbProfessor;

/* b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
‘assistente’ ou ‘titular’; */

ALTER TABLE tbProfessor ADD COLUMN funcao_Professor VARCHAR(50);


-- c) Atualizar os professores inseridos e suas respectivas funções;

UPDATE tbProfessor SET funcao_Professor = 'monitor'
	WHERE id_Professor = 1;
	UPDATE tbProfessor SET funcao_Professor = 'assistente'
	WHERE id_Professor = 2;
	UPDATE tbProfessor SET funcao_Professor = 'titular'
	WHERE id_Professor = 3;
	UPDATE tbProfessor SET funcao_Professor = 'titular'
	WHERE id_Professor = 4;
	UPDATE tbProfessor SET funcao_Professor = 'titular'
	WHERE id_Professor = 5;
	UPDATE tbProfessor SET funcao_Professor = 'monitor'
	WHERE id_Professor = 6;
	UPDATE tbProfessor SET funcao_Professor = 'monitor'
	WHERE id_Professor = 7;
	UPDATE tbProfessor SET funcao_Professor = 'assistente'
	WHERE id_Professor = 8;


-- d) Inserir um novo professor;
INSERT INTO tbProfessor (nome_Professor, especialidade_Professor, dtNasc_Professor) VALUES 
	('Juliano Barros', 'Biologia', '2000-03-11');


-- e) Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM tbProfessor WHERE id_Professor = 5;

-- f) Exibir apenas os nomes dos professores titulares;

SElECT * FROM tbProfessor
	WHERE funcao_Professor = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;

SELECT especialidade_Professor, dtNasc_Professor FROM tbProfessor;

 -- Atualizar a data de nascimento do idProfessor igual a 3;

UPDATE tbProfessor SET dtNasc_Professor = '1999-03-12'
	WHERE id_Professor = 3;

-- i) Limpar a tabela Professor;

TRUNCATE TABLE tbPessoa;



/*****
 	EXERCICIO 5 
 *****/


USE sprint1;

CREATE TABLE tbCurso(
	id_Curso INT PRIMARY KEY AUTO_INCREMENT,
	nome_Curso VARCHAR(40),
	sigla_Curso CHAR(3),
	coordenador_Curso VARCHAR (30)
);


INSERT INTO tbCurso (nome_Curso, sigla_Curso, coordenador_Curso) VALUES
('Engenharia de Software', 'ES', 'Dr. João Silva'),
('Medicina', 'MED', 'Dra. Maria Oliveira'),
('Direito', 'DIR', 'Prof. José Santos'),
('Administração', 'ADM', 'Prof. Carla Souza'),
('Psicologia', 'PSI', 'Dra. Ana Costa'),
('Arquitetura', 'ARQ', 'Prof. Marcos Pereira');

-- a) Exibir todos os dados da tabela.

SELECT * FROM tbCurso;

-- b) Exibir apenas os coordenadores dos cursos.

ALTER TABLE tbCurso DROP COLUMN coordenador_Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.

SELECT * FROM tbCurso
	WHERE sigla_Curso = 'ADM',

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM tbCurso 
	ORDER BY nome_Curso;

/*e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem
decrescente.*/

SElECT * FROM tbCurso
	ORDER BY coordenador_Curso ASC;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.

SELECT * FROM tbCurso
	WHERE nome_Curso LIKE 'D%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.

SELECT * FROM tbCurso
	WHERE nome_Curso LIKE '%A';

/*h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma
determinada letra.*/

SELECT * FROM tbCurso
	WHERE nome_Curso LIKE '_E%';

/*i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma
determinada letra.*/
SELECT * FROM tbCurso
	WHERE nome_Curso LIKE '%N_';

-- j) Elimine a tabela.
TRUNCATE TABLE tbCurso;	


/**********
 *  EXERCICIO 6
 * *******/

USE sprint1;

CREATE TABLE tbRevista(
 	id_Revista INT PRIMARY KEY AUTO_INCREMENT;
 	nome_Revista VARCHAR(40),
 	categoria_Revista VARCHAR(30)
);

-- • Inserir 4 registros na tabela, mas sem informar a categoria.
INSERT INTO tbRevista (nome_Revista, categoria_Revista) VALUES
('Revista 1', NULL),
('Revista 2', NULL),
('Revista 3', NULL),
('Revista 4', NULL);


-- • Exibir todos os dados da tabela.
SElECT * FROM tbRevista;


/*• Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
novamente para verificar se atualizou corretamente.*/

UPDATE tbRevista SET categoria_Revista = 'Ana castelo está namorando o João Gomes'
	WHERE id_Revista = 1;

UPDATE tbRevista SET categoria_Revista = 'Roberto Carlos é careca'
	WHERE id_Revista = 2;

UPDATE tbRevista SET categoria_Revista = 'Vittar descobre que não come carne'
	WHERE id_Revista = 3;

SElECT * FROM tbRevista;

-- • Insira mais 3 registros completos.
INSERT INTO tbRevista (nome_Revista, categoria_Revista) VALUES
('Revista de Tecnologia', 'Tecnologia'),
('Revista de Moda', 'Moda'),
('Revista Científica', 'Ciência');



-- • Exibir novamente os dados da tabela.
SELECT * FROM tbRevista;

-- • Exibir a descrição da estrutura da tabela.
DESCRIBE tbRevista;

-- • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE tbRevista MODIFY COLUMN categoria_Revista VARCHAR(40);


/*• Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o
tamanho da coluna categoria*/
DESCRIBE tbRevista;

-- • Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE tbRevista ADD COLUMN periodicidade_Revista VARCHAR(15);


-- • Exibir os dados da tabela.
SElECT * FROM tbRevista;

-- • Excluir a coluna periodicidade da tabela.
ALTER TABLE tbRevista DROP COLUMN periodicidade_Revista;

/**********
 *  EXERCICIO 7
 * *******/


Escreva e execute os comandos para:




USE sprint1;

CREATE TABLE tbCarros(
	id_Carro INT PRIMARY KEY AUTO_INCREMENT,
	nome_Placa VARCHAR(40),
	placa_Carro CHAR(7)

)AUTO_INCREMENT = 1000;

-- • Inserir 4 registros na tabela;
INSERT INTO tbCarros (nome_Carro, placa_Carro) VALUES
('Fusca', 'ABC1234'),
('Civic', 'XYZ5678'),
('Corolla', 'LMN2345'),
('Ford Focus', 'DEF6789');


-- • Exibir todos os dados da tabela.
SELECT * FROM tbCarros;

-- • Insira mais 3 registros sem a placa dos carros.
INSERT INTO tbCarros (nome_Carro, placa_Carro) VALUES
('Gol', NULL),
('Fiesta', NULL),
('Palio', NULL);

-- • Exibir novamente os dados da tabela.
SElECT * FROM tbCarros;

-- • Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.

ALTER TABLE tbCarros MODIFY COLUMN nome_Carro CHAR(28);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;
DESCRIBE tbCarros;

-- • Acrescentar a coluna ano à tabela, que é char(4);
ALTER TABLE tbCarros ADD COLUMN ano_Carro CHAR(4);


-- • Atualizar todos os dados nulos da tabela;
UPDATE tbCarros SET placa_Carro = 'FAF6457'
	WHERE id_Carro = 1004;
UPDATE tbCarros SET placa_Carro = 'KJH8967'
	WHERE id_Carro = 1005;
UPDATE tbCarros SET placa_Carro = 'GHG1653'
	WHERE id_Carro = 1006;

UPDATE tbCarros SET ano_Carro = '1960'
	WHERE id_Carro = 1000;
UPDATE tbCarros SET ano_Carro = '2016'
	WHERE id_Carro = 1001;
UPDATE tbCarros SET ano_Carro = '2010'
	WHERE id_Carro = 1002;
UPDATE tbCarros SET ano_Carro = '1981'
	WHERE id_Carro = 1003;
UPDATE tbCarros SET ano_Carro = '1999'
	WHERE id_Carro = 1004;
UPDATE tbCarros SET ano_Carro = '2001'
	WHERE id_Carro = 1005;
UPDATE tbCarros SET ano_Carro = '2008'
	WHERE id_Carro = 1006;

-- Verifica as atualizações
SELECT * FROM tbCarros;



