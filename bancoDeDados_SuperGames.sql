create database SuperGames;
use SuperGames;

CREATE TABLE localizacao (
	Id INT(3) PRIMARY KEY AUTO_INCREMENT,
    Secao VARCHAR(50) NOT NULL,
    Prateleira INT(3) ZEROFILL NOT NULL 
);


CREATE TABLE jogo(
	Cod INT(3) PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(6, 2) NOT NULL,
    Localizacao_Id INT(3) NOT NULL,
    FOREIGN KEY (Localizacao_Id)
		REFERENCES Localizacao(Id)
);

INSERT localizacao VAlUES (0, "Guerra", "001"),
(0, "Guerra", "002"),
(0, "Aventura", "100"),
(0, "Aventura", "101"),
(0, "RPG", "150"),
(0, "RPG", "151");

INSERT jogo VALUES (0, "COD 3", 125.00, 1),
(0, "BF 1", 150.00, 2),
(0, "GOW 4", 200.00, 3),
(0, "SLY", 99.00, 4),
(0, "FF XV", 205.00, 5);

-- Identificando o nome do jogo e a prateleira com o nome de uma seção 
SELECT jogo.nome, localizacao.prateleira FROM jogo INNER JOIN localizacao ON localizacao.Id = jogo.localizacao_Id; 

-- Identificando o nome dos jogos da seção de jogos de guerra
SELECT jogo.nome FROM jogo INNER JOIN localizacao ON localizacao.Id = jogo.localizacao_Id where secao = "Guerra";

-- Identificando todas as seções e os respectivos nomes dos jogos, em ordem crescente pelo seu nome
SELECT localizacao.secao, jogo.nome FROM localizacao LEFT JOIN jogo ON localizacao.Id = jogo.localizacao_Id order by jogo.nome asc;

-- Quantidade de registros  na tabela jogo
SELECT count(*) FROM jogo;

-- Valor de maior preço (valor) MAX 
SELECT MAX(valor) AS "Maior Valor" FROM Jogo;

-- Valor de menor preço (valor) MIN 
SELECT MIN(valor) AS "Menor valor" FROM jogo;

-- Valor médio dos jogos de Guerra AVG
SELECT AVG(valor) AS "Media Guerra" FROM Jogo INNER JOIN localizacao ON localizacao.Id = jogo.localizacao_Id WHERE secao = "Guerra";

-- Valor total em estoque na loja SUM 
SELECT sum(valor) AS "Total Geral" FROM jogo;

-- Inserindo novos títulos
INSERT jogo VALUES (0, "Super Driver", 205.00, 2),
	(0, "Neo", 100.00, 2),
    (0, "Max Joe", 120.00, 3),
    (0, "N. New", 199.00, 4);
    
-- Mudando o valor dos jogos em promoção
UPDATE jogo SET valor = valor * 0.5 where nome = "BF 1";
UPDATE jogo SET valor = valor * 0.5 where nome  = "COD 3"; 

-- Tabela com os jogos em promoção 
 CREATE TABLE promocao (
	Promo int(3) PRIMARY KEY AUTO_INCREMENT,
    Cod_Jogo int(3) not null,
    foreign key (Cod_Jogo) references Jogo(Cod)
 );
 
 -- Inserindo jogos na promoção
 INSERT promocao VALUES (0, 1), (0, 2);
 
 -- Jogo, valor e seção dos títulos em promoção 
	SELECT jogo.nome AS "Título", jogo.valor AS "Preço", localizacao.secao AS "Seção" FROM jogo INNER JOIN localizacao ON localizacao.Id = jogo.localizacao_Id 
		WHERE jogo.COD IN (SELECT Cod_Jogo FROM promocao);
 
 -- Jogos que não estão em promoção 
 SELECT jogo.nome AS "Título", jogo.valor AS "Preço" FROM jogo WHERE jogo.COD NOT IN (SELECT Cod_Jogo FROM promocao);