-- Table: Employee
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+

-- id é a chave primária da tabela.
-- departmentId é uma chave estrangeira que referencia a tabela Department.

-- Cada registro representa um funcionário, seu salário
-- e o departamento ao qual pertence.

-- Table: Department
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+

-- id é a chave primária da tabela.
-- Cada registro representa um departamento da empresa.

-- Um "high earner" é um funcionário que possui um salário
-- entre os três MAIORES SALÁRIOS ÚNICOS do seu departamento.

-- Escreva uma consulta para retornar todos os funcionários
-- que são high earners em seus respectivos departamentos.

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
) e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary_rank <= 3;
