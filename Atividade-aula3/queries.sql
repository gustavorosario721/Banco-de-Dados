

CREATE TABLE usuario (
  ID integer,
  CPF char(14) NOT NULL,
  name varchar(70) NOT NULL,
  data_nasc DATE NOT NULL,
  email varchar(254) NOT NULL,
  primary key (id)
);

INSERT INTO usuario VALUES(01, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(02, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(03, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(04, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(05, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(06, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(07, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(08, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(09,'833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');
INSERT INTO usuario VALUES(10, '833-232-345-33', 'Gustavo do Rosário', '2034/12/04', 'gusaddka@gmail.com');

SELECT * FROM usuario;

CREATE TABLE endereco (
  id integer,
  user_id integer,
  bairro varchar(50),
  numero_casa varchar(4),
  CEP char(9),
  primary key (id),
  foreign key (user_id) references usuario(id)
);

INSERT INTO endereco VALUES(1, 01, 'sussuarana-velha', '2342', '23423-243');
INSERT INTO endereco VALUES(2, 02, 'engenho-velho', '21', '23423-234');
INSERT INTO endereco VALUES(3, 03, 'novo-horizonte','132', '23514-975');
INSERT INTO endereco VALUES(4, 04, 'itapua', '12', '04833-389');
INSERT INTO endereco VALUES(5, 05, 'barra', '0332', '03984-394');
INSERT INTO endereco VALUES(6, 06, 'ondina','32', '82428-283');

SELECT * FROM endereco;

