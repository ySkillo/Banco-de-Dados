USE sprint1;

CREATE TABLE tbPessoa(
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
	nome_Pessoa VARCHAR (40),
	dataNasc_Pessoa DATE
) AUTO_INCREMENT = 1000;

INSERT INTO tbPessoa VALUES 
	(default, 'Homem aranha','1954-01-10');

INSERT INTO tbPessoa VALUES 
	(null, 'Mulher Maravilha','1954-10-30');

INSERT INTO tbPessoa VALUES 
	(default, 'Homem aranha','1954-01-10');

SELECT * FROM tbPessoa;


/*
	CAMPOS NUMERICOS:

	NUMEROS INTEIROS TIPAGENS > 
	- INT e TINYINT

	NUMEROS DECIMAIS TIPAGENS >
	- FLOAT - 7 CARACTERES: 12345,67 (NO INSERT USAR . AO INVES DE ,)
	- DOUBLE - 15 CARACTERES: 12345678998,7654
	- DECIMAL(5,2) 123.45

*/

-- ADICIONAR A COLUNA "ALUTURA" NA tbPessoa

ALTER TABLE tbPessoa
	ADD COLUMN altura_Pessoa FLOAT;


ALTER TABLE tbPessoa
	ADD COLUMN salario_Pessoa DECIMAL(10,2);

INSERT INTO tbPessoa (nome_Pessoa, salaripo_Pessoa) VALUES
	('Hulk', 1.99);



-- ATUALIZANDO UMA LINHA JÁ EXISTENTE
UPDATE tbPessoa SET salaripo_Pessoa = 50.99
	WHERE idPessoa = 1;


-- NÃO EXISTE UPDATE SEM O WHERE NO MYSQL NO WHERE SEMPRE DEVE SER A CHAVE PRIMARIA.

-- PARA EXCLUIR UMA COLUNA DA TABELA
ALTER TABLE tbPessoa DROP COLUMN altura_Pessoa;


-- MODIFICAR O CAMPO NOME PARA VARCHAR(50)
ALTER TABLE tbPessoa MODIFY COLUMN nome_Pessoa VARCHAR(50);

DESCRIBE tbPessoa;


-- Renome o campo dataNasc
ALTER TABLE tbPessoa RENAME COLUMN dataNasc_Pessoa TO dataNasc;

--EXCLUIR UMA LINHA
DELETE FROM tbPessoa WHERE idPessoa = 2;

--nesse caso apareceria do ultimo id + 1
INSERT INTO tbPessoa (nome_Pessoa, salaripo_Pessoa) VALUES
	('Homem de Ferro', 1000.98);

-- A PARTIR DE AGORA O AUTO INCREMENT IRA COMEÇAR POR 1000
ALTER TABLE tbPessoa AUTO_INCREMENT = 1000;

INSERT INTO tbPessoa (nome_Pessoa, dataNasc, salaripo_Pessoa) VALUES
	('Chapolin', '1859-01-01', 0.99);


-- Limpar os dados da tabela
-- Limpa inclusive o auto increment
TRUNCATE TABLE tbPessoa;



