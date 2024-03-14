CREATE DATABASE ANIVERSARIOS;

CREATE TABLE TORNEIOS (
  nome VARCHAR(30),
  vitorias REAL,
  melhor REAL,
  tamanho REAL
);

INSERT INTO TORNEIOS (nome, vitorias, melhor, tamanho)
  VALUES
    ("Dolly", 7, 245, 8.5),
    ("Etta", 4, 283, 9),
    ("Irma", 9, 266, 7),
    ("Barbara", 2, 197, 7.5),
    ("Gladys", 13, 273, 8);

CREATE TABLE REFEICOES (
  nome VARCHAR(30),
  data_nascimento DATE,
  entrada VARCHAR(30),
  acompanhamento VARCHAR(30),
  sobremesa VARCHAR(30)
);

INSERT INTO REFEICOES (nome, data_nascimento, entrada, acompanhamento, sobremesa)
  VALUES
    ("Dolly", "1946-01-19", "steak", "salad", "cake"),
    ("Etta", "1938-01-25", "chicken", "fries", "ice cream"),
    ("Irma", "1941-02-18", "tofu", "fries", "cake"),
    ("Barbara", "1948-12-25", "tofu", "salad", "ice cream"),
    ("Gladys", "1944-05-28", "steak", "fries", "ice cream");

SELECT nome FROM REFEICOES;

SELECT nome, data_nascimento FROM REFEICOES;

SELECT * FROM TORNEIOS;

SELECT tamanho FROM TORNEIOS WHERE nome = "Irma";

SELECT entrada FROM REFEICOES WHERE entrada = LIKE "t%";

SELECT nome AS n, data_nascimento AS d, sobremesa AS s FROM REFEICOES;

SELECT COUNT(entrada) FROM REFEICOES WHERE entrada = "tofu";

SELECT AVG(melhor) FROM TORNEIOS;

SELECT SUM(vitorias) FROM TORNEIOS;

SELECT SUM(entrada) FROM REFEICOES;

SELECT MIN(vitorias) FROM TORNEIOS;

SELECT MAX(vitorias) FROM TORNEIOS;

SELECT MIN(nome) FROM REFEICOES;

SELECT MAX(nome) FROM REFEICOES;

SELECT COUNT(nome), entrada FROM REFEICOES GROUP BY entrada;

SELECT nome, data_nascimento FROM REFEICOES ORDER BY data_nascimento;

SELECT nome, data_nascimento FROM REFEICOES ORDER BY data_nascimento DESC;

SELECT COUNT(nome), acompanhamento FROM REFEICOES GROUP BY acompanhamento HAVING COUNT(nome) >= 3;

SELECT TORNEIOS.nome, TORNEIOS.tamanho, REFEICOES.data_nascimento 
  FROM TORNEIOS
  JOIN REFEICOES ON TORNEIOS.nome=REFEICOES.nome;

INSERT INTO TORNEIOS (nome, vitorias, melhor, tamanho)
  VALUES ("Bettye", 0, 193, 9);

INSERT INTO REFEICOES (nome, data_nascimento, entrada, acompanhamento, sobremesa)
  VALUES ("Lesley", "1946-05-02", "steak", "salad", "ice cream");

SELECT TORNEIOS.nome, TORNEIOS.tamanho, REFEICOES.data_nascimento 
  FROM TORNEIOS
  JOIN REFEICOES ON TORNEIOS.nome=REFEICOES.nome;

SELECT TORNEIOS.nome, TORNEIOS.tamanho, REFEICOES.data_nascimento
  FROM TORNEIOS
  LEFT JOIN REFEICOES ON TORNEIOS.nome=REFEICOES.nome;

SELECT TORNEIOS.nome, TORNEIOS.tamanho, REFEICOES.data_nascimento
  FROM TORNEIOS
  RIGHT JOIN REFEICOES ON TORNEIOS.nome=REFEICOES.nome;

SELECT nome FROM TORNEIOS UNION SELECT nome FROM REFEICOES;

SELECT nome FROM TORNEIOS UNION ALL SELECT nome FROM REFEICOES;

-- SELECT nome FROM REFEICOES UNION SELECT nome, vitorias FROM TORNEIOS;

SELECT nome, vitorias FROM TORNEIOS
  WHERE vitorias > (
    SELECT vitorias FROM TORNEIOS WHERE nome = "Barbara"
  );

SELECT nome, tamanho FROM TORNEIOS AS t 
  WHERE vitorias > (
    SELECT AVG(vitorias) FROM TORNEIOS WHERE tamanho = t.tamanho
  );

SELECT nome, entrada, acompanhamento, sobremesa FROM REFEICOES
  WHERE nome = (
    SELECT nome FROM TORNEIOS
      WHERE vitorias = (
        SELECT MAX(vitorias) FROM TORNEIOS
      )
  );


