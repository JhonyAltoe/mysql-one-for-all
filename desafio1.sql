DROP DATABASE IF EXISTS `SpotifyClone`;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone`;

USE `SpotifyClone` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `idplano` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idplano`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`planos`
VALUES
(1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3, 'universitário', 5.99),
(4, 'pessoal', 6.99);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (

  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `idade` INT NOT NULL,
  `idplano` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_assinatura` DATETIME NOT NULL,
  PRIMARY KEY (`idusuario`),
    FOREIGN KEY (`idplano`)
    REFERENCES `SpotifyClone`.`planos` (`idplano`))
ENGINE = InnoDB;
INSERT INTO `SpotifyClone`.`usuario`
VALUES
(1, 23, 1, 'Thati', '2019-10-20' ),
(2, 35, 2, 'Cintia', '2017-12-30' ),
(3, 20, 3, 'Bill', '2019-06-05' ),
(4, 45, 4, 'Roger', '2020-05-13' ),
(5, 58, 4, 'Norman', '2017-02-17' ),
(6, 33, 2, 'Patrick', '2017-01-06' ),
(7, 26, 3, 'Vivian', '2018-01-05' ),
(8, 19, 3, 'Carol', '2018-02-14' ),
(9, 42, 2, 'Angelina', '2018-04-29' ),
(10, 46, 2, 'Paul', '2017-01-17' );

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `idartista` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idartista`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artista`
VALUES
(1, 'Walter Phoenix' ),
(2, 'Freedie Shannon' ),
(3, 'Lance Day'),
(4, 'Peter Strong'),
(5, 'Tyler Isle'),
(6, 'Fog');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
`idalbum` INT NOT NULL AUTO_INCREMENT,
`name_album` VARCHAR(45) NOT NULL,
`ano_lancamento` INT NULL,
`artista_idartista` INT NOT NULL,
PRIMARY KEY (`idalbum`),
FOREIGN KEY (`artista_idartista`)
REFERENCES `SpotifyClone`.`artista` (`idartista`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`album`
VALUES
(1, 'Envious', 1990, 1),
(2, 'Exuberant', 1993, 1),
(3, 'Hallowed Steam', 1995, 4),
(4, 'Incandescent', 1998, 3),
(5, 'Temporary Culture', 2001, 2),
(6, 'Library of liberty', 2003, 2),
(7, 'Chained Down', 2007, 5),
(8, 'Cabinet of fools', 2012, 5),
(9, 'No guarantees', 2015, 5),
(10, 'Apparatus', 2015, 6);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musica` (
`idmusica` INT NOT NULL AUTO_INCREMENT,
`album_idalbum` INT NOT NULL,
`nome` VARCHAR(45) NULL,
`duracao` INT NOT NULL,
`id_artista` INT NOT NULL,
PRIMARY KEY (`idmusica`),
FOREIGN KEY(`id_artista`)
REFERENCES `SpotifyClone`.`artista` (`idartista`),
FOREIGN KEY (`album_idalbum`)
REFERENCES `SpotifyClone`.`album` (`idalbum`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`musica`
VALUES
(1, 1, "Soul For Us", 200, 1),
(2, 1, "Reflections Of Magic", 163, 1),
(3, 1, "Dance With Her Own", 116, 1),
(4, 2, "Troubles Of My Inner Fire", 203, 1),
(5, 2, "Time Fireworks", 152, 1),
(6, 3, "Magic Circus", 105, 2),
(7, 3,  "Honey, So Do I", 207, 2),
(8, 3, "Sweetie, Let's Go Wild", 139, 2),
(9, 3, "She Knows", 244 , 2),
(10, 4, "Fantasy For Me", 100, 3),
(11, 4, "Celebration Of More", 146, 3),
(12, 4, "Rock His Everything", 223, 3),
(13, 4, "Home Forever", 231, 3),
(14, 4, "Diamond Power", 241, 3),
(15, 4, "Let's Be Silly", 132 , 3),
(16, 5, 'Thang Of Thunder', 240, 4),
(17, 5, 'Words Of Her Life', 185, 4 ),
(18, 5, 'Without My Streets', 176, 4),
(19, 6, 'Need Of The Evening', 190, 4),
(20, 6, 'History Of My Roses', 222, 4),
(21, 6, 'Without My Love', 111, 4),
(22, 6, 'Walking And Game', 123, 4),
(23, 6, 'Young And Father', 197 , 4),
(24, 7, 'Finding My Traditions', 179, 5),
(25, 7, 'Walking And Man', 229, 5),
(26, 7, 'Hard And Time', 135, 5),
(27, 7, "Honey, I'm A Lone Wolf", 150, 5),
(28, 8, "She Thinks I Won't Stay Tonight", 166, 5),
(29, 8, "He Heard You're Bad For Me", 154, 5),
(30, 8, "He Hopes We Can't Stay", 210, 5),
(31, 8, 'I Know I Know', 117, 5),
(32, 9, "He's Walking Away", 159, 5),
(33, 9, "He's Trouble", 138, 5),
(34, 9, 'I Heard I Want To Bo Alone', 120, 5),
(35, 9, 'I Ride Alone', 151, 5),
(36, 10, 'Honey', 79, 6),
(37, 10, 'You Cheated On Me', 95, 6),
(38, 10, "Wouldn't It Be Nice", 213, 6),
(39, 10, 'Baby', 136, 6),
(40, 10, 'You Make Me Feel So..', 83, 6);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico`(
 `usuario_id` INT NOT NULL,
 `musica_id` INT NOT NULL,
 `data_reproducao` DATETIME NOT NULL,
 PRIMARY KEY (`usuario_id`, `musica_id`),
 FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario` (`idusuario`),
 FOREIGN KEY (`musica_id`) REFERENCES `SpotifyClone`.`musica` (`idmusica`))
 ENGINE = InnoDB;

 INSERT INTO `SpotifyClone`.`historico`(`usuario_id`,  `musica_id`, `data_reproducao`)
 VALUES
(1, 36, "2020-02-28 10:45:55"),
(1, 25, "2020-05-02 05:30:35"),
(1, 23, "2020-03-06 11:22:33"),
(1, 14, "2020-08-05 08:05:17"),
(1, 15, "2020-09-14 16:32:22"),
(2, 34, "2020-01-02 07:40:33"),
(2, 24, "2020-05-16 06:16:22"),
(2, 21, "2020-10-09 12:27:48"),
(2, 39, "2020-09-21 13:14:46"),
(3, 6, "2020-11-13 16:55:13"),
(3, 3, "2020-12-05 18:38:30"),
(3, 26, "2020-07-30 10:00:00"),
(4, 2, "2021-08-15 17:10:10"),
(4, 35, "2021-07-10 15:20:30"),
(4, 27, "2021-01-09 01:44:33"),
(5, 7, "2020-07-03 19:33:28"),
(5, 12, "2017-02-24 21:14:22"),
(5, 14, "2020-08-06 15:23:43"),
(5, 1, "2020-11-10 13:52:27"),
(6, 38, "2019-02-07 20:33:48"),
(6, 29, "2017-01-24 00:31:17"),
(6, 30, "2017-10-12 12:35:20"),
(6, 22, "2018-05-29 14:56:41"),
(7, 5, "2018-05-09 22:30:49"),
(7, 4, "2020-07-27 12:52:58"),
(7, 11, "2018-01-16 18:40:43"),
(8, 39, "2018-03-21 16:56:40"),
(8, 40, "2020-10-18 13:38:05"),
(8, 32, "2019-05-25 08:14:03"),
(8, 33, "2021-08-15 21:37:09"),
(9, 16, "2021-05-24 17:23:45"),
(9, 17, "2018-12-07 22:48:52"),
(9, 8, "2021-03-14 06:14:26"),
(9, 9, "2020-04-01 03:36:00"),
(10, 20, "2017-02-06 08:21:34"),
(10, 21, "2017-12-04 05:33:43"),
(10, 12, "2017-07-27 05:24:49"),
(10, 13, "2017-12-25 01:03:57");

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo`(
`usuario_idusuario` INT NOT NULL,
`artista_idartista` INT NOT NULL,
PRIMARY KEY (`usuario_idusuario`, `artista_idartista`),
FOREIGN KEY (`usuario_idusuario`)
REFERENCES `SpotifyClone`.`usuario` (`idusuario`),
FOREIGN KEY (`artista_idartista`)
REFERENCES `SpotifyClone`.`artista` (`idartista`))
 ENGINE = InnoDB;

 INSERT INTO `SpotifyClone`.`seguindo` (`usuario_idusuario`, `artista_idartista`)
 VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 4),
(4, 2),
(5, 5),
(5, 6),
(6, 1),
(6, 3),
(6, 6),
(7, 4),
(7, 5),
(8, 1),
(8, 5),
(9, 2),
(9, 3),
(9, 6),
(10, 4),
(10, 6);