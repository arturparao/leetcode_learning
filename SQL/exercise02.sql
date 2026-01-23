-- Problema: Classes com Pelo Menos Cinco Alunos

-- Tabela: `Courses`

-- | Coluna  | Tipo    |
-- |--------|---------|
-- | student | varchar |
-- | class   | varchar |

-- `(student, class)` é a **chave primária** da tabela (combinação de colunas com valores únicos).
-- Cada linha indica que um **aluno está matriculado em uma determinada turma**.

-- Objetivo

-- Encontrar **todas as turmas (`class`) que possuem pelo menos cinco alunos matriculados**.

-- Resultado esperado

-- A consulta deve retornar uma tabela contendo apenas:

-- `class`

-- A ordem das linhas no resultado **não importa**.

-- ### Entrada — Tabela `Courses`

-- | student | class    |
-- |--------|----------|
-- | A      | Math     |
-- | B      | English  |
-- | C      | Math     |
-- | D      | Biology  |
-- | E      | Math     |
-- | F      | Computer |
-- | G      | Math     |
-- | H      | Math     |
-- | I      | Math     |
 
-- ### Saída esperada

-- | class |
-- |------|
-- | Math |

SELECT
    class
FROM Courses

GROUP BY class

HAVING COUNT(student) >= 5;
