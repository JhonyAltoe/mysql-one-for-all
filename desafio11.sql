select 
	M.nome as nome_musica,
	case
		when CM.nome like '%Streets%' then replace(CM.nome, 'Streets', 'Code Review')
		when CM.nome like '%Her Own%' then replace(CM.nome, 'Her Own', 'Trybe')
		when CM.nome like '%Inner Fire%' then replace(CM.nome, 'Inner Fire', 'Project')
		when CM.nome like '%Silly%' then replace(CM.nome, 'Silly', 'Nice')
		when CM.nome like '%Circus%' then replace(CM.nome, 'Circus', 'Pull Request')
		else CM.nome
	end as novo_nome
from SpotifyClone.musica as M
inner join SpotifyClone.musica as CM
on M.nome = CM.nome
where
	M.nome like '%Streets%' or
    M.nome like '%Her Own%' or
    M.nome like '%Inner Fire%' or
    M.nome like '%Silly%' or
    M.nome like '%Circus%'
order by M.nome;
