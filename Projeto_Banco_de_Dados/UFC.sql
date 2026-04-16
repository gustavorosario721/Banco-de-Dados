drop database UFC;
CREATE DATABASE UFC;
USE UFC;

CREATE TABLE Evento (
  id_evento int PRIMARY KEY AUTO_INCREMENT,
  data_evento date NOT NULL,
  nome_evento varchar(75) NOT NULL,
  cidade varchar(30) NOT NULL
);

CREATE TABLE Cards (
	id_card int PRIMARY KEY AUTO_INCREMENT,
	nome varchar(75) NOT NULL,
	id_evento int NOT NULL,
  FOREIGN KEY (id_evento)
    REFERENCES Evento(id_evento)
);

CREATE TABLE Categoria_peso (
  id_categoria int PRIMARY KEY AUTO_INCREMENT,
  peso double NOT NULL,
  nome varchar(75) NOT NULL
);

CREATE TABLE Lutador (
  id_lutador int PRIMARY KEY AUTO_INCREMENT,
  nome_real varchar(75) NOT NULL,
  apelido varchar(50),
  altura double NOT NULL,
  nacionalidade varchar(75) NOT NULL,
  idade int NOT NULL,
  vitorias int,
  derrotas int,
  empate int,
  postura_lutador varchar(20)
);

CREATE TABLE Luta (
  id_luta int PRIMARY KEY AUTO_INCREMENT,
  id_card int NOT NULL,
  horario_luta time NOT NULL,
  FOREIGN KEY (id_card)
    REFERENCES Cards(id_card)
);

CREATE TABLE Luta_Lutador(
  id_luta int NOT NULL,
  id_lutador int NOT NULL,
  metodo_vitoria varchar(20) NOT NULL,
  rounds int NOT NULL,
  tempo_final time NOT NULL,
  corner varchar(20) NOT NULL,
  peso_atual double,
  vencedor BOOLEAN NOT NULL,
  FOREIGN KEY (id_luta)
    REFERENCES Luta(id_luta),
  FOREIGN KEY (id_lutador)
	  REFERENCES Lutador(id_lutador)
);

-- Tabela Ranking

CREATE TABLE Ranking (
  id_lutador int NOT NULL,
  id_categoria int NOT NULL,
  posicao varchar(20) NOT NULL,
  FOREIGN KEY (id_lutador)
    REFERENCES Lutador(id_lutador),
  FOREIGN KEY (id_categoria)
    REFERENCES Categoria_peso(id_categoria)
);

-- Tabela Categoria_peso

INSERT INTO Categoria_peso (id_categoria, peso, nome) VALUES 
(1, 56.7, 'Peso Mosca'),
(2, 61.2, 'Peso Galo'),
(3, 65.8, 'Peso Pena'),
(4, 70.3, 'Peso Leve'),
(5, 77.1, 'Peso Meio-Médio'),
(6, 83.9, 'Peso Médio'),
(7, 93.0, 'Peso Meio-Pesado'),
(8, 120.2, 'Peso Pesado');

-- Tabela Evento

INSERT INTO Evento (id_evento, data_evento, nome_evento, cidade) VALUES 
(100, '2024-04-13', 'UFC 300', 'Las Vegas'),
(101, '2024-05-04', 'UFC 301', 'Rio de Janeiro'),
(102, '2024-06-01', 'UFC 302', 'Newark'),
(103, '2024-06-29', 'UFC 303', 'Las Vegas'),
(104, '2024-07-27', 'UFC 304', 'Manchester');

-- Peso Mosca

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(1, 'Alexandre Pantoja', 'The Cannibal', 1.65, 'Brasil', 34, 27, 5, 0, 'Ortodoxa'),
(2, 'Brandon Moreno', 'The Assassin Baby', 1.70, 'México', 30, 21, 8, 2, 'Ortodoxa'),
(3, 'Amir Albazi', 'The Prince', 1.65, 'Iraque', 30, 17, 1, 0, 'Ortodoxa'),
(4, 'Brandon Royval', 'Raw Dawg', 1.75, 'EUA', 31, 16, 7, 0, 'Canhoto'),
(5, 'Matheus Nicolau', NULL, 1.68, 'Brasil', 31, 19, 4, 1, 'Ortodoxa');

