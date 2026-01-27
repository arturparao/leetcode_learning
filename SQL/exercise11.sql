-- Table: Accounts
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+

-- account_id é a chave primária da tabela.
-- Cada linha contém a informação da renda mensal
-- de uma conta bancária.

-- Escreva uma consulta para calcular a quantidade
-- de contas bancárias por categoria salarial.

-- Categorias:
-- "Low Salary"     → salários menores que 20000
-- "Average Salary" → salários entre 20000 e 50000 (inclusive)
-- "High Salary"    → salários maiores que 50000

-- O resultado deve conter obrigatoriamente as três categorias.
-- Caso não exista nenhuma conta em uma categoria, retornar 0.

-- O resultado pode ser retornado em qualquer ordem.

SELECT
    c.category,
    ISNULL(a.accounts_count, 0) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) c
LEFT JOIN (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END
) a
    ON c.category = a.category;
