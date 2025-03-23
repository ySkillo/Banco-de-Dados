create database sprint2;

USE sprint2;

CREATE TABLE tbPais(
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nomePais VARCHAR(30) NOT NULL,
    capitalPais VARCHAR(40) NOT NULL
);

INSERT INTO tbPais (nomePais, capitalPais) VALUES
    ('Argentina', 'Buenos Aires'),
    ('Brasil', 'Brasília'),
    ('França', 'Paris'),
    ('Alemanha', 'Berlim'),
    ('Japão', 'Tóquio');

CREATE TABLE tbAtleta(
    idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nomeAtleta VARCHAR(40) NOT NULL,
    modalidadeAtleta VARCHAR(40) NOT NULL,
    qntMedalha INT,
    fkPais INT
);

ALTER TABLE tbAtleta ADD foreign key (fkPais)
        references tbPais(idPais);

INSERT INTO tbAtleta (nomeAtleta, modalidadeAtleta, qntMedalha, fkPais) VALUES
    ('Armando','Futebol', 5, 1),
    ('Cláudia','Volei', 2, 2),
    ('Maria','Basquete', 1, 4),
    ('Roberta','Natação', 4, 3),
    ('Antoni','Futebol', 7, 4);


select * from tbAtleta;

select * from tbPais;

select * from tbAtleta as a
join tbPais as p
on a.fkPais = p.idPais;
 
select a.nomeAtleta as Atleta, p.nomePais as Pais from tbAtleta as a
join tbPais as p
on a.fkPais = p.idPais;

select a.nomeAtleta as Atleta, p.nomePais as Pais, p.capitalPais as Capital from tbAtleta as a
join tbPais as p
on a.fkPais = p.idPais;

/*
Exercício 2:
*/
use sprint2;

CREATE TABLE album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR(45),
    dtLancamento DATE,
    CONSTRAINT chkTipo CHECK(tipo IN ('digital', 'fisico'))
);

CREATE TABLE musica (
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40),
    fkAlbum INT,
    FOREIGN KEY (fkAlbum) REFERENCES album(idAlbum)
);

-- Inserindo dados na tabela album
INSERT INTO album (nome, tipo, dtLancamento) VALUES
('Divide', 'digital', '2017-03-03'),
('After Hours', 'fisico', '2020-03-20'),
('Future Nostalgia', 'digital', '2020-03-27');

-- Inserindo dados na tabela musica com referência ao álbum correto
INSERT INTO musica (titulo, artista, genero, fkAlbum) VALUES
('Shape of You', 'Ed Sheeran', 'Pop', 1),
('Castle on the Hill', 'Ed Sheeran', 'Pop', 1),
('Blinding Lights', 'The Weeknd', 'Pop', 2),
('Save Your Tears', 'The Weeknd', 'Pop', 2),
('Don''t Start Now', 'Dua Lipa', 'Pop', 3),
('Levitating', 'Dua Lipa', 'Pop', 3);

TRUNCATE TABLE album;

drop Table musica;

DESC album;

DESC musica;

SELECT * from musica as m
    join album as a
        on a.idAlbum = m.fkAlbum;
        
SELECT m.*, a.tipo  from musica as m
    join album as a
        on a.idAlbum = m.fkAlbum
        where a.tipo = 'fisico';




-- EXERCICIO 03

USE sprint2;
show tables;

CREATE TABLE tbPessoa(
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nomePessoa VARCHAR(45),
    cpfPessoa CHAR(11)
);

CREATE TABLE tbReserva(
	idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fk_Pessoa INT,
		FOREIGN KEY (fk_Pessoa)
			REFERENCES tbPessoa(idPessoa)
);

INSERT INTO tbPessoa (nomePessoa, cpfPessoa)VALUES 
	('Marcia','11122233344'),
	('Pedro','22233344455'),
	('Mariana','33344455566'),
	('Gustavo','44455566677'),
    ('Paula','55566677788');
    
    
INSERT INTO tbReserva (dtReserva, dtRetirada, dtDevolucao, fk_Pessoa)VALUES 
	('2000-01-04 15:00:00','2000-01-22 10:00:00', '2000-01-06 12:10:03', 1),
    ('2000-01-10 13:00:00','2000-01-13 14:00:00', null, 2),
    ('2000-01-10 13:00:36','2000-01-13 16:20:17', '2000-01-12 14:30:00', 3),
	('2000-01-22 10:00:13','2000-01-25 12:20:42', null, 4),
	('2000-01-23 07:00:00','2000-01-25 11:35:00', '2000-01-24 12:30:13', 5);
    

SELECT * FROM tbReserva;

SELECT p.nomePessoa AS 'Nome Pessoa', r.dtReserva AS 'Data Reserva', r.dtRetirada AS 'Retirada' 
FROM tbPessoa as p
	JOIN tbReserva as r
		ON idPessoa = r.fk_Pessoa;
        
        
SELECT	p.nomePessoa AS 'Nome Pessoa', 
		r.dtReserva AS 'Data Reserva',  
        r.dtRetirada AS 'Data Retirada', 
        ifnull(r.dtDevolucao, 'não houve devolução') AS 'Data Devolução'
	FROM tbPessoa AS p
     JOIN tbReserva AS r
		ON p.idPessoa = r.fk_Pessoa;
        

SELECT 
	p.nomePessoa,
    r.dtReserva,
    r.dtRetirada,
    r.dtDevolucao,
		CASE
			WHEN r.dtDevolucao IS NULL THEN 'sem devolucao aqui'
			ELSE 'a devolução foi feita'
        END AS 'DEVOLUÇÕES'
    FROM tbPessoa as p
		JOIN tbReserva as r
			ON p.idPessoa = r.fk_Pessoa;
            
            
            
















-- ultimo exercicio

-- Exercício 6:

-- Regra de negócio:

-- 1 Farmácia tem no mínimo 1 e no máximo 1 endereço, 1 endereço é de no mínimo 1 farmácia e no máximo 1.

-- 1 Farmácia tem no mínimo 1 farmacêutico e no máximo n, 1 farmacêutico é de no mínimo 1 farmácia e no máximo 1.

-- - Criar a modelagem lógica na regra acima, com os campos de sua escolha.

-- - Criar as tabelas;

-- - Inserir 5 registros;

-- - Configurar chave estrangeira;

-- - Exibir dados;

-- - Exibir dados com AS;

-- - Exibir dados com CASE;

-- - Exibir dados com IFNULL;

use sprint2;

CREATE TABLE tbFarmaceutico(
    idFarmaceutico int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
   
);

CREATE TABLE tbEndereco(
    idEndereço int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cep char(9),
    numero VARCHAR(5)
);

CREATE TABLE tbFarmacia(
    idFarmacia int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj char(18),
    CONSTRAINT fkEndereço
        Foreign Key (tbEnderco)
            REFERENCES tbEndereco(idEndereco)
);

