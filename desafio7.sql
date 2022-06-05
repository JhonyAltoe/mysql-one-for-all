SELECT
	AR.nome AS artista,
  AL.name_album AS album,
  count(S.artista_idartista) AS seguidores
FROM SpotifyClone.artista AS AR
INNER JOIN SpotifyClone.album AS AL
ON AR.idartista = AL.artista_idartista
INNER JOIN SpotifyClone.seguindo AS S
ON AR.idartista = S.artista_idartista
GROUP BY
	AR.nome,
  AL.name_album
ORDER BY
	seguidores DESC,
  artista,
  album;