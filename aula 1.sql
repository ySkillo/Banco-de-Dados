Comentarios: 
--


-- criar o banco de dados sprint 1
-- todos os comandos são em Inglês
-- todos os comandos termina com ponto e vírgula
-- toda tabela tem uma chave primaria

-- COMO CRIAR UM BANCO DE DADOS :)
CREATE DATABASE sprint1;

-- PARA PODER USAR O BANCO DE DADOS:
USE sprint1;

-- CRIAR NOSSA PRIMEIRA TABELA

CREATE TABLE tbAluno (
	ra char(8) PRIMARY KEY, -- idAluno INT PRIMARY KEY
	nome VARCHAR(30),
	bairro VARCHAR(25)
);


-- COMO REGRA A CHAVE PRIMARY É SEMPRE DO TIPO INTEIRO(INT)
-- SE TEM EXCEÇÃO COMO O RA, PODE SER OUTRA TIPAGEM
-- show tables;
-- describe tbAluno;
-- desc tbAluno

-- Inserir dados:
-- Todo texto usa ''
-- caso seja INT, NUM etc... pode passar apenas os números.

INSERT INTO tbAluno VALUES 
	('01251020','Henry','Flor de Maio');

INSERT INTO tbAluno VALUES 
	('01251089','Anne','Barroso'),
	('01251008','João Victor','	Cantinho do Céu');


INSERT INTO tbAluno VALUES (ra, nome)
('01251057','Hygor');



-- Exibir os dados da minha tabela.

SELECT * FROM tbAluno; -- Exibe todas as linhas

SELECT ra, nome, bairro FROM tbAluno; -- Exibe todas as linhas



-- exibir alunos que moram apenas em Cantinho do céu
SELECT * FROM tbAluno
WHERE bairro = 'Cantinho do Céu';

SELECT * FROM tbAluno
WHERE bairro != 'Cantinho do Céu';

SELECT * FROM tbAluno
WHERE bairro <> 'Cantinho do Céu';

-- Exibir aluno que mora em flor de maio ou o aluno que mora em cantinho do céu
SELECT * FROM tbAluno WHERE bairro = 'Flor de Maio'
	OR bairro = ' Cantinho do Céu'

SELECT * FROM tbAluno
	WHERE bairro IN ('Flor de Maio', ' Cantinho do Céu');


SELECT * FROM tbAluno;




--Exibir nomes que começam com a letra H
SELECT nome FROM tbAluno
WHERE nome LIKE 'H%';


--Exibir nomes que terminam com R

SELECT nome FROM tbAluno
WHERE nome LIKE '%r';

-- Exibir os nomes que contem a letra Y

SELECT nome FROM tbAluno
WHERE nome LIKE '%y%';

-- Exibir os nomes onde a 2º Letra é E
SELECT nome FROM tbAluno
WHERE nome LIKE '_e%';


--Exibir os nomes onde a penultima letra é R
SELECT nome FROM tbAluno
WHERE nome LIKE '%r_';

--Exibir dados ordenados em ordem crescente do nome

SELECT nome FROM tbAluno
ORDER BY nome ASC;

--Exibir dados ordenados em ordem decrescente do nome
SELECT nome FROM tbAluno
ORDER BY nome DESC;

--Exibir os dados dos alunos que começam com H ordenados pelo bairro

SELECT * FROM tbAluno
WHERE nome LIKE 'H%'
ORDER BY bairro;

-- Exibir os nomes que tenham 2 nomes
SELECT * FROM tbAluno
WHERE nome LIKE '% %';

-- Setiver espaço ele irá apresentar "Dois nomes";



-- Desafio --
-- Exibir o bairro onde o 3 nome começa com m

SELECT bairro FROM tbAluno
WHERE bairro LIKE '% % M%';

-- Para excluir uma tabela 

DROP TABLE tbAluno;





























