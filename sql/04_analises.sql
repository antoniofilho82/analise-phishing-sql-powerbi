USE phishing_db;

-- =====================================================
-- 1. CORRELAÇÃO COM PHISHING
-- =====================================================

-- Esta consulta calcula a correlação entre o campo phishing
-- e as características presentes nas URLs.
-- O resultado ajuda a comparar quais variáveis apresentam
-- maior ou menor relação com a classificação de phishing.

SELECT
    'n_slash' AS campo,
    ROUND(
        (
            COUNT(*) * SUM(p.n_slash * w.phishing)
            - SUM(p.n_slash) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_slash * p.n_slash) - POW(SUM(p.n_slash), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    ) AS correlacao
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'url_length',
    ROUND(
        (
            COUNT(*) * SUM(w.url_length * w.phishing)
            - SUM(w.url_length) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(w.url_length * w.url_length) - POW(SUM(w.url_length), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w

UNION ALL

SELECT
    'n_equal',
    ROUND(
        (
            COUNT(*) * SUM(p.n_equal * w.phishing)
            - SUM(p.n_equal) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_equal * p.n_equal) - POW(SUM(p.n_equal), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_and',
    ROUND(
        (
            COUNT(*) * SUM(p.n_and * w.phishing)
            - SUM(p.n_and) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_and * p.n_and) - POW(SUM(p.n_and), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_dots',
    ROUND(
        (
            COUNT(*) * SUM(p.n_dots * w.phishing)
            - SUM(p.n_dots) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_dots * p.n_dots) - POW(SUM(p.n_dots), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_underline',
    ROUND(
        (
            COUNT(*) * SUM(p.n_underline * w.phishing)
            - SUM(p.n_underline) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_underline * p.n_underline) - POW(SUM(p.n_underline), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_questionmark',
    ROUND(
        (
            COUNT(*) * SUM(p.n_questionmark * w.phishing)
            - SUM(p.n_questionmark) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_questionmark * p.n_questionmark) - POW(SUM(p.n_questionmark), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_hyphens',
    ROUND(
        (
            COUNT(*) * SUM(p.n_hyphens * w.phishing)
            - SUM(p.n_hyphens) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_hyphens * p.n_hyphens) - POW(SUM(p.n_hyphens), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_at',
    ROUND(
        (
            COUNT(*) * SUM(p.n_at * w.phishing)
            - SUM(p.n_at) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_at * p.n_at) - POW(SUM(p.n_at), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_redirection',
    ROUND(
        (
            COUNT(*) * SUM(w.n_redirection * w.phishing)
            - SUM(w.n_redirection) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(w.n_redirection * w.n_redirection) - POW(SUM(w.n_redirection), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w

UNION ALL

SELECT
    'n_tilde',
    ROUND(
        (
            COUNT(*) * SUM(p.n_tilde * w.phishing)
            - SUM(p.n_tilde) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_tilde * p.n_tilde) - POW(SUM(p.n_tilde), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_exclamation',
    ROUND(
        (
            COUNT(*) * SUM(p.n_exclamation * w.phishing)
            - SUM(p.n_exclamation) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_exclamation * p.n_exclamation) - POW(SUM(p.n_exclamation), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_comma',
    ROUND(
        (
            COUNT(*) * SUM(p.n_comma * w.phishing)
            - SUM(p.n_comma) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_comma * p.n_comma) - POW(SUM(p.n_comma), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_percent',
    ROUND(
        (
            COUNT(*) * SUM(p.n_percent * w.phishing)
            - SUM(p.n_percent) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_percent * p.n_percent) - POW(SUM(p.n_percent), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_dollar',
    ROUND(
        (
            COUNT(*) * SUM(p.n_dollar * w.phishing)
            - SUM(p.n_dollar) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_dollar * p.n_dollar) - POW(SUM(p.n_dollar), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_asterisk',
    ROUND(
        (
            COUNT(*) * SUM(p.n_asterisk * w.phishing)
            - SUM(p.n_asterisk) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_asterisk * p.n_asterisk) - POW(SUM(p.n_asterisk), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_space',
    ROUND(
        (
            COUNT(*) * SUM(p.n_space * w.phishing)
            - SUM(p.n_space) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_space * p.n_space) - POW(SUM(p.n_space), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_hashtag',
    ROUND(
        (
            COUNT(*) * SUM(p.n_hashtag * w.phishing)
            - SUM(p.n_hashtag) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_hashtag * p.n_hashtag) - POW(SUM(p.n_hashtag), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

UNION ALL

SELECT
    'n_plus',
    ROUND(
        (
            COUNT(*) * SUM(p.n_plus * w.phishing)
            - SUM(p.n_plus) * SUM(w.phishing)
        )
        /
        SQRT(
            (COUNT(*) * SUM(p.n_plus * p.n_plus) - POW(SUM(p.n_plus), 2))
            *
            (COUNT(*) * SUM(w.phishing * w.phishing) - POW(SUM(w.phishing), 2))
        ),
        4
    )
FROM web_page_fishing AS w
INNER JOIN phishing_dataset AS p
    ON w.unique_id = p.unique_id

ORDER BY correlacao DESC;




USE phishing_db;

SELECT
    phishing,
    COUNT(*) AS total_urls,
    ROUND(AVG(url_length), 2) AS media_tamanho_url,
    MIN(url_length) AS menor_url,
    MAX(url_length) AS maior_url
FROM web_page_fishing
GROUP BY phishing;





USE phishing_db;

SELECT
    phishing,
    COUNT(*) AS total_urls,
    ROUND(AVG(n_redirection), 2) AS media_redirecionamentos,
    MIN(n_redirection) AS menor_numero_redirecionamentos,
    MAX(n_redirection) AS maior_numero_redirecionamentos
FROM web_page_fishing
GROUP BY phishing;





USE phishing_db;

SELECT
    pontuacao_suspeita,
    COUNT(*) AS total_urls,
    SUM(CASE WHEN phishing = 1 THEN 1 ELSE 0 END) AS total_phishing,
    ROUND(
        SUM(CASE WHEN phishing = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS percentual_phishing
FROM (
    SELECT
        w.phishing,
        (
            (p.n_slash > 0) +
            (p.n_hyphens > 0) +
            (p.n_equal > 0) +
            (p.n_underline > 0) +
            (p.n_and > 0) +
            (w.url_length > 60)
        ) AS pontuacao_suspeita
    FROM web_page_fishing AS w
    INNER JOIN phishing_dataset AS p
        ON w.unique_id = p.unique_id
) AS dados
GROUP BY pontuacao_suspeita
ORDER BY pontuacao_suspeita;