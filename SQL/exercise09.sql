-- Table: Products
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+

-- (product_id, change_date) é a chave primária desta tabela.
-- Cada linha indica que o preço de um produto foi alterado
-- para um novo valor em uma determinada data.

-- Inicialmente, todos os produtos possuem preço igual a 10.

-- Escreva uma consulta para encontrar o preço de todos os
-- produtos na data '2019-08-16'.

-- O resultado pode ser retornado em qualquer ordem.

SELECT
    p.product_id,
    ISNULL(pr.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) p
LEFT JOIN (
    SELECT
        product_id,
        new_price,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
) pr
    ON p.product_id = pr.product_id
   AND pr.rn = 1;

