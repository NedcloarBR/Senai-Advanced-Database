CREATE DATABASE aula_4_da;

CREATE TABLE paises (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome_pais VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY pk_pais_id(id)
);

CREATE TABLE estados (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome_estado VARCHAR(255) NOT NULL,
  pais_id INT(11) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY pk_estado_id(id),
  KEY fk_pais_estado_id_idx (pais_id),
  CONSTRAINT fk_pais_estado_id FOREIGN KEY(pais_id) REFERENCES paises(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE cidades (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome_cidade VARCHAR(255),
  estado_id INT(11) NOT NULL,
  pais_id INT(11) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY pk_cidade_id(id),
  KEY fk cidade_estado_id_idx(estado_id),
  KEY fk cidade_pais_id_idx(pais_id),
  CONSTRAINT fk_cidade_estado_id FOREIGN KEY(estado_id) REFERENCES estados(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_cidade_pais_id FOREIGN KEY(pais_id) REFERENCES paises(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE enderecos (
  id INT(11) NOT NULL AUTO_INCREMENT,
  cep VARCHAR(30) NOT NULL COMMENT'cep do endereço',
  tipo_logradouro VARCHAR(1) DEFAULT NULL,
  endereco VARCHAR(255) NOT NULL,
  bairro VARCHAR(100) DEFAULT NULL,
  complemento VARCHAR(255) DEFAULT NULL,
  pais_id INT(11) NOT NULL,
  estado_id INT(11) NOT NULL,
  cidade_id INT(11) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY pk_endereco_id(id),
  KEY fk_endereco_pais_id_idx(pais_id),
  KEY fk_cidade_id_idx(cidade_id),
  KEY fk_estado_id_idx(estado_id),
  CONSTRAINT fk_endereco_cidade_id FOREIGN KEY(cidade_id) REFERENCES cidades(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_endereco_estado_id FOREIGN KEY(estado_id) REFERENCES estado_id(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_endereco_pais_id FOREIGN KEY(pais_id) REFERENCES pais_id(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE categorias (
  id INT(11) NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(100) NOT NULL,
  status VARCHAR(1) NOT NULL DEFAULT 'A' COMMENT 'A - Ativo/C - Cancelada'
  PRIMARY KEY(id),
  UNIQUE KEY pk_categoria_id(id)
);

CREATE TABLE clientes (
  id INT(11) NOT NULL,
  razao_social VARCHAR(255) NOT NULL,
  nome_fantasia VARCHAR(255) NOT NULL,
  tipo_pessoa VARCHAR(11) NOT NULL,
  cpf_cnpj VARCHAR(40) NOT NULL,
  categoria_id INT(11) DEFAULT NULL,
  email VARCHAR(100) NOT NULL,
  status VARCHAR(1) NOT NULL DEFAULT 'A' COMMENT 'A - Ativo/C - Cancelado'
  data_criacao DATETIME DEFAULT NULL,
  ultima_alteracao DATETIME DEFAULT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY pk_cliente_id(id),
  KEY fk_cliente_categoria_id_idx(categoria_id),
  CONSTRAINT fk_cliente_categoria_id FOREIGN KEY(categoria_id) REFERENCES categorias(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
);