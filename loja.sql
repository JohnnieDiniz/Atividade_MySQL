CREATE DATABASE db_loja;

USE db_loja; 

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL);
    
INSERT INTO tb_categoria (nome) VALUES
	('Informática'),
	('Smartphones'),
	('Áudio'),
	('Acessórios'),
	('Games');
    
SELECT * FROM tb_categoria;

CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL,
    preco decimal(6,2) NOT NULL CHECK (preco > 0),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id)
    );
    
 INSERT INTO tb_produto (nome, preco, id_categoria) VALUES
	('Teclado', 120.00, 1),
	('Notebook Core i7', 4500.00, 1),
	('Mouse Óptico', 85.50, 1),
	('Smartphone Pro Max', 3500.00, 2),
	('Carregador Ultra Rápido', 90.00, 2),
	('Fone de Ouvido Bluetooth', 250.00, 3),
	('Caixa de Som Portátil', 199.90, 3),
	('Cabo USB-C 2 Metros', 35.00, 4),
	('Suporte Ergonômico para Monitor', 150.00, 4),
	('Controle sem Fio', 300.00, 5);   
    
SELECT * FROM tb_produto; 

SELECT * FROM tb_produto WHERE preco < 100.00;
SELECT * FROM tb_produto WHERE preco > 500.00;

UPDATE tb_produto SET preco = 100.00 WHERE id = 5;

-- Imaginando em um cenario onde o estoque de um produto chega a zero! (soft delete) 

ALTER TABLE tb_produto ADD estoque INT DEFAULT 10;

UPDATE tb_produto SET estoque = 0 WHERE id = 2;

-- Usando o delete 
DELETE FROM tb_produto WHERE id = 10;

CREATE VIEW vw_relatorio_loja AS
SELECT CONCAT(
    'Produto: ', tb_produto.nome, 
    ' | Preço: ', tb_produto.preco, 
    ' | Estoque: ', tb_produto.estoque,
    ' | Categoria: ', tb_categoria.nome
) AS Relatorio
FROM tb_produto
INNER JOIN tb_categoria ON tb_produto.id_categoria = tb_categoria.id;

SELECT * FROM vw_relatorio_loja;

SELECT * FROM tb_produto;



