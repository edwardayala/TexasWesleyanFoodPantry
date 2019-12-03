-- MySQL dump 10.13  Distrib 5.6.43, for Linux (x86_64)
--
-- Host: localhost    Database: EAAYALA
-- ------------------------------------------------------
-- Server version	5.6.43

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
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `student_id` int(10) NOT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1234567890,'2019-07-03 18:01:54'),(555555,'2019-07-03 18:30:22'),(1324,'2019-07-03 18:32:05'),(567653,'2019-07-03 19:18:02'),(4352315,'2019-07-03 21:00:51'),(7888887,'2019-07-03 21:13:33'),(4375644,'2019-07-03 21:57:50'),(654321,'2019-07-03 23:16:48'),(654321,'2019-07-03 23:19:01'),(654321,'2019-07-03 23:20:18');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `item` char(50) NOT NULL,
  `amount` int(100) DEFAULT NULL,
  PRIMARY KEY (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('Apple',5),('Banana',8),('Broccoli',17),('Carrot',2),('Corn',15),('Deli Sandwich',5),('Egg Plant',12),('French Fries',15),('Green Beans',21),('Hamburgers',7),('Ice Cream',3),('Jell-O',12),('Kiwi',8),('Lima Beans',32),('Mashed Potatoes',11),('Noodle Soup',54),('Orange',10),('Pear',5),('Quinoa',4),('Raisins',12),('String Cheese',16),('Tomato Soup',23),('Unsalted Nuts',19),('Vienna Sausage',24),('Wheat Bread',15),('Xavier Soup',17),('Yogurt',11),('Zucchini',12);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `first_name` char(20) DEFAULT NULL,
  `last_name` char(20) DEFAULT NULL,
  `student_id` int(14) NOT NULL,
  `grade` char(20) DEFAULT NULL,
  `housing_status` char(20) DEFAULT NULL,
  `type` char(5) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('TESTTEST','TESTTEST',12324,'Sophomore','Off Campus','stu'),('NAME','LNAME',222222,'Freshman','On Campus','stu'),('Edward','Ayala',427551,'Junior','Off Campus','sup'),('Mike','Hunt',435245,'Sophomore','On Campus','stu'),('Yukong','Zhang',654321,'Senior','Off Campus','stu'),('Student_9','LName_9',999999,'Sophomore','On Campus','stu'),('Edwad','TEST',1234132,'Freshman','Off Campus','stu'),('John','Smith',1234567,'Senior','On Campus','stu'),('test_first','test_last',1430224,'Freshman','On Campus','stu'),('Bob','Johnson',7654321,'Sophomore','On Campus','stu'),('George','Washington',11223344,'Freshman','On Campus','vol'),('Alexander','Hamilton',33445566,'Junior','Off Campus','vol'),('Benjamin','Franklin',66778899,'Senior','On Campus','vol'),('Albert','Einstein',90674231,'Freshman','Off Campus','sup'),('testf_volunteer','testl_volunteer',90909090,'Sophomore','Off Campus','vol'),('Sample_First','Sample_Last',123454321,'Freshman','On Campus','stu');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `username` char(20) NOT NULL,
  `password` char(20) DEFAULT NULL,
  `full_time` tinyint(1) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `course` char(50) DEFAULT NULL,
  `comment` char(200) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('eaayala','csc4391',1,3.95,'csc4391','Web programming'),('edward','sadfads',0,4,'CSC1310 Foundations of Computer Science','dsa'),('jdoe','csc4391',1,3.25,'csc4391','Web programming'),('usern','psadfas',0,2,'CSC2320 Data Structures','gfhjghf');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-03 23:24:52
