-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.28 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour pretpi
DROP DATABASE IF EXISTS `pretpi`;
CREATE DATABASE IF NOT EXISTS `pretpi` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pretpi`;

-- Listage de la structure de la table pretpi. authors
DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.authors : ~0 rows (environ)
DELETE FROM `authors`;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. bookcategories
DROP TABLE IF EXISTS `bookcategories`;
CREATE TABLE IF NOT EXISTS `bookcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre_UNIQUE` (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.bookcategories : ~0 rows (environ)
DELETE FROM `bookcategories`;
/*!40000 ALTER TABLE `bookcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookcategories` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. bookcategories_classifies_books
DROP TABLE IF EXISTS `bookcategories_classifies_books`;
CREATE TABLE IF NOT EXISTS `bookcategories_classifies_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BookCategories_id` int NOT NULL,
  `Books_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BookCategories_has_Books_Books1_idx` (`Books_id`),
  KEY `fk_BookCategories_has_Books_BookCategories1_idx` (`BookCategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.bookcategories_classifies_books : ~0 rows (environ)
DELETE FROM `bookcategories_classifies_books`;
/*!40000 ALTER TABLE `bookcategories_classifies_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookcategories_classifies_books` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `Authors_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_Books_Authors1_idx` (`Authors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.books : ~0 rows (environ)
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. creators
DROP TABLE IF EXISTS `creators`;
CREATE TABLE IF NOT EXISTS `creators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`firstname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.creators : ~0 rows (environ)
DELETE FROM `creators`;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` (`id`, `firstname`, `lastname`) VALUES
	(1, 'James', 'Cameron'),
	(2, 'Roderick', 'Thorp');
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. developers
DROP TABLE IF EXISTS `developers`;
CREATE TABLE IF NOT EXISTS `developers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `companyname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyname_UNIQUE` (`companyname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.developers : ~2 rows (environ)
DELETE FROM `developers`;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` (`id`, `companyname`) VALUES
	(1, '343 Industries'),
	(2, 'Treyarch');
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. films
DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `releasedate` date DEFAULT NULL,
  `Creators_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`name`),
  KEY `fk_Films_Creators1_idx` (`Creators_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.films : ~2 rows (environ)
DELETE FROM `films`;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` (`id`, `name`, `releasedate`, `Creators_id`) VALUES
	(1, 'Titanic', '1997-11-01', 1),
	(2, 'Die Hard Piege de cristal', '1988-07-22', 2);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. mediacategories
DROP TABLE IF EXISTS `mediacategories`;
CREATE TABLE IF NOT EXISTS `mediacategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre_UNIQUE` (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.mediacategories : ~0 rows (environ)
DELETE FROM `mediacategories`;
/*!40000 ALTER TABLE `mediacategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediacategories` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. mediacategories_classifies_films
DROP TABLE IF EXISTS `mediacategories_classifies_films`;
CREATE TABLE IF NOT EXISTS `mediacategories_classifies_films` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Films_id` int NOT NULL,
  `MediaCategories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Films_has_MediaCategories_MediaCategories1_idx` (`MediaCategories_id`),
  KEY `fk_Films_has_MediaCategories_Films1_idx` (`Films_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.mediacategories_classifies_films : ~0 rows (environ)
DELETE FROM `mediacategories_classifies_films`;
/*!40000 ALTER TABLE `mediacategories_classifies_films` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediacategories_classifies_films` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. mediacategories_classifies_series
DROP TABLE IF EXISTS `mediacategories_classifies_series`;
CREATE TABLE IF NOT EXISTS `mediacategories_classifies_series` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Series_id` int NOT NULL,
  `MediaCategories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Series_has_MediaCategories_MediaCategories1_idx` (`MediaCategories_id`),
  KEY `fk_Series_has_MediaCategories_Series1_idx` (`Series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.mediacategories_classifies_series : ~0 rows (environ)
DELETE FROM `mediacategories_classifies_series`;
/*!40000 ALTER TABLE `mediacategories_classifies_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediacategories_classifies_series` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. platforms
DROP TABLE IF EXISTS `platforms`;
CREATE TABLE IF NOT EXISTS `platforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.platforms : ~11 rows (environ)
DELETE FROM `platforms`;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` (`id`, `type`) VALUES
	(1, 'PC'),
	(6, 'PS1'),
	(5, 'PS2'),
	(4, 'PS3'),
	(3, 'PS4'),
	(2, 'PS5'),
	(11, 'Switch'),
	(10, 'Xbox'),
	(9, 'Xbox 360'),
	(8, 'Xbox One'),
	(7, 'Xbox Series X/S');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `review` varchar(500) NOT NULL,
  `rating` int NOT NULL,
  `date` date NOT NULL,
  `approuved` tinyint NOT NULL,
  `Users_id` int NOT NULL,
  `Books_id` int DEFAULT NULL,
  `Series_id` int DEFAULT NULL,
  `Films_id` int DEFAULT NULL,
  `VideoGames_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueItem` (`title`),
  KEY `fk_Reviews_Users_idx` (`Users_id`),
  KEY `fk_Reviews_Books1_idx` (`Books_id`),
  KEY `fk_Reviews_Series1_idx` (`Series_id`),
  KEY `fk_Reviews_Films1_idx` (`Films_id`),
  KEY `fk_Reviews_VideoGames1_idx` (`VideoGames_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.reviews : ~12 rows (environ)
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `title`, `review`, `rating`, `date`, `approuved`, `Users_id`, `Books_id`, `Series_id`, `Films_id`, `VideoGames_id`) VALUES
	(1, 'Critique Titanic', 'J\'adore l\'histoire d\'amour', 4, '2022-03-14', 1, 5, NULL, NULL, 1, NULL),
	(2, 'Die hard 1', 'trop bien ', 5, '2022-02-10', 1, 6, NULL, NULL, 2, NULL),
	(3, 'Halo 5', 'le multi est un peut bugger ', 3, '2021-12-17', 1, 5, NULL, NULL, NULL, 1),
	(4, 'Black ops 2 mamen', 'Le meilleur jeux du mondeeee !!!!', 5, '2013-02-01', 1, 5, NULL, NULL, NULL, 2),
	(5, 'Halo 5 nulll', 'vraiment un mauvais jeux', 5, '2022-03-24', 1, 5, NULL, NULL, NULL, 1),
	(10, 'Blak ops 2 ', 'tres bon jeux manque d\'arme', 4, '2022-03-25', 0, 5, NULL, NULL, NULL, 2),
	(11, 'fgrtsgst', 'stdhgstghstg', 3, '2022-03-25', 1, 5, NULL, NULL, NULL, 1),
	(12, 'test', 'test &#039; test', 3, '2022-03-25', 1, 5, NULL, NULL, NULL, 1),
	(13, 'Tesrt halo 5 plutot cool', 'j&#039;ai beaucoup aimer le gameplay .', 5, '2022-03-28', 0, 11, NULL, NULL, NULL, 1),
	(14, 'fhuibfdbsvd&lt;fd', 'gwfeagzvdgilvhgvghvbvvdbhvf', 5, '2022-03-28', 1, 5, NULL, NULL, NULL, 2),
	(15, 'test not approuved', 'test', 5, '2022-03-28', 0, 5, NULL, NULL, NULL, 1),
	(16, 'testtesttetsds', 'tetstetdtsdt', 3, '2022-03-28', 1, 11, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.roles : ~2 rows (environ)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`) VALUES
	(1, 'Admin'),
	(2, 'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. series
DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `releasedate` date DEFAULT NULL,
  `season` int DEFAULT NULL,
  `Creators_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`name`),
  KEY `fk_Series_Creators1_idx` (`Creators_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.series : ~0 rows (environ)
DELETE FROM `series`;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(60) NOT NULL,
  `Blocked` tinyint NOT NULL,
  `Roles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Users_Roles1_idx` (`Roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.users : ~10 rows (environ)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `Blocked`, `Roles_id`) VALUES
	(2, 'test', 'test', 'test', '$2y$10$canoczP5sfahqI2lVXbVl.pZ1i2hzj6Jiuty4GO/FF/yOwPGvt21.', 1, 2),
	(3, 'test1', 'test1', 'test1', '$2y$10$SSM9TZFwRiU9R3.rxaQEI.XkgmHujJZUQJaRMz5/Nx16Hd/GbNK0y', 0, 2),
	(4, '', '', '', '$2y$10$4yPLVL3W07TKFM/yQeZxhuVP8C.BN3yje93KKbqKAcoGOZmzkTDY2', 1, 2),
	(5, 'Dmitri', 'Meili', 'dmitri.meili@cpnv.ch', '$2y$10$DDlWTBnGWyX.JsJUEERK8eR4QhUTA/KdINgTrgckEvL3hrLS6C4Xy', 0, 1),
	(6, 'Marwan', 'Alhelo', 'marwan.alehlo@cpnv.ch', '$2y$10$KHlRvIbVYG18/IkZZDToC.Fb4cO8KlaN.KRjMvGUG/7VxrOV6yL72', 1, 2),
	(7, 'dm', 'dm', 'dm', '$2y$10$udnXfRhsFt9xh2kugblfY.70kXzjTfA.Tu3hzNCx7uHcP53bjh7g6', 0, 2),
	(8, 'test2', 'test2', 'test2', '$2y$10$06EqwuhaWQ1VpJy665/y6u3kwIbhFrGIpxd0D.EqN3D.vOrgHWI7O', 1, 2),
	(9, 'loic', 'pedro', 'loic', '$2y$10$maJeMS1nKRkFQasfeCPOC.Dy/WfYLmFAdxQ2uWwyWLcsO4pjxzBzu', 1, 2),
	(10, 'test3', 'test3', 'test3', '$2y$10$oW1BWCEm4YNADBCPkbpIMuUqOmAnOALndcbGA6P4MHd08BzFh9RUO', 0, 2),
	(11, 'test', 'test', 'test@test.com', '$2y$10$XFfRjizxEeVh7hHIsXsT2uMh/V8xnA5zAXDIRMOnuO1t1A1Tmcqyy', 1, 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. videogamecategories
DROP TABLE IF EXISTS `videogamecategories`;
CREATE TABLE IF NOT EXISTS `videogamecategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Genre_UNIQUE` (`Genre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.videogamecategories : ~12 rows (environ)
DELETE FROM `videogamecategories`;
/*!40000 ALTER TABLE `videogamecategories` DISABLE KEYS */;
INSERT INTO `videogamecategories` (`id`, `Genre`) VALUES
	(1, 'Action'),
	(3, 'Action-Aventure'),
	(2, 'Aventure'),
	(10, 'Idle'),
	(12, 'MMORPG'),
	(5, 'MOBA'),
	(8, 'Puzzle'),
	(4, 'RPG'),
	(11, 'RTS'),
	(6, 'Simulation'),
	(7, 'Sport'),
	(9, 'Strategie');
