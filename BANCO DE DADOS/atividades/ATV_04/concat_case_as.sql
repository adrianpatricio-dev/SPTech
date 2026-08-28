USE sprint1;

CREATE TABLE aluguel (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    valor_total DECIMAL(5,2),
    status_ VARCHAR(15) CONSTRAINT chStatus CHECK (status_ IN('finalizado', 'em andamento'))
);

INSERT INTO aluguel (nome, sobrenome, valor_total, status_) VALUES
	('Carlos', 'Silva', 850.00, 'finalizado'),
	('Mariana', 'Oliveira', 800.50, 'em andamento'),
	('João', 'Santos', 650.00, 'finalizado'),
	('Beatriz', 'Souza', 500.00, 'em andamento'),
	('Lucas', 'Pereira', 980.75, 'finalizado');
    
SELECT 
	CONCAT(nome, ' ', sobrenome) AS cliente, 
    valor_total,
    CASE
		WHEN status_ = 'finalizado' THEN 'Concluído'
        WHEN status_ = 'em andamento' THEN 'Em andamento'
		ELSE 'Cancelado'
	END AS situacao
FROM aluguel ORDER BY cliente DESC;