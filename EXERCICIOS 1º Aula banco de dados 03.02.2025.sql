CREATE DATABASE sprint1;

USE sprint1;

/*
 EXERCICIO 01
*/
CREATE TABLE tbAtleta(
	id_Atleta INT PRIMARY KEY AUTO_INCREMENT,
	nome_Atleta varchar(40),
	modalidade varchar (40),
	qtdMedalha int
);

-- VERIFICANDO SE A TABELA FOI CRIADA + VERIFICANDO COLUNAS --
SHOW TABLES;
DESC tbAtleta;

-- Inserindo dados na tabela --
-- Considero uma boa praticar passar os tipos de dados para fazer o Insert
INSERT INTO tbAtleta (nome_Atleta, modalidade, qtdMedalha) VALUES
('João Gomes', 'Natação', 3),
('Maria Paola', 'Futebol', 5),
('Carlos Migel', 'Atletismo', 2),
('Fernanda Costa', 'Judô', 4),
('Ricardo Andrade', 'Basquete', 1),
('Ana Pereira', 'Tênis', 6),
('Pedro Santos', 'Vôlei', 2),
('Beatriz Alves', 'Ginástica', 7),
('Lucas Ferreira', 'Ciclismo', 1),
('Isabela Rocha', 'Boxe', 3),
('Roberto Fernandes', 'Ciclismo', 4);

-- Exibindo todos os dados da tabela. --	
 SELECT * FROM tbAtleta;
 
 -- Exibindo somente nome e quantidade de Medalhas --
 SELECT nome_Atleta, qtdMedalha FROM tbAtleta;
 
 -- Exibindo dados de atletas de apenas uma modalidade --
SELECT * FROM tbAtleta
	WHERE modalidade = 'Futebol';

-- Exibir os dados da tabela ordenados pela modalidade --
SELECT * FROM tbAtleta
	ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente --
SELECT * FROM tbAtleta
	ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s --
SELECT * FROM tbAtleta
	WHERE nome_Atleta LIKE '%s%';
    
-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra --
SELECT * FROM tbAtleta
	WHERE nome_Atleta LIKE 'f%';
    
-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o --
SELECT * FROM tbAtleta
	WHERE nome_Atleta LIKE '%o';
    
/*
Acredito que ficaria mais direto se fizesse:
SELECT * FROM tbAtleta
	WHERE nome_Atleta LIKE '% %o';
por conta de conter um sobrenome, acredito que a leitura no banco
seria ainda mais detalhada.
*/
    
-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r --
SELECT * FROM tbAtleta
	WHERE nome_Atleta LIKE '%r_';
    
-- Eliminar a tabela --
DROP TABLE tbAtleta;




/*****
	Exercicio 02
*****/

-- Garantir que está usando o banco de dados correto. --
USE sprint1;

-- Criando tabela --
CREATE TABLE tbMusica(
	id_Musica INT PRIMARY KEY AUTO_INCREMENT,
	titulo_Musica VARCHAR(40),
	artista_Musica VARCHAR (40),
	genero_Musica VARCHAR (40)
);

-- VERIFICANDO SE A TABELA FOI CRIADA + VERIFICANDO COLUNAS --
SHOW TABLES;
DESC tbMusica;

-- Inserindo dados na tabela --
INSERT INTO tbMusica (titulo_Musica, artista_Musica, genero_Musica) VALUES
('Shape of You', 'Ed Sheeran', 'Pop'),
('Blinding Lights', 'The Weeknd', 'Pop'),
('Bohemian Rhapsody', 'Queen', 'Rock'),
('Bad Guy', 'Billie Eilish', 'Pop'),
('Smells Like Teen Spirit', 'Nirvana', 'Rock'),
('Uptown Funk', 'Bruno Mars', 'Funk'),
('Levitating', 'Dua Lipa', 'Pop'),
('Rolling in the Deep', 'Adele', 'Pop'),
('Hotel California', 'Eagles', 'Rock'),
('Lose Yourself', 'Eminem', 'Hip Hop'),
('Despacito', 'Luis Fonsi', 'Reggaeton'),
('Dance Monkey', 'Tones and I', 'Pop'),
('Shape of You', 'Ed Sheeran', 'Pop'),
('Can t Stop the Feeling!', 'Justin Timberlake', 'Pop'),
('Wonderwall', 'Oasis', 'Rock');

