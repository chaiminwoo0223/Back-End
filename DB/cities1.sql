CREATE DATABASE  IF NOT EXISTS `cities1` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cities1`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: cities
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `districtId` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `population` int NOT NULL,
  `area` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_City_District` (`districtId`),
  CONSTRAINT `FK_City_District` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'강릉시',215677,1041),(2,1,'동해시',90255,180),(3,1,'삼척시',69509,1188),(4,1,'속초시',79846,106),(5,1,'원주시',330854,868),(6,1,'춘천시',281596,1116),(7,1,'태백시',46715,304),(8,2,'과천시',64817,36),(9,2,'광명시',338509,39),(10,2,'광주시',310278,0),(11,2,'구리시',180063,33),(12,2,'군포시',285721,36),(13,2,'김포시',352683,277),(14,2,'남양주시',629061,458),(15,2,'동두천시',97424,96),(16,2,'부천시',843794,53),(17,2,'성남시',948757,142),(18,2,'시흥시',425184,139),(19,2,'안산시',747035,156),(20,2,'안성시',194765,553),(21,2,'안양시',585177,58),(22,2,'양주시',205988,310),(23,2,'여주시',109937,608),(24,2,'오산시',213840,43),(25,2,'용인시',971327,591),(26,2,'의왕시',154879,54),(27,2,'의정부시',421579,82),(28,2,'이천시',209003,461),(29,2,'파주시',415345,672),(30,2,'평택시',457873,458),(31,2,'포천시',163388,827),(32,2,'하남시',154838,93),(33,2,'화성시',608725,698),(34,3,'거제시',261371,403),(35,3,'김해시',534124,463),(36,3,'밀양시',103069,799),(37,3,'사천시',113335,399),(38,3,'양산시',297532,486),(39,3,'진주시',349788,713),(40,3,'통영시',137208,240),(41,4,'경산시',278500,412),(42,4,'경주시',262310,1325),(43,4,'구미시',421075,615),(44,4,'김천시',137540,1010),(45,4,'문경시',71863,912),(46,4,'상주시',98760,1255),(47,4,'안동시',168581,1522),(48,4,'영주시',109266,670),(49,4,'영천시',97669,919),(50,4,'포항시',511804,1130),(51,2,'고양시',990073,268),(52,10,'광주광역시',1502881,431),(53,10,'대구광역시',2466052,0),(54,10,'대전광역시',1538394,0),(55,10,'부산광역시',3448737,0),(56,10,'서울특별시',9904312,0),(57,10,'세종특별자치시',204088,465),(58,2,'수원시',1194313,121),(59,10,'울산광역시',1166615,0),(60,10,'인천광역시',2890451,0),(61,5,'광양시',144414,463),(62,5,'나주시',92582,608),(63,5,'목포시',239524,52),(64,5,'순천시',265390,911),(65,5,'여수시',273761,512),(66,6,'군산시',275155,397),(67,6,'김제시',84269,546),(68,6,'남원시',80499,752),(69,6,'익산시',301723,507),(70,6,'전주시',658172,206),(71,6,'정읍시',110627,693),(72,9,'서귀포시',153861,872),(73,9,'제주시',451758,979),(74,3,'창원시',1059241,748),(75,7,'계룡시',39243,61),(76,7,'공주시',113542,868),(77,7,'논산시',124246,556),(78,7,'당진시',163762,705),(79,7,'보령시',101852,587),(80,7,'서산시',169221,742),(81,7,'아산시',319929,543),(82,7,'천안시',629062,636),(83,8,'제천시',136350,883),(84,8,'청주시',833276,941),(85,8,'충주시',211005,983);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `districtName` varchar(45) NOT NULL,
  `population` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'강원도',1520127,16828),(2,'경기도',13300900,10188),(3,'경상남도',3347209,10540),(4,'경상북도',2668154,19033),(5,'전라남도',1787543,12344),(6,'전라북도',1807423,8069),(7,'충청남도',2188649,8229),(8,'충청북도',1629343,7409),(9,'제주특별자치도',665048,1850),(10,'광역시',0,0);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-30  5:15:13
