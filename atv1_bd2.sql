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



   
INSERT INTO estado (id, nome, sigla) VALUES (2, 'PARANA', 'PR');
INSERT INTO instituicao (id, nome) VALUES (2, 'IFPR');
INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'PARANAVAÍ', 1);
INSERT INTO pessoa (id, nome, data_nascimento, instituicao_id, cidade_id) VALUES (1, 'MISAEL', '1888-05-12', 1, 1);
INSERT INTO curso (id, nome, professor, instituicao_id) VALUES (1, 'BANCO DE DADOS', 'ANGELICA', 1);
INSERT INTO pessoa_curso (id, curso_id, pessoa_id) VALUES (1, 1, 1);


SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM instituicao;
SELECT * FROM pessoa;
SELECT * FROM curso;
SELECT * FROM pessoa_curso;

