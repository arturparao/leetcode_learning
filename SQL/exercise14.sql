-- Table: Seat
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+

-- id é a chave primária da tabela.
-- Cada linha contém o nome do aluno e o número
-- do assento correspondente.

-- A sequência de IDs:
-- - Sempre começa em 1
-- - É contínua (1, 2, 3, ...)

-- Escreva uma consulta para trocar o assento
-- de cada dois alunos consecutivos.

-- Se a quantidade de alunos for ímpar,
-- o último aluno não deve ter o assento alterado.

-- Retorne o resultado ordenado pelo id
-- em ordem crescente.

SELECT
    CASE
        WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;
