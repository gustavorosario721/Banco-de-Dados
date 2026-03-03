create table Carro (
	id int,
	modelo varchar(80),
	cor varchar(20),
	preco double,
	placa char(8),
	primary key (id)
); 

create table Cliente (
	id int,
	cpf char(14),
	nome varchar(80),
	email varchar(80),
	endereco text,
	data_nasc date,
	telefone char(14),
	primary key (id)
);

create table Venda (
  id int,
  Cliente_id int,
  Carro_id int,
  data date,
  primary key (id),
  foreign key (cliente_id) references Cliente(id)
);

insert into Carro values (1299463, 'citroen', 'amarelo', 23.3, 'adjd343');
insert into Cliente values (122893, '784.843.588-58', 'Gustavo', 'gosandaoeona@gmail.com', 'sussuarana-velha', '2006/09/22', '(71)98548-8458');
insert into Venda values (1231356, 122893, 1299463, '2004/12/23');

select * from Carro;
select * from Cliente;
select * from Venda;
