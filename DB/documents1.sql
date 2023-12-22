-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: documents1
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Current Database: `documents1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `documents1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `documents1`;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileName` varchar(45) NOT NULL,
  `size` int NOT NULL,
  `modifiedDate` date NOT NULL,
  `folderId` int NOT NULL,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_folder_idx` (`folderId`),
  CONSTRAINT `FK_folder` FOREIGN KEY (`folderId`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'JPA query language.docx',570805,'2021-12-08',1,'정상'),(2,'transaction.docx',626575,'2021-12-27',1,'정상'),(3,'spring tool suite 설치.docx',527667,'2021-08-31',1,'작성중'),(4,'spring form1.docx',570805,'2021-10-28',1,'정상'),(5,'Spring Boot 시작하기.docx',948550,'2021-12-25',1,'정상'),(6,'RestController 테스트 구현 #1.docx',26884,'2022-02-05',1,'정상'),(7,'transaction isolation level.docx',527667,'2021-12-29',1,'작성중'),(8,'JPA single-valued association.docx',2045915,'2021-11-17',1,'정상'),(9,'spring form.docx',626575,'2021-10-09',1,'정상'),(10,'mybatis 기초.docx',527667,'2021-10-08',1,'정상'),(11,'mybatis pagination 1.docx',570805,'2021-12-07',1,'정상'),(12,'JUnit 테스트 구현.docx',626575,'2022-01-16',1,'작성중'),(13,'mybatis resultMap #2.docx',1172048,'2021-10-29',1,'정상'),(14,'MySQL 설치.docx',2045915,'2021-08-29',1,'정상'),(15,'spring form validation 1.docx',26884,'2021-10-30',1,'정상'),(16,'RestController 테스트 구현 #2.docx',626575,'2022-02-07',1,'작성중'),(17,'JPA 기초.docx',39315,'2021-11-18',1,'정상'),(18,'mybatis 시작.docx',948550,'2021-12-25',1,'작성중'),(19,'JPA collection-valued association.docx',948550,'2021-11-19',1,'정상'),(20,'JPA query creation.docx',1172048,'2021-11-17',1,'정상'),(21,'수업 소개.docx',26884,'2021-08-30',1,'작성중'),(22,'OAuth2 github google 로그인',626575,'2022-01-17',1,'정상'),(23,'JPA pagination 2.docx',948550,'2021-12-09',1,'정장'),(24,'mybatis cache.docx',2045915,'2021-10-10',1,'정상'),(25,'spring form validation 2.docx',626575,'2021-10-28',1,'정상'),(26,'zulu OpenJDK 설치.docx',626575,'2021-08-29',1,'정상'),(27,'파라미터 전달.docx',570805,'2021-09-20',1,'작성중'),(28,'spring security',570805,'2021-12-27',1,'정상'),(29,'JPA pagination 1.docx',2045915,'2021-12-07',1,'정상'),(30,'에러처리와 로그 1.docx',527667,'2022-01-16',1,'정상'),(31,'에러처리와 로그 2.docx',2045915,'2022-01-18',1,'정상'),(32,'mybatis resultMap.docx',948550,'2021-10-08',1,'정상'),(33,'Mockito 테스트 구현.docx',570805,'2022-02-06',1,'작성중'),(34,'Spring mvc 기초.docx',1172048,'2021-09-18',1,'정상'),(35,'01 git 클라이언트 설치.docx',427667,'2021-10-08',2,'정상'),(36,'02 git 기초 명령.docx',70805,'2021-12-07',2,'정상'),(37,'03 eclipse와 git.docx',162675,'2022-01-16',2,'정상'),(38,'04 공동작업 #1.docx',172048,'2021-04-29',2,'작성중'),(39,'05 공동작업 #2.docx',45915,'2022-08-29',2,'정상'),(40,'06 git_test2 history.docx',26884,'2021-12-25',2,'작성중'),(41,'07 remote repository 백업 및 복구.docx',526575,'2022-02-07',2,'정상'),(42,'08 branch - eclipse.docx',39315,'2022-12-18',2,'정상'),(43,'09 branch - vscode.docx',94855,'2021-12-25',2,'작성중'),(44,'10 remote branch.docx',248550,'2021-03-19',2,'정상'),(45,'01 유닉스 기초.docx',424111,'2021-10-08',3,'정상'),(46,'02 유닉스 명령.docx',22871,'2021-12-07',3,'정상'),(47,'05 AWS EC2.docx',722171,'2022-01-16',3,'정상'),(48,'06 EC2에 mysql 설치.docx',17801,'2021-04-29',3,'작성중'),(49,'07 mysql 관리.docx',237801,'2022-11-08',3,'정상'),(50,'08 mybatis1.war 빌드.docx',204111,'2022-03-07',3,'작성중'),(51,'08 tomcat 설치.docx',212227,'2023-08-09',3,'정상'),(52,'09 프로세스 관리 & 데몬.docx',42111,'2021-09-25',3,'정상'),(53,'10 EC2 서버 구축.docx',44110,'2023-01-16',3,'정상'),(54,'10 oracle cloud 서버 구축.docx',317801,'2021-03-07',3,'정상'),(55,'11 나쁜 IP 차단하기.docx',211048,'2022-11-28',3,'정상'),(56,'12 사용자 관리.docx',317801,'2021-03-21',3,'정상'),(57,'13 lightsail 서버 구축.docx',317801,'2021-03-19',3,'정상'),(58,'00 수업 소개.docx',41801,'2021-10-08',4,'정상'),(59,'01 기본 네트워크 개념.docx',327801,'2021-12-07',4,'정상'),(60,'02 스트림.docx',327801,'2022-01-16',4,'정상'),(61,'03 reader and writer.docx',122227,'2023-01-16',4,'작성중'),(62,'04 ZipOutputStream.docx',894111,'2021-03-07',4,'정상'),(63,'05 스레드.docx',44110,'2022-03-07',4,'작성중'),(64,'06 producer-consumer 패턴.docx',731801,'2023-01-16',4,'정상'),(65,'07 HTTP.docx',21048,'2021-04-15',4,'정상'),(66,'08 클라이언트 소켓.docx',531721,'2022-09-18',4,'정상'),(67,'Level1 - K번째수.docx',44101,'2021-10-08',5,'정상'),(68,'Level1 - 개인정보 수집 유효기간.docx',127801,'2021-12-07',5,'정상'),(69,'Level1 - 모의고사.docx',193201,'2021-10-08',5,'정상'),(70,'Level1 - 성격 유형 검사하기.docx',4812227,'2021-12-17',5,'작성중'),(71,'Level1 - 소수 만들기.docx',57101,'2022-01-26',5,'정상'),(72,'Level1 - 소수 찾기.docx',252801,'2023-01-26',5,'작성중'),(73,'Level1 - 숫자 문자열과 영단어.docx',28108,'2021-03-07',5,'정상'),(74,'Level1 - 신고 결과 받기.docx',7523721,'2022-03-17',5,'정상'),(75,'Level1 - 신규 아이디 추천.docx',357801,'2023-01-26',5,'정상'),(76,'Level1 - 실패율.docx',821308,'2021-04-15',5,'정상'),(77,'Level1 - 완주하지 못한 선수.docx',932701,'2022-09-08',5,'정상'),(78,'Level1 - 음양 더하기.docx',182108,'2021-03-17',5,'정상'),(79,'Level1 - 체육복.docx',493201,'2023-01-26',5,'정상'),(80,'Level1 - 최소직사각형.docx',182108,'2021-03-07',5,'정상'),(81,'Level1 - 크레인 인형뽑기.docx',38127,'2022-03-07',5,'작성중'),(82,'Level1 - 키패드누르기.docx',1492111,'2023-01-16',5,'정상'),(83,'Level2 - H-Index.docx',82108,'2023-08-29',5,'작성중'),(84,'Level2 - k진수에서 소수 개수 구하기.docx',571801,'2023-01-16',5,'정상'),(85,'Level2 - n^2 배열 자르기.docx',282108,'2023-01-16',5,'정상'),(86,'Level2 - N개의 최소공배수.docx',753821,'2021-03-27',5,'정상'),(87,'Level2 - 가장 큰 정사각형.docx',544101,'2021-03-07',5,'작성중'),(88,'Level2 - 가장큰수.docx',7123801,'2022-09-08',5,'정상'),(89,'Level2 - 괄호 회전하기.docx',7523721,'2023-01-26',5,'작성중'),(90,'Level2 - 기능개발.docx',851801,'2023-08-29',5,'정상'),(91,'Level2 - 다리를 지라는 트럭.docx',82308,'2023-01-16',5,'정상'),(92,'Level2 - 단체사진 찍기.docx',753721,'2021-08-30',5,'정상'),(93,'Level2 - 더 맵게.docx',244101,'2022-03-25',5,'정상'),(94,'Level2 - 두 큐 합 같게 만들기.docx',212801,'2023-01-16',5,'정상'),(95,'Level2 - 멀쩡한 사각형.docx',933701,'2022-03-07',5,'정상'),(96,'Level2 - 모음사전.docx',281227,'2023-08-19',5,'작성중'),(97,'Level2 - 배달.docx',439111,'2023-08-19',5,'정상'),(98,'Level2 - 소수 찾기.docx',244110,'2023-08-19',5,'작성중'),(99,'Level2 - 수식 최대화.docx',932701,'2023-01-16',5,'정상'),(100,'Level2 - 스킬트리.docx',81227,'2022-03-07',5,'정상'),(101,'Level2 - 양궁대회.docx',494111,'2023-10-11',5,'정상'),(102,'Level2 - 영어 끝말잇기.docx',244110,'2023-01-16',5,'작성중'),(103,'Level2 - 위장.docx',571801,'2023-08-09',5,'정상'),(104,'Level2 - 이모티콘 할인행사.docx',82108,'2023-01-16',5,'작성중'),(105,'Level2 - 전력망을 둘로 나누기.docx',753721,'2023-01-16',5,'정상'),(106,'Level2 - 전화번호 목록.docx',7523721,'2021-03-07',5,'정상'),(107,'Level2 - 조이스틱.docx',851801,'2021-09-12',5,'정상'),(108,'Level2 - 주차요금 계산.docx',82308,'2023-01-16',5,'정상'),(109,'Level2 - 카카오프렌즈 컬러링북.docx',753721,'2022-03-07',5,'정상'),(110,'Level2 - 카펫.docx',244101,'2022-03-07',5,'정상'),(111,'Level2 - 큰수 만들기.docx',212801,'2023-08-19',5,'작성중'),(112,'Level2 - 타겟넘버.docx',933701,'2023-01-16',5,'정상'),(113,'Level2 - 택배 배달과 수거하기.docx',281227,'2023-01-16',5,'작성중'),(114,'Level2 - 튜플.docx',439111,'2022-03-07',5,'작성중'),(115,'Level2 - 프린터.docx',244110,'2022-03-07',5,'정상'),(116,'Level2 - 행렬의 곱셈.docx',932701,'2023-01-16',5,'정상'),(117,'Level3 - N으로 표현.docx',81227,'2022-09-08',5,'정상'),(118,'Level3 - 가장 먼 노드.docx',494111,'2021-03-17',5,'정상'),(119,'Level3 - 경주로 건설.docx',244110,'2023-01-26',5,'정상'),(120,'Level3 - 등산코스 정하기.docx',571801,'2021-03-07',5,'정상'),(121,'Level3 - 미로 탈출 명령어.docx',82108,'2022-03-07',5,'정상'),(122,'Level3 - 보석 쇼핑.docx',753721,'2023-01-16',5,'정상'),(123,'Level3 - 사라지는 발판.docx',439111,'2023-08-29',5,'작성중'),(124,'Level3 - 스타수열.docx',571801,'2020-05-12',5,'정상'),(125,'Level3 - 양과 늑대.docx',82108,'2023-01-16',5,'작성중'),(126,'Level3 - 카드짝맞추기.docx',753721,'2021-03-27',5,'정상'),(127,'Level3 - 코딩테스트 공부.docx',44101,'2023-02-02',5,'정상'),(128,'Level3 - 파괴되지 않은 건물.docx',127801,'2022-01-25',5,'정상'),(129,'Level3 - 표 병합.docx',932701,'2023-01-26',5,'작성중'),(130,'Level3 - 표현 가능한 이진트리.docx',81227,'2021-03-27',5,'정상'),(131,'Level4 - 1,2,3 떨어트리기.docx',494111,'2023-01-16',5,'작성중'),(132,'Level4 - 동굴 탐험.docx',494111,'2021-08-30',5,'정상'),(133,'Level4 - 행렬과 연산.docx',244110,'2023-08-29',5,'정상');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,'spring'),(2,'git'),(3,'linux'),(4,'network'),(5,'programmers');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18  5:19:13
