-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: student2
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `student2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `student2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `student2`;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'소프트웨어공학과','소프','02-2610-9563'),(2,'컴퓨터공학과','컴공','02-2610-9565'),(3,'정보통신공학과','정통','02-2610-9568'),(4,'글로컬IT공학과','글티','02-2610-9569');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `professorId` int NOT NULL,
  `year` int NOT NULL,
  `semester` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Lecture_Professor_idx` (`professorId`),
  CONSTRAINT `FK_Lecture_Professor` FOREIGN KEY (`professorId`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'Java프로그래밍',11,2018,'1학기','6202'),(2,'자료구조',12,2018,'1학기','6201'),(3,'알고리즘',12,2018,'1학기','6404'),(4,'인공지능',14,2018,'1학기','6405'),(5,'이산수학',14,2018,'2학기','6203'),(6,'데이터베이스',11,2018,'2학기','6202'),(7,'운영체제',13,2018,'2학기','6202'),(8,'빅데이터',13,2018,'2학기','6405'),(9,'Java프로그래밍',11,2019,'1학기','6202'),(10,'자료구조',12,2019,'1학기','6201'),(11,'알고리즘',12,2019,'1학기','6404'),(12,'인공지능',14,2019,'1학기','6405'),(13,'이산수학',14,2019,'2학기','6203'),(14,'데이터베이스',11,2019,'2학기','6202'),(15,'운영체제',13,2019,'2학기','6202'),(16,'빅데이터',13,2019,'2학기','6405');
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `office` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Professor_Department_idx` (`departmentId`),
  CONSTRAINT `FK_Professor_Department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (11,'이몽룡',1,'010-2814-3032','lee@skhu.ac.kr','6301'),(12,'전우치',2,'010-4534-2911','jeon@skhu.ac.kr','6302'),(13,'장보고',3,'010-3043-8635','jang@skhu.ac.kr','6304'),(14,'심청',4,'010-5891-6332','sim@skhu.ac.kr','6305');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentNo` varchar(45) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Student_Department_idx` (`departmentId`),
  CONSTRAINT `FK_Student_Department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'201532006','최하은',1,'010-4361-1145','여','choi064@skhu.ac.kr'),(2,'201532007','김진영',3,'010-3415-1238','남','kim073@skhu.ac.kr'),(3,'201532008','나철진',3,'010-8703-1239','남','na088@skhu.ac.kr'),(4,'201532009','이익수',4,'010-7875-1251','남','lee097@skhu.ac.kr'),(5,'201532010','이제문',1,'010-7700-1333','남','lee107@skhu.ac.kr'),(6,'201532011','김영우',1,'010-2090-1421','남','kim112@skhu.ac.kr'),(7,'201532012','주한요',3,'010-4624-1467','남','joo124@skhu.ac.kr'),(8,'201532013','김숙홍',1,'010-3791-1522','남','kim133@skhu.ac.kr'),(9,'201532014','홍영수',4,'010-2897-1525','남','hong142@skhu.ac.kr'),(10,'201532015','박원종',1,'010-7655-1724','남','park157@skhu.ac.kr'),(11,'201432015','변준호',1,'010-2245-1750','남','byeon152@skhu.ac.kr'),(12,'201532016','고희정',3,'010-5691-1943','여','ko165@skhu.ac.kr'),(13,'201432016','신철대',4,'010-3221-1956','남','sin163@skhu.ac.kr'),(14,'201532017','서윤정',3,'010-4310-1965','여','seo174@skhu.ac.kr'),(15,'201432017','오화순',3,'010-8527-2048','여','oh178@skhu.ac.kr'),(16,'201532018','박재인',1,'010-2616-2144','남','park182@skhu.ac.kr'),(17,'201532019','최현복',2,'010-7312-2171','남','choi197@skhu.ac.kr'),(18,'201432019','임봉영',2,'010-7475-2192','남','lim197@skhu.ac.kr'),(19,'201532020','장영만',2,'010-1527-2270','남','jang201@skhu.ac.kr'),(20,'201432020','박주용',4,'010-1640-2396','남','park201@skhu.ac.kr'),(21,'201532021','황하지',2,'010-6682-2463','남','hwang216@skhu.ac.kr'),(22,'201532022','유환치',4,'010-3951-2464','남','yu223@skhu.ac.kr'),(23,'201532023','성희지',1,'010-4267-2555','남','seong234@skhu.ac.kr'),(24,'201532024','박철용',3,'010-2135-2585','남','park242@skhu.ac.kr'),(25,'201532025','이주연',4,'010-7775-2588','남','lee257@skhu.ac.kr'),(26,'201532026','김철지',2,'010-1611-2712','남','kim261@skhu.ac.kr'),(27,'201532027','이화상',4,'010-2703-2794','남','lee272@skhu.ac.kr'),(28,'201532028','백영규',3,'010-6971-2845','남','pak286@skhu.ac.kr'),(29,'201532029','김화인',4,'010-6683-2856','여','kim296@skhu.ac.kr'),(30,'201532030','김만기',1,'010-4194-2860','남','kim304@skhu.ac.kr'),(31,'201632006','김진우',4,'010-3031-2894','남','kim063@skhu.ac.kr'),(32,'201632007','박남영',2,'010-8388-2997','남','park078@skhu.ac.kr'),(33,'201632008','이식동',2,'010-7392-3031','남','lee087@skhu.ac.kr'),(34,'201632009','박하정',4,'010-2627-3076','여','park092@skhu.ac.kr'),(35,'201632010','박룡성',3,'010-7687-3083','남','park107@skhu.ac.kr'),(36,'201632011','곽구인',4,'010-8131-3172','남','kwak118@skhu.ac.kr'),(37,'201632012','김균진',4,'010-5786-3182','남','kim125@skhu.ac.kr'),(38,'201632013','김정희',3,'010-1691-3403','여','kim131@skhu.ac.kr'),(39,'201632014','황찬금',1,'010-5535-3424','남','hwang145@skhu.ac.kr'),(40,'201632015','고영은',2,'010-4005-3498','여','ko154@skhu.ac.kr'),(41,'201635015','정정유',4,'010-8983-3530','남','jeong158@skhu.ac.kr'),(42,'201632016','최영유',2,'010-5208-3577','남','choi165@skhu.ac.kr'),(43,'201633016','김명진',2,'010-5930-3594','여','kim165@skhu.ac.kr'),(44,'201632017','황숙인',3,'010-8300-3661','여','hwang178@skhu.ac.kr'),(45,'201633017','서나윤',2,'010-6760-3792','여','seo176@skhu.ac.kr'),(46,'201632018','김혜초',4,'010-1877-3832','여','kim181@skhu.ac.kr'),(47,'201632019','이하정',1,'010-8598-3839','여','lee198@skhu.ac.kr'),(48,'201634019','안현도',3,'010-9456-3850','남','ahn199@skhu.ac.kr'),(49,'201632020','박배균',4,'010-8120-3925','남','park208@skhu.ac.kr'),(50,'201634020','이복성',1,'010-8473-3925','남','lee208@skhu.ac.kr'),(51,'201632021','박진희',2,'010-5265-3975','여','park215@skhu.ac.kr'),(52,'201632022','박남기',1,'010-9229-4003','남','park229@skhu.ac.kr'),(53,'201632023','손일종',2,'010-5633-4027','남','son235@skhu.ac.kr'),(54,'201632024','송호명',3,'010-4076-4155','남','song244@skhu.ac.kr'),(55,'201632025','박환진',2,'010-5717-4178','남','park255@skhu.ac.kr'),(56,'201632026','최미영',3,'010-8167-4306','여','choi268@skhu.ac.kr'),(57,'201632027','류진소',3,'010-8314-4364','남','ryu278@skhu.ac.kr'),(58,'201632028','이도영',3,'010-3218-4408','여','lee284@skhu.ac.kr'),(59,'201632029','장식달',4,'010-9599-4595','남','jang299@skhu.ac.kr'),(60,'201632030','천세승',1,'010-3727-4761','남','cheon303@skhu.ac.kr'),(61,'201732006','천병상',4,'010-7429-4833','남','cheon067@skhu.ac.kr'),(62,'201732007','김택용',1,'010-5911-4844','남','kim075@skhu.ac.kr'),(63,'201732008','김영수',2,'010-2617-4866','남','kim082@skhu.ac.kr'),(64,'201732009','이호규',3,'010-6023-4873','남','lee096@skhu.ac.kr'),(65,'201732010','이영시',1,'010-5366-4880','여','lee105@skhu.ac.kr'),(66,'201732011','이원강',3,'010-1526-4911','남','lee111@skhu.ac.kr'),(67,'201732012','신춘동',1,'010-3227-4969','남','sin123@skhu.ac.kr'),(68,'201732013','이영상',4,'010-2642-4997','남','lee132@skhu.ac.kr'),(69,'201732014','윤주동',1,'010-4636-5000','남','yoon144@skhu.ac.kr'),(70,'201732015','김환정',1,'010-4183-5008','남','kim154@skhu.ac.kr'),(71,'201734015','김연정',3,'010-2575-5237','여','kim152@skhu.ac.kr'),(72,'201732016','박해노',3,'010-8459-5244','남','park168@skhu.ac.kr'),(73,'201734016','김호경',3,'010-6732-5292','여','kim166@skhu.ac.kr'),(74,'201732017','박진수',3,'010-3996-5297','남','park173@skhu.ac.kr'),(75,'201734017','민영희',3,'010-7361-5364','여','min177@skhu.ac.kr'),(76,'201732018','이수외',2,'010-4771-5403','남','lee184@skhu.ac.kr'),(77,'201733019','신자달',2,'010-4369-5415','남','sin194@skhu.ac.kr'),(78,'201732019','김상종',4,'010-4345-5425','남','kim194@skhu.ac.kr'),(79,'201732020','장언서',1,'010-9410-5478','남','jang209@skhu.ac.kr'),(80,'201733020','나주태',2,'010-6493-5499','남','na206@skhu.ac.kr'),(81,'201732021','김진수',2,'010-9474-5563','남','kim219@skhu.ac.kr'),(82,'201732022','변상우',4,'010-8991-5565','남','byeon228@skhu.ac.kr'),(83,'201732023','정석기',2,'010-1290-5679','남','jeong231@skhu.ac.kr'),(84,'201732024','한운용',3,'010-4007-5762','남','han244@skhu.ac.kr'),(85,'201732025','한운하',4,'010-8065-5800','남','han258@skhu.ac.kr'),(86,'201732026','송원기',1,'010-1176-5806','남','song261@skhu.ac.kr'),(87,'201732027','유숙환',4,'010-6864-5842','남','yu276@skhu.ac.kr'),(88,'201732028','이기병',3,'010-3234-5973','남','lee283@skhu.ac.kr'),(89,'201732029','김현영',2,'010-8195-6083','남','kim298@skhu.ac.kr'),(90,'201732030','엄태원',4,'010-5559-6210','남','eom305@skhu.ac.kr'),(91,'201832006','신순재',1,'010-1042-6235','남','sin061@skhu.ac.kr'),(92,'201832007','심영훈',1,'010-5635-6268','남','sim075@skhu.ac.kr'),(93,'201832008','조훈지',2,'010-7003-6280','남','ko087@skhu.ac.kr'),(94,'201832009','정리두',1,'010-4991-6330','남','jeong094@skhu.ac.kr'),(95,'201832010','안학상',2,'010-9619-6399','남','ahn109@skhu.ac.kr'),(96,'201832011','신림경',4,'010-2924-6464','여','sin112@skhu.ac.kr'),(97,'201832012','김선미',4,'010-3352-6545','남','kim123@skhu.ac.kr'),(98,'201832013','기도형',1,'010-5719-6630','남','ki135@skhu.ac.kr'),(99,'201832014','나채혁',2,'010-9891-6684','남','na149@skhu.ac.kr'),(100,'201834015','송영근',3,'010-5188-6690','남','song155@skhu.ac.kr'),(101,'201832015','이인해',3,'010-1686-6715','여','lee151@skhu.ac.kr'),(102,'201832016','송철종',2,'010-8087-6716','남','song168@skhu.ac.kr'),(103,'201834016','이아경',3,'010-4578-6816','여','lee164@skhu.ac.kr'),(104,'201832017','여희경',1,'010-3913-6827','여','yeo173@skhu.ac.kr'),(105,'201833017','이경규',2,'010-4995-6984','남','lee174@skhu.ac.kr'),(106,'201832018','정기민',4,'010-3795-7004','남','jeong183@skhu.ac.kr'),(107,'201832019','정승호',3,'010-6290-7007','남','jeong196@skhu.ac.kr'),(108,'201835019','서주정',4,'010-9514-7047','여','seo199@skhu.ac.kr'),(109,'201832020','김영주',2,'010-6263-7067','남','kim206@skhu.ac.kr'),(110,'201835020','황우석',4,'010-1320-7139','남','hwang201@skhu.ac.kr'),(111,'201832021','조권정',3,'010-3398-7216','남','ko213@skhu.ac.kr'),(112,'201832022','김영수',4,'010-8509-7224','남','kim228@skhu.ac.kr'),(113,'201832023','김기혜',3,'010-7191-7314','여','kim237@skhu.ac.kr'),(114,'201832024','이기형',2,'010-6215-7444','남','lee246@skhu.ac.kr'),(115,'201832025','송우명',4,'010-3317-7481','남','song253@skhu.ac.kr'),(116,'201832026','류화시',4,'010-5490-7656','남','ryu265@skhu.ac.kr'),(117,'201832027','박재용',3,'010-1572-7661','남','park271@skhu.ac.kr'),(118,'201832028','이사육',4,'010-8269-7677','남','lee288@skhu.ac.kr'),(119,'201832029','이진생',2,'010-3293-7685','남','lee293@skhu.ac.kr'),(120,'201832030','김승영',1,'010-8682-7816','남','kim308@skhu.ac.kr'),(121,'201932006','신정효',3,'010-5439-7858','여','sin065@skhu.ac.kr'),(122,'201932007','김곤일',2,'010-6094-7885','남','kim076@skhu.ac.kr'),(123,'201932008','황규동',2,'010-5940-7969','남','hwang085@skhu.ac.kr'),(124,'201932009','조화병',1,'010-2497-8019','여','ko092@skhu.ac.kr'),(125,'201932010','김영희',4,'010-4847-8088','여','kim104@skhu.ac.kr'),(126,'201932011','김규태',3,'010-9619-8116','남','kim119@skhu.ac.kr'),(127,'201932012','김희진',2,'010-1558-8146','여','kim121@skhu.ac.kr'),(128,'201932013','장남석',3,'010-9465-8203','남','jang139@skhu.ac.kr'),(129,'201932014','이상은',1,'010-7659-8206','남','lee147@skhu.ac.kr'),(130,'201932015','박삼재',2,'010-2969-8319','남','park152@skhu.ac.kr'),(131,'201935015','신호진',4,'010-1165-8320','남','sin151@skhu.ac.kr'),(132,'201933016','한섭계',2,'010-4467-8333','남','han164@skhu.ac.kr'),(133,'201932016','도재인',1,'010-7164-8413','남','do167@skhu.ac.kr'),(134,'201934017','김하지',3,'010-9530-8535','남','kim179@skhu.ac.kr'),(135,'201932017','김준호',1,'010-4717-8565','남','kim174@skhu.ac.kr'),(136,'201932018','조진동',4,'010-6705-8735','남','ko186@skhu.ac.kr'),(137,'201935019','최선예',4,'010-6975-8804','여','choi196@skhu.ac.kr'),(138,'201933019','김영균',2,'010-2595-8854','남','kim192@skhu.ac.kr'),(139,'201932020','함헌석',1,'010-8970-8993','남','ham208@skhu.ac.kr'),(140,'201933020','류숙정',2,'010-1326-9036','여','ryu201@skhu.ac.kr'),(141,'201932021','정훈세',2,'010-5426-9109','남','jeong215@skhu.ac.kr'),(142,'201932022','박준흥',1,'010-2673-9155','남','park222@skhu.ac.kr'),(143,'201932023','민진구',4,'010-8443-9236','남','min238@skhu.ac.kr'),(144,'201932024','박환인',1,'010-2515-9284','남','park249@skhu.ac.kr'),(145,'201932025','장일정',3,'010-9508-9385','남','jang259@skhu.ac.kr'),(146,'201932026','유옥병',1,'010-3615-9437','남','yu263@skhu.ac.kr'),(147,'201932027','고나진',1,'010-3603-9475','남','ko273@skhu.ac.kr'),(148,'201932028','문재균',2,'010-3785-9514','남','moon283@skhu.ac.kr'),(149,'201932029','문병수',1,'010-7894-9541','남','moon297@skhu.ac.kr'),(150,'201932030','박래용',1,'010-5871-9549','남','park305@skhu.ac.kr'),(151,'202032006','이우병',2,'010-2301-9550','남','lee062@skhu.ac.kr'),(152,'202032007','신정석',3,'010-7737-9604','남','sin077@skhu.ac.kr'),(153,'202032008','오영세',2,'010-9188-9607','남','oh089@skhu.ac.kr'),(154,'202032009','유진하',3,'010-2988-9622','여','yu092@skhu.ac.kr'),(155,'202032010','노명인',4,'010-3936-9633','남','no103@skhu.ac.kr'),(156,'202032011','김조인',4,'010-6290-9650','남','kim116@skhu.ac.kr'),(157,'202032012','김주영',1,'010-4881-9651','남','kim124@skhu.ac.kr'),(158,'202032016','김승현',2,'010-2742-9784','남','kim162@skhu.ac.kr'),(159,'202032017','이룡세',4,'010-6468-9810','남','lee176@skhu.ac.kr'),(160,'202032018','김미윤',3,'010-1526-9881','여','kim181@skhu.ac.kr'),(161,'202032019','유진안',2,'010-9176-9921','여','yu199@skhu.ac.kr'),(162,'202032020','정종현',1,'010-5222-9960','남','jeong205@skhu.ac.kr'),(167,'202114099','홍길동',1,'010-999-8888','남자','hong@skhu.ac.kr'),(168,'202114198','임꺽정',4,'010-888-7777','남','lim@skhu.ac.kr');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugang`
--

DROP TABLE IF EXISTS `sugang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lectureId` int NOT NULL,
  `studentId` int NOT NULL,
  `repeated` tinyint NOT NULL,
  `cancel` tinyint NOT NULL,
  `grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Sugang_Student_idx` (`studentId`),
  KEY `FK_Sugang_Lecture_idx` (`lectureId`),
  CONSTRAINT `FK_Sugang_Lecture` FOREIGN KEY (`lectureId`) REFERENCES `lecture` (`id`),
  CONSTRAINT `FK_Sugang_Student` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugang`
