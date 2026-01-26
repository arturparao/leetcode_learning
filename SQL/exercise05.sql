--🧾 Problema: Clientes que Compraram Todos os Produtos

--🗂️ Tabela: `Customer`

--| Coluna      | Tipo |
--|-------------|------|
--| customer_id | int  |
--| product_key | int  |

--- Esta tabela pode conter **linhas duplicadas**.
--- `customer_id` **nunca é NULL**.
--- `product_key` é uma **chave estrangeira** que referencia a tabela `Product`.

-- 🗂️ Tabela: `Product`

--| Coluna       | Tipo |
--|-------------|------|
--| product_key | int  |

--- `product_key` é a **chave primária** da tabela (valores únicos).

-- 🎯 Objetivo

--Escreva uma consulta SQL para **retornar os IDs dos clientes** da tabela `Customer` que **compraram todos os produtos** existentes na tabela `Product`.

-- 📤 Resultado Esperado
--
-- Retornar uma tabela contendo apenas a coluna:
--  - `customer_id`
-- A ordem das linhas no resultado **não importa**.

-- 🧪 Exemplo

-- Entrada — Tabela `Customer`

--| customer_id | product_key |
--|------------|-------------|
--| 1          | 5           |
--| 2          | 6           |
--| 3          | 5           |
--| 3          | 6           |
--| 1          | 6           |

-- Entrada — Tabela `Product`

--| product_key |
--|-------------|
--| 5           |
--| 6           |

-- Saída Esperada

--| customer_id |
--|-------------|
--| 1           |
--| 3           |

-- 📝 Explicação

-- Os produtos disponíveis são **5 e 6**.
-- O cliente **1** comprou os produtos 5 e 6.
-- O cliente **3** também comprou os produtos 5 e 6.
-- O cliente **2** comprou apenas o produto 6.

--Portanto, os clientes que compraram **todos os produtos disponíveis** são os clientes **1 e 3**.

SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*) FROM Product
);
