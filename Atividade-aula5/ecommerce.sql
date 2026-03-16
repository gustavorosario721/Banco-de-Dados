create database ecommerce;
use ecommerce;
drop database ecommerce;

create table cliente(
	id int auto_increment,
    nome varchar(75),
    email varchar(25) unique,
    telefone char(14) unique,
    primary key(id)
);

create table produto(
	id int auto_increment,
    nome_produto varchar(14),
    preco double,
    quantidade_estoque int,
    primary key(id)
);

create table pedido(
	id int auto_increment,
    id_cliente int,
    data_pedido date,
    primary key(id),
    foreign key(id_cliente) references cliente(id)
);

create table itenspedido(
	id_produto int,
    preco_produto double,
    id_pedido int,
    quantidade int,
    foreign key(id_produto) references produto(id),
    foreign key(id_pedido) references pedido(id)
);
