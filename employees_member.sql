-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employeesdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` char(2) NOT NULL,
  `country_name` varchar(40) DEFAULT NULL,
  `region_id` double DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  KEY `countr_reg_fk` (`region_id`),
  CONSTRAINT `countr_reg_fk` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` smallint NOT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `location_id` smallint DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `dept_loc_fk` (`location_id`),
  CONSTRAINT `dept_loc_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` datetime NOT NULL,
  `job_id` varchar(10) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `commission_pct` decimal(2,2) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `department_id` smallint DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `emp_email_uk` (`email`),
  CONSTRAINT `emp_salary_min` CHECK ((`salary` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` varchar(10) NOT NULL,
  `job_title` varchar(35) NOT NULL,
  `min_salary` int DEFAULT NULL,
  `max_salary` int DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` smallint NOT NULL,
  `street_address` varchar(40) DEFAULT NULL,
  `postal_code` varchar(12) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(25) DEFAULT NULL,
  `country_id` char(2) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `loc_c_id_fk` (`country_id`),
  CONSTRAINT `loc_c_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `region_id` double NOT NULL,
  `region_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-05  9:58:17
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: memberdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `c_member`
--

DROP TABLE IF EXISTS `c_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_member` (
  `id` varchar(30) NOT NULL,
  `password` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `c_member_chk_1` CHECK ((`email` like _utf8mb4'%@%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_member`
--

LOCK TABLES `c_member` WRITE;
/*!40000 ALTER TABLE `c_member` DISABLE KEYS */;
INSERT INTO `c_member` VALUES ('id_jdbc1',1234,'홍길동','010-1234-1234','hong@aaa.co.kr','2022-07-18 11:19:29'),('id_jdbc2',2222,'이강산','010-4321-4321','lee@tech.co.kr','2022-07-19 10:03:35'),('id1',1111,'홍길동','010-2345-6789','hong@a.com',NULL),('id11',1111,'홍길동','010-2345-6788','hong@a1.com','2022-07-18 10:32:20'),('ID2',2222,'박대한','010-1111-2222','ID2@MUL.COM','2022-07-15 16:20:21');
/*!40000 ALTER TABLE `c_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_memo`
--

DROP TABLE IF EXISTS `c_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_memo` (
  `MEMO_ID` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) NOT NULL,
  `CONTENTS` varchar(4000) DEFAULT NULL,
  `TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `WRITER` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MEMO_ID`),
  KEY `WRITER` (`WRITER`),
  CONSTRAINT `c_memo_ibfk_4` FOREIGN KEY (`WRITER`) REFERENCES `c_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_memo_ibfk_5` FOREIGN KEY (`WRITER`) REFERENCES `c_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_memo_ibfk_6` FOREIGN KEY (`WRITER`) REFERENCES `c_member` (`id`),
  CONSTRAINT `c_memo_ibfk_7` FOREIGN KEY (`WRITER`) REFERENCES `c_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_memo_ibfk_8` FOREIGN KEY (`WRITER`) REFERENCES `c_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_memo_ibfk_9` FOREIGN KEY (`WRITER`) REFERENCES `c_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_memo`
--

LOCK TABLES `c_memo` WRITE;
/*!40000 ALTER TABLE `c_memo` DISABLE KEYS */;
INSERT INTO `c_memo` VALUES (1,'1번글제목','1번글내용','2022-07-15 16:42:34','ID2'),(13,'추가제목','추가내용','2022-07-18 10:36:35','id11'),(14,'제목을 입력합니다','내용을 입력합니다 내용을 입력합니다','2022-07-18 11:26:52','id_jdbc1');
/*!40000 ALTER TABLE `c_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy_member`
--

DROP TABLE IF EXISTS `copy_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy_member` (
  `id` varchar(30) DEFAULT NULL,
  `PASSWORD` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy_member`
--

LOCK TABLES `copy_member` WRITE;
/*!40000 ALTER TABLE `copy_member` DISABLE KEYS */;
INSERT INTO `copy_member` VALUES ('id1',1111,'홍길동','010-1234-5678','hong@multi.com','2022-07-15 15:16:16'),('id3',222222,'박길동','010-5678-1234','park@tech.net','2022-07-15 15:19:35'),('id4',4444,'김한국','010-5678-1235','park@tech.net','2022-07-15 00:00:00'),('id2',2222,'박길동','010-5678-1234','park@tech.net','2022-07-15 15:22:50'),('id1',2222,'박길동','010-5678-1234','park@tech.net','2022-07-15 15:47:56');
/*!40000 ALTER TABLE `copy_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(30) DEFAULT NULL,
  `password` int DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `member_chk_1` CHECK ((`email` like _utf8mb4'%@%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('id1',1111,'수정이름','수정폰','수정@a.net','2022-07-15 15:16:16'),('id3',222222,'박길동','010-5678-1234','park@tech.net','2022-07-15 15:19:35'),('id4',4444,'김한국','010-5678-1235','park@tech.net','2022-07-15 00:00:00'),('id2',2222,'박길동','010-5678-1234','park@tech.net','2022-07-15 15:22:50'),('id4',4444,'김한국','010-5678-1235','park@tech.net','2022-07-15 16:09:14'),('id1',1111,'수정이름','수정폰','수정@a.net','2022-07-18 10:26:09'),('id_jdbc1',1234,'김회원','010-1234-1234','kim@mem.net','2022-07-18 10:48:25'),('id_jdbc2',4321,'박길동','010-4321-4321','park@multi.co.kr','2022-07-18 11:14:52'),('id_jdbc1',1234,'홍길동','010-1234-1234','hong@aaa.co.kr','2022-07-18 11:19:29'),('id1',1111,'수정이름','수정폰','수정@a.net',NULL),('id11',1111,'홍길동','010-2345-6788','hong@a1.com','2022-07-18 10:32:20'),('ID2',2222,'박대한','010-1111-2222','ID2@MUL.COM','2022-07-15 16:20:21'),('id_jdbc3',3333,'김삼성','010-3333-3333','sam@sung.com','2022-07-19 13:23:28'),('id_jdbc4',4444,'이자바','010-4444-4444','java@a.com','2022-07-19 13:49:21'),('new',2222,'수정','010-2222-2222','new@c.com','2022-07-19 16:19:08'),('id_jdbc5',5555,'윤인성','010-5555-5555','in@html.com','2022-07-20 14:36:54'),('id_jdbc6',6666,'이인성','010-6666-6666','lee@script.com','2022-07-20 14:37:51');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-05  9:58:17
