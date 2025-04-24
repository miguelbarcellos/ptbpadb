-- Questão 01
CREATE TABLE pessoa (
    ID INT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    idade INT CHECK (idade >= 0)
);

-- Questão 02
ALTER TABLE pessoa
ADD CONSTRAINT pessoa_unique UNIQUE (ID, nome, sobrenome);

-- Questão 03
ALTER TABLE pessoa
ALTER COLUMN idade INT NOT NULL;

-- Questão 04
CREATE TABLE endereco (
    ID INT PRIMARY KEY,
    rua VARCHAR(255)
);

ALTER TABLE pessoa
ADD endereco_id INT;

ALTER TABLE pessoa
ADD CONSTRAINT fk_endereco
FOREIGN KEY (endereco_id) REFERENCES endereco(ID);
