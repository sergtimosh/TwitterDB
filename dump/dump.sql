-- MySQL dump 10.13  Distrib 5.7.20, for osx10.13 (x86_64)
--
-- Host: localhost    Database: twitter
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(280) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  KEY `fk_comment_tweet1_idx` (`tweet_id`),
  CONSTRAINT `fk_comment_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `tweet` (`tweet_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'i don\'t beleive you',2,1,'2018-01-28 22:13:06'),(2,'No way!',1,1,'2018-01-29 08:13:06'),(3,'Can you beleive this??',3,3,'2018-01-22 09:13:06'),(4,'Yeah! Great news',4,4,'2018-01-23 20:13:06'),(5,'Looking for this!',6,10,'2018-01-29 18:13:06'),(6,'Thanks!',10,5,'2018-01-28 16:13:06'),(7,'I\'m angry',11,1,'2018-01-29 01:13:06'),(8,'Hate you',2,3,'2018-01-28 15:13:06'),(10,'Bon voyage',5,7,'2018-01-28 11:13:06'),(11,'Wow!',10,8,'2018-01-28 13:13:06'),(12,'What are the drawbacks?',2,6,'2018-01-29 03:13:06'),(13,'It is a dream!',3,4,'2018-01-28 17:13:06'),(14,'See, what i\'ve found here',4,10,'2018-01-29 21:13:06'),(15,'No!',6,1,'2018-01-27 22:13:06'),(16,'Go ahead',8,6,'2018-01-28 06:13:06'),(17,'Yeah, bitch!',8,5,'2018-01-21 07:13:06'),(18,'Come on!',1,3,'2018-01-28 22:25:06');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follower`
--

DROP TABLE IF EXISTS `follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follower` (
  `user_id` int(11) NOT NULL,
  `followed_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`followed_by_id`),
  KEY `fk_follower_user2_idx` (`followed_by_id`),
  CONSTRAINT `fk_follower_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_follower_user2` FOREIGN KEY (`followed_by_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follower`
--

LOCK TABLES `follower` WRITE;
/*!40000 ALTER TABLE `follower` DISABLE KEYS */;
INSERT INTO `follower` VALUES (2,1),(3,1),(6,1),(7,1),(9,1),(10,1),(11,1),(12,1),(1,2),(3,2),(6,2),(1,3),(2,3),(6,3),(1,4),(3,4),(6,4),(6,5),(3,7),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12);
/*!40000 ALTER TABLE `follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `tweet_id`,
 1 AS `body`,
 1 AS `comment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweet` (
  `tweet_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `body` varchar(280) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tweet_id`),
  KEY `fk_tweet_user1_idx` (`user_id`),
  CONSTRAINT `fk_tweet_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,1,'Just listen how is good the soundtrack to the first season of \"Dark','2018-01-28 14:18:20'),(2,1,'I\'d like to go to absa cape epic on 2019','2018-01-01 14:18:20'),(3,4,'Looking for the summer!','2018-01-28 14:18:20'),(4,5,'I\'ve found new details about my ancestors!','2018-01-28 14:18:20'),(5,7,'My turkish trip was so good! Want more :)','2018-01-28 14:18:20'),(6,3,'I whant that Lego Classic so bad!','2018-01-28 14:26:18'),(7,10,'Listen to our new track on google play music!','2018-01-28 14:27:16'),(8,6,'Many open minded people in Davos, thanks for oportunity to say important words to the comunity!','2018-01-28 14:29:06'),(9,2,'I\'m so tired of my job! Looking for new opportunities!','2018-01-28 14:30:45'),(10,12,'We are going to visit US in 2018. See you!','2018-01-28 14:32:22');
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'timtom','1983-04-10'),(2,'sashel81','1981-07-13'),(3,'arstymosh','2010-01-08'),(4,'tamothk','1961-07-02'),(5,'waskos','1987-03-30'),(6,'aivazolya','1981-11-09'),(7,'orysya','1989-03-27'),(8,'danylo','2011-08-30'),(9,'apparat','2005-01-10'),(10,'moderat','2007-05-15'),(11,'maxrichter','1966-03-22'),(12,'tameimpala','2007-01-01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `tw`.`tweet_id` AS `tweet_id`,`tw`.`body` AS `body`,`c`.`comment` AS `comment` from (`tweet` `tw` join `comment` `c` on((`c`.`tweet_id` = `tw`.`tweet_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-29  1:17:36
