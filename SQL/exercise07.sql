-- Tabela: Employee

--|Nome da Coluna   | Tipo     |
--|-----------------|----------|
--| employee_id     | int      |
--| department_id   | int      |
--| primary_flag    | varchar  |

-- A chave primária da tabela é composta por (`employee_id`, `department_id`).
-- `employee_id` representa o identificador do funcionário.
-- `department_id` representa o identificador do departamento ao qual o funcionário pertence.
-- `primary_flag` é um ENUM com os valores:
--  `'Y'`: este é o **departamento principal** do funcionário.
--  `'N'`: este **não** é o departamento principal.

-- Regras importantes
-- Um funcionário pode pertencer a **mais de um departamento**.
-- Quando o funcionário pertence a **apenas um departamento**, o valor de `primary_flag` será `'N'`.
-- Mesmo assim, esse único departamento deve ser considerado o **departamento principal**.

-- Objetivo
--Escreva uma consulta SQL que retorne **todos os funcionários com seu departamento principal**.

-- Para funcionários com mais de um departamento, retorne aquele com `primary_flag = 'Y'`.
-- Para funcionários com apenas um departamento, retorne esse único departamento.

-- Observações
-- A ordem do resultado não importa.

-- Exemplo

--Entrada

--|employee_id | department_id | primary_flag |
--|------------|---------------|--------------|
--| 1          | 1             | N            |
--| 2          | 1             | Y            |
--| 2          | 2             | N            |
--| 3          | 3             | N            |
--| 4          | 2             | N            |
--| 4          | 3             | Y            |
--| 4          | 4             | N            |

--Saída

--|employee_id | department_id |
--|------------|---------------|
--| 1          | 1             |
--| 2          | 1             |
--| 3          | 3             |
--| 4          | 3             |

-- Explicação
-- Funcionário 1 pertence a apenas um departamento → retorna o 1.
-- Funcionário 2 possui dois departamentos → retorna o que está marcado como `'Y'`.
-- Funcionário 3 pertence a apenas um departamento → retorna o 3.
-- Funcionário 4 possui três departamentos → retorna o que está marcado como `'Y'`.

WITH ranked_departments AS (
    SELECT
        employee_id,
        department_id,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY 
                CASE WHEN primary_flag = 'Y' THEN 1 ELSE 2 END
        ) AS rn
    FROM Employee
)
SELECT
    employee_id,
    department_id
FROM ranked_departments
WHERE rn = 1;
