-- Table: Insurance
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | pid         | int   |
-- | tiv_2015    | float |
-- | tiv_2016    | float |
-- | lat         | float |
-- | lon         | float |
-- +-------------+-------+

-- pid é a chave primária da tabela.
-- Cada linha representa uma apólice de seguro.

-- tiv_2015 representa o valor total do investimento em 2015.
-- tiv_2016 representa o valor total do investimento em 2016.

-- lat e lon representam a latitude e longitude da cidade
-- do segurado. Esses valores nunca são NULL.

-- Escreva uma consulta para retornar a soma de tiv_2016
-- considerando apenas os segurados que:

-- 1) Possuem o mesmo valor de tiv_2015 que pelo menos
--    outro segurado
-- 2) Não estão localizados na mesma cidade que
--    nenhum outro segurado (lat, lon devem ser únicos)

-- O valor final de tiv_2016 deve ser arredondado
-- para duas casas decimais.

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
