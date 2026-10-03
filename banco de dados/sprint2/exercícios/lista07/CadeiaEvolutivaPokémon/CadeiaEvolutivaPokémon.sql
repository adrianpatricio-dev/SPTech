USE sprint2;

-- ESTRUTURA DAS TABELAS --

CREATE TABLE tipo (
	pkTipo INT PRIMARY KEY AUTO_INCREMENT,
    nmTipo VARCHAR(45)
);

CREATE TABLE pokemon (
	pkPokemon INT PRIMARY KEY AUTO_INCREMENT,
    nmPokemon VARCHAR(45),
    nrPokedex INT,
    fkTipo INT,
    fkEvoluiDe INT,
    CONSTRAINT fk_tipo_pokemon FOREIGN KEY (fkTipo) REFERENCES tipo (pkTipo),
    CONSTRAINT fk_pokemon_evolui FOREIGN KEY (FkEvoluiDe) REFERENCES pokemon (pkPokemon)
);

-- COMNDAOS --

-- 1)
INSERT INTO tipo (nmTipo) VALUES
	('Grama'),
	('Fogo'),
	('Água'),
	('Venenoso'),
	('Psíquico'),
	('Normal'),
	('Voador'),
	('Elétrico');

-- 2)
INSERT INTO pokemon (nmPOkemon, nrPOkedex, fkTipo, fkEvoluiDe) VALUES
	('Bulbasaur', 1, 1, NULL),
	('Ivysaur', 2, 1, 1),
	('Venusaur', 3, 1, 2),
	('Charmander', 4, 2, NULL),
	('Charmeleon', 5, 2, 4),
	('Charizard', 6, 2, 5),
	('Squirtle', 7, 3, NULL),
	('Wartortle', 8, 3, 7),
	('Blastoise', 9, 3, 8),
	('Abra', 63, 5, NULL),
	('Kadabra', 64, 5, 10),
	('Alakazam', 65, 5, 11),
	('Evee', 133, 6, NULL);
    
-- 3)
SELECT
	pokemon.nmPokemon 'Pokémon',
    pokemon.nrPokedex 'Nº Pokedéx',
    tipo.nmTipo 'Tipo'
FROM pokemon INNER JOIN tipo ON pokemon.fkTipo = tipo.pkTipo;

-- 4)
SELECT
	pokemon.nmPokemon 'Pokémon',
    pokemon.nrPokedex 'Nº Pokedéx',
    evolui.nmPokemon 'Evolui de'
FROM pokemon LEFT JOIN pokemon evolui ON pokemon.fkEvoluiDe = evolui.pkPokemon;

-- 5)
SELECT
	CONCAT(base.nmPokemon, ' evoluiu para ', evolucao.nmPokemon) 'Evoluções'
FROM pokemon base INNER JOIN pokemon evolucao ON base.pkPokemon = evolucao.fkEvoluiDe;

-- 6)
ALTER TABLE pokemon ADD COLUMN dsAtaqueEspecial VARCHAR(30);

-- 7)
UPDATE pokemon set dsAtaqueEspecial = 'Frenesi Solar' WHERE pkPokemon = 3;
UPDATE pokemon set dsAtaqueEspecial = 'Lança-Chamas' WHERE pkPokemon = 6;
UPDATE pokemon set dsAtaqueEspecial = 'Hidro Bomba' WHERE pkPokemon = 9;
UPDATE pokemon set dsAtaqueEspecial = 'Psíquico' WHERE pkPokemon = 12;

-- 8)
SELECT 
	pokemon.nrPokedex 'Nº Pokedéx',
    CASE
		WHEN pokemon.fkEvoluiDe IS NULL THEN 'Forma Base'
        WHEN evo.fkEvoluiDe IS NULL THEN 'Forma Final'
        ELSE 'Forma Intermediária'
	END 'Estágio'
FROM pokemon LEFT JOIN pokemon evo ON evo.fkEvoluiDe = pokemon.pkPokemon ORDER BY pokemon.nrPokedex;

-- 9)
SELECT
	pokemon.nmPokemon 'Pokémon',
    pokemon.nrPokedex 'Nº Pokedéx',
    tipo.nmTipo 'Tipo'
FROM pokemon LEFT JOIN pokemon evo ON evo.fkEvoluiDe = pokemon.pkPokemon INNER JOIN tipo ON pokemon.fkTipo = tipo.pkTipo WHERE evo.pkPokemon IS NULL;

-- 10)
DELETE FROM pokemon WHERE nrPokedex = 133;