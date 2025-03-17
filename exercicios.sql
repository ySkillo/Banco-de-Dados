
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

use sprint1;

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




