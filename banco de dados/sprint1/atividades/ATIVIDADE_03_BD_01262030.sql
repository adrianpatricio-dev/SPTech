-- EXERÍCIO 1 --

CREATE DATABASE game_store;

CREATE TABLE game_store.jogo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    diretor VARCHAR(30),
    genero VARCHAR(30),
    data_lancamento DATE,
    nota INT,
    quantidade INT
);

INSERT INTO game_store.jogo (nome, diretor, genero, data_lancamento, nota, quantidade) VALUES
	('The Last of Us', 'Neil Druckmann', 'Ação', '2013-06-14', 9, 100),
	('Grand Theft Auto V', 'Leslie Benzies', 'Ação', '2013-09-17', 10, 0),
	('Red Dead Redemption 2', 'Jeffery H. Slade', 'Aventura', '2018-10-26', 8, 300),
	('Minecraft', 'Jens Bergensten', 'Sandbox', '2011-11-18', 10, 400),
	('God of War', 'Cory Barlog', 'Ação', '2018-04-20', 10, 0);
    
-- 1)
ALTER TABLE game_store.jogo ADD COLUMN tipo_midia VARCHAR(10);

ALTER TABLE game_store.jogo ADD CONSTRAINT chTipo_midia CHECK (tipo_midia = 'física' OR tipo_midia = 'digital');

-- 2)
UPDATE game_store.jogo SET tipo_midia = 'física' WHERE id = 1;
UPDATE game_store.jogo SET tipo_midia = 'digital' WHERE id = 2;
UPDATE game_store.jogo SET tipo_midia = 'física' WHERE id = 3;
UPDATE game_store.jogo SET tipo_midia = 'digital' WHERE id = 4;
UPDATE game_store.jogo SET tipo_midia = 'física' WHERE id = 5;

-- 3)
SELECT * FROM game_store.jogo WHERE data_lancamento >= '2015-01-01';

-- 4)
SELECT * FROM game_store.jogo WHERE nome LIKE '%a%' AND tipo_midia = 'física';

-- 5)
SELECT * FROM game_store.jogo WHERE diretor NOT LIKE '%e%';

-- 6)
ALTER TABLE game_store.jogo ADD CONSTRAINT chNota CHECK (nota >= 0 AND nota <= 10);

-- 7)
SELECT * FROM game_store.jogo WHERE genero = 'Ação' AND quantidade > 0;

-- 8)
DELETE FROM game_store.jogo WHERE quantidade = 0 AND id > 0;

-- 9)
ALTER TABLE game_store.jogo RENAME COLUMN diretor TO criador;

DESCRIBE game_store.jogo;

TRUNCATE game_store.jogo;



-- EXERÍCIO 2 --

CREATE DATABASE olimpiadas;

CREATE TABLE olimpiadas.esporte (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20),
    num_jogadores INT,
    estreia DATE,
    pais_origem VARCHAR(30)
);

INSERT INTO olimpiadas.esporte (nome, categoria, num_jogadores, estreia, pais_origem) VALUES
	('Futebol', 'Coletivo', 11, '1896-10-26', 'Inglaterra'),
	('Basquete', 'Coletivo', 5, '1896-12-21', 'Estados Unidos'),
	('Vôlei', 'Coletivo', 6, '1900-02-09', 'Estados Unidos'),
	('Tênis', 'Individual', 1, '1977-07-09', 'Inglaterra'),
	('Skate', 'Individual', 1, '2021-05-01', 'Japão');

-- 1)
ALTER TABLE olimpiadas.esporte ADD COLUMN popularidade DECIMAL(3,2);

ALTER TABLE olimpiadas.esporte ADD CONSTRAINT chPopularidade CHECK (popularidade >= 0 AND popularidade <=10);

DESCRIBE olimpiadas.esporte;

-- 2)
UPDATE olimpiadas.esporte SET popularidade = 9.9 WHERE id = 1;
UPDATE olimpiadas.esporte SET popularidade = 9.5 WHERE id = 2;
UPDATE olimpiadas.esporte SET popularidade = 8.3 WHERE id = 3;
UPDATE olimpiadas.esporte SET popularidade = 5 WHERE id = 4;
UPDATE olimpiadas.esporte SET popularidade = 5.2 WHERE id = 5;

-- 3)
SELECT * FROM olimpiadas.esporte ORDER BY popularidade DESC;

-- 4)
SELECT * FROM olimpiadas.esporte WHERE estreia >= '2020-01-01';

-- 5)
ALTER TABLE olimpiadas.esporte ADD CONSTRAINT chEstreia CHECK (estreia >= '1896-04-01' AND estreia <= '2026-08-20');

-- 6)
ALTER TABLE  olimpiadas.esporte ADD CONSTRAINT chCategoria CHECK (categoria != 'Individual' OR categoria != 'Coletivo');

-- 7)
SELECT * FROM olimpiadas.esporte WHERE pais_origem LIKE '_a%';

-- 8)
SELECT * FROM olimpiadas.esporte WHERE num_jogadores BETWEEN 4 AND 11;

-- 9)
DELETE FROM olimpiadas.esporte WHERE id = 1 OR id =3 OR id = 5;



