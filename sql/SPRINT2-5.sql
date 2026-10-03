-- ============================================================
-- LABORATÓRIO DE BANCO DE DADOS
-- SPRINT 2/5 — DDL
-- ATIVIDADE INDIVIDUAL
-- ============================================================
--
-- ALUNO:
-- TEMA DO BANCO:
-- NOME DO BANCO:
--
-- INSTRUÇÕES:
-- 1. Este arquivo é um MODELO GENÉRICO.
-- 2. Substitua os nomes de banco, tabelas e campos.
-- 3. Adapte os tipos de dados ao seu projeto.
-- 4. Adicione/remova campos conforme a SPRINT1-5.md.
-- 5. Não entregue este arquivo sem adaptar.
-- 6. Teste todo o script no MySQL Workbench.
--
-- ============================================================


-- ============================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS
-- ============================================================

CREATE DATABASE IF NOT EXISTS nome_do_banco;

USE nome_do_banco;


-- ============================================================
-- 2. TABELA 1 — ENTIDADE INDEPENDENTE
-- ============================================================
--
-- Substitua "tabela_a" pelo nome real da primeira entidade.
--

CREATE TABLE tabela_a (
    id_a INT PRIMARY KEY AUTO_INCREMENT,

    campo_a1 VARCHAR(100) NOT NULL,
    campo_a2 VARCHAR(150) UNIQUE,
    campo_a3 DATE,

    ativo BOOLEAN NOT NULL DEFAULT TRUE
);


-- ============================================================
-- 3. TABELA 2 — OUTRA ENTIDADE INDEPENDENTE
-- ============================================================

CREATE TABLE tabela_b (
    id_b INT PRIMARY KEY AUTO_INCREMENT,

    campo_b1 VARCHAR(100) NOT NULL,
    campo_b2 DECIMAL(10,2) NOT NULL,
    campo_b3 TEXT
);


-- ============================================================
-- 4. TABELA 3 — EXEMPLO COM FOREIGN KEY
-- ============================================================
--
-- Esta tabela depende da tabela_a.
-- Portanto, tabela_a precisa existir antes.
--

CREATE TABLE tabela_c (
    id_c INT PRIMARY KEY AUTO_INCREMENT,

    id_a INT NOT NULL,
    campo_c1 DATE NOT NULL,
    campo_c2 VARCHAR(100),

    CONSTRAINT fk_tabela_c_tabela_a
        FOREIGN KEY (id_a)
        REFERENCES tabela_a(id_a)
);


-- ============================================================
-- 5. TABELA 4 — EXEMPLO DE TABELA ASSOCIATIVA
-- ============================================================
--
-- Exemplo para relacionamento N:N.
-- Adapte ou substitua caso seu projeto não possua esse tipo
-- de relacionamento.
--

CREATE TABLE tabela_d (
    id_c INT NOT NULL,
    id_b INT NOT NULL,

    quantidade INT NOT NULL DEFAULT 1,

    PRIMARY KEY (id_c, id_b),

    CONSTRAINT fk_tabela_d_tabela_c
        FOREIGN KEY (id_c)
        REFERENCES tabela_c(id_c),

    CONSTRAINT fk_tabela_d_tabela_b
        FOREIGN KEY (id_b)
        REFERENCES tabela_b(id_b)
);


-- ============================================================
-- 6. OUTRAS TABELAS DO PROJETO
-- ============================================================
--
-- Caso seu banco possua mais tabelas, continue seguindo
-- a mesma lógica.
--
-- Exemplo:
--
-- CREATE TABLE tabela_e (
--     id_e INT PRIMARY KEY AUTO_INCREMENT,
--     campo_e1 VARCHAR(100) NOT NULL
-- );
--


-- ============================================================
-- 7. ALTER TABLE
-- ============================================================
--
-- Faça pelo menos uma alteração estrutural controlada.
-- Substitua pelo comando adequado ao seu banco.
--

ALTER TABLE tabela_a
ADD COLUMN campo_novo VARCHAR(100);


-- ============================================================
-- 8. TESTE CONTROLADO DE DROP TABLE
-- ============================================================
--
-- Crie uma tabela apenas para testar DROP TABLE.
--

CREATE TABLE tabela_teste (
    id_teste INT PRIMARY KEY
);

DROP TABLE tabela_teste;


-- ============================================================
-- 9. VALIDAÇÃO DAS TABELAS
-- ============================================================
--
-- Execute DESCRIBE para cada tabela real do seu projeto.
--

DESCRIBE tabela_a;
DESCRIBE tabela_b;
DESCRIBE tabela_c;
DESCRIBE tabela_d;


-- ============================================================
-- 10. VERIFICAR O CREATE TABLE GERADO PELO MYSQL
-- ============================================================
--
-- Estes comandos ajudam a verificar PK, FK, UNIQUE e outras
-- restrições.
--

SHOW CREATE TABLE tabela_a;
SHOW CREATE TABLE tabela_b;
SHOW CREATE TABLE tabela_c;
SHOW CREATE TABLE tabela_d;


-- ============================================================
-- 11. ESPAÇO PARA O SCRIPT FINAL DO ALUNO
-- ============================================================
--
-- Depois de adaptar e testar as seções acima:
--
-- 1. remova exemplos que não façam parte do seu projeto;
-- 2. mantenha somente as tabelas reais do seu banco;
-- 3. organize as tabelas na ordem correta;
-- 4. confira todas as PRIMARY KEY;
-- 5. confira todas as FOREIGN KEY;
-- 6. confira tipos e restrições;
-- 7. execute novamente o arquivo inteiro no Workbench;
-- 8. salve com o nome SPRINT2-5.sql.
--
-- FIM DA SPRINT 2/5
-- ============================================================
