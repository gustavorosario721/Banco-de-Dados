create database universidade;
use universidade;

create table aluno(
	matricula int auto_increment,
    nome varchar(75),
    curso varchar(50),
    email varchar(50) unique,
    primary key(matricula)
);

create table professor(
	id int auto_increment,
    nome varchar(10),
    funcao varchar(25),
    primary key(id)
);

create table disciplina(
	id int auto_increment,
    professor_id int,
    nome varchar(25),
    carga_horaria int,
    primary key(id),
    foreign key(professor_id) references professor(id)
);

create table matricula(
	matricula_aluno int,
    disciplina_id int,
    semestre date,
    foreign key(matricula_aluno) references aluno(matricula),
    foreign key(disciplina_id) references disciplina(id)
);