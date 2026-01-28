-- Table: Customer
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- | visited_on    | date    |
-- | amount        | int     |
-- +---------------+---------+

-- (customer_id, visited_on) é a chave primária da tabela.
-- Esta tabela contém informações sobre transações
-- realizadas por clientes em um restaurante.

-- visited_on representa a data em que o cliente visitou o restaurante.
-- amount representa o valor total pago pelo cliente naquele dia.

-- Sempre existe pelo menos um cliente por dia.

-- Escreva uma consulta para calcular a média móvel
-- de 7 dias (dia atual + 6 dias anteriores) do valor pago.

-- O valor da média deve ser arredondado para 2 casas decimais.

-- Retorne o resultado ordenado por visited_on em ordem crescente.

WITH daily_amount AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
moving_avg AS (
    SELECT
        visited_on,
        amount,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_amount,
        COUNT(*) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS cnt
    FROM daily_amount
)
SELECT
    visited_on,
    total_amount AS amount,
    ROUND(CAST(total_amount AS FLOAT) / cnt, 2) AS average_amount
FROM moving_avg
WHERE cnt = 7
ORDER BY visited_on;
