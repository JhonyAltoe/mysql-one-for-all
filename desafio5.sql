SELECT
	M.nome AS cancao,
    count(H.musica_id) AS reproducoes
FROM SpotifyClone.musica AS M
INNER JOIN SpotifyClone.historico AS H
ON M.idmusica = H.musica_id
GROUP BY M.nome
ORDER BY reproducoes DESC, M.nome
LIMIT 2;