select
	U.nome as usuario,
    count(U.nome) as qtde_musicas_ouvidas,
	round((sum(M.duracao)/60), 2) as total_minutos
from SpotifyClone.usuario as U
inner join SpotifyClone.historico as H
on U.idusuario = H.usuario_id
inner join SpotifyClone.musica as M
on H.musica_id = M.idmusica
group by U.idusuario
order by U.nome;
