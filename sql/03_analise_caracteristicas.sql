USE phishing_db;

-- =====================================================
-- 03. ANÁLISE DAS CARACTERÍSTICAS DAS URLs
-- =====================================================


-- Esta consulta calcula a média de cada característica
-- separando as URLs por classificação.
-- A comparação ajuda a identificar quais elementos aparecem
-- com maior frequência em cada tipo de URL.
SELECT
    w.phishing,
    ROUND(AVG(p.n_dots), 2) AS media_pontos,
    ROUND(AVG(p.n_hyphens), 2) AS media_hifens,
    ROUND(AVG(p.n_underline), 2) AS media_underline,
    ROUND(AVG(p.n_slash), 2) AS media_barras,
    ROUND(AVG(p.n_questionmark), 2) AS media_interrogacao,
    ROUND(AVG(p.n_equal), 2) AS media_igual,
    ROUND(AVG(p.n_at), 2) AS media_arroba,
    ROUND(AVG(p.n_and), 2) AS media_and,
    ROUND(AVG(p.n_exclamation), 2) AS media_exclamacao,
    ROUND(AVG(p.n_space), 2) AS media_espacos,
    ROUND(AVG(p.n_tilde), 2) AS media_til,
    ROUND(AVG(p.n_comma), 2) AS media_virgulas,
    ROUND(AVG(p.n_plus), 2) AS media_mais,
    ROUND(AVG(p.n_asterisk), 2) AS media_asterisco,
    ROUND(AVG(p.n_hashtag), 2) AS media_hashtag,
    ROUND(AVG(p.n_dollar), 2) AS media_dolar,
    ROUND(AVG(p.n_percent), 2) AS media_percentual
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id
GROUP BY w.phishing;


-- =====================================================
-- Presença de algumas características nas URLs
-- =====================================================

