-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: wendao
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `wd_comment`
--

DROP TABLE IF EXISTS `wd_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `video_id` int(11) NOT NULL,
  `comment_like` int(10) unsigned DEFAULT NULL,
  `comment_content` varchar(1024) NOT NULL,
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_reply` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`author_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `Video` (`video_id`),
  CONSTRAINT `wd_comment_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `wd_video` (`video_id`),
  CONSTRAINT `wd_comment_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `wd_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_comment`
--

LOCK TABLES `wd_comment` WRITE;
/*!40000 ALTER TABLE `wd_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_interest`
--

DROP TABLE IF EXISTS `wd_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_interest` (
  `interest_id` int(11) NOT NULL,
  `interest_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_interest`
--

LOCK TABLES `wd_interest` WRITE;
/*!40000 ALTER TABLE `wd_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_note`
--

DROP TABLE IF EXISTS `wd_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_note` (
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `note_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note_address` varchar(100) DEFAULT NULL,
  `note_name` varchar(30) DEFAULT NULL,
  KEY `noteuser` (`user_id`),
  KEY `notevid` (`video_id`),
  CONSTRAINT `wd_note_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`),
  CONSTRAINT `wd_note_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `wd_video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_note`
--

LOCK TABLES `wd_note` WRITE;
/*!40000 ALTER TABLE `wd_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user`
--

DROP TABLE IF EXISTS `wd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_passwd` varchar(300) DEFAULT NULL,
  `user_sex` char(2) DEFAULT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_picture` varchar(100) DEFAULT NULL,
  `user_home_page` varchar(100) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_times` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_mail` (`user_mail`),
  UNIQUE KEY `user_mail_2` (`user_mail`),
  UNIQUE KEY `user_mail_3` (`user_mail`),
  UNIQUE KEY `user_home_page` (`user_home_page`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user`
--

LOCK TABLES `wd_user` WRITE;
/*!40000 ALTER TABLE `wd_user` DISABLE KEYS */;
INSERT INTO `wd_user` VALUES (1,'test1','123456','女','`123456789@qq.com',NULL,NULL,'2016-04-04 14:32:46',NULL);
/*!40000 ALTER TABLE `wd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user_interest`
--

DROP TABLE IF EXISTS `wd_user_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user_interest` (
  `user_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`interest_id`),
  KEY `interest` (`interest_id`),
  CONSTRAINT `wd_user_interest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`),
  CONSTRAINT `wd_user_interest_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `wd_interest` (`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user_interest`
--

LOCK TABLES `wd_user_interest` WRITE;
/*!40000 ALTER TABLE `wd_user_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_user_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_user_video`
--

DROP TABLE IF EXISTS `wd_user_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_user_video` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`video_id`),
  KEY `video_id` (`video_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `User_Video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `User_Video_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `Video` (`video_id`),
  CONSTRAINT `User_Video_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `Video_Type` (`type_id`),
  CONSTRAINT `wd_user_video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`user_id`),
  CONSTRAINT `wd_user_video_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `wd_video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_user_video`
--

LOCK TABLES `wd_user_video` WRITE;
/*!40000 ALTER TABLE `wd_user_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_user_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_video`
--

DROP TABLE IF EXISTS `wd_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(20) NOT NULL,
  `video_describe` varchar(1024) DEFAULT NULL,
  `video_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_url` varchar(100) DEFAULT NULL,
  `video_comment` int(10) unsigned DEFAULT NULL,
  `video_like` int(10) unsigned DEFAULT NULL,
  `video_play` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE KEY `video_name` (`video_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_video`
--

LOCK TABLES `wd_video` WRITE;
/*!40000 ALTER TABLE `wd_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wd_video_interest`
--

DROP TABLE IF EXISTS `wd_video_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wd_video_interest` (
  `video_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`,`interest_id`),
  KEY `inter` (`interest_id`),
  CONSTRAINT `wd_video_interest_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `wd_video` (`video_id`),
  CONSTRAINT `wd_video_interest_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `wd_interest` (`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wd_video_interest`
--

LOCK TABLES `wd_video_interest` WRITE;
/*!40000 ALTER TABLE `wd_video_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `wd_video_interest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  9:31:28
