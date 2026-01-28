-- Table: RequestAccepted
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+

-- (requester_id, accepter_id) é a chave primária da tabela.
-- Esta tabela contém:
-- - O ID do usuário que enviou a solicitação de amizade
-- - O ID do usuário que aceitou a solicitação
-- - A data em que a solicitação foi aceita

-- Cada registro representa uma amizade aceita entre dois usuários.

-- Escreva uma consulta para encontrar:
-- 1) A pessoa que possui o maior número de amigos
-- 2) O número total de amigos dessa pessoa

-- Os testes garantem que apenas uma pessoa possui
-- o maior número de amigos.

-- Retorne o resultado no formato:
-- id | num

SELECT TOP 1
    id,
    COUNT(*) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
) friends
GROUP BY id
ORDER BY COUNT(*) DESC;

