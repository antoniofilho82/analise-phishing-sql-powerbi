USE phishing_db;

-- =====================================================
-- 01. EXPLORAÇÃO INICIAL DOS DADOS
-- =====================================================

-- Primeiro, verificamos quantos registros existem na tabela.
-- Essa consulta ajuda a entender o tamanho do conjunto de dados
-- antes de iniciar as demais análises.
SELECT COUNT(*) AS total_registros
FROM web_page_phishing;


-- Aqui visualizamos alguns registros da tabela para conhecer
-- o formato dos dados e os campos disponíveis.
SELECT *
FROM web_page_phishing
LIMIT 10;


-- Por fim, contamos quantas URLs pertencem a cada classificação.
-- Essa comparação mostra como os registros estão distribuídos
-- entre URLs phishing e não phishing.
SELECT
    phishing,
    COUNT(*) AS quantidade
FROM web_page_phishing
GROUP BY phishing;


-- =====================================================
-- 04. Consulta completa do conjunto de dados
-- =====================================================

-- Esta consulta reúne os dados das duas tabelas pelo campo unique_id,
-- permitindo visualizar o conjunto de dados completo em uma única consulta.
SELECT
    w.unique_id,
    w.url_length,
    w.n_redirection,
    w.phishing,
    p.n_dots,
    p.n_hyphens,
    p.n_underline,
    p.n_slash,
    p.n_questionmark,
    p.n_equal,
    p.n_at,
    p.n_and,
    p.n_exclamation,
    p.n_space,
    p.n_tilde,
    p.n_comma,
    p.n_plus,
    p.n_asterisk,
    p.n_hashtag,
    p.n_dollar,
    p.n_percent
FROM web_page_phishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id;