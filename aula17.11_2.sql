drop database if exists escola;

create database escola;
use escola;
show databases;

create table alunos (
	id int auto_increment primary key,
	nome varchar (100) not null,
    email varchar (100) not null,
    data_nascimento date,
    turma_id int
);

 create table professores(
	id int auto_increment primary key,
    nome varchar (100) not null,
    especialidade varchar(100) 
 );
 
 create table turmas(
	id int auto_increment primary key,
    nome varchar (100) not null,
    professor_id int not null,
    horario time,
    foreign key (professor_id) references professores(id)
 );
 
 create table disciplinas(
	id int auto_increment primary key,
    nome varchar(100) not null,
    carga_horaria int
);

create table notas(
	id int auto_increment primary key,
    aluno_id int,
    disciplina_id int,
    nota decimal(2, 1),
    bimestre int,
    foreign key (aluno_id) references alunos(id),
    foreign key (disciplina_id) references disciplinas(id)
);
drop table notas, alunos;
alter table alunos add foreign key (turma_id) references turmas(id);
desc alunos;

INSERT INTO professores (nome, especialidade) VALUES
('Carlos Alberto Mendes', 'Matemática'),
('Juliana Ribeiro Santos', 'História'),
('Marcos Vinícius Oliveira', 'Física'),
('Renata Almeida Costa', 'Biologia'),
('Fernanda Lopes Martins', 'Português');
select * from professores;

INSERT INTO turmas (nome, professor_id, horario) VALUES
('Matemática - Turma A', 1, '08:00:00'),
('História - Turma B', 2, '09:30:00'),
('Física - Turma C', 3, '10:45:00'),
('Biologia - Turma D', 4, '13:00:00'),
('Português - Turma E', 5, '14:20:00');
select * from turmas;

INSERT INTO alunos (nome, email, data_nascimento, turma_id) VALUES
('Ana Beatriz Silva', 'ana.silva@example.com', '2007-05-12', 1),
('Lucas Ferreira Gomes', 'lucas.gomes@example.com', '2006-11-03', 1),
('Mariana Costa Pereira', 'mariana.pereira@example.com', '2007-02-28', 2),
('João Pedro Martins', 'joao.martins@example.com', '2006-09-17', 2),
('Gabriel Souza Andrade', 'gabriel.andrade@example.com', '2007-08-21', 3),
('Larissa Monteiro Dias', 'larissa.dias@example.com', '2006-12-02', 3),
('Fernanda Lima Rocha', 'fernanda.rocha@example.com', '2007-04-10', 4),
('Ricardo Alves Nunes', 'ricardo.nunes@example.com', '2006-07-30', 4),
('Vitória Mendes Duarte', 'vitoria.duarte@example.com', '2007-01-19', 5),
('Thiago Ramos Oliveira', 'thiago.oliveira@example.com', '2006-10-05', 5);
select * from alunos;