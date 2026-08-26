CREATE DATABASE sprint1;

USE sprint1;

-- EXERCÍCIO 1: ATLETA --

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO Atleta VALUES 
	(1, 'Michael Phelps', 'natação', 28),
    (2, 'Usain Bolt', 'atletismo', 8),
    (3, 'Simone Biles', 'ginástica artística', 11),
    (4, 'César Cielo', 'natação', 3),
    (5, 'Vera', 'ginástica artística', 2);
    
-- 1)
SELECT * FROM Atleta;

-- 2)
SELECT nome, qtdMedalha FROM Atleta;

-- 3)
SELECT * FROM Atleta WHERE modalidade = 'natação';

-- 4)
SELECT * FROM Atleta
	ORDER BY modalidade;

-- 5)
SELECT * FROM Atleta 
	ORDER BY qtdMedalha DESC;
    
-- 6)
SELECT * FROM Atleta
	WHERE nome LIKE '%s%';
    
-- 7)
SELECT * FROM Atleta
	WHERE nome LIKE 'M%';
    
-- 8)
SELECT * FROM Atleta
	WHERE nome LIKE '%o';
    
-- 9)
SELECT * FROM Atleta
	WHERE nome LIKE '%r_';
    
-- 10)
DROP TABLE Atleta;


-- EXERCÍCIO 2: MÚSICA --

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica VALUES
	(1, 'Lugar secreto', 'Gabriela Rocha', 'Worship'),
	(2, 'Ousado amor', 'Isaias Saad', 'Worship'),
	(3, 'Me atraiu', 'Gabriela Rocha', 'Pop gospel'),
	(4, 'Bênçãos Que Não Têm Fim', 'Isadora Pompeo', 'Adoração Contemporânea'),
	(5, 'Deus de Promessas', 'Davi Sacer', 'Congregacional'),
	(6, 'Eu Navegarei', 'Gabriela Rocha', 'Pentecostal'),
	(7, 'Atos 2', 'Gabriela Rocha', 'Worship');
 
-- 1)
SELECT * FROM Musica;

-- 2)
SELECT titulo, artista FROM Musica;

-- 3)
SELECT * FROM Musica
	WHERE genero = 'Worship';

-- 4)
SELECT * FROM Musica
	WHERE artista = 'Gabriela Rocha';

-- 5)
SELECT * FROM Musica
	ORDER BY titulo;

-- 6)
SELECT * FROM Musica
	ORDER BY artista DESC;
    
-- 7)
SELECT * FROM Musica
	WHERE titulo LIKE 'A%';
    
-- 8)
SELECT * FROM Musica
	WHERE artista LIKE '%d';
    
-- 9)
SELECT * FROM Musica
	WHERE genero LIKE '_e%';
    
-- 10)
SELECT * FROM Musica
	WHERE titulo LIKE '%e_';
    
-- 11)
DROP TABLE Musica;


-- EXERCÍCIO 3: FILME --

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

INSERT INTO Filme VALUES
	(1, "Vingadores: Ultimato", "Super-herói", "Anthony Russo"),
	(2, "Batman: O Cavaleiro das Trevas", "Super-herói", "Christopher Nolan"),
	(3, "Homem-Aranha: Sem Volta para Casa", "Super-herói", "Jon Watts"),
	(4, "John Wick: De Volta ao Jogo", "Ação", "Chad Stahelski"),
	(5, "Interestelar", "Ficção científica", "Christopher Nolan"),
	(6, "Avatar", "Ficção científica", "James Cameron"),
	(7, "Duro de Matar", "Ação", "John McTiernan");
    
    
-- 1)
SELECT * FROM Filme;

-- 2)
SELECT titulo, diretor FROM Filme;

-- 3)
SELECT * FROM Filme
	WHERE genero = 'Ação';
    
-- 4) 
SELECT * FROM Filme
	WHERE diretor = 'Christopher Nolan';
    
-- 5)
SELECT * FROM Filme
	ORDER BY titulo;

-- 6)
SELECT * FROM Filme
	ORDER BY diretor DESC;
    
-- 7)
SELECT * FROM Filme
	WHERE titulo LIKE 'A%';
    
-- 8)
SELECT * FROM Filme
	WHERE diretor LIKE '%s';

-- 9)
SELECT * FROM Filme
	WHERE genero LIKE '_i%';

-- 10)
SELECT * FROM Filme
	WHERE titulo LIKE '%g_';
    
-- 11)
DROP TABLE Filme;


-- EXERCÍCIO 4: Professor --

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO Professor VALUES
	(1, 'Julia', 'Banco de dados', '1982-04-15'),
	(2, 'Murilo', 'Banco de dados', '1978-11-03'),
	(3, 'Frizza', 'Algoritmo', '1979-12-07'),
	(4, 'Lucas', 'Algoritmo', '1980-01-30'),
	(5, 'Fernando', 'TI', '1978-11-030'),
	(6, 'Marcos', 'TI', '1978-11-030');
    
-- 1)
SELECT * FROM Professor;

-- 2) 
SELECT especialidade FROM Professor;

-- 3)
SELECT * FROM Professor
	WHERE especialidade = 'Banco de dados';
    
-- 4)
SELECT * FROM Professor
	ORDER BY nome;

-- 5)
SELECT * FROM Professor
	ORDER BY dtNasc DESC;
    
-- 6)
SELECT * FROM Professor
	WHERE nome LIKE 'J%';
    
-- 7)
SELECT * FROM Professor
	WHERE nome LIKE '%o';

-- 8)
SELECT * FROM Professor
	WHERE nome LIKE '_u%';
    
-- 9)
SELECT * FROM Professor
	WHERE nome LIKE '%z_';
    
-- 10)
DROP TABLE Professor;


-- EXERCÍCIO 5: JOGO --

CREATE TABLE Jogo (
	idJogo INT PRIMARY KEY,
    nome VARCHAR(50),
    comentario VARCHAR(200),
    ranking INT
);

INSERT INTO Jogo VALUES
	(1, 'Minecraft', 'Jogo criativo com construção e sobrevivência', 10),
	(2, 'Grand Theft Auto V', 'Mundo aberto com muitas missões e ação', 9),
	(3, 'The Legend of Zelda: Breath of the Wild', 'Grande exploração e excelente jogabilidade', 8),
	(4, 'Elden Ring', 'RPG desafiador com mundo aberto', 10),
	(5, 'Red Dead Redemption 2', 'História envolvente e mundo muito detalhado', 8);
    
-- 1)
SELECT * FROM Jogo;

-- 2)
SELECT nome FROM Jogo;

-- 3)
SELECT comentario FROM Jogo
	WHERE nome = 'Minecraft';
    
-- 4)
SELECT * FROM Jogo
	ORDER BY nome;
    
-- 5)
SELECT * FROM Jogo
	ORDER BY ranking DESC;
    
-- 6)
SELECT * FROM Jogo
	WHERE nome LIKE 'G%';
    
-- 7)
SELECT * FROM Jogo
	WHERE nome LIKE '%d';
    
-- 8)
SELECT * FROM Jogo
	WHERE nome LIKE '_l%';
    
-- 9)
SELECT * FROM Jogo
	WHERE nome LIKE '%n_';
    
-- 10)
SELECT * FROM Jogo
	WHERE nome != 'Minecraft';
    
-- 11)
DROP TABLE Jogo;