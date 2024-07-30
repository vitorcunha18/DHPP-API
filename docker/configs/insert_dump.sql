-- Inicia uma nova transação
BEGIN;

-- Desativa todas as restrições de chave estrangeira
SET CONSTRAINTS ALL DEFERRED;

-- Importa o dump
\i /home/dump_postgres.sql;

-- Confirma a transação para aplicar as alterações permanentemente
COMMIT;

-- Reativa todas as restrições de chave estrangeira
SET CONSTRAINTS ALL IMMEDIATE;