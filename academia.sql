 PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS AGENDAMENTOS;
DROP TABLE IF EXISTS AULAS;
DROP TABLE IF EXISTS ALUNOS;
DROP TABLE IF EXISTS PROFESSORES;
DROP TABLE IF EXISTS PLANOS;
PRAGMA foreign_keys = ON;
CREATE TABLE PLANOS (
id_planos INT PRIMARY KEY,
nome_plano VARCHAR(25),
valor_mensal DECIMAL(10,2)
);
CREATE TABLE ALUNOS (
id_aluno INT PRIMARY KEY,
nome_aluno VARCHAR(50),
idade INT,
id_planos INT,
FOREIGN KEY (id_planos)
REFERENCES PLANOS(id_planos)
);
CREATE TABLE PROFESSORES (
id_professores INT PRIMARY KEY,
nome_professores VARCHAR(50)
);
CREATE TABLE AULAS (
id_aulas INT PRIMARY KEY,
nome_aula VARCHAR(50),
id_professores INT,
FOREIGN KEY (id_professores)
REFERENCES PROFESSORES(id_professores)
);
CREATE TABLE AGENDAMENTOS (
id_agendamentos INT PRIMARY KEY,
id_aluno INT,
id_aulas INT,
data_hora DATETIME,
FOREIGN KEY (id_aluno)
REFERENCES ALUNOS(id_aluno),
FOREIGN KEY (id_aulas)
REFERENCES AULAS(id_aulas)
);
INSERT INTO PLANOS VALUES
(1, 'plano smart', 90.00),
(2, 'plano black', 140.00);
INSERT INTO ALUNOS VALUES
(1, 'Mariana Costa', 31, 2),
(2, 'Lucas', 20, 1),
(3, 'Pedro', 22, 2),
(4, 'Ana', 23, 2),
(6, 'Carla Souza', 35, 2);
SELECT SUM(valor_mensal) AS faturamento_total
FROM PLANOS;
SELECT AVG(idade) AS media_idade
FROM ALUNOS;
SELECT ALUNOS.nome_aluno, PLANOS.nome_plano
FROM ALUNOS
INNER JOIN PLANOS
ON ALUNOS.id_plan