--

LOCK TABLES `sugang` WRITE;
/*!40000 ALTER TABLE `sugang` DISABLE KEYS */;
INSERT INTO `sugang` VALUES (1,4,91,0,0,'A+'),(2,4,92,0,0,'C+'),(3,4,93,0,0,'B+'),(4,4,94,1,0,'B+'),(5,4,95,0,0,'A0'),(6,4,96,0,0,'C0'),(7,4,97,0,0,'C0'),(8,4,98,0,0,'C0'),(9,4,99,0,0,'A+'),(10,4,100,0,0,'A+'),(11,4,101,0,1,'B+'),(12,4,102,0,0,'B0'),(13,4,103,0,0,'C+'),(14,4,104,1,0,'B0'),(15,4,105,0,0,'A0'),(16,4,106,0,0,'B+'),(17,4,107,0,0,'B0'),(18,4,108,0,0,'C+'),(19,4,109,0,0,'C+'),(20,4,110,0,0,'A+'),(21,4,111,0,0,'C+'),(22,4,112,0,0,'C0'),(23,4,113,0,0,'C0'),(24,4,114,0,0,'C0'),(25,4,115,0,0,'B+'),(26,4,116,0,0,'B0'),(27,4,117,0,0,'A+'),(28,4,118,0,0,'B+'),(29,4,119,0,0,'B0'),(30,4,120,0,0,'C+'),(31,3,61,0,0,'C+'),(32,3,62,0,0,'A0'),(33,3,63,0,0,'B+'),(34,3,64,0,0,'B0'),(35,3,65,0,0,'B+'),(36,3,66,0,0,'A0'),(37,3,67,0,0,'C0'),(38,3,68,0,0,'A+'),(39,3,69,0,0,'B0'),(40,3,70,0,0,'C0'),(41,3,71,0,0,'C+'),(42,3,72,0,1,'B+'),(43,3,73,0,0,'A0'),(44,3,74,0,0,'C0'),(45,3,75,0,0,'C0'),(46,3,76,0,0,'A0'),(47,3,77,0,0,'B+'),(48,3,78,0,0,'B0'),(49,3,79,0,0,'C+'),(50,3,80,0,0,'B0'),(51,3,81,0,0,'A+'),(52,3,82,0,0,'C+'),(53,3,83,0,0,'A+'),(54,3,84,0,0,'C+'),(55,3,85,0,0,'C0'),(56,3,86,0,0,'B0'),(57,3,87,0,1,'B+'),(58,3,88,0,0,'B+'),(59,3,89,0,0,'C+'),(60,3,90,0,0,'B0'),(61,2,30,0,0,'A0'),(62,2,31,0,0,'C0'),(63,2,32,0,0,'B0'),(64,2,33,0,0,'C+'),(65,2,34,0,0,'C+'),(66,2,35,0,0,'B+'),(67,2,36,0,0,'B+'),(68,2,37,0,0,'C0'),(69,2,38,0,0,'A+'),(70,2,39,0,0,'B+'),(71,2,40,0,0,'C0'),(72,2,41,0,0,'B0'),(73,2,42,0,0,'C+'),(74,2,43,0,0,'C0'),(75,2,44,0,1,'B+'),(76,2,45,0,0,'B0'),(77,2,46,0,0,'C+'),(78,2,47,0,0,'A+'),(79,2,48,0,0,'A0'),(80,2,49,0,0,'A0'),(81,2,50,0,0,'B0'),(82,2,51,0,0,'A0'),(83,2,52,0,0,'B0'),(84,2,53,0,0,'C0'),(85,2,54,0,0,'B+'),(86,2,55,0,0,'C+'),(87,2,56,0,0,'A+'),(88,2,57,0,0,'C0'),(89,2,58,0,0,'C0'),(90,2,59,0,0,'C0'),(91,2,60,0,0,'C+'),(92,1,1,0,1,'B+'),(93,1,2,0,0,'B+'),(94,1,3,0,0,'A+'),(95,1,4,0,0,'C+'),(96,1,5,0,0,'A0'),(97,1,6,0,0,'B0'),(98,1,7,0,0,'B0'),(99,1,8,0,0,'C0'),(100,1,9,0,0,'C+'),(101,1,10,0,0,'B0'),(102,1,11,0,0,'C+'),(103,1,12,0,0,'C+'),(104,1,13,0,0,'B+'),(105,1,14,0,0,'A+'),(106,1,15,0,1,'B0'),(107,1,16,0,0,'B+'),(108,1,17,0,0,'C0'),(109,1,18,0,0,'C+'),(110,1,19,0,0,'B+'),(111,1,20,0,0,'C+'),(112,1,21,0,0,'C0'),(113,1,22,0,0,'B+'),(114,1,23,0,0,'A0'),(115,1,24,0,0,'C0'),(116,1,25,0,0,'B0'),(117,1,26,0,0,'B+'),(118,1,27,0,0,'C0'),(119,1,28,0,0,'C0'),(120,1,29,0,0,'B0'),(121,1,30,0,0,'C+'),(122,8,91,0,0,'A0'),(123,8,92,0,0,'C+'),(124,8,93,0,1,'C0'),(125,8,94,0,0,'B+'),(126,8,95,0,0,'A+'),(127,8,96,0,0,'A+'),(128,8,97,0,0,'B0'),(129,8,98,0,0,'C0'),(130,8,99,0,0,'C0'),(131,8,100,0,0,'C+'),(132,8,101,0,0,'B+'),(133,8,102,0,0,'C+'),(134,8,103,0,0,'C+'),(135,8,104,0,0,'B0'),(136,8,105,0,0,'A0'),(137,8,106,0,0,'C0'),(138,8,107,0,0,'B0'),(139,8,108,0,0,'C0'),(140,8,109,0,1,'B+'),(141,8,110,0,0,'B0'),(142,8,111,0,0,'C+'),(143,8,112,0,0,'B0'),(144,8,113,0,0,'C+'),(145,8,114,0,0,'B+'),(146,8,115,0,0,'B+'),(147,8,116,0,0,'C0'),(148,8,117,0,0,'A+'),(149,8,118,0,0,'A+'),(150,8,119,0,0,'C0'),(151,8,120,0,0,'B0'),(152,7,61,0,0,'A0'),(153,7,62,0,0,'C+'),(154,7,63,0,0,'B+'),(155,7,64,0,0,'C+'),(156,7,65,0,0,'B0'),(157,7,66,0,1,'C+'),(158,7,67,0,0,'A0'),(159,7,68,0,0,'C0'),(160,7,69,0,0,'B0'),(161,7,70,0,0,'C0'),(162,7,71,0,0,'B+'),(163,7,72,0,0,'B+'),(164,7,73,0,0,'A0'),(165,7,74,0,0,'B+'),(166,7,75,0,0,'A0'),(167,7,76,0,0,'C0'),(168,7,77,0,0,'B0'),(169,7,78,0,0,'C+'),(170,7,79,0,0,'C0'),(171,7,80,0,0,'A+'),(172,7,81,0,0,'C+'),(173,7,82,0,0,'A+'),(174,7,83,0,0,'B0'),(175,7,84,0,0,'C0'),(176,7,85,0,0,'B0'),(177,7,86,0,0,'C+'),(178,7,87,0,1,'C+'),(179,7,88,0,0,'C+'),(180,7,89,0,0,'B0'),(181,7,90,0,0,'C+'),(182,6,30,0,0,'B+'),(183,6,31,0,0,'C0'),(184,6,32,0,0,'B+'),(185,6,33,0,0,'C0'),(186,6,34,0,0,'A0'),(187,6,35,0,0,'B+'),(188,6,36,0,0,'B0'),(189,6,37,0,0,'B+'),(190,6,38,0,0,'C+'),(191,6,39,0,0,'B+'),(192,6,40,0,0,'A+'),(193,6,41,0,0,'C0'),(194,6,42,0,0,'C0'),(195,6,43,0,1,'B0'),(196,6,44,0,0,'C0'),(197,6,45,0,0,'B0'),(198,6,46,0,0,'B0'),(199,6,47,0,0,'C+'),(200,6,48,0,0,'C+'),(201,6,49,0,0,'C+'),(202,6,50,0,0,'A+'),(203,6,51,0,0,'B+'),(204,6,52,0,0,'A0'),(205,6,53,0,0,'C0'),(206,6,54,0,0,'C0'),(207,6,55,0,0,'A0'),(208,6,56,0,0,'B+'),(209,6,57,0,0,'B0'),(210,6,58,0,0,'C+'),(211,6,59,0,0,'A0'),(212,6,60,0,0,'C+'),(213,5,1,0,0,'A+'),(214,5,2,0,0,'C0'),(215,5,3,0,0,'A+'),(216,5,4,0,0,'C+'),(217,5,5,0,0,'B0'),(218,5,6,0,0,'C0'),(219,5,7,0,0,'B+'),(220,5,8,0,1,'B0'),(221,5,9,0,0,'B+'),(222,5,10,0,0,'C+'),(223,5,11,0,0,'B+'),(224,5,12,0,0,'B+'),(225,5,13,0,0,'C+'),(226,5,14,0,0,'C0'),(227,5,15,0,0,'C0'),(228,5,16,0,0,'A0'),(229,5,17,0,0,'B+'),(230,5,18,0,0,'B0'),(231,5,19,0,0,'C0'),(232,5,20,0,0,'C0'),(233,5,21,0,0,'A0'),(234,5,22,0,0,'C0'),(235,5,23,0,0,'B0'),(236,5,24,0,0,'C+'),(237,5,25,0,0,'A+'),(238,5,26,0,0,'A+'),(239,5,27,0,0,'C+'),(240,5,28,0,0,'C+'),(241,5,29,0,0,'B0'),(242,5,30,0,0,'B0'),(243,12,121,0,0,'B+'),(244,12,122,0,0,'C+'),(245,12,123,0,1,'B0'),(246,12,124,0,0,'C0'),(247,12,125,0,0,'A0'),(248,12,126,0,0,'B+'),(249,12,127,0,0,'B0'),(250,12,128,0,0,'C0'),(251,12,129,0,0,'B+'),(252,12,130,0,0,'B+'),(253,12,131,0,0,'C0'),(254,12,132,0,0,'A0'),(255,12,133,0,0,'B+'),(256,12,134,0,0,'C+'),(257,12,135,0,0,'A0'),(258,12,136,0,0,'B0'),(259,12,137,0,0,'A0'),(260,12,138,0,0,'C+'),(261,12,139,0,0,'B0'),(262,12,140,0,0,'A+'),(263,12,141,0,0,'C0'),(264,12,142,0,0,'C0'),(265,12,143,0,0,'B0'),(266,12,144,0,0,'A+'),(267,12,145,0,0,'C+'),(268,12,146,0,0,'C+'),(269,12,147,0,0,'C+'),(270,12,148,0,0,'B0'),(271,12,149,0,1,'C0'),(272,12,150,0,0,'C0'),(273,11,91,0,0,'B+'),(274,11,92,0,0,'B+'),(275,11,93,0,1,'A+'),(276,11,94,0,0,'B+'),(277,11,95,0,0,'A0'),(278,11,96,0,0,'B+'),(279,11,97,0,0,'B0'),(280,11,98,0,0,'A+'),(281,11,99,0,0,'C0'),(282,11,100,0,0,'C+'),(283,11,101,0,0,'A0'),(284,11,102,0,0,'D0'),(285,11,103,0,0,'B0'),(286,11,104,0,0,'B0'),(287,11,105,0,0,'A+'),(288,11,106,0,0,'C0'),(289,11,107,0,0,'C+'),(290,11,108,0,0,'C+'),(291,11,109,0,0,'C+'),(292,11,110,0,0,'C+'),(293,11,111,0,0,'B+'),(294,11,112,0,0,'C0'),(295,11,113,0,0,'B+'),(296,11,114,0,0,'B+'),(297,11,115,0,0,'A0'),(298,11,116,0,0,'C0'),(299,11,117,0,1,'B0'),(300,11,118,0,0,'C0'),(301,11,119,0,0,'A0'),(302,11,120,0,0,'C0'),(303,10,61,0,0,'B+'),(304,10,62,0,0,'A+'),(305,10,63,0,0,'C0'),(306,10,64,0,0,'B+'),(307,10,65,0,0,'B0'),(308,10,66,0,0,'C+'),(309,10,67,0,0,'C+'),(310,10,68,0,0,'A0'),(311,10,69,0,0,'C+'),(312,10,70,0,0,'B0'),(313,10,71,0,0,'A+'),(314,10,72,0,0,'B0'),(315,10,73,0,0,'B0'),(316,10,74,0,0,'C0'),(317,10,75,0,0,'C0'),(318,10,76,0,0,'B+'),(319,10,77,0,1,'C+'),(320,10,78,0,0,'C+'),(321,10,79,0,0,'B0'),(322,10,80,0,0,'B+'),(323,10,81,0,0,'B0'),(324,10,82,0,0,'B+'),(325,10,83,0,0,'C0'),(326,10,84,0,0,'B+'),(327,10,85,0,0,'D+'),(328,10,86,0,0,'C0'),(329,10,87,0,0,'B0'),(330,10,88,0,0,'A0'),(331,10,89,0,0,'B+'),(332,10,90,0,0,'B0'),(333,10,30,0,0,'C+'),(334,9,31,0,0,'C+'),(335,9,32,0,0,'C+'),(336,9,33,0,0,'B0'),(337,9,34,0,0,'C0'),(338,9,35,0,0,'A+'),(339,9,36,0,0,'B+'),(340,9,37,0,0,'C0'),(341,9,38,0,0,'C+'),(342,9,39,0,0,'C0'),(343,9,40,0,0,'A0'),(344,9,41,0,0,'C0'),(345,9,42,0,0,'B+'),(346,9,43,0,0,'A+'),(347,9,44,0,0,'B+'),(348,9,45,0,0,'C+'),(349,9,46,0,0,'A0'),(350,9,47,0,0,'B0'),(351,9,48,0,1,'B0'),(352,9,49,0,0,'C+'),(353,9,50,0,0,'C0'),(354,9,51,0,0,'C+'),(355,9,52,0,0,'B0'),(356,9,53,0,0,'A+'),(357,9,54,0,0,'C0'),(358,9,55,0,0,'C0'),(359,9,56,0,0,'B+'),(360,9,57,0,0,'A+'),(361,9,58,0,0,'B0'),(362,9,59,0,0,'C+'),(363,9,60,0,0,'B+'),(364,16,121,0,0,'C+'),(365,16,122,0,0,'A0'),(366,16,123,0,1,'F'),(367,16,124,0,0,'C+'),(368,16,125,0,0,'F'),(369,16,126,0,0,'B+'),(370,16,127,0,0,'C0'),(371,16,128,0,0,'B0'),(372,16,129,0,0,'B+'),(373,16,130,0,0,'A0'),(374,16,131,0,0,'C+'),(375,16,132,0,0,'B0'),(376,16,133,0,0,'B+'),(377,16,134,0,0,'C0'),(378,16,135,0,0,'C0'),(379,16,136,0,0,'C+'),(380,16,137,0,0,'B+'),(381,16,138,0,0,'C0'),(382,16,139,0,0,'B0'),(383,16,140,0,0,'A+'),(384,16,141,0,0,'B0'),(385,16,142,0,0,'C0'),(386,16,143,0,0,'C+'),(387,16,144,0,0,'A0'),(388,16,145,0,0,'B+'),(389,16,146,0,0,'C0'),(390,16,147,0,0,'A+'),(391,16,148,0,0,'B0'),(392,16,149,0,1,'A0'),(393,16,150,0,0,'B+'),(394,15,91,0,0,'B0'),(395,15,92,0,0,'C+'),(396,15,93,0,1,'C+'),(397,15,94,0,0,'C0'),(398,15,95,0,0,'C0'),(399,15,96,0,0,'C+'),(400,15,97,0,0,'B+'),(401,15,98,0,0,'B0'),(402,15,99,0,0,'B+'),(403,15,100,0,0,'A+'),(404,15,101,0,0,'B0'),(405,15,102,0,0,'C0'),(406,15,103,0,0,'C+'),(407,15,104,0,0,'B+'),(408,15,105,0,0,'A+'),(409,15,106,0,0,'A0'),(410,15,107,0,0,'B0'),(411,15,108,0,0,'B+'),(412,15,109,0,0,'C+'),(413,15,110,0,0,'A0'),(414,15,111,0,0,'C+'),(415,15,112,0,0,'A0'),(416,15,113,0,0,'C0'),(417,15,114,0,0,'B0'),(418,15,115,0,0,'A+'),(419,15,116,0,0,'C0'),(420,15,117,0,1,'C0'),(421,15,118,0,0,'B+'),(422,15,119,0,0,'C+'),(423,15,120,0,0,'B0'),(424,14,61,0,0,'B+'),(425,14,62,0,0,'A+'),(426,14,63,0,0,'C+'),(427,14,64,0,0,'C0'),(428,14,65,0,0,'B+'),(429,14,66,0,0,'F'),(430,14,67,0,0,'B0'),(431,14,68,0,0,'B+'),(432,14,69,0,0,'C+'),(433,14,70,0,0,'B0'),(434,14,71,0,0,'C+'),(435,14,72,0,0,'A0'),(436,14,73,0,0,'C+'),(437,14,74,0,0,'B0'),(438,14,75,0,0,'B+'),(439,14,76,0,0,'B+'),(440,14,77,0,1,'C0'),(441,14,78,0,0,'C0'),(442,14,79,0,0,'A0'),(443,14,80,0,0,'B+'),(444,14,81,0,0,'B0'),(445,14,82,0,0,'A0'),(446,14,83,0,0,'C+'),(447,14,84,0,0,'C0'),(448,14,85,0,0,'A+'),(449,14,86,0,0,'A+'),(450,14,87,0,0,'B+'),(451,14,88,0,0,'C+'),(452,14,89,0,0,'C0'),(453,14,90,0,0,'B+'),(454,14,30,0,0,'C0'),(455,13,31,0,0,'B0'),(456,13,32,0,0,'B0'),(457,13,33,0,0,'A0'),(458,13,34,0,0,'C0'),(459,13,35,0,0,'B0'),(460,13,36,0,0,'C+'),(461,13,37,0,0,'B+'),(462,13,38,0,0,'B0'),(463,13,39,0,0,'C+'),(464,13,40,0,0,'C0'),(465,13,41,0,0,'A0'),(466,13,42,0,0,'C+'),(467,13,43,0,0,'B0'),(468,13,44,0,0,'A+'),(469,13,45,0,0,'B+'),(470,13,46,0,0,'B+'),(471,13,47,0,0,'B+'),(472,13,48,0,1,'C0'),(473,13,49,0,0,'C0'),(474,13,50,0,0,'B0'),(475,13,51,0,0,'C0'),(476,13,52,0,0,'B0'),(477,13,53,0,0,'C+'),(478,13,54,0,0,'B+'),(479,13,55,0,0,'B0'),(480,13,56,0,0,'B0'),(481,13,57,0,0,'C+'),(482,13,58,0,0,'A0'),(483,13,59,0,0,'C0'),(484,13,60,0,0,'B0');
/*!40000 ALTER TABLE `sugang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03  8:12:05
