create schema brasileirao;
use brasileirao;

create table jogador(
	id int auto_increment primary key unique,
    nome varchar(100) not null,
    numero_camisa int not null
);
describe jogador;

alter table jogador add altura int, add data_de_nascimento date;
describe jogador;

drop table jogador;
show tables;

create table jogador(
	id int auto_increment primary key unique,
    nome varchar(100) not null,
    numero_camisa int unique not null,
    altura int,
    data_de_nascimento date
);
describe jogador;

insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Joao", 09, 181, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Marcos", 75, 174, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Gustavo", 89, 175, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Higor", 37, 172, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Neymar", 101, 174, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Guilherme", 43, 176, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Hulk", 11, 179, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Michael", 08, 178, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Arana", 07, 179, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Jeovane", 45, 180, "2002-02-12");
select * from jogador;

truncate table jogador;
alter table jogador modify numero_camisa varchar(3) unique;
describe jogador;
alter table jogador change data_de_nascimento data_nasc date;
describe jogador;

insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Joao", 09, 181, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Marcos", 75, 174, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Gustavo", 89, 175, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Higor", 37, 172, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Neymar", 101, 174, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Guilherme", 43, 176, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Hulk", 11, 179, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Michael", 08, 178, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Arana", 07, 179, "2002-02-12");
insert into jogador(nome, numero_camisa, altura, data_de_nascimento) values("Jeovane", 45, 180, "2002-02-12");
select * from jogador;

create table time(
	id int auto_increment primary key,
    nome varchar(75) unique not null,
    jogador_id int unique,
    foreign key(jogador_id) references jogador(id)
);

insert into time(nome, jogador_id) values("Vasco", 09);