-- Peso Galo

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(6, 'Sean O''Malley', 'Suga', 1.80, 'EUA', 29, 18, 1, 0, 'Ambidestro'),
(7, 'Merab Dvalishvili', 'The Machine', 1.68, 'Geórgia', 33, 17, 4, 0, 'Ortodoxa'),
(8, 'Cory Sandhagen', 'Sandman', 1.80, 'EUA', 32, 17, 4, 0, 'Ambidestro'),
(9, 'Petr Yan', 'No Mercy', 1.70, 'Rússia', 31, 17, 5, 0, 'Ambidestro'),
(10, 'Marlon Vera', 'Chito', 1.73, 'Equador', 31, 23, 9, 1, 'Ortodoxa'),
(11, 'Henry Cejudo', 'Triple C', 1.63, 'EUA', 37, 16, 4, 0, 'Ortodoxa'),
(12, 'Deiveson Figueiredo', 'Deus da Guerra', 1.65, 'Brasil', 36, 23, 3, 1, 'Ortodoxa');

-- Peso Pena

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(13, 'Ilia Topuria', 'El Matador', 1.70, 'Espanha', 27, 15, 0, 0, 'Ortodoxa'),
(14, 'Alexander Volkanovski', 'The Great', 1.68, 'Austrália', 35, 26, 4, 0, 'Ortodoxa'),
(15, 'Max Holloway', 'Blessed', 1.80, 'EUA', 32, 26, 7, 0, 'Ortodoxa'),
(16, 'Brian Ortega', 'T-City', 1.73, 'EUA', 33, 16, 3, 0, 'Canhoto'),
(17, 'Yair Rodriguez', 'El Pantera', 1.80, 'México', 31, 19, 5, 0, 'Ortodoxa'),
(18, 'Movsar Evloev', NULL, 1.70, 'Rússia', 30, 18, 0, 0, 'Ortodoxa'),
(19, 'Arnold Allen', 'Almighty', 1.73, 'Inglaterra', 30, 19, 3, 0, 'Canhoto');

-- Peso Leve

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(20, 'Islam Makhachev', NULL, 1.78, 'Rússia', 32, 25, 1, 0, 'Canhoto'),
(21, 'Charles Oliveira', 'Do Bronx', 1.78, 'Brasil', 34, 34, 10, 0, 'Ortodoxa'),
(22, 'Justin Gaethje', 'The Highlight', 1.80, 'EUA', 35, 25, 5, 0, 'Ortodoxa'),
(23, 'Dustin Poirier', 'The Diamond', 1.75, 'EUA', 35, 30, 8, 0, 'Canhoto'),
(24, 'Arman Tsarukyan', 'Ahalkalakets', 1.70, 'Armênia', 27, 22, 3, 0, 'Ortodoxa'),
(25, 'Mateusz Gamrot', 'Gamer', 1.78, 'Polônia', 33, 24, 2, 0, 'Canhoto'),
(26, 'Michael Chandler', 'Iron', 1.73, 'EUA', 38, 23, 8, 0, 'Ortodoxa'),
(27, 'Rafael Fiziev', 'Ataman', 1.73, 'Azerbaijão', 31, 12, 3, 0, 'Ortodoxa');

-- Peso Meio-Medio

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(28, 'Leon Edwards', 'Rocky', 1.83, 'Inglaterra', 32, 22, 3, 0, 'Canhoto'),
(29, 'Kamaru Usman', 'The Nigerian Nightmare', 1.83, 'Nigéria', 37, 20, 4, 0, 'Ortodoxa'),
(30, 'Belal Muhammad', 'Remember the Name', 1.80, 'Palestina', 36, 23, 3, 0, 'Ortodoxa'),
(31, 'Shavkat Rakhmonov', 'Nomad', 1.85, 'Cazaquistão', 29, 18, 0, 0, 'Ortodoxa'),
(32, 'Colby Covington', 'Chaos', 1.80, 'EUA', 36, 17, 4, 0, 'Canhoto'),
(33, 'Jack Della Maddalena', NULL, 1.80, 'Austrália', 27, 17, 2, 0, 'Canhoto'),
(34, 'Gilbert Burns', 'Durinho', 1.78, 'Brasil', 37, 22, 7, 0, 'Ortodoxa');

