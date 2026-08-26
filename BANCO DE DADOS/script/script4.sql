/* 
	MySQL é um banco relacional
    Tabelas que se relacionam entre elas
    Toda tabela é composta por colunas (atributos) e linhas (registros)
    Toda tabela tem que ter uma coluna que não se repete, essa coluna é chamada de chave primária (PK - Primary Key) ou ID
    Todos os comandos são em inglês
*/

-- CRIANDO UM BANCO DE DADOS
CREATE DATABASE sprint1;

-- USANDO O BANCO DE DADOS
USE sprint1;

-- CRIANDO UMA TABELA NO BANCO DE DADOS
CREATE TABLE empresa (
	id INT PRIMARY KEY NOT NULL, -- INT: Tipo número inteiro
    nome VARCHAR(45), -- VARCHAR: Tipo de texto limitado/ variável
    cnpj CHAR(14) -- CHAR: Tipo texto limitado
);

-- DESCREVER A TABELA EMPRESA
DESCRIBE empresa; -- OU DESC empresa;

-- INSERINDO DADO NA TABELA EMPRESA
INSERT INTO empresa VALUE
	(1, 'Safra', '123.456.0001/8');

-- EXIBIR OS DADOS INSERIDOS
SELECT * FROM empresa;

-- INSERINDO MAIS DE UM DADO NA TABELA EMPRESA
INSERT INTO empresa VALUES
	(2, 'Itaú', '100.456.0001/8'),
	(3, 'SPTech', '333.456.0001/8'),
	(4, 'PWC', '444.456.0001/8');
    
-- EXIBIR APENAS O NOME DA EMPRESA
SELECT nome FROM empresa;

-- EXIBIR APENAS O NOME E O CPJ DA EMPRESA
SELECT cnpj ,nome FROM empresa;

-- EXIBIR TODOS OS DADOS APENAS DA EMPRESA SAFRA
SELECT * FROM empresa 
	WHERE nome = 'Safra';

-- EXIBIR TODOS OS DADOS APENAS DA EMPRESA DE ID 4
SELECT * FROM empresa 
	WHERE id = 4;

-- EXIBIR TODOS OS DADOS APENAS DA EMPRESA DE ID 2 E 3
SELECT * FROM empresa 
	WHERE id = 2 OR id = 3;

-- EXIBIR O NOME DA EMRESA QUE COMEÇA COM A LETRA S
SELECT nome FROM empresa 
	WHERE nome LIKE 'S%';

-- EXIBIR O NOME DA EMRESA QUE TERMINAM COM A LETRA A
SELECT nome FROM empresa 
	WHERE nome LIKE '%a';
    
-- EXIBIR O NOME DA EMRESA QUE CONTENHA A LETRA A
SELECT nome FROM empresa 
	WHERE nome LIKE '%P%';

-- EXIBIR O NOME DA EMRESA QUE CONTENHA A LETRA R NA PENÚLTIMA POSIÇÃO
SELECT nome FROM empresa 
	WHERE nome LIKE '%r_';
    
-- EXIBIR TODOS OS DADOS MENOS DA EMPRESA SPTECH (SINAL DE DIFERENTE: != ou <>)
SELECT * FROM empresa
	WHERE nome != 'SPTech';
    
-- EXIBIR AS EMPRESAS EM ORDEM ALFABÉTICA (COM OU SEM 'ASC: ORDEM CRESCENTE')
SELECT * FROM empresa
	ORDER BY nome ASC;
    
-- EXIBIR AS EMPRESAS EM ORDEM DECRESCENTE
SELECT * FROM empresa
	ORDER BY nome DESC;
    
-- EXCLUIR A TABELA
DROP TABLE empresa;