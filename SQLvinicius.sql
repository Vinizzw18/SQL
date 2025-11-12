create database Teste;
show databases;

use Teste;

create table alunos(
	id int auto_increment primary key,
    nome varchar(100) not null,
    idade int,
    disciplina varchar(50)
);

show tables;

insert into alunos (nome, idade, disciplina)
values('João Carlos', 17, 'Banco de Dados'),
('Maria Rita', 24, 'Lógica de Programação'),
('Renato da Silva', 28, 'Banco de dados'),
('Fernanda Ramos', 21, 'Programação de Aplicativos'),
('Evelin Duarte', 32, 'Lógica de Programação'),
('Mariana Alves', 18, 'Modelagem de Sistema'),
('Carlos Lima', 17, 'Desenvolvimento Web'),
('Ana Souza', 16, 'Banco de Dados'),
('Marcelo Vieira', 25, 'Programação de Aplicativos'),
('André Gregório', 17, 'Modelagem de Sistema');
	
select * from alunos;

select nome, idade from alunos;

select * from alunos where disciplina='Modelagem de Sistema';

select * from alunos where idade>=19;

select nome from alunos order by nome asc;

select nome, idade from alunos order by idade asc;

select * from alunos where disciplina='Modelagem de Sistema' or disciplina='Programação de Aplicativos';

select count(*) from alunos;

select avg(idade) from alunos;

select disciplina, COUNT(*) as total_alunos from alunos group by disciplina;

update alunos set idade = 19 where 	nome='Ana Souza';
SELECT * FROM alunos WHERE nome = 'Ana Souza';

update alunos set disciplina='Programação Mobile' where disciplina='Programação de Aplicativos';
select * from alunos;

delete from alunos where nome='André Gregório';
select * from alunos;

ALTER TABLE alunos ADD email VARCHAR(200);
select * from alunos;

ALTER TABLE alunos modify disciplina varchar(150);
select * from alunos;

ALTER TABLE alunos DROP email;
select * from alunos;

select * from alunos where nome like 'A%'; 

select * from alunos where nome like '%A'; 

select * from alunos where nome like '%e%'; 
 
select disciplina from alunos group by disciplina having avg(idade) > 19;

select max(idade) from alunos;

select nome, idade from alunos where idade= (select max(idade) from alunos);
 
CREATE TABLE alunos_bd AS SELECT * FROM alunos  WHERE disciplina = 'Banco de Dados';
SELECT * FROM alunos_bd;




create database biblioteca_db;
show databases;

use biblioteca_db;

create table livros(
	id int auto_increment primary key,
    titulo varchar(150) not null,
    autor varchar(100),
    ano_publicacao(int),
    disponivel boolean
);