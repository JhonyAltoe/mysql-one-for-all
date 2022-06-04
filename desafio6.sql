SELECT CONVERT(ROUND(MIN(planos.valor), 2), CHAR) AS faturamento_minimo,
CAST(ROUND(MAX(planos.valor), 2) AS CHAR) AS faturamento_maximo,
CAST(ROUND(AVG(planos.valor), 2) AS CHAR) AS faturamento_medio,
CAST(ROUND(SUM(planos.valor), 2) AS CHAR) AS faturamento_total
FROM SpotifyClone.planos AS planos
INNER JOIN SpotifyClone.usuario AS usuario
ON planos.idplano = usuario.idplano;