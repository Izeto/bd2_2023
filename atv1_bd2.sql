CREATE DATABASE IF NOT EXISTS mydb;

USE mydb;

CREATE TABLE IF NOT EXISTS estado (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    sigla CHAR(2) NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS cidade (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    estado_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id)
        REFERENCES estado (id)
);
    
CREATE TABLE IF NOT EXISTS instituicao (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS pessoa (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    data_nascimento DATE NULL,
    instituicao_id INT NOT NULL,
    cidade_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_pessoa_cidade1 FOREIGN KEY (cidade_id)
        REFERENCES cidade (id),
    CONSTRAINT fk_pessoa_instituicao FOREIGN KEY (instituicao_id)
        REFERENCES instituicao (id)
);
  
CREATE TABLE IF NOT EXISTS curso (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    professor VARCHAR(100) NULL,
    instituicao_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_curso_instituicao FOREIGN KEY (instituicao_id)
        REFERENCES instituicao (id)
);
  
CREATE TABLE IF NOT EXISTS pessoa_curso (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    curso_id INT NOT NULL,
    pessoa_id INT NOT NULL,
    CONSTRAINT fk_curso FOREIGN KEY (curso_id)
        REFERENCES curso (id),
    CONSTRAINT fk_pessoa FOREIGN KEY (pessoa_id)
        REFERENCES pessoa (id)
);



   
INSERT INTO estado(nome, sigla)
VALUES ('Paraná','PR');

INSERT INTO cidade(nome, estado_id)
VALUES ('Paranavaí',1);

INSERT INTO pessoa(nome, data_nascimento, cidade_id)
VALUES ('José','2004-05-22',1);

INSERT INTO cidade(nome, estado_id)
VALUES ('Nova Esperança',1);

INSERT INTO pessoa(nome, data_nascimento, cidade_id)
VALUES ('Misael','1994-05-18',2);

INSERT INTO curso(nome, professor, pessoa_id)
VALUES ('Empreendedorismo','Hercilio',1);

INSERT INTO curso(nome, professor, pessoa_id)
VALUES ('Banco de Dados','Angélica',2);

SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM pessoa;
SELECT * FROM curso;

ALTER TABLE curso DROP COLUMN curso;
