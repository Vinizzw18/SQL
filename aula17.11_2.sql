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

INSERT INTO disciplinas (nome, carga_horaria) VALUES
('Matemática', 80),
('História', 60),
('Física', 70),
('Biologia', 65),
('Português', 75),
('Química', 70),
('Geografia', 60),
('Inglês', 50);
select * from disciplinas;

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre) VALUES
(1, 1, 8.5, 1), (1, 1, 9.0, 2), (1, 1, 8.7, 3), (1, 1, 9.2, 4),
(1, 2, 7.5, 1), (1, 2, 7.8, 2), (1, 2, 8.0, 3), (1, 2, 8.3, 4),
(1, 3, 8.0, 1), (1, 3, 8.2, 2), (1, 3, 8.5, 3), (1, 3, 8.7, 4),
(1, 4, 7.2, 1), (1, 4, 7.5, 2), (1, 4, 7.8, 3), (1, 4, 8.0, 4),
(1, 5, 8.8, 1), (1, 5, 9.0, 2), (1, 5, 9.2, 3), (1, 5, 9.3, 4),
(1, 6, 7.0, 1), (1, 6, 7.3, 2), (1, 6, 7.6, 3), (1, 6, 7.8, 4),
(1, 7, 8.3, 1), (1, 7, 8.5, 2), (1, 7, 8.7, 3), (1, 7, 8.9, 4),
(1, 8, 9.0, 1), (1, 8, 9.2, 2), (1, 8, 9.4, 3), (1, 8, 9.5, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre) VALUES
(2, 1, 7.8, 1), (2, 1, 8.0, 2), (2, 1, 8.2, 3), (2, 1, 8.5, 4),
(2, 2, 6.5, 1), (2, 2, 6.8, 2), (2, 2, 7.0, 3), (2, 2, 7.3, 4),
(2, 3, 7.7, 1), (2, 3, 7.9, 2), (2, 3, 8.0, 3), (2, 3, 8.1, 4),
(2, 4, 6.8, 1), (2, 4, 7.0, 2), (2, 4, 7.2, 3), (2, 4, 7.4, 4),
(2, 5, 8.2, 1), (2, 5, 8.4, 2), (2, 5, 8.6, 3), (2, 5, 8.8, 4),
(2, 6, 6.2, 1), (2, 6, 6.5, 2), (2, 6, 6.7, 3), (2, 6, 6.9, 4),
(2, 7, 7.9, 1), (2, 7, 8.1, 2), (2, 7, 8.3, 3), (2, 7, 8.4, 4),
(2, 8, 8.0, 1), (2, 8, 8.2, 2), (2, 8, 8.4, 3), (2, 8, 8.6, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre) VALUES
(3, 1, 8.0, 1), (3, 1, 8.3, 2), (3, 1, 8.6, 3), (3, 1, 8.8, 4),
(3, 2, 7.5, 1), (3, 2, 7.7, 2), (3, 2, 7.9, 3), (3, 2, 8.1, 4),
(3, 3, 8.1, 1), (3, 3, 8.3, 2), (3, 3, 8.5, 3), (3, 3, 8.6, 4),
(3, 4, 7.8, 1), (3, 4, 8.0, 2), (3, 4, 8.1, 3), (3, 4, 8.3, 4),
(3, 5, 8.9, 1), (3, 5, 9.0, 2), (3, 5, 9.2, 3), (3, 5, 9.3, 4),
(3, 6, 7.3, 1), (3, 6, 7.5, 2), (3, 6, 7.7, 3), (3, 6, 7.9, 4),
(3, 7, 8.4, 1), (3, 7, 8.6, 2), (3, 7, 8.7, 3), (3, 7, 8.9, 4),
(3, 8, 8.7, 1), (3, 8, 8.9, 2), (3, 8, 9.0, 3), (3, 8, 9.2, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(4, 1, 7.2, 1), (4, 1, 7.4, 2), (4, 1, 7.6, 3), (4, 1, 7.8, 4),
(4, 2, 6.8, 1), (4, 2, 7.0, 2), (4, 2, 7.2, 3), (4, 2, 7.4, 4),
(4, 3, 7.4, 1), (4, 3, 7.5, 2), (4, 3, 7.7, 3), (4, 3, 7.8, 4),
(4, 4, 6.9, 1), (4, 4, 7.1, 2), (4, 4, 7.3, 3), (4, 4, 7.4, 4),
(4, 5, 8.1, 1), (4, 5, 8.3, 2), (4, 5, 8.4, 3), (4, 5, 8.5, 4),
(4, 6, 6.5, 1), (4, 6, 6.7, 2), (4, 6, 6.8, 3), (4, 6, 7.0, 4),
(4, 7, 7.5, 1), (4, 7, 7.7, 2), (4, 7, 7.9, 3), (4, 7, 8.0, 4),
(4, 8, 7.8, 1), (4, 8, 8.0, 2), (4, 8, 8.1, 3), (4, 8, 8.3, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(5, 1, 8.3, 1), (5, 1, 8.5, 2), (5, 1, 8.7, 3), (5, 1, 8.9, 4),
(5, 2, 7.1, 1), (5, 2, 7.3, 2), (5, 2, 7.5, 3), (5, 2, 7.7, 4),
(5, 3, 8.4, 1), (5, 3, 8.6, 2), (5, 3, 8.7, 3), (5, 3, 8.9, 4),
(5, 4, 7.6, 1), (5, 4, 7.8, 2), (5, 4, 8.0, 3), (5, 4, 8.2, 4),
(5, 5, 9.0, 1), (5, 5, 9.1, 2), (5, 5, 9.2, 3), (5, 5, 9.3, 4),
(5, 6, 7.2, 1), (5, 6, 7.4, 2), (5, 6, 7.6, 3), (5, 6, 7.8, 4),
(5, 7, 8.5, 1), (5, 7, 8.7, 2), (5, 7, 8.8, 3), (5, 7, 8.9, 4),
(5, 8, 8.8, 1), (5, 8, 9.0, 2), (5, 8, 9.1, 3), (5, 8, 9.2, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(6, 1, 7.9, 1), (6, 1, 8.1, 2), (6, 1, 8.3, 3), (6, 1, 8.5, 4),
(6, 2, 7.0, 1), (6, 2, 7.2, 2), (6, 2, 7.4, 3), (6, 2, 7.6, 4),
(6, 3, 7.8, 1), (6, 3, 8.0, 2), (6, 3, 8.1, 3), (6, 3, 8.3, 4),
(6, 4, 7.1, 1), (6, 4, 7.3, 2), (6, 4, 7.5, 3), (6, 4, 7.7, 4),
(6, 5, 8.4, 1), (6, 5, 8.6, 2), (6, 5, 8.7, 3), (6, 5, 8.9, 4),
(6, 6, 6.9, 1), (6, 6, 7.1, 2), (6, 6, 7.3, 3), (6, 6, 7.5, 4),
(6, 7, 7.8, 1), (6, 7, 8.0, 2), (6, 7, 8.2, 3), (6, 7, 8.3, 4),
(6, 8, 8.0, 1), (6, 8, 8.2, 2), (6, 8, 8.4, 3), (6, 8, 8.6, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(7, 1, 8.7, 1), (7, 1, 8.9, 2), (7, 1, 9.0, 3), (7, 1, 9.2, 4),
(7, 2, 7.9, 1), (7, 2, 8.1, 2), (7, 2, 8.3, 3), (7, 2, 8.5, 4),
(7, 3, 8.5, 1), (7, 3, 8.7, 2), (7, 3, 8.8, 3), (7, 3, 9.0, 4),
(7, 4, 7.8, 1), (7, 4, 8.0, 2), (7, 4, 8.2, 3), (7, 4, 8.4, 4),
(7, 5, 9.3, 1), (7, 5, 9.4, 2), (7, 5, 9.5, 3), (7, 5, 9.6, 4),
(7, 6, 7.4, 1), (7, 6, 7.6, 2), (7, 6, 7.8, 3), (7, 6, 7.9, 4),
(7, 7, 8.6, 1), (7, 7, 8.7, 2), (7, 7, 8.9, 3), (7, 7, 9.0, 4),
(7, 8, 9.0, 1), (7, 8, 9.1, 2), (7, 8, 9.3, 3), (7, 8, 9.4, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(8, 1, 7.3, 1), (8, 1, 7.5, 2), (8, 1, 7.7, 3), (8, 1, 7.9, 4),
(8, 2, 6.8, 1), (8, 2, 7.0, 2), (8, 2, 7.2, 3), (8, 2, 7.4, 4),
(8, 3, 7.2, 1), (8, 3, 7.4, 2), (8, 3, 7.6, 3), (8, 3, 7.8, 4),
(8, 4, 6.9, 1), (8, 4, 7.1, 2), (8, 4, 7.3, 3), (8, 4, 7.5, 4),
(8, 5, 8.1, 1), (8, 5, 8.3, 2), (8, 5, 8.4, 3), (8, 5, 8.6, 4),
(8, 6, 6.5, 1), (8, 6, 6.7, 2), (8, 6, 6.8, 3), (8, 6, 7.0, 4),
(8, 7, 7.7, 1), (8, 7, 7.9, 2), (8, 7, 8.0, 3), (8, 7, 8.2, 4),
(8, 8, 8.0, 1), (8, 8, 8.2, 2), (8, 8, 8.3, 3), (8, 8, 8.5, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(9, 1, 8.4, 1), (9, 1, 8.6, 2), (9, 1, 8.8, 3), (9, 1, 9.0, 4),
(9, 2, 7.6, 1), (9, 2, 7.8, 2), (9, 2, 8.0, 3), (9, 2, 8.2, 4),
(9, 3, 8.3, 1), (9, 3, 8.4, 2), (9, 3, 8.6, 3), (9, 3, 8.7, 4),
(9, 4, 7.5, 1), (9, 4, 7.7, 2), (9, 4, 7.9, 3), (9, 4, 8.1, 4),
(9, 5, 9.2, 1), (9, 5, 9.3, 2), (9, 5, 9.4, 3), (9, 5, 9.5, 4),
(9, 6, 7.1, 1), (9, 6, 7.3, 2), (9, 6, 7.5, 3), (9, 6, 7.7, 4),
(9, 7, 8.4, 1), (9, 7, 8.5, 2), (9, 7, 8.7, 3), (9, 7, 8.8, 4),
(9, 8, 8.9, 1), (9, 8, 9.0, 2), (9, 8, 9.2, 3), (9, 8, 9.3, 4);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)VALUES
(10, 1, 7.5, 1), (10, 1, 7.7, 2), (10, 1, 7.9, 3), (10, 1, 8.1, 4),
(10, 2, 6.9, 1), (10, 2, 7.1, 2), (10, 2, 7.3, 3), (10, 2, 7.5, 4),
(10, 3, 7.6, 1), (10, 3, 7.8, 2), (10, 3, 7.9, 3), (10, 3, 8.1, 4),
(10, 4, 6.8, 1), (10, 4, 7.0, 2), (10, 4, 7.2, 3), (10, 4, 7.4, 4),
(10, 5, 8.2, 1), (10, 5, 8.3, 2), (10, 5, 8.4, 3), (10, 5, 8.6, 4),
(10, 6, 6.7, 1), (10, 6, 6.9, 2), (10, 6, 7.0, 3), (10, 6, 7.2, 4),
(10, 7, 7.8, 1), (10, 7, 8.0, 2), (10, 7, 8.1, 3), (10, 7, 8.3, 4),
(10, 8, 8.0, 1), (10, 8, 8.1, 2), (10, 8, 8.3, 3), (10, 8, 8.5, 4);


/*----------------------1--------------------------*/
select * from alunos where turma_id=1;
 
 /*----------------------2--------------------------*/
 select * from alunos order by nome asc;
 
 /*----------------------3--------------------------*/
 select nome, data_nascimento from alunos where data_nascimento > '2006-12-31' order by data_nascimento;
 
 /*----------------------4--------------------------*/
 SELECT turmas.nome AS turma, COUNT(alunos.id) AS total_alunos
FROM turmas 
LEFT JOIN alunos ON alunos.turma_id = turmas.id
GROUP BY turmas.id, turmas.nome;

/*----------------------5--------------------------*/
SELECT disciplinas.nome AS disciplina,
       AVG(notas.nota) AS media_notas
FROM disciplinas
JOIN notas ON notas.disciplina_id = disciplinas.id
GROUP BY disciplinas.id, disciplinas.nome
ORDER BY disciplinas.nome;

/*----------------------6--------------------------*/
SELECT
    A.nome AS Aluno,
    T.nome AS Turma,
    P.nome AS Professor_Regente
FROM
    alunos A
INNER JOIN
    turmas T ON A.turma_id = T.id -- Conecta Aluno à Turma
INNER JOIN
    professores P ON T.professor_id = P.id -- Conecta Turma ao Professor
ORDER BY
    Aluno;

/*----------------------7--------------------------*/
SELECT
    A.nome AS Nome_Aluno,
    T.nome AS Turma,
    D.nome AS Disciplina,
    N.nota AS Nota,
    N.bimestre AS Bimestre
FROM
    alunos A
INNER JOIN
    notas N ON A.id = N.aluno_id       -- 1. Conecta o aluno com suas notas
INNER JOIN
    disciplinas D ON N.disciplina_id = D.id -- 2. Conecta a nota à disciplina
INNER JOIN
    turmas T ON A.turma_id = T.id      -- 3. Conecta o aluno à sua turma
ORDER BY
    Nome_Aluno, Disciplina, Bimestre;

/*----------------------8--------------------------*/
DELIMITER //

CREATE PROCEDURE CalcularMediaGeral (
    IN p_aluno_id INT,
    OUT p_media_geral DECIMAL(4, 2)
)
BEGIN
    -- Calcula a média aritmética de todas as notas do aluno
    SELECT
        AVG(nota)
    INTO
        p_media_geral
    FROM
        notas
    WHERE
        aluno_id = p_aluno_id;
END //

DELIMITER ;
SET @media_geral_do_aluno = 0.0;
CALL CalcularMediaGeral(2, @media_geral_do_aluno);
SELECT 'Média Geral do Aluno 2:' AS Teste, @media_geral_do_aluno AS Media_Geral_Calculada;
    
/*----------------------9--------------------------*/
 DELIMITER //

CREATE PROCEDURE ListarAlunosPorTurma (
    IN p_turma_id INT -- Parâmetro de entrada: o ID da turma desejada
)
BEGIN
    -- Seleciona os detalhes dos alunos, da turma e do professor
    SELECT
        A.nome AS Nome_do_Aluno,
        A.email AS Email_do_Aluno,
        T.nome AS Nome_da_Turma,
        P.nome AS Professor_Regente
    FROM
        alunos A
    INNER JOIN
        turmas T ON A.turma_id = T.id -- Conecta Alunos à Turma
    INNER JOIN
        professores P ON T.professor_id = P.id -- Conecta a Turma ao Professor
    WHERE
        A.turma_id = p_turma_id -- Filtra apenas os alunos da turma especificada
    ORDER BY
        A.nome;
END //

DELIMITER ;

CALL ListarAlunosPorTurma(1);
/*----------------------10--------------------------*/

SELECT
    A.nome AS Nome_do_Aluno,
    D.nome AS Nome_da_Disciplina,
    -- Calcula a média final das notas na disciplina
    AVG(N.nota) AS Media_Final,
    -- Usa a função CASE para determinar o status
    CASE
        WHEN AVG(N.nota) >= 7.0 THEN 'APROVADO'
        ELSE 'REPROVADO'
    END AS Status_Final
FROM
    alunos A
INNER JOIN
    notas N ON A.id = N.aluno_id
INNER JOIN
    disciplinas D ON N.disciplina_id = D.id
GROUP BY
    A.id, D.id, A.nome, D.nome
ORDER BY
    Nome_do_Aluno, Nome_da_Disciplina;

/*----------------------11--------------------------*/

SELECT
    A.nome AS Nome_do_Aluno,
    -- Calcula a média geral de todas as notas do aluno (em todas as disciplinas e bimestres)
    AVG(N.nota) AS Media_Geral,
    -- Usa uma função de janela (Window Function) para ranquear os alunos
    -- RANK() salta posições em caso de empate (ex: 1º, 2º, 2º, 4º)
    -- DENSE_RANK() não salta posições em caso de empate (ex: 1º, 2º, 2º, 3º)
    RANK() OVER (ORDER BY AVG(N.nota) DESC) AS Posicao_Ranking
FROM
    alunos A
INNER JOIN
    notas N ON A.id = N.aluno_id -- Conec	ta Alunos às Notas
GROUP BY
    A.id, A.nome -- Agrupa para calcular a média de cada aluno
ORDER BY
    Media_Geral DESC;