/*!40000 ALTER TABLE `videogamecategories` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. videogamecategories_classifies_videogames
DROP TABLE IF EXISTS `videogamecategories_classifies_videogames`;
CREATE TABLE IF NOT EXISTS `videogamecategories_classifies_videogames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VideoGames_id` int NOT NULL,
  `VideoGameCategories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_VideoGames_has_VideoGameCategories_VideoGameCategories1_idx` (`VideoGameCategories_id`),
  KEY `fk_VideoGames_has_VideoGameCategories_VideoGames1_idx` (`VideoGames_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.videogamecategories_classifies_videogames : ~2 rows (environ)
DELETE FROM `videogamecategories_classifies_videogames`;
/*!40000 ALTER TABLE `videogamecategories_classifies_videogames` DISABLE KEYS */;
INSERT INTO `videogamecategories_classifies_videogames` (`id`, `VideoGames_id`, `VideoGameCategories_id`) VALUES
	(1, 2, 4),
	(2, 2, 9),
	(3, 1, 8);
/*!40000 ALTER TABLE `videogamecategories_classifies_videogames` ENABLE KEYS */;

-- Listage de la structure de la table pretpi. videogames
DROP TABLE IF EXISTS `videogames`;
CREATE TABLE IF NOT EXISTS `videogames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `releasedate` date DEFAULT NULL,
  `Developers_id` int NOT NULL,
  `Platforms_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`name`),
  KEY `fk_VideoGames_Devloppers1_idx` (`Developers_id`),
  KEY `fk_VideoGames_Platforms1_idx` (`Platforms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table pretpi.videogames : ~2 rows (environ)
DELETE FROM `videogames`;
/*!40000 ALTER TABLE `videogames` DISABLE KEYS */;
INSERT INTO `videogames` (`id`, `name`, `releasedate`, `Developers_id`, `Platforms_id`) VALUES
	(1, 'Halo 5: Guardians', '2015-10-27', 1, 8),
	(2, 'Call of Duty: Black ops 2', '2012-11-12', 2, 4);
/*!40000 ALTER TABLE `videogames` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
