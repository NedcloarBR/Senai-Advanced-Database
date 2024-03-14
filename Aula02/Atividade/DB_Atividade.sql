CREATE DATABASE DBDiscoteca;

CREATE TABLE tab_cd (
  codigo INT(5),
  nome CHAR(30),
  datacompra DATE,
  valorpago FLOAT,
  localcompra CHAR(20),
  album BOOLEAN,
  PRIMARY KEY (codigo)
);

CREATE TABLE tab_musica (
  codigocd INT(5),
  numero INT(5),
  nome CHAR(50),
  artista CHAR(50),
  tempo TIME,
  PRIMARY KEY (codigocd, numero)
);

INSERT INTO tab_cd
  VALUES (1, "Balada 2015", 2020/05/01, 18.50, "submarino", True);

INSERT INTO tab_cd 
  VALUES (2, "Swing Total", 2020/05/02, 20.00, "submarino", True);

INSERT INTO tab_cd
  VALUES (3, "Amigos para Sempre", 2020/05/03, 40.00, "Americanas", False);

INSERT INTO tab_musica
  VALUES (1, 1, "Estou De Olho", "Guto Boy", 2.55);

INSERT INTO tab_musica
  VALUES (1, 2, "Virando o Copo", "Guto Boy", 5);

INSERT INTO tab_musica
  VALUES (1, 2, "Vivendo Cada Dia", "Guto Boy", 8);

SELECT * FROM tab_cd;

SELECT nome, datacompra FROM tab_cd ORDER BY nome;

SELECT SUM(valorpago) as Total FROM tab_cd;

SELECT * FROM tab_musica WHERE codigocd = 1;

SELECT COUNT(*) AS Qtde FROM tab_musica;

SELECT AVG(tempo) AS Media from tab_musica;

SELECT * FROM tab_musica ORDER BY nome;

SELECT * FROM tab_cd WHERE album = True;

SELECT MAX(valorpago) FROM tab_cd;

-------------------------------------

CREATE TABLE produto (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  preco DECIMAL(10, 2) NULL,
  promocao DECIMAL(10, 2) NULL,
  PRIMARY KEY (id)
);

CREATE TRIGGER tr_promocao BEFORE INSERT 
  ON produto FOR EACH ROW
    SET NEW.promocao = ((NEW.preco * 3) * 0.3);

INSERT INTO produto (nome, preco)
  VALUES ("Abobora", 10.00), 
         ("Picanha". 99.80), 
         ("Corrente", 80.00);
