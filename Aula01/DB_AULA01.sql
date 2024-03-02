CREATE TABLE DEPARTAMENTO(
	cod INT(11) NOT NULL,
  nome VARCHAR(25) NOT NULL,
	atividade VARCHAR(250) NOT NULL
);

ALTER TABLE DEPARTAMENTO ADD PRIMARY KEY(cod);

CREATE TABLE FUNCIONARIO(
	cod INT(11) NOT NULL,
  nome VARCHAR(25) NOT NULL,
	cod_departamento INT(11) NOT NULL
);

ALTER TABLE FUNCIONARIO ADD PRIMARY KEY(cod);

ALTER TABLE FUNCIONARIO
	ADD CONSTRAINT fk_funcionario_departamento
	FOREIGN KEY (cod_departamento)
	REFERENCES DEPARTAMENTO (cod);

ALTER TABLE FUNCIONARIO DROP CONSTRAINT fk_funcionario_departamento;

CREATE TABLE LOTACAO(
	cod_funcionario INT(11) NOT NULL,
	cod_departamento INT(11) NOT NULL
);

ALTER TABLE LOTACAO 
ADD PRIMARY KEY (cod_funcionario, cod_departamento);

ALTER TABLE LOTACAO
	ADD CONSTRAINT fk_lotacao_funcionario
	FOREIGN KEY (cod_funcionario)
	REFERENCES FUNCIONARIO (cod);

ALTER TABLE LOTACAO
	ADD CONSTRAINT fk_lotacao_departamento
	FOREIGN KEY (cod_departamento)
	REFERENCES DEPARTAMENTO (cod);

ALTER TABLE LOTACAO ADD dt_inicio DATE NOT NULL;

ALTER TABLE LOTACAO ADD dt_fim DATE NULL;

ALTER TABLE LOTACAO ADD cod INT(11) NOT NULL FIRST;

ALTER TABLE FUNCIONARIO ADD dt_nasc DATE NOT NULL;

ALTER TABLE FUNCIONARIO DROP cod_departamento;

ALTER TABLE LOTACAO
	DROP PRIMARY KEY, ADD PRIMARY KEY (cod);

INSERT INTO DEPARTAMENTO (cod, nome, atividade)
	VALUES(1, "RH", "Faz o Recursos humanos");

INSERT INTO DEPARTAMENTO (cod, nome, atividade)
	VALUES(2, "TI", "Faz a Tecnologia na empresa andar");

INSERT INTO FUNCIONARIO (cod, nome, dt_nasc)
	VALUES(1, "Daniel Adormes", "1985-01-01");

INSERT INTO FUNCIONARIO (cod, nome, dt_nasc)
	VALUES (2, "Taciano Rodolfo", "1985-01-01");


CREATE TABLE CLIENTE (
  num_cliente NUMERIC,
  nome_cliente CHAR(20),
  endereco VARCHAR(256),
  nivel_de_credito NUMERIC,
  CHECK (nivel_de_credito >= 1000),   
  PRIMARY KEY (num_cliente)
);

CREATE TABLE ITEM (
  num_item NUMERIC,
  nome_item CHAR(20),
  preco NUMERIC,
  peso NUMERIC,
  PRIMARY KEY (num_item)
);

CREATE TABLE PEDIDO (
  num_pedido CHAR(15),
  num_cliente NUMERIC NOT NULL,
  num_item NUMERIC NOT NULL,
  quantidade NUMERIC,
  custo_total NUMERIC,
  PRIMARY KEY (num_pedido)
);

ALTER TABLE CLIENTE MODIFY nome_cliente VARCHAR(256);

ALTER TABLE CLIENTE ADD COLUMN cliente_credito_limite NUMERIC;

ALTER TABLE PEDIDO
  ADD CONSTRAINT fk_pedido_cliente
  FOREIGN KEY (num_cliente)
  REFERENCES CLIENTE (num_cliente);

ALTER TABLE PEDIDO
  ADD CONSTRAINT fk_pedido_item,
  FOREIGN KEY (num_item)
  REFERENCES ITEM (num_item);

INSERT INTO CLIENTE
  VALUES (1, "Marcio Lemos", "Brazil RS Osório", 100000, 1000000);

INSERT INTO ITEM (num_item, nome_item, preco, peso)
  VALUES (1, "Arroz", "4,00", "1000");

INSERT INTO PEDIDO (num_pedido, num_cliente, num_item, quantidade, custo_total) 
  VALUES ("1", "1", "1", "1", "4,00");

CREATE VIEW ORDERS (nome_cliente, nome_item, quantidade) AS
  SELECT c.nome_cliente, i.nome_item, o.quantidade FROM
  CLIENTE AS c, ITEM as i, PEDIDO as o 
  WHERE 
    c.num_cliente = o.num_cliente 
    AND 
    o.num_item;

