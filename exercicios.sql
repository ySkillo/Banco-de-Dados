Exercício 1.


-- Escreva e execute os comandos para:
-- • Criar a chave estrangeira na tabela correspondente conforme modelagem;
-- • Atualizar o país de todos os atletas;
-- • Exibir os atletas e seu respectivo país;
-- • Exibir apenas o nome do atleta e o nome do respectivo país;
-- • Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;






USE sprint2;

-- • Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave
-- primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho
-- 40), qtdMedalha (int, representando a quantidade de medalhas que o atleta
-- possui)

-- 1:N
CREATE TABLE tbAtleta(
    idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nomeAtleta VARCHAR(40) NOT NULL,
    modalidadeAtleta VARCHAR(40) NOT NULL,
    qntMedalha INT,
    fkPais INT
);

-- • Inserir dados na tabela, procurando colocar mais de um atleta para cada
-- modalidade e pelo menos 5 atletas.

INSERT INTO tbAtleta (nomeAtleta, modalidadeAtleta, qntMedalha, fkPais) VALUES
    ('Armando','Futebol', 5, 1),
    ('Cláudia','Volei', 2, 2),
    ('Maria','Basquete', 1, 4),
    ('Roberta','Natação', 4, 3),
    ('Antoni','Futebol', 7, 4);


-- • Criar uma tabela chamada País para conter os dados: idPais (int e chave primária
-- da tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);

CREATE TABLE tbPais(
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nomePais VARCHAR(30) NOT NULL,
    capitalPais VARCHAR(40) NOT NULL
);

-- • Inserir pelo menos 4 países na tabela país.
INSERT INTO tbPais (nomePais, capitalPais) VALUES
    ('Argentina', 'Buenos Aires'),
    ('Brasil', 'Brasília'),
    ('França', 'Paris'),
    ('Alemanha', 'Berlim'),
    ('Japão', 'Tóquio');



-- Fazer a modelagem lógica conforme a regra de negócio:
-- • 1 país tem 1 ou muitos atletas;
-- • 1 atleta é de 1 e somente 1 país;
ALTER TABLE tbAtleta ADD foreign key (fkPais)
		references tbPais(idPais);



