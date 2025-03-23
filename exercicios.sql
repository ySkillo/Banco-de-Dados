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
No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
• Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho
40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave
primária da tabela.
• Inserir dados na tabela, procurando colocar um gênero de música que tenha mais
de uma música, e um artista, que tenha mais de uma música cadastrada. Procure
inserir pelo menos umas 3 músicas.
• Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital
ou físico) e dtLancamento (DATE).
• Inserir pelo menos 2 albuns;
• Fazer a modelagem lógica conforme a regra de negócio:
• 1 album pode ter 1 ou muitas músicas;
• 1 música é de 1 e somente 1 album;
Execute os comandos para:
a) Exibir todos os dados das tabelas separadamente;
b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
c) Atualizar os álbuns de cada música;
d) Exibir as músicas e seus respectivos álbuns;
e) Exibir somente o título da música e o nome do seu respectivo álbum;
f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
*/

use sprint2;

CREATE Table musica (
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)      
);

INSERT INTO musica (titulo, artista, genero)
VALUES
('Shape of You', 'Ed Sheeran', 'Pop'),
('Castle on the Hill', 'Ed Sheeran', 'Pop'),
('Blinding Lights', 'The Weeknd', 'Pop');


CREATE Table album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR (45),
    dtLancamento DATE,
    fkMusica INT,
    constraint chkTipo check(tipo IN('digital','fisico'))
);

INSERT INTO album (nome, tipo, dtLancamento, fkMusica)
VALUES
('Divide', 'fisico', '2017-03-03',1),
('After Hours', 'digital', '2020-03-20',2),
('Akira', 'digital', '2022-03-20',3);

DROP Table album;

TRUNCATE TABLE album;

drop Table musica;

alter table album add FOREIGN KEY (fkMusica)
    REFERENCES musica(idMusica);

DESC album;

DESC musica;

SELECT * from album as a
    join musica as m
        on a.fkMusica = m.idMusica;

SELECT * from album as a
    join musica as m
        on a.fkMusica = m.idMusica;




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

