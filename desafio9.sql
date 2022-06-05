SELECT
  COUNT(*) AS quantidade_musicas_no_historico
 FROM
  `SpotifyClone`.`usuario` AS USER
  JOIN `SpotifyClone`.`historico` AS historico
  ON idusuario = usuario_id
 WHERE
  USER.nome = "Bill"
 GROUP BY
  USER.nome;