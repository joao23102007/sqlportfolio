CREATE DATABASE IF NOT EXISTS mysqlportfolio;
USE mysqlportfolio;

-- Tabela Aluno
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    data_nascimento DATE,
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(200)
);

-- Tabela Materia
CREATE TABLE Materia (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    carga_horaria INT NOT NULL
);

-- Tabela Professor
CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

-- Tabela Turma
CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT NOT NULL,
    id_professor INT NOT NULL,
    semestre VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_materia) REFERENCES Materia(id_materia),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- Tabela Nota
CREATE TABLE Nota (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    data_lancamento DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);