-- Exibir todos os dados da tabela. --
SELECT * FROM tbMusica;


-- Exibir apenas os títulos e os artistas das músicas. -- 
SELECT titulo_Musica, artista_Musica FROM tbMusica;

-- Exibir apenas os dados das músicas de um determinado gênero. --
SELECT * FROM tbMusica
	WHERE genero_Musica = 'Pop';

-- Exibir apenas os dados das músicas de um determinado artista. --
SELECT * FROM tbMusica
	WHERE artista_Musica = 'Ed Sheeran';

-- Exibir os dados da tabela ordenados pelo título da música. --
SELECT * FROM tbMusica
	ORDER BY titulo_Musica;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente. --
SELECT * FROM tbMusica
	ORDER BY artista_Musica DESC;


-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra. --
SELECT * FROM tbMusica
	WHERE titulo_Musica LIKE 's%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra. --
SELECT * FROM tbMusica
	WHERE artista_Musica LIKE '%n';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra. --
SELECT * FROM tbMusica
	WHERE genero_Musica LIKE '_o%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra. --
SELECT * FROM tbMusica
	WHERE titulo_Musica LIKE '%n_';

-- Eliminar a tabela --
DROP TABLE tbMusica;




/*****
	Exercicio 03
******/

-- Garantindo que o banco esta sendo usado --
USE sprint1;

-- Criando tabela --
CREATE TABLE tbFilme(
	id_Filme INT PRIMARY KEY AUTO_INCREMENT,
	titulo_Filme VARCHAR(50),
	genero_Filme VARCHAR(40),
	diretor_Filme VARCHAR(40)
);



-- Inserindo dados na tabela --
INSERT INTO tbFilme (titulo_Filme, genero_Filme, diretor_Filme) VALUES
('Las vacas', 'Comedia', 'Cururu'),
('Ratazanas Malditas', 'Terror', 'Alfred'),
('A migragem', 'Ação', 'Joice'),
('Você não vale nada', 'Comedia', 'Chico'),
('Piranhas assassinas', 'Romance', 'Cururu'),
('Tiriça matadora', 'Ação','Joice'),
('Não diga nada', 'Suspense', 'Alfred'),
('A volta dos que não foram', 'Suspense', 'Walbert'),
('A ida dos que não vão', 'Suspense', 'Sandra'),
('Amor por cavalo', 'Romance', 'Paola'),
('Sem dona', 'Comedia', 'Sandra');

-- Exibir todos os dados da tabela. --
SELECT * FROM tbFilme;

-- Exibir apenas os títulos e os diretores dos filmes. --
SELECT titulo_Filme FROM tbFilme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
SELECT * FROM tbFilme
	WHERE genero_Filme = 'Ação';

-- Exibir apenas os dados dos filmes de um determinado diretor. --
SELECT * FROM tbFilme
	WHERE diretor_Filme = 'Cururu';

-- Exibir os dados da tabela ordenados pelo título do filme. --
SELECT * FROM tbFilme
	ORDER BY titulo_Filme;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente. --
SELECT * FROM tbFilme
	ORDER BY diretor_Filme DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra. --
SELECT * FROM tbFilme
	WHERE titulo_Filme LIKE 'a%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra. --
SELECT * FROM tbFilme
	WHERE diretor_Filme LIKE '%d';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra. --
SELECT * FROM tbFilme
	WHERE genero_Filme LIKE '_o%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra. --
SELECT * FROM tbFilme
	WHERE titulo_Filme LIKE '%a_';

-- Elimine a tabela. --
DROP TABLE tbFilme;




/*****
	Exercicio 04
******/

-- Garantindo que o banco esta sendo usado --
USE sprint1;

-- Criando a tabela --
CREATE TABLE tbProfessor(
	id_Professor INT PRIMARY KEY AUTO_INCREMENT,
	nome_Professor VARCHAR(50),
	especialidade_Professor VARCHAR(40),
	dtNasc_Professor DATE
);


