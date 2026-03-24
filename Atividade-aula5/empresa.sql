create database empresa;
use empresa;

create table funcionario(
	id int auto_increment primary key,
    nome varchar(75),
    salario double,
    departamento varchar(75),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

INSERT INTO funcionario (nome, salario, departamento) VALUES
('Carlos', 3000, 'TI'),
('Maria', 4500, 'RH'),
('João', 5000, 'TI'),
('Ana', 3500, 'Financeiro'),
('Pedro', 2800, 'RH');

select * from funcionario;
select count(*) from funcionario;
select * from funcionario where departamento = "TI";
select count(*) from funcionario where departamento = "TI";
select * from funcionario where salario > 4000;
select count(*) from funcionario where salario > 4000;
INSERT INTO funcionario (nome, salario, departamento) VALUES ('Juliana', 4200, 'TI');
update funcionario set salario = 3500 where id = 1;
set sql_safe_updates = 0;
update funcionario set salario = salario * 1.10 where departamento = "RH";
delete from funcionario where nome = 'Pedro';
select * from funcionario order by salario desc;
select avg(salario) from funcionario;
select max(salario) from funcionario;
select min(salario) from funcionario;