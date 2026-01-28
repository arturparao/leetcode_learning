-- Table: Movies
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+

-- movie_id é a chave primária da tabela.
-- title é o nome do filme e é único.

-- Table: Users
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+

-- user_id é a chave primária da tabela.
-- name possui valores únicos.

-- Table: MovieRating
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+

-- (movie_id, user_id) é a chave primária da tabela.
-- Esta tabela contém as avaliações dos filmes feitas pelos usuários.
-- created_at representa a data da avaliação.

-- Escreva uma consulta para:
-- 1) Encontrar o nome do usuário que avaliou a maior quantidade de filmes.
--    Em caso de empate, retornar o nome lexicograficamente menor.

-- 2) Encontrar o nome do filme com a maior média de avaliação em fevereiro de 2020.
--    Em caso de empate, retornar o nome lexicograficamente menor.

-- O resultado deve conter apenas uma coluna chamada "results",
-- conforme o formato do exemplo.

-- Usuário que avaliou o maior número de filmes
SELECT TOP 1
    u.name AS results
FROM Users u
JOIN MovieRating mr
    ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY COUNT(*) DESC, u.name ASC

UNION ALL

-- Filme com a maior média de avaliação em fevereiro de 2020
SELECT TOP 1
    m.title AS results
FROM Movies m
JOIN MovieRating mr
    ON m.movie_id = mr.movie_id
WHERE mr.created_at >= '2020-02-01'
  AND mr.created_at <= '2020-02-29'
GROUP BY m.title
ORDER BY AVG(mr.rating) DESC, m.title ASC;