-- Verificamos a presença de barras nas URLs.
-- O objetivo é comparar a frequência desse caractere
-- entre URLs phishing e não phishing.
SELECT
    w.phishing,
    COUNT(*) AS total,
    SUM(CASE WHEN p.n_slash > 0 THEN 1 ELSE 0 END) AS possui_slash,
    ROUND(
        SUM(CASE WHEN p.n_slash > 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS percentual
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id
GROUP BY w.phishing;


-- Verificamos a presença do sinal de igual nas URLs.
-- Essa comparação mostra como esse elemento aparece
-- em cada classificação.
SELECT
    w.phishing,
    COUNT(*) AS total,
    SUM(CASE WHEN p.n_equal > 0 THEN 1 ELSE 0 END) AS possui_equal,
    ROUND(
        SUM(CASE WHEN p.n_equal > 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS percentual
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id
GROUP BY w.phishing;


-- Verificamos a presença de hífens nas URLs.
-- A consulta permite comparar a ocorrência desse caractere
-- entre os dois grupos analisados.
SELECT
    w.phishing,
    COUNT(*) AS total,
    SUM(CASE WHEN p.n_hyphens > 0 THEN 1 ELSE 0 END) AS possui_hifens,
    ROUND(
        SUM(CASE WHEN p.n_hyphens > 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS percentual
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id
GROUP BY w.phishing;


-- Verificamos a presença de underline nas URLs.
-- O resultado ajuda a observar se esse elemento aparece
-- com frequências diferentes entre as classificações.
SELECT
    w.phishing,
    COUNT(*) AS total,
    SUM(CASE WHEN p.n_underline > 0 THEN 1 ELSE 0 END) AS possui_underline,
    ROUND(
        SUM(CASE WHEN p.n_underline > 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS percentual
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id
GROUP BY w.phishing;


-- Verificamos a presença do caractere "&" nas URLs.
-- A comparação ajuda a entender como esse elemento
-- se distribui entre URLs phishing e não phishing.
SELECT
    w.phishing,
    COUNT(*) AS total,
    SUM(CASE WHEN p.n_and > 0 THEN 1 ELSE 0 END) AS possui_and,
    ROUND(
        SUM(CASE WHEN p.n_and > 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS percentual
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id
GROUP BY w.phishing;


-- =====================================================
-- Diferença entre phishing e não phishing
-- para todas as características
-- =====================================================

-- Esta consulta reúne as características e calcula a diferença
-- entre a presença delas em URLs phishing e não phishing.
-- Assim, podemos comparar quais elementos apresentam maior
-- diferença entre os dois grupos.
WITH estatisticas AS (
    SELECT
        w.phishing,

        AVG(p.n_dots > 0) * 100 AS pontos,
        AVG(p.n_hyphens > 0) * 100 AS hifens,
        AVG(p.n_underline > 0) * 100 AS underline,
        AVG(p.n_slash > 0) * 100 AS barras,
        AVG(p.n_questionmark > 0) * 100 AS interrogacao,
        AVG(p.n_equal > 0) * 100 AS igual,
        AVG(p.n_at > 0) * 100 AS arroba,
        AVG(p.n_and > 0) * 100 AS and_symbol,
        AVG(p.n_exclamation > 0) * 100 AS exclamacao,
        AVG(p.n_space > 0) * 100 AS espacos,
        AVG(p.n_tilde > 0) * 100 AS til,
        AVG(p.n_comma > 0) * 100 AS virgula,
        AVG(p.n_plus > 0) * 100 AS mais,
        AVG(p.n_asterisk > 0) * 100 AS asterisco,
        AVG(p.n_hashtag > 0) * 100 AS hashtag,
        AVG(p.n_dollar > 0) * 100 AS dolar,
        AVG(p.n_percent > 0) * 100 AS percentual

    FROM web_page_fishing AS w
    INNER JOIN phishing_dataset AS p
        ON w.unique_id = p.unique_id

    GROUP BY w.phishing
)

SELECT
    'pontos' AS caracteristica,
    ROUND(
        MAX(CASE WHEN phishing = 1 THEN pontos END)
        - MAX(CASE WHEN phishing = 0 THEN pontos END),
        2
    ) AS diferenca

FROM estatisticas

UNION ALL

SELECT 'hifens',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN hifens END)
           - MAX(CASE WHEN phishing = 0 THEN hifens END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'underline',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN underline END)
           - MAX(CASE WHEN phishing = 0 THEN underline END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'barras',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN barras END)
           - MAX(CASE WHEN phishing = 0 THEN barras END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'interrogacao',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN interrogacao END)
           - MAX(CASE WHEN phishing = 0 THEN interrogacao END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'igual',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN igual END)
           - MAX(CASE WHEN phishing = 0 THEN igual END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'arroba',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN arroba END)
           - MAX(CASE WHEN phishing = 0 THEN arroba END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'and',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN and_symbol END)
           - MAX(CASE WHEN phishing = 0 THEN and_symbol END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'exclamacao',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN exclamacao END)
           - MAX(CASE WHEN phishing = 0 THEN exclamacao END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'espacos',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN espacos END)
           - MAX(CASE WHEN phishing = 0 THEN espacos END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'til',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN til END)
           - MAX(CASE WHEN phishing = 0 THEN til END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'virgula',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN virgula END)
           - MAX(CASE WHEN phishing = 0 THEN virgula END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'mais',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN mais END)
           - MAX(CASE WHEN phishing = 0 THEN mais END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'asterisco',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN asterisco END)
           - MAX(CASE WHEN phishing = 0 THEN asterisco END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'hashtag',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN hashtag END)
           - MAX(CASE WHEN phishing = 0 THEN hashtag END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'dolar',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN dolar END)
           - MAX(CASE WHEN phishing = 0 THEN dolar END),
           2
       )
FROM estatisticas

UNION ALL

SELECT 'percentual',
       ROUND(
           MAX(CASE WHEN phishing = 1 THEN percentual END)
           - MAX(CASE WHEN phishing = 0 THEN percentual END),
           2
       )
FROM estatisticas

ORDER BY diferenca DESC;