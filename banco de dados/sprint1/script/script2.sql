/* 
UPDATE - Atualiza dados - DML

DELETE - Exclui um registro - DML

ALTER TABLE - Altera a tabela - DDL
	MODIFY - Modifica um atributo
    ADD - Adiciona um atributo
    DROP - Exclui um atributo
    RENAME - Muda o nome do atributo

DROP TABLE - Excluiu a tabela

TRUNCATE - Apaga os dados da tabela - DDL

CONSTRAINT - Restrição de um atributo
	CHECK - Valida valores permitidos 
    
DESCRIBE - Descreve os metadados da tabela
*/

-- USE sprint1;

CREATE TABLE sprint1.usuario (
	id INT PRIMARY KEY AUTO_INCREMENT, -- Funciona apenas em tipos números inteiros
    nome VARCHAR(45) NOT NULL, -- Obrigatório
    dtNasc DATE,
    peso DECIMAL(4,1),
    altura FLOAT,
    plano VARCHAR(45),
	email VARCHAR(100) UNIQUE,
	CONSTRAINT chPlano CHECK (plano IN('Mensal', 'Semanal', 'Avulso')),
	nivel INT,
    CONSTRAINT chNivel CHECK (nivel >= 1 AND nivel <= 5),
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
) AUTO_INCREMENT = 500;

INSERT INTO sprint1.usuario (nome, dtNasc, peso, altura, plano, email, nivel) VALUES
	('Jorge', '2000-06-09', 75.5, 1.85, 'Mensal', 'jorge@email.com', 2),
	('Maria', '2009-07-10', 56.5, 1.65, 'Avulso', 'maria@email.com', 1),
	('Carlos', '1998-10-05', 87.5, 1.75, 'Semanal', 'carlos@email.com', 5),
	('Adriana', '2010-04-07', 60.1, 1.65, 'Mensal', 'adriana@email.com', 4);
    
SELECT * FROM sprint1.usuario;

SELECT
	nome AS 'Nome do usuário', -- ALIAS - Apelidando o nome da coluna (não muda a estrutura da tabela)
    dtCadastro AS Data_Cadastro
FROM sprint1.usuario;
    
SELECT
	CONCAT('O aluno(a) ' , nome , ' utiliza o plano ' , plano) AS Info
FROM sprint1.usuario;

-- IF e ELSE no MySQL
-- CASE

SELECT 
	nome,
CASE
	WHEN nivel = 1 THEN 'Nível baby'
    WHEN nivel <= 2 THEN 'Nível mini monster'
	ELSE 'Nível monster'
END AS 'Nível', nivel AS 'Nível do usuário'
FROM sprint1.usuario;

SELECT * FROM sprint1.usuario WHERE id IN(500,503);

SELECT * FROM sprint1.usuario WHERE id NOT IN(500,503);

SELECT * FROM sprint1.usuario WHERE id > 500 AND id < 503;

SELECT * FROM sprint1.usuario WHERE dtNasc > '2000-01-01';

SELECT * FROM sprint1.usuario WHERE id BETWEEN 500 AND 505;

SELECT * FROM sprint1.usuario WHERE dtNasc > '2000-01-01';

TRUNCATE usuario;