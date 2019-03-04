-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: jobsearchsystem
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applyforjob`
--

DROP TABLE IF EXISTS `applyforjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applyforjob` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `applyforjob_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `applyforjob_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `applyforjob_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applyforjob`
--

LOCK TABLES `applyforjob` WRITE;
/*!40000 ALTER TABLE `applyforjob` DISABLE KEYS */;
INSERT INTO `applyforjob` VALUES (47,1,'aarush@gmail.com',12,8,'Pune','2019-02-20 06:26:16','2019-02-20 06:26:16',1,1),(48,1,'aarush@gmail.com',10,12,'Chennai','2019-02-20 08:24:18','2019-02-20 08:24:18',1,1),(49,1,'aarush@gmail.com',12,1,'Chennai','2019-02-20 08:31:34','2019-02-20 08:31:34',1,1),(52,100,'siva@gmail.com',10,12,'Chennai','2019-02-20 08:47:13','2019-02-20 08:47:13',100,100),(54,100,'siva@gmail.com',3,2,'Chennai','2019-02-20 08:50:46','2019-02-20 08:50:46',100,100),(56,95,'sarada2509@gmail.com',3,11,'Chennai','2019-02-20 09:00:43','2019-02-20 09:00:43',95,95),(60,1,'aarush@gmail.com',12,8,'Pune','2019-02-20 09:09:31','2019-02-20 09:09:31',1,1),(63,100,'siva@gmail.com',10,8,'Chennai','2019-02-20 09:11:48','2019-02-20 09:11:48',100,100),(66,100,'siva@gmail.com',12,8,'Pune','2019-02-20 09:13:06','2019-02-20 09:13:06',100,100),(67,100,'siva@gmail.com',12,1,'Chennai','2019-02-20 09:14:21','2019-02-20 09:14:21',100,100),(71,111,'priyanka@gmail.com',3,14,'Chennai','2019-02-20 09:17:42','2019-02-20 09:17:42',111,111),(72,111,'priyanka@gmail.com',3,16,'Pune','2019-02-20 09:17:58','2019-02-20 09:17:58',111,111),(73,111,'priyanka@gmail.com',3,2,'Chennai','2019-02-20 09:19:04','2019-02-20 09:19:04',111,111),(74,111,'priyanka@gmail.com',3,2,'Chennai','2019-02-20 09:19:12','2019-02-20 09:19:12',111,111),(75,1,'aarush@gmail.com',10,12,'Chennai','2019-02-20 10:25:44','2019-02-20 10:25:44',1,1),(76,111,'priyanka@gmail.com',10,8,'Chennai','2019-02-20 10:38:57','2019-02-20 10:38:57',111,111),(77,111,'priyanka@gmail.com',3,2,'Chennai','2019-02-20 10:41:31','2019-02-20 10:41:31',111,111),(79,1,'aarush@gmail.com',3,14,'Chennai','2019-02-20 10:45:57','2019-02-20 10:45:57',1,1),(82,1031,'sara@gmail.com',10,12,'Chennai','2019-02-21 16:43:13','2019-02-21 16:43:13',1031,1031),(83,1031,'sara@gmail.com',10,2,'Mumbai','2019-02-21 16:43:27','2019-02-21 16:43:27',1031,1031),(84,101,'neela@gmail.com',12,1,'Chennai','2019-02-21 16:55:04','2019-02-21 16:55:04',101,101),(85,101,'neela@gmail.com',18,7,'Karnataka','2019-02-21 16:55:26','2019-02-21 16:55:26',101,101),(86,101,'neela@gmail.com',12,4,'Chennai','2019-02-21 17:03:41','2019-02-21 17:03:41',101,101),(87,1,'aarush@gmail.com',23,17,'Pune','2019-02-21 17:28:35','2019-02-21 17:28:35',1,1),(88,1044,'neelathayak@gmail.com',23,18,'Kerala','2019-02-21 17:30:01','2019-02-21 17:30:01',1044,1044);
/*!40000 ALTER TABLE `applyforjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_admin`
--

DROP TABLE IF EXISTS `company_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_admin` (
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`company_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `company_admin_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_admin`
--

