-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: proiect_pibd
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `concurs`
--

DROP TABLE IF EXISTS `concurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concurs` (
  `idconcurs` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idprofesor` bigint unsigned DEFAULT NULL,
  `idcatedra` bigint unsigned DEFAULT NULL,
  `Disciplina_Examen` varchar(90) DEFAULT NULL,
  `Medie_Examen` float DEFAULT NULL,
  `Medie_Departajare` float DEFAULT NULL,
  `Medie_Bacalaureat` float DEFAULT NULL,
  `Grad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idconcurs`),
  KEY `fk_concurs_1_idx` (`idprofesor`),
  KEY `fk_concurs_2_idx` (`idcatedra`),
  CONSTRAINT `fk_concurs_1` FOREIGN KEY (`idprofesor`) REFERENCES `profesori` (`idprofesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_concurs_2` FOREIGN KEY (`idcatedra`) REFERENCES `catedre` (`idcatedra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurs`
--

LOCK TABLES `concurs` WRITE;
/*!40000 ALTER TABLE `concurs` DISABLE KEYS */;
INSERT INTO `concurs` VALUES (27,41,1,'Fizica',9,9,9,'II');
/*!40000 ALTER TABLE `concurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 13:39:02
