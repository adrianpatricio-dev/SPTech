USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE sprint2.animal (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    especie VARCHAR(45),
    raca VARCHAR(45),
    idade INT
);

CREATE TABLE sprint2.ficha_medica (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_ultima_consulta DATE,
    peso DECIMAL(4,2),
    vacina_em_dia VARCHAR(10),
    observacao  VARCHAR(100),
    fk_animal INT UNIQUE,
    CONSTRAINT fk_animal_ficha FOREIGN KEY (fk_animal) REFERENCES animal (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO animal (nome, especie, raca, idade)	VALUES
	('Rex', 'Cachorro', 'Labrador', 1),
	('Mia', 'Gato', 'Siamês', 3),
	('Thor', 'Cachorro', 'Pastor Alemão', 8),
	('Nina', 'Cachorro', NULL, 6),
	('Luna', 'Coelho', 'Mini Lop', 10);
    
-- 2)
INSERT INTO ficha_medica (data_ultima_consulta, peso, vacina_em_dia, observacao, fk_animal) VALUES
	('2026-08-15', 3.50, 'Sim', 'Animal saudável', 1),
	('2026-07-20', 4.80, 'Não', 'Vacina antirrábica atrasada', 2),
	('2026-06-10', 32.50, 'Sim', NULL, 3),
	('2026-09-01', 18.00, 'Não', 'Necessita reforço de vacina', 4);
    
-- 3)
SELECT * FROM animal;
SELECT * FROM ficha_medica;

-- 4)
INSERT INTO ficha_medica (data_ultima_consulta, peso, vacina_em_dia, observacao, fk_animal) VALUES
	('2026-08-15', 3.50, 'Sim', 'Animal saudável', 1);
    
    -- Error Code: 1062. Duplicate entry '1' for key 'ficha_medica.fk_animal'

-- PARTE 3 : CONSULTAS COM SELECT --

-- 1)
SELECT
    nome 'Nome doAnimal',
    especie 'Espécie'
FROM animal;

-- 2)
SELECT 
	*
FROM ficha_medica WHERE vacina_em_dia = 'Não';

-- 3)
SELECT 
	*
FROM animal ORDER BY idade DESC;

-- 4)
SELECT 
	*
FROM animal WHERE especie = 'Cachorro';

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
    animal.nome 'Pet',
    animal.especie 'Tipo'
FROM animal;

-- 2)
SELECT
    ficha_medica.peso 'Peso (kg)',
    ficha_medica.data_ultima_consulta 'Ultima Consulta'
FROM ficha_medica;

-- 3)
SELECT
    animal.nome 'Pet',
    animal.idade * 7 'Idade Humana Aproximada'
FROM animal;

-- 4)
SELECT
    animal.nome 'Nome do Pet',
    animal.raca 'Raca/Tipo'
FROM animal;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT
    animal.nome 'Pet',
    CASE
        WHEN animal.idade < 2 THEN 'Filhote'
        WHEN animal.idade <= 7 THEN 'Adulto'
        ELSE 'Idoso'
    END 'fase_vida'
FROM animal;

-- 2)
SELECT
    animal.nome 'Pet',
    CASE
        WHEN ficha_medica.vacina_em_dia = 'Sim' THEN 'Vacinado'
        ELSE 'Pendente'
    END 'vacinacao'
FROM animal INNER JOIN ficha_medica ON animal.id = ficha_medica.fk_animal;

-- 3)
SELECT
    ficha_medica.peso 'Peso',
    CASE
        WHEN ficha_medica.peso < 5 THEN 'Pequeno'
        WHEN ficha_medica.peso <= 20 THEN 'Médio'
        ELSE 'Grande'
    END 'porte'
FROM ficha_medica;

-- 4)
SELECT
    animal.nome 'Pet',
    CASE
        WHEN animal.especie = 'Cachorro' THEN 'Canino'
        WHEN animal.especie = 'Gato' THEN 'Felino'
        ELSE 'Outro'
    END 'especie_tipo'
FROM animal;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT
    animal.nome 'Pet',
    IFNULL(ficha_medica.observacao, 'Nenhuma observação') 'observacao'
FROM animal INNER JOIN ficha_medica ON animal.id = ficha_medica.fk_animal;

-- 2)
SELECT
    animal.nome 'Pet',
    IFNULL(ficha_medica.data_ultima_consulta, 'SEM FICHA') 'Ultima Consulta'
FROM animal LEFT JOIN ficha_medica ON animal.id = ficha_medica.fk_animal;

-- 3)
SELECT
    animal.nome 'Pet',
    ficha_medica.peso 'Peso',
    ficha_medica.data_ultima_consulta 'Última consulta'
FROM animal INNER JOIN ficha_medica ON animal.id = ficha_medica.fk_animal;

-- 4)
SELECT
    CONCAT(animal.nome, ' - ', animal.especie, ' - ', ficha_medica.peso,' kg') 'resumo'
FROM animal INNER JOIN ficha_medica ON animal.id = ficha_medica.fk_animal;

-- 5)
SELECT
    animal.nome 'Pet',
    IFNULL(animal.raca, 'Raca não informada') 'Raca/Tipo'
FROM animal;