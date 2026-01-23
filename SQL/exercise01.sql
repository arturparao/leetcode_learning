-- Problema: First Year Sales
-- Tabela: `Sales`
-- | Coluna     | Tipo |
-- |------------|------|
-- | sale_id    | int  |
-- | product_id | int  |
-- | year       | int  |
-- | quantity   | int  |
-- | price      | int  |

-- `(sale_id, year)` é a **chave primária** da tabela (combinação de colunas com valores únicos).
-- Cada linha registra uma **venda de um produto em um determinado ano**.
-- Um produto pode ter **múltiplas vendas no mesmo ano**.
-- O campo `price` representa o **preço unitário** do produto.
 
-- Encontrar **todas as vendas que ocorreram no primeiro ano em que cada produto foi vendido**.

-- Para cada `product_id`:

-- 1. Identifique o **primeiro ano** (`first_year`) em que o produto aparece na tabela `Sales`.
-- 2. Retorne **todas as vendas desse produto nesse primeiro ano**.

-- Resultado esperado

-- A consulta deve retornar uma tabela com as seguintes colunas:
-- `product_id`
-- `first_year`
-- `quantity`
-- `price`
-- A ordem das linhas no resultado **não importa**.

-- ### Entrada — Tabela `Sales`
-- | sale_id | product_id | year | quantity | price |
-- |--------|------------|------|----------|-------|
-- | 1      | 100        | 2008 | 10       | 5000  |
-- | 2      | 100        | 2009 | 12       | 5000  |
-- | 7      | 200        | 2011 | 15       | 9000  |

-- ### Saída esperada
-- | product_id | first_year | quantity | price |
-- |------------|------------|----------|-------|
-- | 100        | 2008       | 10       | 5000  |
-- | 200        | 2011       | 15       | 9000  |

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
INNER JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) fy
    ON s.product_id = fy.product_id
   AND s.year = fy.first_year;