INSERT INTO tbProfessor (nome_Professor, especialidade_Professor, dtNasc_Professor) VALUES
('Lucas Andrade', 'Historia', '1973-01-15'),
('Marcos Silva', 'Matematica', '2003-07-18'),
('Marina Oliveira', 'Historia', '1963-04-13'),
('Gilvaneide Cardoso', 'Geografia', '1983-08-04'),
('Pamela Dias', 'Filosofia', '2004-03-25'),
('Thiago Reis', 'Sociologia', '1971-02-07'),
('Matheus Gomes', 'Artes', '1980-05-10'),
('Matheus Silva', 'Matematica', '1998-10-10'),
('João Carlos', 'Português', '1980-12-13'),
('Jonatham Fernandes', 'Fisica', '2002-10-04'),
('Carla Pinto', 'Historia', '1990-11-12');


-- Exibir todos os dados da tabela. --
SELECT * FROM tbProfessor;

-- Exibir apenas as especialidades dos professores. --
SELECT especialidade_Professor FROM tbProfessor;

-- Exibir apenas os dados dos professores de uma determinada especialidade. --
SELECT * FROM tbProfessor
	WHERE especialidade_Professor = 'Historia';

-- Exibir os dados da tabela ordenados pelo nome do professor. --
SELECT * FROM tbProfessor
	ORDER BY nome_Professor;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente. --
SELECT * FROM tbProfessor
	ORDER BY dtNasc_Professor DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra. --
SELECT * FROM tbProfessor
	WHERE nome_Professor LIKE 'm%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra. --
SELECT * FROM tbProfessor
	WHERE nome_Professor LIKE '%a';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra. --
SELECT * FROM tbProfessor
	WHERE nome_Professor LIKE '_a%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra. --
SELECT * FROM tbProfessor
	WHERE nome_Professor LIKE '%o_';

-- Eliminando a tabela. --
DROP TABLE tbProfessor;

/*****
	Exercicio 05
******/


-- Garantindo que o banco esta sendo usado --
USE sprint1;

-- Criando tabela --
CREATE TABLE tbJogo(
	id_Jogo INT PRIMARY KEY AUTO_INCREMENT,
	nome_Jogo VARCHAR(50),
	comentario_Jogo VARCHAR(200),
	ranking_Jogo INT
);

-- Inserindo dados --
INSERT INTO tbJogo (nome_Jogo, comentario_Jogo, ranking_Jogo) VALUES
('Minecraft', 'Ótimo jogo', '5'),
('CS GO', 'Exelente Jogo', '2'),
('Valorant', 'Ótimo Jogo', '1'),
('Fortnite', 'Mediano', '7'),
('Combat Arms', 'Bom Jogo', '6'),
('Warzone', 'Ótimo Jogo', '3'),
('Batman Arkan', 'Ótimo Jogo', '4');

-- Exibir todos os dados da tabela. --
SELECT * FROM tbJogo;

-- Exibir apenas os nomes dos jogos. --
SELECT nome_Jogo FROM tbJogo;

-- Exibir apenas o comentário de um determinado jogo. --
SELECT comentario_Jogo FROM tbJogo
	WHERE nome_Jogo = 'CS GO';

-- Exibir os dados da tabela ordenados pelo nome do jogo. --
SELECT * FROM tbJogo
	ORDER BY nome_Jogo;

-- Exibir os dados da tabela ordenados pelo ranking em ordem decrescente. -- 
SELECT * FROM tbJogo
	ORDER BY ranking_Jogo DESC;

-- Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra. --
SELECT * FROM tbJogo
	WHERE nome_Jogo LIKE 'c%';

-- Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra. --
SELECT * FROM tbJogo
	WHERE nome_Jogo LIKE '%o';

-- Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra. --
SELECT * FROM tbJogo
	WHERE nome_Jogo LIKE '_a%';

-- Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra. --
SELECT * FROM tbJogo
	WHERE nome_Jogo LIKE '%n_';

-- Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft. --
SELECT * FROM tbJogo
	WHERE nome_Jogo != 'Minecraft';

-- Eliminando a tabela --
DROP TABLE tbJogo;






















