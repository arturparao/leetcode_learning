-- ## Tabela: Followers
 
-- | Nome da Coluna| Tipo |
-- |---------------|------|
-- | user_id       | int  |
-- | follower_id   | int  |
 
-- A combinação (`user_id`, `follower_id`) é a **chave primária** desta tabela.
-- Esta tabela contém os IDs de um usuário e de seus seguidores em um aplicativo de rede social, onde `follower_id` segue `user_id`.

-- Enunciado

-- Escreva uma solução que retorne, **para cada usuário**, a **quantidade de seguidores** que ele possui.

-- A tabela de resultado deve ser ordenada por `user_id` em **ordem crescente**.
-- O formato do resultado deve seguir o exemplo abaixo.

-- Exemplo 1

-- Entrada

-- Tabela `Followers`:

-- | user_id| follower_id |
-- |--------|-------------|
-- | 0      | 1           |
-- | 1      | 0           |
-- | 2      | 0           |
-- | 2      | 1           |

-- Saída

-- | user_id| followers_count |
-- |--------|-----------------|
-- | 0      | 1               |
-- | 1      | 1               |
-- | 2      | 2               |

-- Explicação

-- Os seguidores do usuário **0** são `{1}`.
-- Os seguidores do usuário **1** são `{0}`.
-- Os seguidores do usuário **2** são `{0, 1}`.

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
