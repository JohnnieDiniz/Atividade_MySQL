CREATE DATABASE db_empresa;

USE db_empresa; 

CREATE TABLE tb_departamento(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL);

INSERT INTO tb_departamento (nome) VALUES
	('Tecnologia'),
	('Recursos Humanos'),
	('Financeiro'),
	('Marketing'),
	('Vendas'),
	('Suporte ao Cliente'),
	('Jurídico'),
	('Logística'),
	('Operações'),
	('Diretoria Executiva');
    
    SELECT * FROM tb_departamento;
    
    CREATE TABLE tb_funcionario(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL,
    salario decimal(6,2) NOT NULL,
    id_departamento BIGINT,
    FOREIGN KEY(id_departamento) REFERENCES tb_departamento (id)
    );
    
INSERT INTO tb_funcionario (nome, salario, id_departamento) VALUES
	('Carlos Souza', 3500.00, 1),
	('Mariana Lima', 4200.50, 2),
	('João Pedro', 5100.00, 3),
	('Ana Beatriz', 3800.00, 4),
	('Paulo Gomes', 3200.75, 5),
	('Fernanda Silva', 2800.00, 6),
	('Lucas Alves', 6500.00, 7),
	('Juliana Costa', 3100.00, 8),
	('Rafael Mendes', 4800.00, 9),
	('Camila Rocha', 9500.00, 10);
    
SELECT * FROM tb_funcionario;

SELECT * FROM tb_funcionario WHERE salario > 4600.00;

UPDATE tb_funcionario SET salario = 4250.00 WHERE id = 8;

-- Imaginei uma situação onde um funcionário é desligado mas seus dados permancem no database, fazendo um soft delete
ALTER TABLE tb_funcionario ADD statusfuncionario TINYINT DEFAULT 1;

-- Atualização do database (simulando o desligamento)
UPDATE tb_funcionario SET statusfuncionario = 0 WHERE id = 5;

SELECT statusfuncionario FROM tb_funcionario;

-- Usando um hard delete para simular um desligamento sem registro posterior
DELETE FROM tb_funcionario WHERE id = 7;

CREATE VIEW vw_relatorio_funcionario AS
SELECT CONCAT(
    'Funcionário: ', tb_funcionario.nome, 
    ' | Salário: ', tb_funcionario.salario, 
    ' | Departamento: ', tb_departamento.nome,
    ' | Status: ', tb_funcionario.statusfuncionario
) AS Relatorio
FROM tb_funcionario
INNER JOIN tb_departamento ON tb_funcionario.id_departamento = tb_departamento.id;

SELECT * FROM vw_relatorio_funcionario;

SELECT * FROM tb_funcionario;