-- EXERCÍCIO 3 --

CREATE DATABASE desenho;

CREATE TABLE desenho.desenho_animado (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    data_lancamento DATE,
    emissora_original VARCHAR(50),
    classificacao INT,
    status VARCHAR(15),
    nota INT
) AUTO_INCREMENT = 10 ;

INSERT INTO desenho.desenho_animado (titulo, data_lancamento, emissora_original, classificacao, status, nota) VALUES
	('Tom e Jerry', '1940-02-10', 'CBS', '0', 'finalizado', 9.0),
	('Os Simpsons', '1989-12-17', 'FOX', '14', 'exibindo', 9.0),
	('Bob Esponja Calça Quadrada', '1999-05-01', 'Nickelodeon', '0', 'exibindo', 8.5),
	('O Laboratório de Dexter', '1996-04-28', 'Cartoon Network', '0', 'finalizado', 8.6),
	('As Meninas Superpoderosas', '1998-11-18', 'Cartoon Network', '0', 'finalizado', 8.5),
	('Ben 10', '2005-12-27', 'Cartoon Network', '0', 'finalizado', 8.2),
	('Hora de Aventura', '2010-04-05', 'Cartoon Network', '10', 'finalizado', 8.6),
	('O Incrível Mundo de Gumball', '2011-05-02', 'Cartoon Network', '0', 'cancelado', 8.7),
	('Pokémon', '1997-04-01', 'TV Tokyo', '0', 'exibindo', 8.3),
	('Dragon Ball Z', '1989-04-26', 'Fuji TV', '15', 'finalizado', 8.8);
    
-- 1)
SELECT * FROM desenho.desenho_animado;

-- 2)
SELECT * FROM desenho.desenho_animado WHERE classificacao <= 14;

-- 3)
SELECT * FROM desenho.desenho_animado WHERE emissora_original = 'Cartoon Network';

-- 4)
ALTER TABLE desenho.desenho_animado ADD CONSTRAINT chStatus CHECK (status = 'exibindo' OR status = 'finalizado' OR status = 'cancelado');

UPDATE desenho.desenho_animado SET status = 'finalização' WHERE id = 10;

-- 5)
UPDATE desenho.desenho_animado SET status = 'finalizado' WHERE id = 11 OR id = 12;

-- 6)
DELETE FROM desenho.desenho_animado WHERE id = 12;

-- 7)
SELECT * FROM desenho.desenho_animado WHERE titulo LIKE 'O%';

-- 8)
ALTER TABLE desenho.desenho_animado RENAME COLUMN classificacao TO classificacaoIndicativa;

-- 9)
UPDATE desenho.desenho_animado SET nota = 10, data_lancamento = '2000-04-26' WHERE id = 11;

-- 10)
TRUNCATE desenho.desenho_animado;

-- 11)
ALTER TABLE desenho.desenho_animado DROP CONSTRAINT chStatus;



-- EXERCÍCIO 4 --

CREATE DATABASE estoque;

CREATE TABLE estoque.MisteriosSA (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    data_compra DATE,
    preco DECIMAL(4,2),
    peso INT,
    data_retirada DATE
);

INSERT INTO estoque.MisteriosSA (nome, data_compra, preco, peso) VALUES
	('Biscoitos Scooby', '2024-06-12', 35.50, 700),
    ('Cachorro-quente', '2024-05-23', 8.50, 200),
    ('Biscoitos Scooby', '2024-04-14', 6.75, 300),
    ('Cachorro-quente', '2026-02-20', 9.90, 500),
    ('Biscoitos Scooby', '2026-03-03', 7.40, 100),
    ('Cachorro-quente', '2026-03-18', 5.90, 100),
    ('Biscoitos Scooby', '2026-04-01', 11.50, 400),
    ('Cachorro-quente', '2026-04-12', 40.00, 800),
    ('Biscoitos Scooby', '2026-05-07', 6.00, 200),
    ('Cachorro-quente', '2026-05-22', 14.80, 150);
    
-- 1)
SELECT * FROM estoque.MisteriosSA;

-- 2)
SELECT nome, data_compra, data_retirada, id FROM estoque.MisteriosSA ORDER BY data_compra;

-- 3)
UPDATE estoque.MisteriosSA SET data_compra = '2026-08-23' WHERE id = 1;

-- 4)
ALTER TABLE estoque.MisteriosSA RENAME COLUMN id TO idComida;

-- 5)
ALTER TABLE estoque.MisteriosSA ADD CONSTRAINT chNome CHECK (nome = 'Biscoitos Scooby' OR nome = 'Cachorro-quente');

-- 6)
SELECT 
	nome, 
	data_compra AS 'data da compra',
    data_retirada AS 'data da retirada'
FROM estoque.MisteriosSA WHERE nome = 'Biscoitos Scooby';

-- 7)
SELECT * FROM estoque.MisteriosSA WHERE data_compra <= '2024-07-25';

-- 8)
SELECT * FROM estoque.MisteriosSA WHERE preco >= 30.50;

-- 9)
TRUNCATE TABLE estoque.MisteriosSA;



