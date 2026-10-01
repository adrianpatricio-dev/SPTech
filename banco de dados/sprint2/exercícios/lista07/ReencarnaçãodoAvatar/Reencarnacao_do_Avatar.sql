USE sprint2;

-- CRIAÇÃO DAS TABELAS E INSERÇÃO DOS DADOS --

CREATE TABLE nacao (
	pkNacao INT PRIMARY KEY AUTO_INCREMENT,
    nmNacao VARCHAR(45),
    nmElemento VARCHAR(10)
);

CREATE TABLE avatar (
	pkAvatar INT PRIMARY KEY AUTO_INCREMENT,
    nmAvatar VARCHAR(45),
    fkNacao INT, 
    fkAntecessor INT, 
    CONSTRAINT fk_nacao_avatar FOREIGN KEY (fkNacao) REFERENCES nacao (pkNacao),
    CONSTRAINT fk_avatar_antecessor FOREIGN KEY (fkAntecessor) REFERENCES avatar (pkAvatar)
);

-- 1)
INSERT INTO nacao (nmNacao, nmElemento) VALUES
	('Nômades do Ar', 'Ar'),
	('Tribo da Água', 'Água'),
	('Reino da Terra', 'Terra'),
	('Nação do Fogo', 'Fogo');
    
-- 2)
INSERT INTO avatar (nmAvatar, fkNacao, fkAntecessor) VALUES
	('Wan', 1, NULL),
	('Szeto', 4, 1),
	('Yangchen', 1, 2),
	('Kuruk', 2, 3),
	('Kyoshi', 3, 4),
	('Roku', 4, 5),
	('Aang', 1, 6),
	('Korra', 2, 7);
    
-- LEITURA DO PERGAMINHO --

-- 1)
SELECT
	avatar.nmAvatar 'Avatar',
	nacao.nmNacao 'Nação',
    nacao.nmElemento 'Elemento',
    anterior.nmAvatar 'Antecessor'
FROM avatar 
	LEFT JOIN avatar anterior ON avatar.fkAntecessor = anterior.pkAvatar
    INNER JOIN nacao ON nacao.pkNacao = avatar.fkNacao;
    
-- 2)
SELECT
	CONCAT('Avatar ', avatar.nmAvatar, ' sucedeu Avatar ', anterior.nmAvatar) 'Avatar e sucessor'
FROM avatar INNER JOIN avatar anterior ON avatar.fkAntecessor = anterior.pkAvatar;

-- 3)
SELECT 
    avatar.nmAvatar 'Avatar',
    nacao.nmElemento 'Elemento',
    anterior.nmAvatar 'Antecessor',
    nacao_anterior.nmElemento 'Elemento do antecessor'
FROM
    avatar
        INNER JOIN
    nacao ON avatar.fkNacao = nacao.pkNacao
        INNER JOIN
    avatar anterior ON avatar.fkAntecessor = anterior.pkAvatar
        INNER JOIN
    nacao nacao_anterior ON anterior.fkNacao = nacao_anterior.pkNacao;
    
-- 4)
SELECT
	avatar.nmAvatar 'Avatar',
    CASE
		WHEN nmAvatar IN('Wan', 'Szeto', 'Yangchen', 'Kuruk') THEN 'Era Antiga'
        WHEN nmAvatar IN('Kyoshi', 'Roku') THEN 'Era Clássica'
        ELSE 'Era Moderna'
	END 'Época'
FROM avatar;

-- AJUSTES NO CICLO --

-- 1)
UPDATE nacao SET nmNacao = 'Tribo da Água do Norte e do Sul' WHERE pkNacao = 2;

-- 2)
DELETE FROM avatar WHERE pkAvatar = 8;