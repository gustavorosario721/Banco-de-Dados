create database escola;
use escola;

create table curso(
	id int primary key auto_increment,
    nome varchar(75)
);

create table aluno(
	id int primary key unique auto_increment,
	id_curso int,
    nome varchar(75),
    idade int
);

select * from curso;
select * from aluno;

insert into curso(nome) values('Design');
insert into curso(nome) values('Desenvolvimento de sistemas');
insert into curso(nome) values('Engenharia portuaria');

insert into aluno(id_curso, nome, idade) values(1, 'Gustavo', 19);
insert into aluno(id_curso, nome, idade) values(2, 'ovatsug', 20);
insert into aluno(id_curso, nome, idade) values(2, 'Gustova', 28);
insert into aluno(id_curso, nome, idade) values(3, 'Jeovane', 27);
insert into aluno(id_curso, nome, idade) values(2, 'Mikael', 27);
insert into aluno(id_curso, nome, idade) values(3, 'Luisa', 50);
insert into aluno(id_curso, nome, idade) values(4, 'Deivid', 25);

-- 1)
select aluno.id_curso, aluno.nome, curso.nome as curso from aluno inner join curso on aluno.id_curso = curso.id;

-- 2)
select aluno.id_curso, aluno.nome, curso.nome as curso from aluno left join curso on aluno.id_curso = curso.id;

-- 3)
select curso.nome, count(aluno.id) as total_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 4)
select curso.nome, count(aluno.id) as total_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome having total_alunos > 1;

-- 5)
select aluno.id_curso, aluno.nome, curso.nome as curso from aluno left join curso on aluno.id_curso = curso.id where curso.nome is null;

-- 6)
select curso.nome, count(aluno.id) as quantidade_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 7)
select curso.nome, avg(aluno.idade) as quantidade_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 8)
select * from aluno order by nome asc;
select * from curso order by nome asc;

-- 9)
select curso.nome, count(aluno.id) as quantidade_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 10)
select curso.nome, count(aluno.id) as total_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome having total_alunos < 3;

-- 11)
select curso.nome, max(aluno.idade) as idade_maxima from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 12)
select curso.nome, min(aluno.idade) as idade_minima from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 13)
select aluno.id_curso, aluno.nome, curso.nome as curso from aluno inner join curso on aluno.id_curso = curso.id having curso.nome = 'Design';

-- 14)
select curso.nome, count(aluno.id) as total_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome order by total_alunos asc;

-- 15)
select curso.nome, sum(aluno.idade) as total_alunos from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome;

-- 16)
select curso.nome, avg(aluno.idade) as media_idade from aluno inner join curso on aluno.id_curso = curso.id group by curso.nome having media_idade > 20;

-- 17)
select aluno.id_curso, aluno.nome, curso.nome as curso from aluno left join curso on aluno.id_curso = curso.id;

-- 18)
select count(1) as total_curso from curso;

-- 19)
select 	id as id_aluno, id_curso as id_curso_alias, nome as nome_aluno, idade as idade_aluno from aluno;
select 	id as id_curso, nome as curso_nome from curso;

-- 20)
select curso.nome, count(aluno.id) as total_alunos from aluno left join curso on aluno.id_curso = curso.id group by curso.nome;