USE sprint2;

CREATE TABLE pessoa (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE reserva (
	idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fkPessoa INT,
    CONSTRAINT fkPessoa_Reserva FOREIGN KEY (fkPessoa) REFERENCES pessoa (idPessoa)
);

INSERT INTO pessoa (nome, cpf) VALUES
	('Adrian', '12345678901'),
	('Carlos', '23456789012'),
	('Mariana', '34567890123'),
	('João', '45678901234'),
	('Beatriz', '56789012345');
    
INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
	('2026-09-20 10:30:00', '2026-09-21 09:00:00', '2026-09-25 18:00:00', 1),
	('2026-09-22 14:00:00', '2026-09-23 10:00:00', NULL, 1),
	('2026-09-22 15:30:00', NULL, NULL, 2),
	('2026-09-24 11:00:00', '2026-09-25 08:30:00', '2026-09-28 17:00:00', 3),
	('2026-09-22 16:00:00', '2026-09-23 11:00:00', NULL, 4),
	('2026-09-26 09:00:00', NULL, NULL, 5);

-- CONSULTAS --

-- 1)
SELECT
	*
FROM pessoa INNER JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa;

-- 2)
SELECT
	*
FROM pessoa LEFT JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa WHERE pessoa.idPessoa = 1;

-- 3)
SELECT
	pessoa.nome 'Nome', 
    reserva.dtReserva 'Data de reserva'
FROM pessoa INNER JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa;

-- 4)
SELECT
	*
FROM pessoa INNER JOIN reserva ON pessoa.idPEssoa = reserva.fkPessoa WHERE DATE(reserva.dtReserva) = '2026-09-22';

-- 5)
SELECT
	CONCAT('[', pessoa.nome,'] retirou na data [', DATE(reserva.dtRetirada), ']') AS 'Pessoas e suas reservas'
FROM pessoa INNER JOIN reserva ON pessoa.idPEssoa = reserva.fkPessoa;

-- 6)
SELECT
	pessoa.idPessoa,
    pessoa.nome,
    pessoa.cpf,
    reserva.dtReserva,
    IFNULL(reserva.dtRetirada, 'Não foi retirado') AS dtRetirada,
    IFNULL(reserva.dtDevolucao, 'Não foi devolvido') AS dtDevolucao
FROM pessoa	INNER JOIN reserva ON pessoa.idPessoa = reserva.fkPessoa;
    