-- Peso Medio 

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(35, 'Dricus Du Plessis', 'Stillknocks', 1.85, 'África do Sul', 30, 21, 2, 0, 'Ambidestro'),
(36, 'Sean Strickland', 'Tarzan', 1.85, 'EUA', 33, 29, 6, 0, 'Ortodoxa'),
(37, 'Israel Adesanya', 'The Last Stylebender', 1.93, 'Nigéria', 34, 24, 3, 0, 'Ambidestro'),
(38, 'Robert Whittaker', 'The Reaper', 1.80, 'Austrália', 33, 26, 7, 0, 'Ortodoxa'),
(39, 'Jared Cannonier', 'The Killa Gorilla', 1.80, 'EUA', 40, 17, 7, 0, 'Ortodoxa'),
(40, 'Khamzat Chimaev', 'Borz', 1.88, 'Emirados Árabes', 30, 13, 0, 0, 'Ortodoxa');

-- Peso Meio-Pesado

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(41, 'Alex Pereira', 'Poatan', 1.93, 'Brasil', 36, 10, 2, 0, 'Ortodoxa'),
(42, 'Jiri Prochazka', 'BJP', 1.91, 'República Tcheca', 31, 30, 4, 1, 'Ortodoxa'),
(43, 'Magomed Ankalaev', NULL, 1.91, 'Rússia', 32, 18, 1, 1, 'Ortodoxa'),
(44, 'Jamahal Hill', 'Sweet Dreams', 1.93, 'EUA', 33, 12, 2, 0, 'Canhoto'),
(45, 'Jan Blachowicz', 'Legendary Polish Power', 1.88, 'Polônia', 41, 29, 10, 1, 'Ortodoxa');

-- Peso Pesados

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(46, 'Jon Jones', 'Bones', 1.93, 'EUA', 36, 27, 1, 0, 'Ambidestro'),
(47, 'Tom Aspinall', NULL, 1.96, 'Inglaterra', 31, 14, 3, 0, 'Ortodoxa'),
(48, 'Ciryl Gane', 'Bon Gamin', 1.93, 'França', 34, 12, 2, 0, 'Ortodoxa'),
(49, 'Sergei Pavlovich', NULL, 1.91, 'Rússia', 32, 18, 2, 0, 'Canhoto'),
(50, 'Curtis Blaydes', 'Razor', 1.93, 'EUA', 33, 18, 4, 0, 'Ortodoxa');

-- Tabela Cards

INSERT INTO Cards (id_card, nome, id_evento) VALUES 
(1, 'Principal', 100),
(2, 'Preliminar', 100),
(3, 'Principal', 101),
(4, 'Preliminar', 101),
(5, 'Principal', 102);

-- Tabela Luta

INSERT INTO Luta (id_luta, id_card, horario_luta) VALUES 
(1, 1, '23:00:00'),
(2, 1, '23:30:00'),
(3, 2, '21:00:00'),
(4, 3, '23:00:00'),
(5, 3, '23:30:00'),
(6, 4, '21:30:00'),
(7, 5, '23:00:00'),
(8, 5, '23:45:00');

-- Tabela Luta_Lutador