LOCK TABLES `company_admin` WRITE;
/*!40000 ALTER TABLE `company_admin` DISABLE KEYS */;
INSERT INTO `company_admin` VALUES (2,10,'2019-01-26 08:04:34','2019-01-26 08:04:34',2,2),(96,3,'2019-01-26 10:12:13','2019-01-26 10:12:13',NULL,NULL),(98,6,'2019-01-26 13:21:19','2019-01-26 13:21:19',NULL,NULL),(99,12,'2019-01-26 13:59:03','2019-01-26 13:59:03',NULL,NULL),(107,17,'2019-01-27 08:01:36','2019-01-27 08:01:36',NULL,NULL),(108,18,'2019-01-27 08:20:23','2019-01-27 08:20:23',NULL,NULL),(109,7,'2019-01-27 10:54:06','2019-01-27 10:54:06',109,109),(110,6,'2019-01-27 12:19:57','2019-01-27 12:19:57',110,110),(112,10,'2019-01-27 13:24:06','2019-01-27 13:24:06',112,112),(115,24,'2019-01-28 04:49:21','2019-01-28 04:49:21',115,115),(131,3,'2019-01-29 09:12:56','2019-01-29 09:12:56',131,131),(147,21,'2019-02-11 16:10:05','2019-02-11 16:10:05',147,147),(1035,17,'2019-02-17 08:26:07','2019-02-17 08:26:07',1035,1035),(1040,22,'2019-02-17 08:37:27','2019-02-17 08:37:27',1040,1040),(1041,10,'2019-02-17 08:39:46','2019-02-17 08:39:46',1041,1041),(1045,23,'2019-02-19 06:51:45','2019-02-19 06:51:45',1045,1045),(1047,18,'2019-02-19 07:38:25','2019-02-19 07:38:25',1047,1047),(1049,23,'2019-02-19 07:45:36','2019-02-19 07:45:36',1049,1049);
/*!40000 ALTER TABLE `company_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_details` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(30) DEFAULT NULL,
  `website_url` varchar(2083) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_details`
--

LOCK TABLES `company_details` WRITE;
/*!40000 ALTER TABLE `company_details` DISABLE KEYS */;
INSERT INTO `company_details` VALUES (3,'Zilker Technology','https://ztech.io/','2019-01-25 06:34:31','2019-01-25 06:34:35','131','131'),(4,'TataMotors','https://www.tatamotors.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(6,'Cognizant','https://www.cognizant.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','110','110'),(7,'Freshworks','https://www.freshworks.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','109','109'),(8,'Informatica','https://www.informatica.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(10,'ABC India Limited','http://www.abcindia.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','112','112'),(12,'Tata Communication','https://www.tatacommunications.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(13,'Zoho','https://www.zoho.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(14,'Yamaha Motors','https://www.yamaha-motor-india.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(17,'vst motors','https://www.vstmotors.com/','2019-01-27 08:01:08','2019-01-27 08:01:08','107','107'),(18,'hyundai','https://www.hyundai.com/','2019-01-27 08:19:40','2019-01-27 08:19:40','108','108'),(21,'genesis','https://www.genesis.com/','2019-01-27 08:55:05','2019-01-27 08:55:05','3','3'),(22,'larsen and toubro','http://www.larsentoubro.com/','2019-01-27 17:19:32','2019-01-27 17:19:32','3','3'),(23,'Tata consultancy services','https://www.tcs.com/','2019-01-27 17:21:19','2019-01-27 17:21:19','3','3'),(24,'Musigma','https://www.mu-sigma.com/','2019-01-28 04:48:46','2019-01-28 04:48:46','115','115'),(28,'CMS IT','www.cms.com','2019-02-11 16:42:21','2019-02-11 16:42:21',NULL,NULL);
/*!40000 ALTER TABLE `company_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_reviews`
--

DROP TABLE IF EXISTS `company_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_reviews` (
  `company_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `reviews` text,
  `rating` float DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_review_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `company_reviews_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_reviews`
--

LOCK TABLES `company_reviews` WRITE;
/*!40000 ALTER TABLE `company_reviews` DISABLE KEYS */;
INSERT INTO `company_reviews` VALUES (2,1,4,'Superb work culture.',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(4,1,3,'Good work culture.',5,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(15,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(25,2,13,'Good learning place',3,'2019-01-25 06:38:04','2019-01-25 06:38:06',2,2),(26,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(27,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(28,2,13,'nice',3,'2019-01-25 06:38:04','2019-01-25 06:38:06',2,2),(29,1,13,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(31,1,8,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(32,1,10,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(35,95,3,'superb work culture',5,'2019-01-26 10:20:33','2019-01-26 10:20:33',95,95),(36,95,6,'nice work culture.',3.4,'2019-01-26 11:33:32','2019-01-26 11:33:32',95,95),(37,100,6,'nice work culture',3,'2019-01-27 07:15:50','2019-01-27 07:15:50',100,100),(38,1,24,'Very much work pressure and stress,bond for 3 years',3,'2019-02-12 20:02:19','2019-02-12 20:02:19',1,1),(39,1,21,'Good work culture',4,'2019-02-12 20:03:19','2019-02-12 20:03:19',1,1),(41,1,10,'Good work culture',3,'2019-02-13 15:58:41','2019-02-13 15:58:41',1,1),(44,122,3,'good work culture',5,'2019-02-18 11:25:39','2019-02-18 11:25:39',122,122),(45,101,7,'Offers a Learning Platform, allows you to shoulder multiple hats, learn from your mistakes and experiment with your creative ideas.',5,'2019-02-21 16:59:51','2019-02-21 16:59:51',101,101);
/*!40000 ALTER TABLE `company_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_designation` varchar(30) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Java developer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(2,'PHP developer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(3,'Manager','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(4,'System Engineer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(5,'Network Engineer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(6,'Team Leader','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(7,'Marketing Head','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(8,'Human Resource Manager','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(9,'Internee','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(10,'consultant','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(11,'HR','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(12,'General Manager','2019-01-27 10:39:53','2019-01-27 10:39:53',108,108),(13,'Fresher','2019-01-28 04:54:09','2019-01-28 04:54:09',114,114),(14,'Senior account manager','2019-02-12 03:40:16','2019-02-12 03:40:16',2,2),(15,'National account manager','2019-02-12 14:37:18','2019-02-12 14:37:18',2,2),(16,'national manager','2019-02-12 14:41:21','2019-02-12 14:41:21',2,2),(17,'clerk','2019-02-12 14:44:05','2019-02-12 14:44:05',2,2),(18,'senior developer','2019-02-18 09:09:25','2019-02-18 09:09:25',2,2),(19,'consultant Trainee','2019-02-18 09:30:12','2019-02-18 09:30:12',2,2),(20,'Content manager','2019-02-18 09:33:09','2019-02-18 09:33:09',2,2),(23,'content writer','2019-02-18 11:35:24','2019-02-18 11:35:24',2,2);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_request`
--

DROP TABLE IF EXISTS `job_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `job_status` int(11) DEFAULT '0',
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_request_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_request`
--

LOCK TABLES `job_request` WRITE;
/*!40000 ALTER TABLE `job_request` DISABLE KEYS */;
INSERT INTO `job_request` VALUES (1,'sarada2509@gmail.com',1,'Chennai',7,0,'2019-01-26 10:22:11','2019-01-26 10:22:11',95,95),(2,'aarush@gmail.com',5,'Mumbai',6.7,0,'2019-01-27 10:47:15','2019-01-27 10:47:15',1,1),(3,'aarush@gmail.com',6,'Maharashtra',12.5,0,'2019-02-13 04:18:41','2019-02-13 04:18:41',1,1),(4,'aarush@gmail.com',10,'Chennai',12.5,0,'2019-02-13 11:51:42','2019-02-13 11:51:42',1,1),(5,'siva@gmail.com',7,'Chennai',12.5,0,'2019-02-15 03:32:47','2019-02-15 03:32:47',100,100),(6,'sravan1097@gmail.com',6,'Pune',13.8,0,'2019-02-15 03:37:48','2019-02-15 03:37:48',100,100),(7,'aarush@gmail.com',7,'Chennai',12.3,0,'2019-02-18 06:13:31','2019-02-18 06:13:31',1,1),(8,'sandy@gmail.com',5,'Chennai',12,0,'2019-02-18 11:33:27','2019-02-18 11:33:27',122,122),(9,'sravan1097@gmail.com',8,'Chennai',15.4,0,'2019-02-20 05:21:33','2019-02-20 05:21:33',1,1),(10,'aarush@gmail.com',10,'Chennai',12.3,0,'2019-02-20 05:23:26','2019-02-20 05:23:26',1,1),(11,'aarush@gmail.com',1,'Chennai',13,0,'2019-02-20 05:29:24','2019-02-20 05:29:24',1,1),(12,'aarush@gmail.com',5,'Chennai',12,0,'2019-02-20 10:56:51','2019-02-20 10:56:51',1,1),(13,'priyanka@gmail.com',18,'Pune',12.5,0,'2019-02-20 11:17:38','2019-02-20 11:17:38',111,111),(14,'priyanka@gmail.com',12,'Chennai',12,0,'2019-02-20 11:18:17','2019-02-20 11:18:17',111,111),(15,'priyanka@gmail.com',1,'Chennai',12,0,'2019-02-20 11:18:54','2019-02-20 11:18:54',111,111),(16,'priyanka@gmail.com',4,'Chennai',12,0,'2019-02-20 11:19:41','2019-02-20 11:19:41',111,111),(17,'priyanka@gmail.com',17,'Mumbai',5,0,'2019-02-20 11:21:38','2019-02-20 11:21:38',111,111),(18,'priyanka@gmail.com',4,'Chennai',3,0,'2019-02-20 11:22:03','2019-02-20 11:22:03',111,111),(19,'priyanka@gmail.com',15,'Kerala',12,0,'2019-02-20 11:25:00','2019-02-20 11:25:00',111,111),(283,'priyanka@gmail.com',4,'Rajasthan',7.5,0,'2019-02-20 11:31:20','2019-02-20 11:31:20',111,111),(546,'aarush@gmail.com',3,'pune',13,0,'2019-02-20 11:33:42','2019-02-20 11:33:42',1,1),(547,'aarush@gmail.com',13,'Chennai',6.5,0,'2019-02-20 11:47:13','2019-02-20 11:47:13',1,1),(548,'siva@gmail.com',6,'Chennai',12,0,'2019-02-20 11:49:07','2019-02-20 11:49:07',100,100),(549,'siva@gmail.com',10,'Pune',12,0,'2019-02-20 11:52:33','2019-02-20 11:52:33',100,100),(550,'aarush@gmail.com',1,'chennai',11.97,0,'2019-02-20 11:54:35','2019-02-20 11:54:35',1,1),(551,'aarush@gmail.com',2,'Mumbai',12,0,'2019-02-20 12:01:10','2019-02-20 12:01:10',1,1),(552,'aarush@gmail.com',2,'Mumbai',12,0,'2019-02-20 12:02:02','2019-02-20 12:02:02',1,1),(553,'aarush@gmail.com',2,'Mumbai',12,0,'2019-02-20 12:02:09','2019-02-20 12:02:09',1,1),(554,'aarush@gmail.com',4,'Chennai',12,0,'2019-02-20 12:02:14','2019-02-20 12:02:14',1,1),(555,'siva@gmail.com',3,'Chennai',12,0,'2019-02-20 12:08:45','2019-02-20 12:08:45',100,100),(556,'aarush@gmail.com',4,'Chennai',12,0,'2019-02-20 12:11:38','2019-02-20 12:11:38',1,1),(557,'siva@gmail.com',12,'Pune',12,0,'2019-02-20 12:12:54','2019-02-20 12:12:54',100,100),(558,'aarush@gmail.com',7,'Karnataka',13,0,'2019-02-21 15:55:48','2019-02-21 15:55:48',1,1),(559,'aarush@gmail.com',7,'Karnataka',13,0,'2019-02-21 15:55:55','2019-02-21 15:55:55',1,1),(560,'neelathayak@gmail.com',8,'Pune',20,0,'2019-02-21 17:31:09','2019-02-21 17:31:09',1044,1044);
/*!40000 ALTER TABLE `job_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_reviews`
--

DROP TABLE IF EXISTS `job_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_reviews` (
  `job_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `interview_process` text,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_review_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `job_reviews_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `job_reviews_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_reviews`
--

LOCK TABLES `job_reviews` WRITE;
/*!40000 ALTER TABLE `job_reviews` DISABLE KEYS */;
INSERT INTO `job_reviews` VALUES (1,1,12,1,'easy','2019-01-25 12:04:30','2019-01-25 12:04:30',NULL,NULL),(2,1,12,10,'difficult','2019-01-25 12:04:55','2019-01-25 12:04:55',NULL,NULL),(4,1,13,1,'easy','2019-01-25 12:06:18','2019-01-25 12:06:18',NULL,NULL),(6,95,3,1,'First round had aptitude and programming questions,second round was a technical interview and the questions were mainly focused on html and css.third and final round was technical and hr interview.overall process was easy.','2019-01-26 10:19:22','2019-01-26 10:19:22',NULL,NULL),(7,1,3,1,'easy','2019-01-27 05:40:16','2019-01-27 05:40:16',NULL,NULL),(8,100,6,3,'Questions were mainly based on basic concepts.so be thorough with basic concepts.','2019-01-27 07:14:06','2019-01-27 07:14:06',100,100),(9,1,21,4,'Easy interview','2019-02-12 20:03:20','2019-02-12 20:03:20',1,1),(10,1,3,1,'Easy interview process','2019-02-17 12:45:16','2019-02-17 12:45:16',1,1),(11,101,7,9,'First round was online test , second and third rounds were face to face interview which had medium difficulty level.','2019-02-21 16:59:51','2019-02-21 16:59:51',101,101);
/*!40000 ALTER TABLE `job_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(30) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user','2019-01-25 06:30:54','2019-01-25 06:31:22',3,3),(2,'company admin','2019-01-25 06:30:54','2019-01-25 06:31:22',3,3),(3,'website admin','2019-01-25 06:30:54','2019-01-25 06:31:22',3,3);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `technology_id` int(11) NOT NULL AUTO_INCREMENT,
  `technology` varchar(30) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'C','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(2,'C++','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(3,'Java','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(4,'PHP','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(5,'HTML','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(6,'CSS','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(7,'JavaScript','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(8,'Python','2019-01-26 06:21:50','2019-01-26 06:21:50',3,3),(9,'AngularJS','2019-01-26 06:22:23','2019-01-26 06:22:23',3,3),(10,'Perl','2019-01-26 06:28:25','2019-01-26 06:28:25',3,3),(11,'C#','2019-01-26 06:30:59','2019-01-26 06:30:59',3,3),(12,'MySQL','2019-01-26 06:31:34','2019-01-26 06:31:34',3,3),(13,'Ruby','2019-01-26 06:34:49','2019-01-26 06:34:49',3,3),(14,'Swift','2019-01-26 06:34:58','2019-01-26 06:34:58',3,3),(15,'Rust','2019-01-26 07:17:39','2019-01-26 07:17:39',3,3),(16,'Go','2019-01-26 07:17:47','2019-01-26 07:17:47',3,3),(17,'Elixir','2019-01-26 07:21:21','2019-01-26 07:21:21',3,3),(18,'Matlab','2019-01-26 07:21:28','2019-01-26 07:21:28',3,3),(19,'R','2019-01-26 07:30:06','2019-01-26 07:30:06',3,3),(20,'TypeScript','2019-01-26 07:30:19','2019-01-26 07:30:19',3,3),(21,'Shell','2019-01-26 07:30:25','2019-01-26 07:30:25',3,3),(22,'ReactJS','2019-01-26 10:10:57','2019-01-26 10:10:57',3,3),(23,'Artificial Intelligence','2019-01-27 07:33:28','2019-01-27 07:33:28',105,105),(24,'Augumented Reality','2019-01-27 07:33:34','2019-01-27 07:33:34',105,105),(25,'Machine Learning','2019-01-28 04:47:24','2019-01-28 04:47:24',114,114),(26,'deep learning','2019-01-28 07:05:54','2019-01-28 07:05:54',119,119),(27,'spring mvc','2019-01-28 07:46:32','2019-01-28 07:46:32',130,130);
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_classification`
--

DROP TABLE IF EXISTS `user_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_classification` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `role` (`role`),
  CONSTRAINT `user_classification_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_classification`
--

LOCK TABLES `user_classification` WRITE;
/*!40000 ALTER TABLE `user_classification` DISABLE KEYS */;
INSERT INTO `user_classification` VALUES (1,'Aarush','aarush@gmail.com','aarush123','ABC India Limited','consultant',1,'2019-01-25 06:33:20','2019-02-20 05:09:30',1,1),(2,'avneesh','avneesh@gmail.com','avneesh123','Cognizant','Manager',2,'2019-01-25 06:33:20','2019-02-12 15:47:49',2,2),(3,'anu','anu@gmail.com','anu234','Indeed','Website admin',3,'2019-01-25 06:33:20','2019-01-25 06:33:24',3,3),(95,'Sarada','sarada2509@gmail.com','sarada123','Yamaha Motors','Manager',1,'2019-01-26 10:10:12','2019-01-27 11:53:37',95,95),(96,'kamal','kamal@ztech.io','zilker123','zilker technology','admin',2,'2019-01-26 10:12:13','2019-01-26 10:12:13',96,96),(97,'sruthi','sravan1097@gmail.com','sruthi123','zilker','consultant trainee',1,'2019-01-26 13:17:24','2019-01-26 13:17:24',97,97),(98,'viswanathan','cognizant@gmail.com','cognizant1','cognizant','admin',2,'2019-01-26 13:21:19','2019-01-26 13:21:19',98,98),(99,'Manikandan','mani@gmail.com','mani@123','Tata Communication','admin',2,'2019-01-26 13:59:03','2019-01-26 13:59:03',99,99),(100,'sivalinga','siva@gmail.com','siva@123','','manager',1,'2019-01-27 06:22:42','2019-02-15 04:03:30',100,100),(101,'neela','neela@gmail.com','neela@123','Blue Dart','manager',1,'2019-01-27 06:25:36','2019-02-21 17:08:04',101,101),(102,'venkat','venkat@gmail.com','venkat#123','abc','manager',1,'2019-01-27 06:31:59','2019-01-27 06:31:59',102,102),(103,'jackie','jackie@gmail.com','jack@123','bluedart','admin',2,'2019-01-27 06:37:18','2019-01-27 06:37:18',103,103),(104,'srividya','sri@gmail.com','sri@1234','svce','student',1,'2019-01-27 07:05:05','2019-01-27 07:05:05',104,104),(107,'Ganesh','ganesh@gmail.vom','vstmotors1','vst motors','admin',2,'2019-01-27 08:01:36','2019-01-27 08:01:36',107,107),(108,'nancy','hyundai@gmail.com','hyundai1','hyundai','admin',2,'2019-01-27 08:20:22','2019-01-27 08:20:22',108,108),(109,'sathya','sathya@gmail.com','sathya@123','freshworks','admin',2,'2019-01-27 10:54:06','2019-01-27 10:54:06',109,109),(110,'raghuraman','raghu@gmail.com','raghu@123','cognizant','admin',2,'2019-01-27 12:19:56','2019-01-27 12:19:56',110,110),(111,'priyanka','priyanka@gmail.com','priya@34','Vijay Tv','anchor',1,'2019-01-27 13:05:59','2019-02-17 16:59:51',111,111),(112,'Nisha','nisha@gmail.com','nisha@123','ABC India Limited','admin',2,'2019-01-27 13:24:06','2019-01-27 13:24:06',112,112),(115,'abiram','abiram@gmail.com','abiram@123','musigma','admin',2,'2019-01-28 04:49:20','2019-01-28 04:49:20',115,115),(122,'sandy','sandy@gmail.com','sandy@123','abcd','student',1,'2019-01-28 07:19:53','2019-01-28 07:19:53',122,122),(127,'aravind','aravind@gmail.com','aravind123','svce','student',1,'2019-01-28 07:36:13','2019-01-28 07:36:13',127,127),(130,'divya','divya@gmail.com','divya@12','svce','student',1,'2019-01-28 07:44:20','2019-01-28 07:44:20',130,130),(131,'gopal','gopal@gmail.com','gopal@123','zilker technology','admin',2,'2019-01-29 09:12:56','2019-01-29 09:12:56',131,131),(147,'sarada','sar@gmail.com','sar123','genesis','admin',2,'2019-02-11 16:10:04','2019-02-11 16:10:04',147,147),(662,'gaay','gaay@gmail.com','gaay123','zilker technology','Consultant',1,'2019-02-15 06:39:48','2019-02-15 06:39:48',662,662),(673,'anu','anu2001@gmail.com','anu123','zilker technology','manager',1,'2019-02-15 07:58:25','2019-02-15 07:58:25',673,673),(1031,'sara','sara@gmail.com','sara','Delium','manager',1,'2019-02-17 08:06:14','2019-02-21 16:43:45',1031,1031),(1035,'siva','siva@yahoo.com','siva123','vst motors','admin',2,'2019-02-17 08:26:07','2019-02-17 08:26:07',1035,1035),(1036,'mahesh','mahesh@gmail.com','mahesh123','Larsen and Toubro','consultant',1,'2019-02-17 08:33:04','2019-02-17 08:33:04',1036,1036),(1038,'latha','latha@gmail.com','latha123','ABC Limited','manager',1,'2019-02-17 08:35:58','2019-02-17 08:35:58',1038,1038),(1040,'viji','viji@hotmail.com','viji','larsen and toubro','admin',2,'2019-02-17 08:37:27','2019-02-17 08:37:27',1040,1040),(1041,'divya','divya@hotmail.com','divya123','ABC India Limited','admin',2,'2019-02-17 08:39:46','2019-02-17 08:39:46',1041,1041),(1042,'abinna','abi@gmail.com','abi','ABC Limited','supervisor',1,'2019-02-17 08:42:09','2019-02-17 08:42:09',1042,1042),(1044,'neelayathakshi','neelathayak@gmail.com','neela','musigma','trainee',1,'2019-02-17 13:24:55','2019-02-21 17:30:49',1044,1044),(1045,'asas','asas@gmail.com','asasa','Tata consultancy services','admin',2,'2019-02-19 06:51:45','2019-02-19 06:51:45',1045,1045),(1046,'divya','divss@gmail.com','divs','delium','trainee',1,'2019-02-19 07:00:23','2019-02-19 07:00:23',1046,1046),(1047,'visvesh','vish@gmail.com','vish123','hyundai','admin',2,'2019-02-19 07:38:25','2019-02-19 07:38:25',1047,1047),(1048,'krishna','krish@gmail.com','krish123','Larsen and Toubro','manager',1,'2019-02-19 07:44:19','2019-02-19 07:44:19',1048,1048),(1049,'krishna','krishna@gmail.com','krishna','Tata consultancy services','admin',2,'2019-02-19 07:45:36','2019-02-19 07:45:36',1049,1049);
/*!40000 ALTER TABLE `user_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_technology_mapping`
--

DROP TABLE IF EXISTS `user_technology_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_technology_mapping` (
  `user_technology_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `technology_id` int(11) NOT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_technology_id`),
  KEY `user_id` (`user_id`),
  KEY `technology_id` (`technology_id`),
  CONSTRAINT `user_technology_mapping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_technology_mapping_ibfk_2` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_technology_mapping`
--

LOCK TABLES `user_technology_mapping` WRITE;
/*!40000 ALTER TABLE `user_technology_mapping` DISABLE KEYS */;
INSERT INTO `user_technology_mapping` VALUES (7,95,4,'2019-02-17 15:32:00','2019-02-17 15:32:00',95,95),(8,95,5,'2019-02-17 15:32:00','2019-02-17 15:32:00',95,95),(9,97,6,'2019-02-17 15:32:00','2019-02-17 15:32:00',97,97),(10,97,7,'2019-02-17 15:32:00','2019-02-17 15:32:00',97,97),(11,111,2,'2019-02-17 16:59:51','2019-02-17 16:59:51',111,111),(12,111,3,'2019-02-17 16:59:51','2019-02-17 16:59:51',111,111),(13,111,4,'2019-02-17 16:59:51','2019-02-17 16:59:51',111,111),(22,1046,1,'2019-02-19 07:00:23','2019-02-19 07:00:23',1046,1046),(23,1046,7,'2019-02-19 07:00:24','2019-02-19 07:00:24',1046,1046),(24,1046,11,'2019-02-19 07:00:24','2019-02-19 07:00:24',1046,1046),(25,1048,3,'2019-02-19 07:44:19','2019-02-19 07:44:19',1048,1048),(26,1048,7,'2019-02-19 07:44:19','2019-02-19 07:44:19',1048,1048),(27,1,2,'2019-02-20 05:09:30','2019-02-20 05:09:30',1,1),(28,1,5,'2019-02-20 05:09:30','2019-02-20 05:09:30',1,1),(29,1,6,'2019-02-20 05:09:30','2019-02-20 05:09:30',1,1),(30,1,10,'2019-02-20 05:09:30','2019-02-20 05:09:30',1,1),(31,1044,25,'2019-02-21 17:30:49','2019-02-21 17:30:49',1044,1044);
/*!40000 ALTER TABLE `user_technology_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy_publish`
--

DROP TABLE IF EXISTS `vacancy_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_publish` (
  `company_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `location` varchar(30) NOT NULL,
  `job_description` text,
  `salary` bigint(20) DEFAULT NULL,
  `vacancy_count` int(11) DEFAULT NULL,
  `vacancy_status` varchar(255) NOT NULL DEFAULT 'available',
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`job_id`,`location`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `vacancy_publish_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `vacancy_publish_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_publish`
--

LOCK TABLES `vacancy_publish` WRITE;
/*!40000 ALTER TABLE `vacancy_publish` DISABLE KEYS */;
INSERT INTO `vacancy_publish` VALUES (3,2,'Chennai',' A PHP Developer is responsible for creating and implementing an array of Web-based products using PHP, MySQL, Ajax, and JavaScript. You develop back-end components, connect the application with other web services, and assist front-end developers by ensuring their work integrates with the application.',6,12,'available','2019-02-14 17:56:25','2019-02-14 17:56:25',96,96),(3,10,'Chennai','Consultants offer advice and expertise to organisations to help them improve their business performance in terms of operations, profitability, management, structure and strategy. Although the workload can be heavy, consulting is a sociable profession with plenty of networking opportunities. The work stretches across a variety of areas, including management, strategy, IT, finance, marketing, HR and supply chain management.',7,0,'expired','2019-02-14 17:27:48','2019-02-14 17:27:48',96,96),(3,11,'Chennai',' Developing and implementing HR strategies and initiatives aligned with the overall business strategy. Bridging management and employee relations by addressing demands, grievances or other issues. Managing the recruitment and selection process.',12,1,'available','2019-02-14 17:59:38','2019-02-14 17:59:38',96,96),(3,14,'Chennai','Serve as the primary relationship owner for an assigned group of top tier client accounts with responsibility for retention and growth. Ensure clients derive maximum value from our services. Prepare implementation plans and lead client on-boarding; present content strategy and annual plan. Work closely with clients to identify needs including content approval workflows and consult on best practices for solutions and setup.\r\n\r\nPrepare and deliver effective client presentations, including stakeholders at all levels of the organization up to C-Suite. Deliver weekly, monthly and quarterly status and results presentations to internal and external teams. Regularly evaluate quality of content, managing external content creation, editorial and strategy resources. Identify new opportunities from within existing accounts, partnering with the Business Development team to aid in increasing revenue. Ensure a deep enough understanding of clientsâ?? individual experiences to head off potential issues before they become problems.',10,2,'available','2019-02-14 17:49:06','2019-02-14 17:49:06',96,96),(3,16,'Pune','Develop and implement effective sales strategies\r\nLead nationwide sales team members to achieve sales targets\r\nEstablish productive and professional relationships with key personnel in assigned customer accounts\r\nNegotiate and close agreements with large customers\r\nMonitor and analyze performance metrics and suggest improvements\r\nPrepare monthly, quarterly and annual sales forecasts\r\nPerform research and identify new potential customers and new market opportunities\r\nProvide timely and effective solutions aligned with clientsâ?? needs\r\nLiaise with Marketing and Product Development departments to ensure brand consistency\r\nStay up-to-date with new product launches and ensure sales team members are on board',12,2,'available','2019-02-14 17:51:10','2019-02-14 17:51:10',96,96),(10,2,'Mumbai','Network Engineer Responsibilities: Maintaining and administering computer networks and related computing environments including systems software, applications software, hardware, and configurations. ... Protecting data, software, and hardware by coordinating, planning and implementing network security measures.',5,6,'available','2019-02-13 15:44:44','2019-02-20 05:08:36',2,2),(10,4,'kerala','Systems Engineer Responsibilities include: Managing and monitoring all installed systems and infrastructure. Installing, configuring, testing and maintaining operating systems, application software and system management tools. Ensuring the highest levels of systems and infrastructure availability.',12,0,'expired','2019-02-13 15:41:30','2019-02-18 10:33:45',2,2),(10,6,'Gujarat',' A Java developer is responsible for many duties throughout the development lifecycle of applications, from concept and design right through to testing. Here are some other responsibilities they may have: Design, implement and maintain java application phases.',8,0,'expired','2019-02-13 15:45:47','2019-02-18 11:37:38',2,2),(10,7,'Chennai','The Head of Marketing is required to: Provide service leadership related to Marketing and Communications of business. ... As the Head of Marketing, they will support the Director with their duties and also work within the management team to maintain the collective work to a good standard.',12,3,'available','2019-02-20 06:44:18','2019-02-20 06:44:18',2,2),(10,8,'Chennai','To us, an HR manager is the go-to person for all employee-related issues. This means that your HR manager duties will involve managing activities such as job design, recruitment, employee relations, performance management, training & development and talent management.\r\n\r\nThe job of HR manager is important to business success. People are our most important asset and youâ??ll be the one to ensure we have a happy and productive workplace where everyone works to realize our established mission and objectives. Promoting corporate values and shaping a positive culture is a vital aspect of a complete HR manager job description and specification.',13,1,'available','2019-02-20 08:17:44','2019-02-20 08:17:44',112,112),(10,12,'Chennai','a general manager of administration is responsible for overseeing all administrative functions in your business. A major part involves leading and directing employees. She delegates administrative tasks, such as accounting, paperwork and payroll, while giving you the freedom to deal with other issues.',12,5,'available','2019-02-13 15:43:03','2019-02-21 17:20:46',2,2),(10,23,'Mumbai','Content Writer responsibilities include: Researching industry-related topics (combining online sources, interviews and studies) Writing clear marketing copy to promote our products/services. Preparing well-structured drafts using Content Management Systems.',12,0,'expired','2019-02-18 11:36:47','2019-02-21 17:21:08',2,2),(12,1,'Chennai','A Java developer is responsible for many duties throughout the development lifecycle of applications, from concept and design right through to testing. Here are some other responsibilities they may have: Design, implement and maintain java application phases.',13,13,'available','2019-02-15 05:06:27','2019-02-15 05:06:27',99,99),(12,4,'Chennai','Systems Engineer Responsibilities include: Managing and monitoring all installed systems and infrastructure. Installing, configuring, testing and maintaining operating systems, application software and system management tools. Ensuring the highest levels of systems and infrastructure availability.',12,5,'available','2019-02-15 05:11:11','2019-02-15 05:11:11',99,99),(12,8,'Pune','Maintains the work structure by updating job requirements and job descriptions for all positions.\r\nMaintains organization staff by establishing a recruiting, testing, and interviewing program; counseling managers on candidate selection; conducting and analyzing exit interviews; recommending changes.\r\nPrepares employees for assignments by establishing and conducting orientation and training programs.\r\nMaintains a pay plan by conducting periodic pay surveys; scheduling and conducting job evaluations; preparing pay budgets; monitoring and scheduling individual pay actions; recommending, planning, and implementing pay structure revisions.\r\nEnsures planning, monitoring, and appraisal of employee work results by training managers to coach and discipline employees; scheduling management conferences with employees; hearing and resolving employee grievances; counseling employees and supervisors.\r\nMaintains employee benefits programs and informs employees of benefits by studying and assessing benefit needs and trends; recommending benefit programs to management; directing the processing of benefit claims; obtaining and evaluating benefit contract bids; awarding benefit contracts; designing and conducting educational programs on benefit programs.\r\nEnsures legal compliance by monitoring and implementing applicable human resource federal and state requirements; conducting investigations; maintaining records; representing the organization at hearings.\r\n\r\nMaintains management guidelines by preparing, updating, and recommending human resource policies and procedures.\r\nMaintains historical human resource records by designing a filing and retrieval system; keeping past and current records.\r\nMaintains professional and technical knowledge by attending educational workshops; reviewing professional publications; establishing personal networks; participating in professional societies.Completes human resource operational requirements by scheduling and assigning employees; following up on work results.\nMaintains human resource staff by recruiting, selecting, orienting, and training employees.\nMaintains human resource staff job results by counseling and disciplining employees; planning, monitoring, and appraising job results.\nContributes to team effort by accomplishing related results as needed.',12,4,'available','2019-02-14 09:02:51','2019-02-14 09:02:51',99,99),(18,7,'Karnataka',' The Head of Marketing is required to: Provide service leadership related to Marketing and Communications of business. ... As the Head of Marketing, they will support the Director with their duties and also work within the management team to maintain the collective work to a good standard.',20,6,'available','2019-02-21 12:18:48','2019-02-21 13:22:23',108,108),(18,10,'Pune','Consultant offer advice and expertise to organisations to help them improve their business performance in terms of operations, profitability, management, structure and strategy. ... The work stretches across a variety of areas, including management, strategy, IT, finance, marketing, HR and supply chain management.',6,6,'available','2019-02-21 12:27:40','2019-02-21 13:22:48',108,108),(18,12,'Banglore','We are looking for a General Manager to oversee all staff, budgets and operations of the local business unit. General Manager responsibilities include formulating overall strategy, managing people and establishing policies.',10,3,'available','2019-02-21 12:25:05','2019-02-21 12:51:01',108,108),(23,17,'Pune','Depending on the job, office clerks might answer phones, filing, data processing, faxing, envelope stuffing and mailing, message delivery, running errands, sorting incoming mail and much more. Each office clerk job is a little different and varies by the office type.',5,10,'available','2019-02-21 17:24:52','2019-02-21 17:24:52',1049,1049),(23,18,'Kerala','A senior developer may manage a team of developers and will be expected to encourage creativity and efficiency throughout complex digital projects. Due to the pressurised nature of the role, a robust and organised approach to the work is needed to produce the best solutions.\r\nA deep understanding of all stages of digital development is as essential as an understanding of the part each developer plays and how it contributes to the end product. Senior developers thrive on new challenges and are never intimidated by something unfamiliar to them. They are passionate about their work and gain genuine enjoyment from seeing projects through, from start to finish.\r\nFluency in digital languages such as JavaScript, CSS and HTML is standard, as is expertise in Adobe software like Photoshop and Illustrator.',13,3,'available','2019-02-21 17:23:29','2019-02-21 17:23:29',1049,1049),(24,6,'Pune','A team leader is responsible for guiding a group of employees as they complete a project. They are responsible for developing and implementing a timeline their team will use to reach its end goal. Some of the ways team leaders ensure they reach their goals is by delegating tasks to their members, including themselves.',13,1,'available','2019-02-20 08:04:58','2019-02-20 08:04:58',115,115);
/*!40000 ALTER TABLE `vacancy_publish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-21 23:03:03
