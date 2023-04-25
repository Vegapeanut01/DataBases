CREATE DATABASE Car;
use car;

create table Fabricante (
	Codigo int(3) primary key auto_increment,
    Marca char (20) not null
);

create table Veiculo (
	RENAVAM int(8) primary key,
    Nome varchar (30) not null,
    Cor varchar (20) not null,
    Preco decimal (10, 2) not null,
    fabricante_Codigo int (3) not null,
    foreign key (fabricante_Codigo) references Fabricante (Codigo)
);

INSERT Fabricante VALUES (0, "Volk"),
	(0, "Fait"),
    (0, "Chervoles"),
    (0, "Fordys"),
    (0, "Maudi"),
    (0, "Junday");
    
INSERT Veiculo VALUES (1234567, "Cersas", "azul", 15000.00, 3),
	(144558, "Já", "verde", 49000.00, 4),
	(2582582, "Montanha", "lilas", 62000.00, 3),
	(2589967, "Hideas", "prata", 44000.00, 2),
    (4445566, "AAR5", "azul", 80000.00, 5),
    (10102020, "Cheveiro", "preto", 22000.00, 1),
    (11111111, "EspacialFex", "amarelo", 39000.00, 1),
    (11122255, "10S", "preto", 33000.00, 3),
    (12312312, "Cersas", "rosa", 18000.00, 3),
    (12345678, "AAR3", "prata", 44000.00, 5),
    (14714714, "Jatus", "prata", 45000.00, 1),
    (22222222, "Seniel", "preto", 18000.00, 2),
    (30303030, "Estradus", "preto", 27000.00, 2),
    (33333333, "Pins", "preto", 40000.00, 3),
    (36544477, "Linearrr", "prata", 35000.00, 2),
    (44444444, "Pins", "prata", 38000.00, 3),
    (45645645, "Hideas", "branco", 42000.00, 2),
    (55220044, "Festinnn", "branco", 25000.00, 4),
    (65465465, "AAR3", "verde", 54000.00, 5),
    (66666666, "Já", "preto", 19000.00, 4),
    (74174174, "10S", "azul", 23000.00, 3),
    (77889966, "Montanha", "preto", 32000.00, 3),
    (78889994, "Jatus", "prata", 55000.00, 1),
    (78978998, "Golos", "dourado", 82000.00, 1),
    (85285285, "Linearrr", "amarelo", 55000.00, 2),
    (87654321, "Golos", "azul", 32000.00, 1),
    (95195195, "Golos", "preto", 18000.00, 1),
    (96396396, "Festinnn", "marrom", 25000.00, 4),
    (98798798, "AAR5", "blindado", 40000.00, 5);
    
CREATE VIEW v_select1 AS SELECT veiculo.nome as "Veiculo", fabricante.marca as "Marca", veiculo.cor as "Cor", veiculo.preco as "Valor" FROM veiculo INNER JOIN fabricante 
	WHERE veiculo.fabricante_Codigo = fabricante.Codigo AND veiculo.preco <= 50000;
    
    
show tables;
select * from v_select1;

CREATE INDEX idx_Renavam ON veiculo(RENAVAM);

show index from veiculo;

SELECT nome AS "Veiculo", cor AS "Cor", preco AS "Valor" FROM veiculo USE INDEX(idx_Renavam) WHERE preco <= 50000;