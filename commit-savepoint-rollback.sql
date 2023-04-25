create database Atendimento_Hospital;
use Atendimento_Hospital;

CREATE TABLE Enfermeiro(
	Coren INT PRIMARY KEY,
    Nome VARCHAR (50) not null
);

CREATE TABLE Paciente(
	Num INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Remedio (
	Cod INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Medicacao(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    Hora TIME NOT NULL,
    PacienteNum INT NOT NULL,
    RemedioCod INT NOT NULL,
    EnfermeiroCoren INT NOT NULL,
    FOREIGN KEY (PacienteNum) REFERENCES Paciente(Num),
    FOREIGN KEY (RemedioCod) REFERENCES Remedio(Cod),
    FOREIGN KEY (EnfermeiroCoren) REFERENCES Enfermeiro(Coren)
);

INSERT Enfermeiro VALUES (11111, "Enfermeiro 1"),
	(22222, "Enfermeiro 2"),
    (33333, "Enfermeiro 3");
    
INSERT Paciente VALUES (1000, "Paciente A"),
	(1001, "Paciente B"),
    (1002, "Paciente C"),
    (1003, "Paciente D"),
    (1004, "Paciente E"),
    (1005, "Paciente F"),
    (1006, "Paciente G"),
    (1007, "Paciente H"),
    (1008, "Paciente I");
    
INSERT Remedio VALUES (100, "Controle de pressao"),
	(101, "Problemas no estomago"),
    (102, "Soro"),
    (103, "Calmante"),
    (104, "Analgesico"),
    (105, "Rins");
    
INSERT Medicacao VALUES 
	(0, current_date, "05:00:00", 1003, 104, 1111),
    (0, current_date, "08:00:00", 1001, 100, 1111),
    (0, current_date, "08:20:00", 1007, 102, 1111),
    (0, current_date, "08:30:00", 1007, 105, 1111),
    (0, current_date, "09:00:00", 1004, 104, 2222),
    (0, current_date, "09:30:00", 1005, 105, 3333),
    (0, current_date, "10:20:00", 1001, 103, 1111),
    (0, current_date, "12:00:00", 1008, 102, 2222),
    (0, current_date, "12:20:00", 1002, 105, 2222),
    (0, current_date, "13:30:00", 1001, 100, 1111),
    (0, current_date, "15:00:00", 1003, 104, 2222),
    (0, current_date, "16:00:00", 1001, 103, 1111),
    (0, current_date, "20:30:00", 1008, 100, 2222),
    (0, current_date, "21:00:00", 1002, 105, 1111),
    (0, current_date, "21:10:00", 1006, 102, 1111),
    (0, current_date, "23:00:00", 1003, 104, 3333);

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
SELECT * FROM medicacao WHERE Id = 1;

UPDATE Medicacao SET EnfermeiroCoren = 2222 WHERE Id = 1;
COMMIT;

RENAME TABLE Medicacao TO AdmMedicacao;
COMMIT;

SHOW TABLES;

SAVEPOINT status1;
COMMIT;
UPDATE enfermeiro SET Nome = "Enfermeiro 10" WHERE Coren = 11111;
select * from enfermeiro;

ROLLBACK to savepoint status1;