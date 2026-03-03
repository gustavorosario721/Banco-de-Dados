create schema aula_04;
use aula_04;

create table clientes(
	id int auto_increment primary key unique,
    cpf char(14) unique,
    nome varchar(100) not null,
    email varchar(254) not null unique
);

insert into clientes (cpf, nome, email) values ("000.000.000-01", "Getulio varagas1", "getuliovagas@gmail");
insert into clientes (cpf, nome, email) values ("000.000.000-02", "Getulio varagas2", "getuliovagas2@gmail");
insert into clientes (cpf, nome, email) values ("000.000.000-03", "Getulio varagas jr.1","getuliovagasjr@gmail");
insert into clientes (cpf, nome, email) values ("000.000.000-04", "Getulio varagas jr.2", "getuliovagasjr2@gmail");
insert into clientes (cpf, nome, email, altura) values ("000.000.000-05", "Getulio varagas3", "getuliovagas3@gmail", 182);
insert into clientes (cpf, nome, email, altura) values ("000.000.000-06", "Getulio varagas4", "getuliovagas4@gmail", 174);
insert into clientes (cpf, nome, email, altura) values ("000.000.000-07", "Getulio varagas jr.3","getuliovagasjr3@gmail", 168);
insert into clientes (cpf, nome, email, altura) values ("000.000.000-08", "Getulio varagas jr.4", "getuliovagasjr4@gmail", 190);

alter table clientes add altura int;
alter table clientes modify email varchar(254);
alter table clientes change nome nome_clientes varchar(254);
truncate table clientes;
show tables;
select * from clientes;
drop schema aula_04;
