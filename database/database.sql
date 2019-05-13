-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 13 mai 2019 à 20:52
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) COLLATE utf8_bin NOT NULL,
  `mail` varchar(250) COLLATE utf8_bin NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `post` int(11) NOT NULL,
  `report` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `username`, `mail`, `comment`, `created`, `updated`, `post`, `report`) VALUES
(3, 'meryem', 'meryem@meryem.com', 'Bonsoir c\'est très intéressant !!', '2019-05-13 21:47:36', '2019-05-13 21:47:36', 6, 0),
(4, 'ABCD', 'test@test.com', 'c\'est décevant une horreur ...', '2019-05-13 21:48:39', '2019-05-13 21:48:54', 6, 4),
(5, 'meryem', 'meryben@gmail.com', 'j\'adore \r\nMerci beaucoup', '2019-05-13 21:50:04', '2019-05-13 21:50:04', 7, 0),
(6, 'azert', 'test@test.com', 'Bonsoir \r\nExcellant bravo !! ', '2019-05-13 21:51:14', '2019-05-13 21:51:14', 8, 0);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `picture` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `author`, `title`, `content`, `created`, `updated`, `picture`) VALUES
(6, 'Jean Forteroche', 'Chapitre 1 : Légende inuit ', '<p>Une l&eacute;gende inuit raconte qu\'&agrave; l&rsquo;origine des temps, terre, collines et pierres tomb&egrave;rent du ciel. Une fois le monde constitu&eacute; , les hommes apparurent &agrave; leur tour, surgissant d&rsquo;entre la terre, dont ils apprirent &agrave; se nourrir. Des enfants naquirent et les hommes devinrent vieux - extr&ecirc;mement vieux, &agrave; en perdre la vue, la capacit&eacute; de se mouvoir et jusqu&rsquo;&agrave; celle de s&rsquo;allonger. Car, en ces temps-l&agrave;, les hommes ne mouraient pas. Ce monde &eacute;trange vivait dans une nuit &eacute;ternelle. Jamais le jour ne s&rsquo;y levait. C\'est tout juste si les hommes avaient de la lumi&egrave;re dans leurs maisons. Au fil du temps, les hommes se multipli&egrave;rent. Ils devinrent m&ecirc;me si nombreux qu&rsquo;ils encombraient la terre de leur existence. Un jour d&rsquo;aurore, une crue g&eacute;ante venue de la mer balaya le monde. Beaucoup p&eacute;rirent noy&eacute;s. Deux femmes &acirc;g&eacute;es commentaient l&rsquo;&eacute;v&eacute;nement : &laquo; &Eacute;pargnons-nous la mort, m&ecirc;me s&rsquo;il faut continuer &agrave; vivre dans l&rsquo;ombre. &raquo; Une autre la contredit : &laquo; Non, acceptons la mort mais vivons &agrave; la lumi&egrave;re. &raquo; Sur ces paroles, le jour se leva. Depuis lors, l&rsquo;homme n&rsquo;est plus condamn&eacute; &agrave; manger la terre. Il peut se d&eacute;placer, chasser au grand air. Car avec la mort sont apparus le soleil, la lune et les &eacute;toiles. Ce sont les &acirc;mes, en fait, qui apr&egrave;s la mort rejoignent le firmament et y brillent &eacute;ternellement.</p>', '2019-03-22 08:21:00', '2019-05-13 21:41:07', '5cd9d3873bfff.jpg'),
(7, 'Jean Forteroche', 'Chapitre 2 : Carte d\'identité Alaska', '<p>Superficie : 1 717 856 km&sup2;. Population : 738 432 habitants (estimation 2015), dont plus de la moiti&eacute; vit &agrave; Anchorage et dans un rayon de 100 km - en particulier dans les vall&eacute;es des rivi&egrave;res Matanuska et Sutsina. Langue : l\'anglais. R&eacute;gime : d&eacute;mocratie parlementaire. Pr&eacute;sident : Donald Trump (r&eacute;publicain), &eacute;lu en novembre 2016, investi en janvier 2017. Gouverneur de l\'Alaska : William Wamker, &eacute;lu en 2014. L&rsquo;Alaska est un bastion r&eacute;publicain : traditionaliste, religieux et libertarien, hostile au gouvernement f&eacute;d&eacute;ral et adepte de la &laquo; libert&eacute; &raquo; individuelle.Le gouverneur actuel est toutefois &laquo; sans &eacute;tiquette &raquo;. Ethnies : la population autochtone d&rsquo;Alaska repr&eacute;sente environ 100 000 personnes. Contrairement aux peuples am&eacute;rindiens des &Eacute;tats-Unis continentaux et du Canada, les autochtones d&rsquo;Alaska ne se sont pas vu accorder de &laquo; r&eacute;serves &raquo;, et ne disposent donc d&rsquo;aucun droit politique ni fiscal. Ils ont en revanche celui de pratiquer les chasses traditionnelles (dont celle de la baleine). Sites inscrits au patrimoine mondial de l\'Unesco: Kluane / Wrangell - St. Elias / Glacier Bay / Tatshenshini-Alesk (1979). Ces superbes glaciers s\'&eacute;tendent du Canada &agrave; l\'Alaska. Vous ne trouverez pas de champ de glace non polaire plus &eacute;tendu!</p>', '2019-03-22 15:27:56', '2019-05-13 21:41:35', '5cd9d3a3ef8c6.jpg'),
(8, 'Jean Forteroche', 'Chapitre 3 : Nuits blanches', '<p>our froide qu&rsquo;elle soit, l&rsquo;Alaska n&rsquo;est pas aussi septentrionale qu&rsquo;on pourrait le penser. Le cercle polaire ne passe que dans son tiers sup&eacute;rieur nord, un bon 200 km au-del&agrave; de Fairbanks. C&rsquo;est alors, seulement, que l&rsquo;on peut v&eacute;ritablement parler de soleil de minuit et de nuits blanches - m&ecirc;me si 23h de luminosit&eacute; en juin &agrave; Fairbanks n&rsquo;est d&eacute;j&agrave; pas si mal ! En r&eacute;alit&eacute;, m&ecirc;me &agrave; l&rsquo;extr&ecirc;me nord de l&rsquo;Alaska, la nuit n&rsquo;est jamais compl&egrave;te, car le soleil y r&eacute;verb&egrave;re encore sous l&rsquo;horizon. La lune se refl&egrave;te &eacute;galement sur la neige et la glace, et les aurores bor&eacute;ales repeignent le ciel de leurs faisceaux color&eacute;s. Corollaire de longues journ&eacute;es d&rsquo;&eacute;t&eacute;, les journ&eacute;es d&rsquo;hiver sont tr&egrave;s courtes : environ 5h de jour plus ou moins clair &agrave; Anchorage en d&eacute;cembre. &Agrave; Barrow, le soleil se couche carr&eacute;ment le 16 novembre pour se lever &agrave; nouveau le... 23 janvier !</p>', '2019-03-22 15:28:01', '2019-05-13 21:41:53', '5cd9d40259052.jpg'),
(9, 'Jean Forteroche', 'Chapitre 4 : Blanket toss', '<p>En d&rsquo;autres termes, le &laquo; saut en couverture &raquo;. Une vingtaine, jusqu&rsquo;&agrave; une trentaine de personnes soutiennent une tenture en peau de morse, sur laquelle rebondit un sauteur. L&rsquo;anc&ecirc;tre du trampoline, en quelque sorte. Marrant, sans doute, mais pas uniquement : &agrave; l&rsquo;origine, selon certains, la technique aurait servi aux chasseurs des villages de l&rsquo;Arctique pour rep&eacute;rer les baleines croisant au large. Les meilleurs sauteurs peuvent atteindre pr&egrave;s de 10 m de haut ! Aujourd&rsquo;hui, le blanket toss (nalukataq) se pratique dans tous les festivals inuit et, bien s&ucirc;r, aux World Eskimo Indian Olympics - aux c&ocirc;t&eacute;s d&rsquo;autres &eacute;preuves originales comme le saut &agrave; genoux (avec atterrissage obligatoire sur les pieds), la course sur le sol en imitant le phoque et le porter de poids avec les oreilles... En d&rsquo;autres termes, le &laquo; saut en couverture &raquo;. Une vingtaine, jusqu&rsquo;&agrave; une trentaine de personnes soutiennent une tenture en peau de morse, sur laquelle rebondit un sauteur. L&rsquo;anc&ecirc;tre du trampoline, en quelque sorte. Marrant, sans doute, mais pas uniquement : &agrave; l&rsquo;origine, selon certains, la technique aurait servi aux chasseurs des villages de l&rsquo;Arctique pour rep&eacute;rer les baleines croisant au large. Les meilleurs sauteurs peuvent atteindre pr&egrave;s de 10 m de haut ! Aujourd&rsquo;hui, le blanket toss (nalukataq) se pratique dans tous les festivals inuit et, bien s&ucirc;r, aux World Eskimo Indian Olympics - aux c&ocirc;t&eacute;s d&rsquo;autres &eacute;preuves originales comme le saut &agrave; genoux (avec atterrissage obligatoire sur les pieds), la course sur le sol en imitant le phoque et le porter de poids avec les oreilles...</p>', '2019-03-22 15:28:09', '2019-05-13 21:42:30', '5cd9d420f0996.jpg'),
(11, 'Jean Forteroche', 'Chapitre 5 : Incontournables Alaska', '<p>Marcher dans les rues d&rsquo;Anchorage, et pourquoi pas croiser un grizzly ou un ours noir. Arriver en bateau &agrave; Juneau et se sentir le frisson des premiers chercheurs d&rsquo;or. Marcher dans l&rsquo;immensit&eacute; presque vierge du Wrangell St. Elias National Park et se sentir tout petit entre ses sommets enneig&eacute;s. Se mesurer au Mont Kinley, le plus grand sommet d&rsquo;Am&eacute;rique du Nord. Marcher le nez en l&rsquo;air dans Haines, pour apercevoir les aigles chauves pos&eacute;s dans les sapins. Partir pour une journ&eacute;e de p&ecirc;che &agrave; Petersburg. Observer toutes sortes d&rsquo;animaux marins dans la p&eacute;ninsule de Kenai, et notamment des baleines. Camper dans le Denali National Park. Marcher dans les rues d&rsquo;Anchorage, et pourquoi pas croiser un grizzly ou un ours noir. Arriver en bateau &agrave; Juneau et se sentir le frisson des premiers chercheurs d&rsquo;or. Marcher dans l&rsquo;immensit&eacute; presque vierge du Wrangell St. Elias National Park et se sentir tout petit entre ses sommets enneig&eacute;s. Se mesurer au Mont Kinley, le plus grand sommet d&rsquo;Am&eacute;rique du Nord. Marcher le nez en l&rsquo;air dans Haines, pour apercevoir les aigles chauves pos&eacute;s dans les sapins. Partir pour une journ&eacute;e de p&ecirc;che &agrave; Petersburg. Observer toutes sortes d&rsquo;animaux marins dans la p&eacute;ninsule de Kenai, et notamment des baleines. Camper dans le Denali National Park. Marcher dans les rues d&rsquo;Anchorage, et pourquoi pas croiser un grizzly ou un ours noir. Arriver en bateau &agrave; Juneau et se sentir le frisson des premiers chercheurs d&rsquo;or. Marcher dans l&rsquo;immensit&eacute; presque vierge du Wrangell St. Elias National Park et se sentir tout petit entre ses sommets enneig&eacute;s. Se mesurer au Mont Kinley, le plus grand sommet d&rsquo;Am&eacute;rique du Nord. Marcher le nez en l&rsquo;air dans Haines, pour apercevoir les aigles chauves pos&eacute;s dans les sapins. Partir pour une journ&eacute;e de p&ecirc;che &agrave; Petersburg. Observer toutes sortes d&rsquo;animaux marins dans la p&eacute;ninsule de Kenai, et notamment des baleines. Camper dans le Denali National Park.</p>', '2019-03-27 20:08:53', '2019-05-13 21:42:50', '5cd9d440a5545.jpg'),
(17, 'Jean Forteroche', 'Chapitre 6 : Prince William Sound Alaska', '<p>Prince William Sound est une baie situ&eacute;e sur la c&ocirc;te orientale de la p&eacute;ninsule de Kena&iuml; qui est entour&eacute;e par les montagnes Chugach &agrave; l\'est, &agrave; l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites &icirc;les et des fjords. Le plus grand port de cette baie est Valdez. Prince William Sound est une baie situ&eacute;e sur la c&ocirc;te orientale de la p&eacute;ninsule de Kena&iuml; qui est entour&eacute;e par les montagnes Chugach &agrave; l\'est, &agrave; l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites &icirc;les et des fjords. Le plus grand port de cette baie est Valdez. Prince William Sound est une baie situ&eacute;e sur la c&ocirc;te orientale de la p&eacute;ninsule de Kena&iuml; qui est entour&eacute;e par les montagnes Chugach &agrave; l\'est, &agrave; l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites &icirc;les et des fjords. Le plus grand port de cette baie est Valdez. Prince William Sound est une baie situ&eacute;e sur la c&ocirc;te orientale de la p&eacute;ninsule de Kena&iuml; qui est entour&eacute;e par les montagnes Chugach &agrave; l\'est, &agrave; l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites &icirc;les et des fjords. Le plus grand port de cette baie est Valdez. Prince William Sound est une baie situ&eacute;e sur la c&ocirc;te orientale de la p&eacute;ninsule de Kena&iuml; qui est entour&eacute;e par les montagnes Chugach &agrave; l\'est, &agrave; l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites &icirc;les et des fjords. Le plus grand port de cette baie est Valdez.</p>', '2019-03-27 08:35:18', '2019-05-13 21:43:10', '5cd9d467c4858.jpg'),
(21, 'Jean Forteroche', 'Chapitre 7 : Misty Fjords National Monument ', '<p>Wrangell : fond&eacute;e par les Russes en 1834, Wrangell vit surtout du bois et de la p&ecirc;che. On y trouve un mus&eacute;e, des totems, des p&eacute;troglyphes &agrave; proximit&eacute; et m&ecirc;me... un golf (le seul de la r&eacute;gion) ! Dans le port, l&rsquo;&icirc;le du chef Shakes abrite une belle reconstruction d&rsquo;une demeure de chef tlingit. &Agrave; 35 miles au sud-est, ne ratez pas l&rsquo;extraordinaire observatoire d&rsquo;Anan, mis en place par l&rsquo;US Forest Service dans la for&ecirc;t de Tongass. En &eacute;t&eacute;, ours noirs et bruns s&rsquo;y retrouvent pour p&ecirc;cher les saumons alors qu&rsquo;ils tentent de remonter une chute. Petersburg : entre Wrangell et Petersburg, le ferry emprunte une section particuli&egrave;rement &eacute;troite et photog&eacute;nique de l&rsquo;Inside Passage, baptis&eacute;e Wrangell Narrows. Tr&egrave;s attach&eacute;e &agrave; la p&ecirc;che au fl&eacute;tan (les prises record atteignent 200 kilos !), la petite ville entretient avec bonhomie la m&eacute;moire de ses racines norv&eacute;giennes lors d&rsquo;un festival color&eacute; le 17 mai. On y trouve les classiques, un port color&eacute; et un mus&eacute;e local, ainsi qu&rsquo;un centre d&rsquo;info sur les mammif&egrave;res marins. L&rsquo;&eacute;t&eacute;, les baleines &agrave; bosse se regroupent &agrave; 50 km vers le nord (excursions). Admiralty Island National Monument : l&rsquo;&icirc;le, qui ne compte qu&rsquo;un seul village (tlingit), abrite la plus grande concentration au monde d&rsquo;ours bruns. Ils sont davantage sur cette seule &icirc;le que dans tous les &Eacute;tats-Unis continentaux ! L&rsquo;&eacute;t&eacute;, ils festoient lors des remont&eacute;es de saumons, en particulier dans le Pack Creek Bear Refuge, sur la c&ocirc;te orientale. Les aigles chauves sont aussi particuli&egrave;rement nombreux. Les amateurs de cano&euml; trouveront un bel itin&eacute;raire de 53 km entrecoup&eacute; de portages (le plus long sur 5 km !).</p>', '2019-03-27 10:23:52', '2019-05-13 21:43:27', '5cd9d35a9bb2c.jpg'),
(82, 'Jean Forteroche', 'Chapitre 8 : Misty Fjords National Monument ', '<p>Wrangell : fond&eacute;e par les Russes en 1834, Wrangell vit surtout du bois et de la p&ecirc;che. On y trouve un mus&eacute;e, des totems, des p&eacute;troglyphes &agrave; proximit&eacute; et m&ecirc;me... un golf (le seul de la r&eacute;gion) ! Dans le port, l&rsquo;&icirc;le du chef Shakes abrite une belle reconstruction d&rsquo;une demeure de chef tlingit. &Agrave; 35 miles au sud-est, ne ratez pas l&rsquo;extraordinaire observatoire d&rsquo;Anan, mis en place par l&rsquo;US Forest Service dans la for&ecirc;t de Tongass. En &eacute;t&eacute;, ours noirs et bruns s&rsquo;y retrouvent pour p&ecirc;cher les saumons alors qu&rsquo;ils tentent de remonter une chute. Petersburg : entre Wrangell et Petersburg, le ferry emprunte une section particuli&egrave;rement &eacute;troite et photog&eacute;nique de l&rsquo;Inside Passage, baptis&eacute;e Wrangell Narrows. Tr&egrave;s attach&eacute;e &agrave; la p&ecirc;che au fl&eacute;tan (les prises record atteignent 200 kilos !), la petite ville entretient avec bonhomie la m&eacute;moire de ses racines norv&eacute;giennes lors d&rsquo;un festival color&eacute; le 17 mai. On y trouve les classiques, un port color&eacute; et un mus&eacute;e local, ainsi qu&rsquo;un centre d&rsquo;info sur les mammif&egrave;res marins. L&rsquo;&eacute;t&eacute;, les baleines &agrave; bosse se regroupent &agrave; 50 km vers le nord (excursions). Admiralty Island National Monument : l&rsquo;&icirc;le, qui ne compte qu&rsquo;un seul village (tlingit), abrite la plus grande concentration au monde d&rsquo;ours bruns. Ils sont davantage sur cette seule &icirc;le que dans tous les &Eacute;tats-Unis continentaux ! L&rsquo;&eacute;t&eacute;, ils festoient lors des remont&eacute;es de saumons, en particulier dans le Pack Creek Bear Refuge, sur la c&ocirc;te orientale. Les aigles chauves sont aussi particuli&egrave;rement nombreux. Les amateurs de cano&euml; trouveront un bel itin&eacute;raire de 53 km entrecoup&eacute; de portages (le plus long sur 5 km !).</p>', '2019-05-13 21:34:35', '2019-05-13 21:43:45', '5cd9d4db0f37f.jpg'),
(83, 'Jean Forteroche', 'Chapitre 9 : Nuits blanches', '<p>our froide qu&rsquo;elle soit, l&rsquo;Alaska n&rsquo;est pas aussi septentrionale qu&rsquo;on pourrait le penser. Le cercle polaire ne passe que dans son tiers sup&eacute;rieur nord, un bon 200 km au-del&agrave; de Fairbanks. C&rsquo;est alors, seulement, que l&rsquo;on peut v&eacute;ritablement parler de soleil de minuit et de nuits blanches - m&ecirc;me si 23h de luminosit&eacute; en juin &agrave; Fairbanks n&rsquo;est d&eacute;j&agrave; pas si mal ! En r&eacute;alit&eacute;, m&ecirc;me &agrave; l&rsquo;extr&ecirc;me nord de l&rsquo;Alaska, la nuit n&rsquo;est jamais compl&egrave;te, car le soleil y r&eacute;verb&egrave;re encore sous l&rsquo;horizon. La lune se refl&egrave;te &eacute;galement sur la neige et la glace, et les aurores bor&eacute;ales repeignent le ciel de leurs faisceaux color&eacute;s. Corollaire de longues journ&eacute;es d&rsquo;&eacute;t&eacute;, les journ&eacute;es d&rsquo;hiver sont tr&egrave;s courtes : environ 5h de jour plus ou moins clair &agrave; Anchorage en d&eacute;cembre. &Agrave; Barrow, le soleil se couche carr&eacute;ment le 16 novembre pour se lever &agrave; nouveau le... 23 janvier !</p>', '2019-05-13 21:35:31', '2019-05-13 21:44:18', '5cd9d5136546a.jpg'),
(84, 'Jean Forteroche', 'Chapitre 10 : Carte d\'identité Alaska', '<p>Superficie : 1 717 856 km&sup2;. Population : 738 432 habitants (estimation 2015), dont plus de la moiti&eacute; vit &agrave; Anchorage et dans un rayon de 100 km - en particulier dans les vall&eacute;es des rivi&egrave;res Matanuska et Sutsina. Langue : l\'anglais. R&eacute;gime : d&eacute;mocratie parlementaire. Pr&eacute;sident : Donald Trump (r&eacute;publicain), &eacute;lu en novembre 2016, investi en janvier 2017. Gouverneur de l\'Alaska : William Wamker, &eacute;lu en 2014. L&rsquo;Alaska est un bastion r&eacute;publicain : traditionaliste, religieux et libertarien, hostile au gouvernement f&eacute;d&eacute;ral et adepte de la &laquo; libert&eacute; &raquo; individuelle.Le gouverneur actuel est toutefois &laquo; sans &eacute;tiquette &raquo;. Ethnies : la population autochtone d&rsquo;Alaska repr&eacute;sente environ 100 000 personnes. Contrairement aux peuples am&eacute;rindiens des &Eacute;tats-Unis continentaux et du Canada, les autochtones d&rsquo;Alaska ne se sont pas vu accorder de &laquo; r&eacute;serves &raquo;, et ne disposent donc d&rsquo;aucun droit politique ni fiscal. Ils ont en revanche celui de pratiquer les chasses traditionnelles (dont celle de la baleine). Sites inscrits au patrimoine mondial de l\'Unesco: Kluane / Wrangell - St. Elias / Glacier Bay / Tatshenshini-Alesk (1979). Ces superbes glaciers s\'&eacute;tendent du Canada &agrave; l\'Alaska. Vous ne trouverez pas de champ de glace non polaire plus &eacute;tendu!</p>', '2019-05-13 21:37:05', '2019-05-13 21:45:15', '5cd9d5719a136.jpg'),
(85, 'Jean Forteroche', 'Chapitre 11 : Misty Fjords National Monument ', '<p>Wrangell : fond&eacute;e par les Russes en 1834, Wrangell vit surtout du bois et de la p&ecirc;che. On y trouve un mus&eacute;e, des totems, des p&eacute;troglyphes &agrave; proximit&eacute; et m&ecirc;me... un golf (le seul de la r&eacute;gion) ! Dans le port, l&rsquo;&icirc;le du chef Shakes abrite une belle reconstruction d&rsquo;une demeure de chef tlingit. &Agrave; 35 miles au sud-est, ne ratez pas l&rsquo;extraordinaire observatoire d&rsquo;Anan, mis en place par l&rsquo;US Forest Service dans la for&ecirc;t de Tongass. En &eacute;t&eacute;, ours noirs et bruns s&rsquo;y retrouvent pour p&ecirc;cher les saumons alors qu&rsquo;ils tentent de remonter une chute. Petersburg : entre Wrangell et Petersburg, le ferry emprunte une section particuli&egrave;rement &eacute;troite et photog&eacute;nique de l&rsquo;Inside Passage, baptis&eacute;e Wrangell Narrows. Tr&egrave;s attach&eacute;e &agrave; la p&ecirc;che au fl&eacute;tan (les prises record atteignent 200 kilos !), la petite ville entretient avec bonhomie la m&eacute;moire de ses racines norv&eacute;giennes lors d&rsquo;un festival color&eacute; le 17 mai. On y trouve les classiques, un port color&eacute; et un mus&eacute;e local, ainsi qu&rsquo;un centre d&rsquo;info sur les mammif&egrave;res marins. L&rsquo;&eacute;t&eacute;, les baleines &agrave; bosse se regroupent &agrave; 50 km vers le nord (excursions). Admiralty Island National Monument : l&rsquo;&icirc;le, qui ne compte qu&rsquo;un seul village (tlingit), abrite la plus grande concentration au monde d&rsquo;ours bruns. Ils sont davantage sur cette seule &icirc;le que dans tous les &Eacute;tats-Unis continentaux ! L&rsquo;&eacute;t&eacute;, ils festoient lors des remont&eacute;es de saumons, en particulier dans le Pack Creek Bear Refuge, sur la c&ocirc;te orientale. Les aigles chauves sont aussi particuli&egrave;rement nombreux. Les amateurs de cano&euml; trouveront un bel itin&eacute;raire de 53 km entrecoup&eacute; de portages (le plus long sur 5 km !).</p>', '2019-05-13 21:38:40', '2019-05-13 21:45:33', '5cd9d5d0ac871.jpg'),
(86, 'Jean Forteroche', 'Chapitre 12 : Légende inuit ', '<p>Une l&eacute;gende inuit raconte qu\'&agrave; l&rsquo;origine des temps, terre, collines et pierres tomb&egrave;rent du ciel. Une fois le monde constitu&eacute; , les hommes apparurent &agrave; leur tour, surgissant d&rsquo;entre la terre, dont ils apprirent &agrave; se nourrir. Des enfants naquirent et les hommes devinrent vieux - extr&ecirc;mement vieux, &agrave; en perdre la vue, la capacit&eacute; de se mouvoir et jusqu&rsquo;&agrave; celle de s&rsquo;allonger. Car, en ces temps-l&agrave;, les hommes ne mouraient pas. Ce monde &eacute;trange vivait dans une nuit &eacute;ternelle. Jamais le jour ne s&rsquo;y levait. C\'est tout juste si les hommes avaient de la lumi&egrave;re dans leurs maisons. Au fil du temps, les hommes se multipli&egrave;rent. Ils devinrent m&ecirc;me si nombreux qu&rsquo;ils encombraient la terre de leur existence. Un jour d&rsquo;aurore, une crue g&eacute;ante venue de la mer balaya le monde. Beaucoup p&eacute;rirent noy&eacute;s. Deux femmes &acirc;g&eacute;es commentaient l&rsquo;&eacute;v&eacute;nement : &laquo; &Eacute;pargnons-nous la mort, m&ecirc;me s&rsquo;il faut continuer &agrave; vivre dans l&rsquo;ombre. &raquo; Une autre la contredit : &laquo; Non, acceptons la mort mais vivons &agrave; la lumi&egrave;re. &raquo; Sur ces paroles, le jour se leva. Depuis lors, l&rsquo;homme n&rsquo;est plus condamn&eacute; &agrave; manger la terre. Il peut se d&eacute;placer, chasser au grand air. Car avec la mort sont apparus le soleil, la lune et les &eacute;toiles. Ce sont les &acirc;mes, en fait, qui apr&egrave;s la mort rejoignent le firmament et y brillent &eacute;ternellement.</p>', '2019-05-13 21:39:56', '2019-05-13 21:45:49', '5cd9d61c5f610.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `created`, `email`, `description`) VALUES
(1, 'jean_forteroche', '$2y$10$lrPEOkcG7DTWfgUQIAqlI.3GPjwILOD.OKTgdJa6TFQO6E2pn3zcW', 'Jean', 'Forteroche', '0000-00-00 00:00:00', 'Jean@gmail.com', '');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `post_comment` FOREIGN KEY (`post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
