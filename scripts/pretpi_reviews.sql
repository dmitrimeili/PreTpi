-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pretpi
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
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
  KEY `fk_Reviews_VideoGames1_idx` (`VideoGames_id`),
  CONSTRAINT `fk_Reviews_Books1` FOREIGN KEY (`Books_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_Reviews_Films1` FOREIGN KEY (`Films_id`) REFERENCES `films` (`id`),
  CONSTRAINT `fk_Reviews_Series1` FOREIGN KEY (`Series_id`) REFERENCES `series` (`id`),
  CONSTRAINT `fk_Reviews_Users` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_Reviews_VideoGames1` FOREIGN KEY (`VideoGames_id`) REFERENCES `videogames` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-14 10:49:20
