-- CRIAR UM USUARIO PELO PROMPT (CMD);

create user 'coordenador'@'localhost' identified by 'Urubu100@';

grant all privileges on *.* to 'coordenador'@'localhost';

grant all privileges on sprint1 to 'coordenador'@'localhost'; -- modificação apenas nesse banco

grant all privileges on sprint1.tbAluno to 'coordenador'@'localhost'; -- modificação apenas em uma tabela

flush privileges;

