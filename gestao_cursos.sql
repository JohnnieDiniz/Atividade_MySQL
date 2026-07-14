CREATE DATABASE db_gestao_cursos;

USE db_gestao_cursos;

CREATE TABLE tb_curso(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL, 
    carga_horaria INT NOT NULL
);

INSERT INTO tb_curso (nome, carga_horaria) VALUES
('Java Full Stack', 400),
('Python para Dados', 300),
('Front-End com React', 250),
('Banco de Dados Avançado', 150),
('Segurança da Informação', 200),
('Engenharia de Software', 500),
('Marketing Digital', 100),
('Design de Interfaces (UI/UX)', 120),
('DevOps e Nuvem', 350),
('Inteligência Artificial', 450);

SELECT * FROM tb_curso;

CREATE TABLE tb_aluno(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL, 
    idade INT NOT NULL,
	id_curso BIGINT,
    FOREIGN KEY (id_curso) REFERENCES tb_curso (id)
);

INSERT INTO tb_aluno (nome, idade, id_curso) VALUES
('Ana Silva', 20, 1),
('Carlos Oliveira', 17, 3),
('Beatriz Costa', 25, 2),
('Daniel Souza', 16, 7),
('Fernanda Lima', 22, 1),
('Gabriel Martins', 30, 9),
('Helena Pereira', 18, 4),
('Igor Santos', 15, 8),
('Juliana Alves', 28, 5),
('Lucas Rodrigues', 21, 10);

SELECT * FROM tb_aluno;

SELECT * FROM tb_aluno WHERE idade >= 18; 

UPDATE tb_curso SET nome = "Desenvolvedor Java Back end" WHERE id = 2;

SELECT * FROM tb_curso;

DELETE FROM tb_curso WHERE id = 6;

-- Criando uma Tabela Virtual (VIEW) para o relatório de alunos e cursos
CREATE VIEW vw_relatorio_alunos AS
SELECT CONCAT(
    'Aluno: ', tb_aluno.nome, 
    ' | Idade: ', tb_aluno.idade, 
    ' | Curso: ', tb_curso.nome, 
    ' | Carga Horária: ', tb_curso.carga_horaria
) AS Relatorio
FROM tb_aluno 
INNER JOIN tb_curso ON tb_aluno.id_curso = tb_curso.id;

SELECT * FROM vw_relatorio_alunos;