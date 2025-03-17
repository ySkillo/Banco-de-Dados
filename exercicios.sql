
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

