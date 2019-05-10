-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 10 mai 2019 à 08:52
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `username`, `mail`, `comment`, `created`, `updated`, `post`, `report`) VALUES
(8, 'mmm', 'meryben@gmail.fr', 'cccc', '2019-03-25 18:42:54', '2019-03-25 18:42:54', 0, 0),
(9, 'test', 'tet', 'test', '2019-03-27 20:15:31', '2019-04-01 19:01:41', 2, 1),
(10, 'salamsala', 'test', 'salaam', '2019-03-27 20:20:53', '2019-04-03 10:24:16', 2, 4),
(11, 'meryem benlhaj', 'meryben@gmail.fr', 'hello j\'aime bien cette article bravo !!!!!!\r\n', '2019-03-28 10:44:05', '2019-03-28 11:04:10', 10, 4),
(13, 'test', 'test', 'hhhhhhhhhhhhh', '2019-03-28 17:02:26', '2019-03-28 17:02:26', 3, 0),
(14, 'test', 'meryben@gmail.com', 'test', '2019-04-08 20:45:10', '2019-04-08 20:45:21', 3, 1),
(20, 'yes', 'yes', 'yes', '2019-04-09 18:30:13', '0000-00-00 00:00:00', 2, 0),
(26, 'test', 'test', 'tetqs', '2019-04-16 19:14:52', '2019-04-16 19:21:18', 18, 4),
(27, 'test', 'test', 'tetqs', '2019-04-16 19:17:08', '2019-04-18 18:45:48', 18, 3),
(28, 'test', 'test@test.com', 'test', '2019-04-18 18:51:53', '2019-04-18 18:51:53', 7, 0),
(29, 'mooi', 'test@test.com', 'testt', '2019-04-24 20:31:05', '2019-04-26 21:39:32', 20, 2),
(31, 'meryem@meryem.com', 'test@test.com', 'hello', '2019-04-26 16:42:42', '2019-04-26 16:42:42', 21, 0),
(34, 'TEST', 'TEST', 'TEST', '2019-04-26 17:05:52', '2019-04-26 17:05:52', 21, 0),
(35, 'jean_forteroche', 'meryben@gmail.fr', 'hello', '2019-04-26 17:19:06', '2019-04-26 17:19:06', 21, 0),
(36, 'TEST', 'TEST', 'HELLO', '2019-05-06 15:01:15', '2019-05-06 15:01:39', 6, 2),
(37, 'hi', 'hi', 'hi', '2019-05-06 16:13:27', '2019-05-06 16:13:27', 6, 0),
(38, 'meryem', 'meryem', 'meryem', '2019-05-06 16:26:49', '2019-05-06 16:26:49', 6, 0),
(39, 'HELLO', 'hello', 'hello', '2019-05-09 11:39:07', '2019-05-09 11:39:07', 6, 0),
(40, 'meryem', 'benlhaj', 'hello helllo', '2019-05-09 11:45:20', '2019-05-09 11:45:20', 6, 0),
(41, 'a', 'a', 'a', '2019-05-09 11:46:33', '2019-05-09 11:46:33', 6, 0),
(42, 'a', 'a', 'a', '2019-05-09 11:51:39', '2019-05-09 11:51:39', 6, 0),
(43, 'b', 'b', 'bbbbbbbb', '2019-05-09 11:55:16', '2019-05-09 11:55:16', 6, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `author`, `title`, `content`, `created`, `updated`, `picture`) VALUES
(6, 'Jean Forteroche', 'Chapitre 3 : Légende inuit ', '<p>Une l&eacute;gende inuit raconte qu\'&agrave; l&rsquo;origine des temps, terre, collines et pierres tomb&egrave;rent du ciel. Une fois le monde constitu&eacute; , les hommes apparurent &agrave; leur tour, surgissant d&rsquo;entre la terre, dont ils apprirent &agrave; se nourrir. Des enfants naquirent et les hommes devinrent vieux - extr&ecirc;mement vieux, &agrave; en perdre la vue, la capacit&eacute; de se mouvoir et jusqu&rsquo;&agrave; celle de s&rsquo;allonger. Car, en ces temps-l&agrave;, les hommes ne mouraient pas. Ce monde &eacute;trange vivait dans une nuit &eacute;ternelle. Jamais le jour ne s&rsquo;y levait. C\'est tout juste si les hommes avaient de la lumi&egrave;re dans leurs maisons. Au fil du temps, les hommes se multipli&egrave;rent. Ils devinrent m&ecirc;me si nombreux qu&rsquo;ils encombraient la terre de leur existence. Un jour d&rsquo;aurore, une crue g&eacute;ante venue de la mer balaya le monde. Beaucoup p&eacute;rirent noy&eacute;s. Deux femmes &acirc;g&eacute;es commentaient l&rsquo;&eacute;v&eacute;nement : &laquo; &Eacute;pargnons-nous la mort, m&ecirc;me s&rsquo;il faut continuer &agrave; vivre dans l&rsquo;ombre. &raquo; Une autre la contredit : &laquo; Non, acceptons la mort mais vivons &agrave; la lumi&egrave;re. &raquo; Sur ces paroles, le jour se leva. Depuis lors, l&rsquo;homme n&rsquo;est plus condamn&eacute; &agrave; manger la terre. Il peut se d&eacute;placer, chasser au grand air. Car avec la mort sont apparus le soleil, la lune et les &eacute;toiles. Ce sont les &acirc;mes, en fait, qui apr&egrave;s la mort rejoignent le firmament et y brillent &eacute;ternellement.</p>', '2019-03-22 08:21:00', '2019-04-15 18:52:20', ''),
(7, 'Jean Forteroche', 'Chapitre 4 : Carte d\'identité Alaska', 'Superficie : 1 717 856 km². Population : 738 432 habitants (estimation 2015), dont plus de la moitié vit à Anchorage et dans un rayon de 100 km - en particulier dans les vallées des rivières Matanuska et Sutsina. Langue : l\'anglais. Régime : démocratie parlementaire. Président : Donald Trump (républicain), élu en novembre 2016, investi en janvier 2017.\r\nGouverneur de l\'Alaska : William Wamker, élu en 2014. L’Alaska est un bastion républicain : traditionaliste, religieux et libertarien, hostile au gouvernement fédéral et adepte de la « liberté » individuelle.Le gouverneur actuel est toutefois « sans étiquette ». \r\nEthnies : la population autochtone d’Alaska représente environ 100 000 personnes. Contrairement aux peuples amérindiens des États-Unis continentaux et du Canada, les autochtones d’Alaska ne se sont pas vu accorder de « réserves », et ne disposent donc d’aucun droit politique ni fiscal. Ils ont en revanche celui de pratiquer les chasses traditionnelles (dont celle de la baleine).\r\nSites inscrits au patrimoine mondial de l\'Unesco: Kluane / Wrangell - St. Elias / Glacier Bay / Tatshenshini-Alesk (1979). Ces superbes glaciers s\'étendent du Canada à l\'Alaska. Vous ne trouverez pas de champ de glace non polaire plus étendu!\r\n', '2019-03-22 15:27:56', '2019-03-22 15:27:56', ''),
(8, 'Jean Forteroche', 'Chapitre 5 : Nuits blanches', 'our froide qu’elle soit, l’Alaska n’est pas aussi septentrionale qu’on pourrait le penser. Le cercle polaire ne passe que dans son tiers supérieur nord, un bon 200 km au-delà de Fairbanks. C’est alors, seulement, que l’on peut véritablement parler de soleil de minuit et de nuits blanches - même si 23h de luminosité en juin à Fairbanks n’est déjà pas si mal !\r\n\r\nEn réalité, même à l’extrême nord de l’Alaska, la nuit n’est jamais complète, car le soleil y réverbère encore sous l’horizon. La lune se reflète également sur la neige et la glace, et les aurores boréales repeignent le ciel de leurs faisceaux colorés.\r\n\r\nCorollaire de longues journées d’été, les journées d’hiver sont très courtes : environ 5h de jour plus ou moins clair à Anchorage en décembre. À Barrow, le soleil se couche carrément le 16 novembre pour se lever à nouveau le... 23 janvier !', '2019-03-22 15:28:01', '2019-03-22 15:28:01', ''),
(9, 'Jean Forteroche', 'Chapitre 6 : Blanket toss', 'En d’autres termes, le « saut en couverture ». Une vingtaine, jusqu’à une trentaine de personnes soutiennent une tenture en peau de morse, sur laquelle rebondit un sauteur. L’ancêtre du trampoline, en quelque sorte. \r\nMarrant, sans doute, mais pas uniquement : à l’origine, selon certains, la technique aurait servi aux chasseurs des villages de l’Arctique pour repérer les baleines croisant au large. Les meilleurs sauteurs peuvent atteindre près de 10 m de haut !\r\n\r\nAujourd’hui, le blanket toss (nalukataq) se pratique dans tous les festivals inuit et, bien sûr, aux World Eskimo Indian Olympics - aux côtés d’autres épreuves originales comme le saut à genoux (avec atterrissage obligatoire sur les pieds), la course sur le sol en imitant le phoque et le porter de poids avec les oreilles...\r\n\r\nEn d’autres termes, le « saut en couverture ». Une vingtaine, jusqu’à une trentaine de personnes soutiennent une tenture en peau de morse, sur laquelle rebondit un sauteur. L’ancêtre du trampoline, en quelque sorte. \r\nMarrant, sans doute, mais pas uniquement : à l’origine, selon certains, la technique aurait servi aux chasseurs des villages de l’Arctique pour repérer les baleines croisant au large. Les meilleurs sauteurs peuvent atteindre près de 10 m de haut !\r\n\r\nAujourd’hui, le blanket toss (nalukataq) se pratique dans tous les festivals inuit et, bien sûr, aux World Eskimo Indian Olympics - aux côtés d’autres épreuves originales comme le saut à genoux (avec atterrissage obligatoire sur les pieds), la course sur le sol en imitant le phoque et le porter de poids avec les oreilles...', '2019-03-22 15:28:09', '2019-03-22 15:28:09', ''),
(11, 'Jean Forteroche', 'Chapitre 8 : Incontournables Alaska', 'Marcher dans les rues d’Anchorage, et pourquoi pas croiser un grizzly ou un ours noir. Arriver en bateau à Juneau et se sentir le frisson des premiers chercheurs d’or. Marcher dans l’immensité presque vierge du Wrangell St. Elias National Park et se sentir tout petit entre ses sommets enneigés. Se mesurer au Mont Kinley, le plus grand sommet d’Amérique du Nord. Marcher le nez en l’air dans Haines, pour apercevoir les aigles chauves posés dans les sapins. Partir pour une journée de pêche à Petersburg. Observer toutes sortes d’animaux marins dans la péninsule de Kenai, et notamment des baleines. Camper dans le Denali National Park.\r\n\r\nMarcher dans les rues d’Anchorage, et pourquoi pas croiser un grizzly ou un ours noir. Arriver en bateau à Juneau et se sentir le frisson des premiers chercheurs d’or. Marcher dans l’immensité presque vierge du Wrangell St. Elias National Park et se sentir tout petit entre ses sommets enneigés. Se mesurer au Mont Kinley, le plus grand sommet d’Amérique du Nord. Marcher le nez en l’air dans Haines, pour apercevoir les aigles chauves posés dans les sapins. Partir pour une journée de pêche à Petersburg. Observer toutes sortes d’animaux marins dans la péninsule de Kenai, et notamment des baleines. Camper dans le Denali National Park.\r\n\r\nMarcher dans les rues d’Anchorage, et pourquoi pas croiser un grizzly ou un ours noir. Arriver en bateau à Juneau et se sentir le frisson des premiers chercheurs d’or. Marcher dans l’immensité presque vierge du Wrangell St. Elias National Park et se sentir tout petit entre ses sommets enneigés. Se mesurer au Mont Kinley, le plus grand sommet d’Amérique du Nord. Marcher le nez en l’air dans Haines, pour apercevoir les aigles chauves posés dans les sapins. Partir pour une journée de pêche à Petersburg. Observer toutes sortes d’animaux marins dans la péninsule de Kenai, et notamment des baleines. Camper dans le Denali National Park.', '2019-03-27 20:08:53', '2019-03-22 20:08:53', ''),
(17, 'Jean Forteroche', 'Chapitre 9 : Prince William Sound Alaska', 'Prince William Sound est une baie située sur la côte orientale de la péninsule de Kenaï qui est entourée par les montagnes Chugach à l\'est, à l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites îles et des fjords. Le plus grand port de cette baie est Valdez.\n\nPrince William Sound est une baie située sur la côte orientale de la péninsule de Kenaï qui est entourée par les montagnes Chugach à l\'est, à l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites îles et des fjords. Le plus grand port de cette baie est Valdez.\n\nPrince William Sound est une baie située sur la côte orientale de la péninsule de Kenaï qui est entourée par les montagnes Chugach à l\'est, à l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites îles et des fjords. Le plus grand port de cette baie est Valdez.\n\nPrince William Sound est une baie située sur la côte orientale de la péninsule de Kenaï qui est entourée par les montagnes Chugach à l\'est, à l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites îles et des fjords. Le plus grand port de cette baie est Valdez.\n\nPrince William Sound est une baie située sur la côte orientale de la péninsule de Kenaï qui est entourée par les montagnes Chugach à l\'est, à l\'ouest et au nord et par le glacier Columbia. Son littoral est chaotique, avec de nombreuses petites îles et des fjords. Le plus grand port de cette baie est Valdez.', '2019-03-27 08:35:18', '2019-03-24 10:01:17', ''),
(18, 'Jean Forteroche', 'Chapitre 10 : Le parc national de Denali', 'L’image du mont McKinley, dressé tel un gigantesque gâteau blanc tutoyant les nuages, se reflétant dans Wonder Lake, a fait le tour du monde. Oui, mais... Le mont McKinley ne se voit pas depuis l’entrée du parc de Denali, distante de plus de 100 km. Une route part dans sa direction, mais les voitures particulières ne peuvent l’emprunter que sur 15 miles. Là, entre deux pentes, un petit bout de McKinley dépasse et c’est tout.\r\n\r\nsalaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaam\r\n\r\nLes bus descendent le long de l’unique piste qui pénètre dans le parc, en s’arrêtant (plus ou moins longtemps selon l’humeur du chauffeur) à chaque fois que des animaux montrent le bout de leur nez. Bref, c’est très aléatoire et le trajet aller et retour est franchement fatigant pour une balade dans la journée (8h aller-retour jusqu’au Visitor Center, 11h jusqu’au lac).\r\n\r\nEn conclusion : prévoyez de camper dans l’intérieur du parc (et non pas juste à l’entrée) et d’y rester plusieurs jours. Les campeurs et randonneurs bénéficient d’ailleurs de bus spéciaux.\r\n\r\nL’image du mont McKinley, dressé tel un gigantesque gâteau blanc tutoyant les nuages, se reflétant dans Wonder Lake, a fait le tour du monde. Oui, mais... Le mont McKinley ne se voit pas depuis l’entrée du parc de Denali, distante de plus de 100 km. Une route part dans sa direction, mais les voitures particulières ne peuvent l’emprunter que sur 15 miles. Là, entre deux pentes, un petit bout de McKinley dépasse et c’est tout.\r\n\r\nPour aller plus loin, il faut emprunter l’un des bus du parc. Il faut réserver (possible en ligne) et payer. À l’été 2014, il en coûte 35 $ par personne pour le circuit de 8h aller-retour du départ du Visitor Center d’Eielson (gratuit pour les enfants jusqu’à 15 ans), 48 $ pour le trajet jusqu\'au Wonder Lake. Certains réservent longtemps à l’avance par mesure de précaution.\r\n\r\nLes bus descendent le long de l’unique piste qui pénètre dans le parc, en s’arrêtant (plus ou moins longtemps selon l’humeur du chauffeur) à chaque fois que des animaux montrent le bout de leur nez. Bref, c’est très aléatoire et le trajet aller et retour est franchement fatigant pour une balade dans la journée (8h aller-retour jusqu’au Visitor Center, 11h jusqu’au lac).\r\n\r\nEn conclusion : prévoyez de camper dans l’intérieur du parc (et non pas juste à l’entrée) et d’y rester plusieurs jours. Les campeurs et randonneurs bénéficient d’ailleurs de bus spéciaux.\r\n\r\nL’image du mont McKinley, dressé tel un gigantesque gâteau blanc tutoyant les nuages, se reflétant dans Wonder Lake, a fait le tour du monde. Oui, mais... Le mont McKinley ne se voit pas depuis l’entrée du parc de Denali, distante de plus de 100 km. Une route part dans sa direction, mais les voitures particulières ne peuvent l’emprunter que sur 15 miles. Là, entre deux pentes, un petit bout de McKinley dépasse et c’est tout.\r\n\r\nPour aller plus loin, il faut emprunter l’un des bus du parc. Il faut réserver (possible en ligne) et payer. À l’été 2014, il en coûte 35 $ par personne pour le circuit de 8h aller-retour du départ du Visitor Center d’Eielson (gratuit pour les enfants jusqu’à 15 ans), 48 $ pour le trajet jusqu\'au Wonder Lake. Certains réservent longtemps à l’avance par mesure de précaution.\r\n\r\nLes bus descendent le long de l’unique piste qui pénètre dans le parc, en s’arrêtant (plus ou moins longtemps selon l’humeur du chauffeur) à chaque fois que des animaux montrent le bout de leur nez. Bref, c’est très aléatoire et le trajet aller et retour est franchement fatigant pour une balade dans la journée (8h aller-retour jusqu’au Visitor Center, 11h jusqu’au lac).\r\n\r\nEn conclusion : prévoyez de camper dans l’intérieur du parc (et non pas juste à l’entrée) et d’y rester plusieurs jours. Les campeurs et randonneurs bénéficient d’ailleurs de bus spéciaux.', '2019-03-27 09:09:48', '2019-04-02 18:55:14', ''),
(20, 'Jean Forteroche', 'Chapitre 11 : Le sud-est de l\'Alaska', 'Hyder, Haines et Skagway sont desservis par des routes en cul-de-sac venant de Colombie-Britannique voisine, mais tous les autres lieux ne peuvent être atteints qu’en ferry ou en avion. Faites votre choix !\r\nKetchikan : l’ex « capitale mondiale du saumon », née en 1883, s’amarre au littoral occidental d’une grosse île montagneuse à peine séparée du continent. Très humide (la bruine peut s’y installer des jours durant), elle est néanmoins attachante avec les bâtiments en bois sur pilotis de Creek Street, ses trois ports et ses totems tlingit (il y en a de superbes aux environs). Intéressante escale à la Deer Mountain Hatchery, une écloserie de saumons. Les fjords et la forêt de Tongass invitent à de belles randos et explorations en kayak.\r\n\r\nHyder, Haines et Skagway sont desservis par des routes en cul-de-sac venant de Colombie-Britannique voisine, mais tous les autres lieux ne peuvent être atteints qu’en ferry ou en avion. Faites votre choix !\r\nKetchikan : l’ex « capitale mondiale du saumon », née en 1883, s’amarre au littoral occidental d’une grosse île montagneuse à peine séparée du continent. Très humide (la bruine peut s’y installer des jours durant), elle est néanmoins attachante avec les bâtiments en bois sur pilotis de Creek Street, ses trois ports et ses totems tlingit (il y en a de superbes aux environs). Intéressante escale à la Deer Mountain Hatchery, une écloserie de saumons. Les fjords et la forêt de Tongass invitent à de belles randos et explorations en kayak.\r\n', '2019-03-27 10:23:46', '2019-03-25 10:23:46', ''),
(21, 'Jean Forteroche', 'Chapitre 12 : Misty Fjords National Monument ', 'Wrangell : fondée par les Russes en 1834, Wrangell vit surtout du bois et de la pêche. On y trouve un musée, des totems, des pétroglyphes à proximité et même... un golf (le seul de la région) ! Dans le port, l’île du chef Shakes abrite une belle reconstruction d’une demeure de chef tlingit. À 35 miles au sud-est, ne ratez pas l’extraordinaire observatoire d’Anan, mis en place par l’US Forest Service dans la forêt de Tongass. En été, ours noirs et bruns s’y retrouvent pour pêcher les saumons alors qu’ils tentent de remonter une chute.\r\n\r\nPetersburg : entre Wrangell et Petersburg, le ferry emprunte une section particulièrement étroite et photogénique de l’Inside Passage, baptisée Wrangell Narrows. Très attachée à la pêche au flétan (les prises record atteignent 200 kilos !), la petite ville entretient avec bonhomie la mémoire de ses racines norvégiennes lors d’un festival coloré le 17 mai. On y trouve les classiques, un port coloré et un musée local, ainsi qu’un centre d’info sur les mammifères marins. L’été, les baleines à bosse se regroupent à 50 km vers le nord (excursions).\r\n\r\nAdmiralty Island National Monument : l’île, qui ne compte qu’un seul village (tlingit), abrite la plus grande concentration au monde d’ours bruns. Ils sont davantage sur cette seule île que dans tous les États-Unis continentaux ! L’été, ils festoient lors des remontées de saumons, en particulier dans le Pack Creek Bear Refuge, sur la côte orientale. Les aigles chauves sont aussi particulièrement nombreux. Les amateurs de canoë trouveront un bel itinéraire de 53 km entrecoupé de portages (le plus long sur 5 km !).', '2019-03-27 10:23:52', '2019-03-25 10:23:52', ''),
(78, 'Jean Forteroche', 'hello', 'heloo', '2019-05-06 15:11:47', '2019-05-06 15:11:47', '5cd040a3bd490.jpg');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
