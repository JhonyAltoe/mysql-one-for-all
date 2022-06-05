SELECT
  ARTIST.nome AS artista,
  ALBUM.name_album AS album
 FROM
  `SpotifyClone`.`artista` AS ARTIST
  INNER JOIN `SpotifyClone`.`album` as ALBUM
  ON artista_idartista = idartista
 WHERE
  ARTIST.nome = "Walter Phoenix"
 GROUP BY
  artista,
  album;