-- EXERCÍCIO 4 --

CREATE DATABASE vingadores;

CREATE TABLE vingadores.heroi (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(45),
    altura INT
);

INSERT INTO vingadores.heroi (nome, versao, habilidade, altura) VALUES
	('Homem de Ferro', 'Homem de Ferro', 'Inteligência e tecnologia', 185),
    ('Thor', 'Thor', 'Controle do trovão', 200),
    ('Hulk', 'O Incrível Hulk', 'Super força', 244),
    ('Doutor Estranho', 'Doutor Estranho', 'Magia e manipulação da realidade', 180),
    ('Capitão América', 'Capitão América: O Primeiro Vingador', 'Super força e estratégia', 188);
    
-- 1)
SELECT * FROM vingadores.heroi;

-- 2)
ALTER TABLE vingadores.heroi ADD COLUMN regeneracao BOOLEAN, ADD CONSTRAINT chRegeneracao CHECK (regeneracao = 'TRUE' OR regeneracao = 'FALSE');

-- 3)
ALTER TABLE vingadores.heroi MODIFY COLUMN regeneracao VARCHAR(100);

-- 4)
DELETE FROM vingadores.heroi WHERE id = 3;

-- 5)
INSERT INTO vingadores.heroi (nome, versao, habilidade, altura) VALUE
	('Senhor fantástico', 'Quarteto fantástico', 'Elasticidade corporal', 184);
    
-- 6)
SELECT * FROM vingadores.heroi WHERE nome LIKE 'C%';

-- 7)
SELECT * FROM vingadores.heroi WHERE nome NOT LIKE '%a%';

-- 8)
SELECT nome FROM vingadores.heroi WHERE altura > 190;

-- 9)
SELECT * FROM vingadores.heroi WHERE altura > 180 ORDER BY nome DESC;

-- 10)
TRUNCATE TABLE vingadores.heroi;



-- EXERCÍCIO 6 --

CREATE TABLE sprint1.Revista (
	idREvista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO sprint1.Revista (nome) VALUES
	('Veja'),
    ('Exame'),
    ('Superinteressante'),
    ('Claudia');
    
-- 1)
SELECT * FROM sprint1.Revista;

-- 2)
UPDATE sprint1.Revista SET categoria = 'Notícia' WHERE idRevista = 1;
UPDATE sprint1.Revista SET categoria = 'Economia' WHERE idRevista = 2;
UPDATE sprint1.Revista SET categoria = 'Ciência' WHERE idRevista = 3;
UPDATE sprint1.Revista SET categoria = 'Comportamento' WHERE idRevista = 4;

SELECT * FROM sprint1.Revista;

-- 3)
INSERT INTO sprint1.Revista (nome, categoria) VALUES
    ('Caras', 'Celebridades'),
    ('Quatro Rodas', 'Automóveis'),
    ('Mundo Estranho', 'Curiosidades');
    
-- 4)
SELECT * FROM sprint1.Revista;

-- 5)
DESCRIBE sprint1.Revista;

-- 6)
ALTER TABLE sprint1.Revista MODIFY COLUMN categoria VARCHAR(40);

-- 7)
DESCRIBE sprint1.Revista;

-- 8)
ALTER TABLE sprint1.revista ADD COLUMN periodicidade VARCHAR(15);

-- 9)
SELECT * FROM sprint1.Revista;

-- 10)
ALTER TABLE sprint1.Revista DROP COLUMN periodicidade;



-- EXERCÍCIO 7 --

CREATE TABLE sprint1.Carro (
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
) AUTO_INCREMENT = 1000;

INSERT INTO sprint1.Carro (nome, placa) VALUES
	('Civic', 'ABC1234'),
    ('Corolla', 'DEF5678'),
    ('Onix', 'GHI9012'),
    ('HB20', 'JKL3456');
    
-- 1)
SELECT * FROM sprint1.Carro;

-- 2)
INSERT INTO sprint1.Carro (nome, placa) VALUES
    ('Gol', 'MNO7890'),
    ('Fiesta', 'PQR1234'),
    ('Uno', 'STU5678');
    
-- 3)
SELECT * FROM sprint1.Carro;

-- 4)
DESCRIBE sprint1.Carro;

-- 5)
ALTER TABLE sprint1.Carro MODIFY COLUMN nome VARCHAR(28);

-- 6)
DESCRIBE sprint1.Carro;

-- 7)
ALTER TABLE sprint1.Carro ADD COLUMN ano CHAR(4);

-- 8)
UPDATE sprint1.Carro SET ano = '2020' WHERE idCarro = 1000;
UPDATE sprint1.Carro SET ano = '2021' WHERE idCarro = 1001;
UPDATE sprint1.Carro SET ano = '2019' WHERE idCarro = 1002;
UPDATE sprint1.Carro SET ano = '2022' WHERE idCarro = 1003;
UPDATE sprint1.Carro SET ano = '2018' WHERE idCarro = 1004;
UPDATE sprint1.Carro SET ano = '2020' WHERE idCarro = 1005;
UPDATE sprint1.Carro SET ano = '2017' WHERE idCarro = 1006;