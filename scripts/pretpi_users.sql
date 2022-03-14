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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(60) NOT NULL,
  `Blocked` tinyint NOT NULL,
  `Roles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Users_Roles1_idx` (`Roles_id`),
  CONSTRAINT `fk_Users_Roles1` FOREIGN KEY (`Roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'test','test','test','$2y$10$canoczP5sfahqI2lVXbVl.pZ1i2hzj6Jiuty4GO/FF/yOwPGvt21.',0,2),(3,'test1','test1','test1','$2y$10$SSM9TZFwRiU9R3.rxaQEI.XkgmHujJZUQJaRMz5/Nx16Hd/GbNK0y',0,2),(4,'','','','$2y$10$4yPLVL3W07TKFM/yQeZxhuVP8C.BN3yje93KKbqKAcoGOZmzkTDY2',0,2),(5,'Dmitri','Meili','dmitri.meili@cpnv.ch','$2y$10$DDlWTBnGWyX.JsJUEERK8eR4QhUTA/KdINgTrgckEvL3hrLS6C4Xy',0,2),(6,'Marwan','Alhelo','marwan.alehlo@cpnv.ch','$2y$10$KHlRvIbVYG18/IkZZDToC.Fb4cO8KlaN.KRjMvGUG/7VxrOV6yL72',0,2),(7,'dm','dm','dm','$2y$10$udnXfRhsFt9xh2kugblfY.70kXzjTfA.Tu3hzNCx7uHcP53bjh7g6',0,2),(8,'test2','test2','test2','$2y$10$06EqwuhaWQ1VpJy665/y6u3kwIbhFrGIpxd0D.EqN3D.vOrgHWI7O',0,2),(9,'loic','pedro','loic','$2y$10$maJeMS1nKRkFQasfeCPOC.Dy/WfYLmFAdxQ2uWwyWLcsO4pjxzBzu',0,2),(10,'test3','test3','test3','$2y$10$oW1BWCEm4YNADBCPkbpIMuUqOmAnOALndcbGA6P4MHd08BzFh9RUO',0,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
