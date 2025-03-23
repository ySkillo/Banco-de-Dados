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













-- Exercicio 5

-- Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1, implemente com o script realizando os seguintes comandos:

-- - Criar as tabelas;

-- - Inserir 5 registros

-- - Configurar chave estrangeira

-- - Exibir dados;

-- - Exibir dados com AS;

-- - Exibir dados com CASE;

-- - Exibir dados com IFNULL;



CREATE TABLE tbCandidato (
    idCandidato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE
);

CREATE TABLE tbHabilitacao (
    idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
    categoria varchar(5),
    validade DATE,
    fkCandidato INT
);

alter table tbHabilitacao add FOREIGN KEY (fkCandidato) REFERENCES tbCandidato(idCandidato);

INSERT INTO tbCandidato (nome, cpf) VALUES
('Ana Souza', '12345678901'),
('Carlos Lima', '23456789012'),
('Mariana Ribeiro', '34567890123'),
('João Alves', '45678901234'),
('Fernanda Costa', '56789012345');

INSERT INTO tbHabilitacao (categoria, validade, fkCandidato) VALUES
('A', '2025-12-31', 1),
('B', '2025-12-31', 2),
('A e B', '2025-12-31', 3),
('ACC', '2025-12-31', 4),
('A', '2025-12-31', 5);

SELECT * FROM tbCandidato;
SELECT * FROM tbHabilitacao;

SELECT c.nome AS 'Nome do Candidato', h.categoria AS 'Categoria da CNH', h.validade AS 'Validade'
FROM tbCandidato as c
JOIN tbHabilitacao as h ON c.idCandidato = h.fkCandidato;

SELECT c.nome AS 'Nome', 
       CASE h.categoria 
            WHEN 'A' THEN 'Motocicleta'
            WHEN 'B' THEN 'Automóvel'
            WHEN 'A e B' THEN 'Ambos'
            WHEN 'ACC' THEN 'Ciclomotor'
            ELSE 'Desconhecida'
       END AS 'Tipo de Categoria'
FROM tbCandidato c
JOIN tbHabilitacao h ON c.idCandidato = h.fkCandidato;

SELECT c.nome AS 'Nome', IFNULL(h.categoria, 'Sem Habilitação') AS 'Categoria'
FROM tbCandidato c
JOIN tbHabilitacao h ON c.idCandidato = h.fkCandidato;














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

CREATE TABLE tbFarmacia(
    idFarmacia int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj char(18) unique,
    telefone VARCHAR(15)
);

CREATE TABLE tbFarmaceutico(
    idFarmaceutico int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkFarmacia int
--     CONSTRAINT fkFarmacia
--         Foreign Key (fkFarmacia)
--             REFERENCES tbFarmacia(idFarmacia)
    
);
   
CREATE TABLE tbEndereco(
    idEndereço int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cep char(9),
    rua VARCHAR(100),
    numero VARCHAR(5),
	fkFarmacia int
);

-- Inserindo dados na tabela tbFarmacia
INSERT INTO tbFarmacia (nome, cnpj, telefone) VALUES
('Farmácia Saúde', '12.345.678/0001-90', '(11) 98765-4321'),
('Drogaria Bem-Estar', '98.765.432/0001-12', '(21) 91234-5678'),
('Farmácia Vida', '45.678.912/0001-34', '(31) 95678-1234'),
('Farmácia Popular', '56.789.123/0001-56', '(41) 94567-8901'),
('Drogaria Central', '67.890.234/0001-78', '(51) 93456-7890'),
('Farmácia Vida', '45.678.912/0001-34', null);

-- Inserindo dados na tabela tbFarmaceutico
INSERT INTO tbFarmaceutico (nome, fkFarmacia) VALUES
('Ana Souza', 1),
('Carlos Lima', 2),
('Mariana Ribeiro', 3),
('João Alves', 1),
('Fernanda Costa', 4),
('Rafael Martins', 5),
(null,null);

-- Inserindo dados na tabela tbEndereco
INSERT INTO tbEndereco (nome, cep, rua, numero, fkFarmacia) VALUES
('Unidade Centro', '01001-000', 'Rua das Flores', '123', 1),
('Unidade Norte', '02002-111', 'Avenida Brasil', '456', 2),
('Unidade Sul', '03003-222', 'Praça Central', '789', 3),
('Unidade Oeste', '05005-444', 'Avenida das Palmeiras', '202', 4),
('Unidade Sudeste', '06006-555', 'Rua do Comércio', '303', 5),
(null, null, null, null, 6);

alter table tbFarmaceutico add foreign key (fkFarmacia)
            REFERENCES tbFarmacia(idFarmacia);

alter table tbEndereco add foreign key (fkFarmacia)
            REFERENCES tbFarmacia(idFarmacia);
            
select * from tbEndereco;
select * from tbFarmacia;
select * from tbFarmaceutico;

select fo.nome as 'Farmaceutico', f.nome as Farmacia, e.cep as CEP from tbFarmacia as f
	join tbFarmaceutico as fo
		on f.idFarmacia = fo.fkFarmacia
	join tbEndereco as e
		on f.idFarmacia = e.fkFarmacia;
        
select fo.nome as 'Farmaceutico', f.telefone as Telefone, e.cep as CEP,
case 
	when e.nome like '%Centro%' then 'Clinica mais Proxima'
    else 'Clinica Distante'
end as 'Proximidade'
	from tbFarmacia as f
		join tbFarmaceutico as fo
			on f.idFarmacia = fo.fkFarmacia
		join tbEndereco as e
			on f.idFarmacia = e.fkFarmacia;
            



-- não sei usar ifnull

SELECT fo.nome AS 'Farmaceutico', 
       IFNULL(f.telefone, 'telefone não informado') AS 'Telefone', 
       e.cep AS 'CEP'
FROM tbFarmacia AS f
JOIN tbFarmaceutico as fo on f.idFarmacia = fo.fkFarmacia
JOIN tbEndereco as e on f.idFarmacia = e.fkFarmacia;

