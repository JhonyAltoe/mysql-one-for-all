select 
	U.nome as usuario,
    if(max(year(H.data_reproducao)) = 2021, 'Usuário ativo', 'Usuário inativo') as condicao_usuario
from SpotifyClone.usuario as U
inner join SpotifyClone.historico as H
on U.idusuario = H.usuario_id
group by U.nome
order by U.nome;
