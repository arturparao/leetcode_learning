--Dada a tabela `Logs`, encontre **todos os números que aparecem pelo menos três vezes consecutivas**, considerando a ordem do `id`.

-- Estrutura da tabela

--Logs
--+-------------+---------+
--| Column Name | Type |
--+-------------+---------+
--| id | int |
--| num | varchar |
--+-------------+---------+

--yaml

--- `id` é a **chave primária**
--- `id` é **autoincremental**, iniciando em 1
--- Cada linha representa um registro em ordem crescente de `id`

-- Objetivo

--Retornar todos os valores de `num` que aparecem **três ou mais vezes seguidas**.

--- O resultado pode ser retornado **em qualquer ordem**
--- O nome da coluna de saída deve ser **`ConsecutiveNums`**

-- Exemplo de entrada

--Logs table:
--+----+-----+
--| id | num |
--+----+-----+
--| 1 | 1 |
--| 2 | 1 |
--| 3 | 1 |
--| 4 | 2 |
--| 5 | 1 |
--| 6 | 2 |
--| 7 | 2 |
--+----+-----+

--yaml
--Copiar código

-- Saída esperada

--+-----------------+
--| ConsecutiveNums |
--+-----------------+
--| 1 |
--+-----------------+

SELECT DISTINCT
    num AS ConsecutiveNums
FROM (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev1,
        LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1
  AND num = prev2;