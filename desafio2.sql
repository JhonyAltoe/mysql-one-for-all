select
	count(idmusica) as cancoes,
    count(distinct(id_artista)) as artistas,
    count(distinct(album_idalbum)) as albuns
from SpotifyClone.musica;