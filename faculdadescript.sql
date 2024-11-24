-- Criar o banco de dados
CREATE DATABASE Faculdadee;

-- Usar o banco de dados criado
USE Faculdadee;
-- Tabela Alunos
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(10) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco TEXT,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Professores
CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(10) UNIQUE NOT NULL,
    area_atuacao VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Cursos
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao INT
);

-- Tabela Materias
CREATE TABLE materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT,
    id_professor INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);

-- Tabela Turmas
CREATE TABLE turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabela Notas
CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_materia INT,
    nota DECIMAL(5, 2),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);
-- Inserindo Alunos
INSERT INTO alunos (nome, matricula, data_nascimento, endereco, telefone, email)
VALUES 
('João Silva', '20230001', '2000-01-15', 'Rua A, 123', '11999999999', 'joao@email.com'),
('Ana Souza', '20230002', '1999-06-20', 'Rua B, 456', '11988888888', 'ana@email.com');

-- Inserindo Professores
INSERT INTO professores (nome, matricula, area_atuacao, telefone, email)
VALUES 
('Maria Oliveira', 'PROF001', 'Matemática', '11977777777', 'maria@faculdade.com'),
('Carlos Pereira', 'PROF002', 'Física', '11966666666', 'carlos@faculdade.com');

-- Inserindo Cursos
INSERT INTO cursos (nome, duracao)
VALUES 
('Engenharia da Computação', 10),
('Administração', 8);

-- Inserindo Materias
INSERT INTO materias (nome, carga_horaria, id_curso, id_professor)
VALUES 
('Cálculo I', 60, 1, 1),
('Física I', 60, 1, 2),
('Administração Geral', 60, 2, 2);

-- Inserindo Turmas
INSERT INTO turmas (nome, id_curso)
VALUES 
('Turma A', 1),
('Turma B', 2);

-- Inserindo Notas
INSERT INTO notas (id_aluno, id_materia, nota)
VALUES 
(1, 1, 8.5),
(1, 2, 7.0),
(2, 3, 9.0);

-- Consultar todos os alunos
SELECT * FROM alunos;

-- Consultar todos os professores
SELECT * FROM professores;

-- Consultar todos os cursos
SELECT * FROM cursos;

-- Consultar todas as matérias
SELECT * FROM materias;

-- Consultar todas as turmas
SELECT * FROM turmas;

-- Consultar todas as notas
SELECT * FROM notas;

-- Consultar Alunos e suas Notas
SELECT a.nome AS Aluno, m.nome AS Materia, n.nota
FROM notas n
JOIN alunos a ON n.id_aluno = a.id_aluno
JOIN materias m ON n.id_materia = m.id_materia;
