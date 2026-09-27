-- PARTE 1 : CRIAR O BANCO DE DADOS E AS TABELAS --

-- 1)
USE sprint2;

CREATE TABLE atleta (
	idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    modalidade VARCHAR(45),
    qtdMedalha INT
);

CREATE TABLE pais (
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    capital VARCHAR(45)
);

-- PARTE 2 : INSERIR OS DADOS --

-- 1)
INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
    ('Michael Phelps', 'Natação', 28),
    ('Katie Ledecky', 'Natação', 10),
    ('Usain Bolt', 'Atletismo', 8),
    ('Allyson Felix', 'Atletismo', 11),
    ('Rebeca Andrade', 'Ginástica', 6),
    ('Simone Biles', 'Ginástica', 11);
    
-- 2)
INSERT INTO pais (nome, capital) VALUES
    ('Estados Unidos', 'Washington, D.C.'),
    ('Brasil', 'Brasília'),
    ('Jamaica', 'Kingston'),
    ('França', 'Paris');
    
-- PARTE 3 : MODELAGEM E CHAVE ESTRANGEIRA --

-- 1)
ALTER TABLE atleta ADD COLUMN fk_pais INT;

ALTER TABLE atleta ADD CONSTRAINT fk_atleta_pais FOREIGN KEY (fk_pais) REFERENCES atleta (idAtleta);

-- 2)
UPDATE atleta SET atleta.fk_pais = 1 WHERE atleta.nome IN ('Michael Phelps', 'Katie Ledecky', 'Simone Biles');

UPDATE atleta SET atleta.fk_pais = 2 WHERE atleta.nome = 'Rebeca Andrade';

UPDATE atleta SET atleta.fk_pais = 3 WHERE atleta.nome = 'Usain Bolt';

UPDATE atleta SET atleta.fk_pais = 4 WHERE atleta.nome = 'Allyson Felix';

-- PARTE 4 : CONSULTAS COM JOIN --

-- 1)
SELECT 
    atleta.nome 'Nome',
    atleta.modalidade 'Modalidade',
    atleta.qtdMedalha 'Medalhas',
    pais.nome 'Pais'
FROM atleta INNER JOIN pais ON atleta.fk_pais = pais.idPais;

-- 2)
SELECT 
    atleta.nome 'Nome',
    pais.nome 'Pais'
FROM atleta INNER JOIN pais ON atleta.fk_pais = pais.idPais;

-- 3)
SELECT 
    atleta.nome 'Nome',
    atleta.modalidade 'Modalidade',
    atleta.qtdMedalha 'Medalhas',
    pais.nome 'Pais',
    pais.capital 'Capital'
FROM atleta
INNER JOIN pais ON atleta.fk_pais = pais.idPais
WHERE pais.capital = 'Brasília';