INSERT INTO Luta_Lutador (id_luta, id_lutador, metodo_vitoria, rounds, tempo_final, corner, peso_atual, vencedor) VALUES 
(1, 41, 'Nocaute', 2, '00:03:08', 'Red', 93.0, 1),
(1, 42, 'Nocaute', 2, '00:03:08', 'Blue', 92.8, 0),
(2, 21, 'Decisao', 3, '00:05:00', 'Red', 70.3, 0),
(2, 24, 'Decisao', 3, '00:05:00', 'Blue', 70.3, 1),
(3, 15, 'Nocaute', 5, '00:04:59', 'Red', 70.0, 1),
(3, 22, 'Nocaute', 5, '00:04:59', 'Blue', 70.2, 0),
(4, 1, 'Decisao', 5, '00:05:00', 'Red', 56.7, 1),
(4, 2, 'Decisao', 5, '00:05:00', 'Blue', 56.5, 0),
(5, 6, 'Decisao', 5, '00:05:00', 'Red', 61.2, 1),
(5, 10, 'Decisao', 5, '00:05:00', 'Blue', 61.0, 0),
(6, 12, 'Finalizacao', 3, '00:01:22', 'Red', 61.2, 1),
(6, 9, 'Finalizacao', 3, '00:01:22', 'Blue', 61.1, 0),
(7, 20, 'Finalizacao', 5, '00:02:42', 'Red', 70.2, 1),
(7, 23, 'Finalizacao', 5, '00:02:42', 'Blue', 70.3, 0),
(8, 31, 'Finalizacao', 2, '00:04:10', 'Red', 77.1, 1),
(8, 33, 'Finalizacao', 2, '00:04:10', 'Blue', 77.0, 0);

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (1, 1, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (2, 1, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (3, 1, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (4, 1, 'Quarto');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (5, 1, 'Quinto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (6, 2, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (7, 2, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (8, 2, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (12, 2, 'Quarto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (13, 3, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (14, 3, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (15, 3, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (16, 3, 'Quarto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (20, 4, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (24, 4, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (21, 4, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (23, 4, 'Quarto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (28, 5, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (30, 5, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (31, 5, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (29, 5, 'Quarto');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (32, 5, 'Quinto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (35, 6, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (36, 6, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (37, 6, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (38, 6, 'Quarto');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (40, 6, 'Quinto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (41, 7, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (42, 7, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (43, 7, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (44, 7, 'Quarto');

INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (46, 8, 'Campeao');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (47, 8, 'Segundo');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (48, 8, 'Terceiro');
INSERT INTO Ranking (id_lutador, id_categoria, posicao) VALUES (50, 8, 'Quarto');

-- Bucas em Tabelas

-- select * from Luta;
-- select * from Evento;

-- select id_luta, Lutador.nome_real, Lutador.apelido, Lutador.idade, Lutador.nacionalidade from Lutador inner join Luta_Lutador on Lutador.id_lutador = Luta_Lutador.id_lutador;

-- select nome_evento, nome, cidade from Evento inner join Cards on Cards.id_evento = Evento.id_evento;

INSERT INTO Evento (id_evento, data_evento, nome_evento, cidade) VALUES 
(105, '2026-04-14', 'CIMATEC Fight Night', 'Salvador');

INSERT INTO Cards (id_card, nome, id_evento) VALUES 
(6, 'Principal', 105),
(7, 'Preliminar', 105);

INSERT INTO Lutador (id_lutador, nome_real, apelido, altura, nacionalidade, idade, vitorias, derrotas, empate, postura_lutador) VALUES 
(51, 'Victor', NULL, 1.85, 'África do Sul', 30, 21, 2, 0, 'Ambidestro');

INSERT INTO Luta (id_luta, id_card, horario_luta) VALUES 
(9, 7, '23:00:00');

-- UPDATE Evento SET cidade = 'Sao Paulo' WHERE id_evento = 105;
-- UPDATE Ranking SET posição = 'Quarto' WHERE id_evento = 48;
-- UPDATE Ranking SET posição = 'Terceiro' WHERE id_evento = 50;

-- DELETE FROM Lutador WHERE id_lutador = 51;
-- DELETE FROM Luta WHERE id_card = 7;
-- DELETE FROM Cards WHERE id_card IN (6, 7);
-- DELETE FROM Evento WHERE id_evento = 105;

-- group by de Tabelas

-- SELECT nacionalidade, COUNT(id_lutador) AS total_lutador FROM Lutador GROUP BY nacionalidade;