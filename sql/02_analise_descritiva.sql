USE phishing_db;

-- =====================================================
-- 02. ANÁLISE DESCRITIVA
-- =====================================================

-- Esta consulta resume os dados de acordo com a classificação
-- de cada URL. A ideia é comparar a quantidade de registros,
-- o tamanho médio das URLs e a média de redirecionamentos.
-- Essas medidas ajudam a observar diferenças gerais entre
-- URLs phishing e não phishing.
SELECT
    phishing,
    COUNT(*) AS quantidade,
    ROUND(AVG(url_length), 2) AS media_tamanho_url,
    ROUND(AVG(n_redirection), 2) AS media_redirecionamentos
FROM web_page_fishing
GROUP BY phishing;