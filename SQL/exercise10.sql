-- Table: Queue
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |
-- | person_name | varchar |
-- | weight      | int     |
-- | turn        | int     |
-- +-------------+---------+

-- A coluna person_id possui valores únicos.
-- A tabela contém informações de todas as pessoas
-- aguardando para embarcar em um ônibus.

-- As colunas person_id e turn contêm valores de 1 até n,
-- onde n é o número de registros da tabela.

-- A coluna turn determina a ordem de embarque:
-- turn = 1 é a primeira pessoa a embarcar
-- turn = n é a última pessoa.

-- O ônibus possui um limite de peso de 1000 kg.
-- Apenas uma pessoa pode embarcar por vez.

-- Escreva uma consulta para encontrar o nome da
-- última pessoa que consegue embarcar sem ultrapassar
-- o limite de peso.

-- Os testes garantem que a primeira pessoa sempre
-- consegue embarcar.

SELECT TOP 1
    person_name
FROM (
    SELECT
        person_name,
        SUM(weight) OVER (
            ORDER BY turn
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS total_weight
    FROM Queue
) q
WHERE total_weight <= 1000
ORDER BY total_weight DESC;

