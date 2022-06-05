select
	M.nome as nome,
    count(H.musica_id) as reproducoes
from SpotifyClone.musica as M
inner join SpotifyClone.historico as H
on M.idmusica = H.musica_id
inner join SpotifyClone.usuario as U
on U.idusuario = H.usuario_id
where U.idplano in (1, 4)
group by M.nome
order by M.nome;
