-- Table: Employees
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | manager_id  | int      |
-- | salary      | int      |
-- +-------------+----------+

-- employee_id é a chave primária da tabela.
-- A tabela contém informações dos funcionários,
-- seus salários e o ID de seus respectivos gestores.

-- Alguns funcionários não possuem gestor
-- (manager_id é NULL).

-- Quando um gestor sai da empresa, seu registro
-- é removido da tabela Employees, porém os
-- funcionários subordinados continuam com o
-- manager_id apontando para esse gestor.

-- Escreva uma consulta para encontrar os IDs
-- dos funcionários que:
-- 1) Possuem salário estritamente menor que 30000
-- 2) Possuem um gestor que já saiu da empresa

-- Retorne o resultado ordenado por employee_id.

SELECT
    e.employee_id
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.employee_id
WHERE e.salary < 30000
  AND e.manager_id IS NOT NULL
  AND m.employee_id IS NULL
ORDER BY e.employee_id;
