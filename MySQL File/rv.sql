-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `cid` int(11) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `pincode` int(6) NOT NULL,
  `pno` int(11) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pno` (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1001,'Prakash','prakash@gmail.com','HSR','Bangalore','Karnataka',562143,957463218,'Prakash'),(1002,'Rakesh','rakesh@gmail.com','HSR','Bangalore','Karnataka',562143,777463218,'Rakesh'),(1003,'Vinay','vinay@gmail.com','TinFactory','Bangalore','Karnataka',562154,889463218,'Vinay'),(1004,'Darshan','darshan@gmail.com','TinFactory','Bangalore','Karnataka',562154,845663218,'Darshan'),(1005,'Ashish','ashish@gmail.com','Hebbala','Bangalore','Karnataka',560069,852103218,'Ashish'),(1006,'Giri','giri@gmail.com','Yelahanka','Bangalore','Karnataka',560063,814753218,'Giri'),(1007,'Anupam','anupam@gmail.com','Yelahanka','Bangalore','Karnataka',560063,999953218,'Anupam'),(1008,'Anuska','anuska@gmail.com','Yelahanka','Bangalore','Karnataka',560063,989953218,'Anuska'),(1009,'Richa','richa@gmail.com','Devenhalli','Bangalore','Karnataka',562357,789953218,'Richa'),(1010,'Varshi','varshi@gmail.com','Yashwantpur','Bangalore','Karnataka',566211,798953218,'Varshi'),(1011,'Shalini','shalini@gmail.com','Yashwantpur','Banglore','Karnataka',570000,987451263,'Shalini'),(1012,'Shreya','shreya@gmail.com','Yashwantpur','Banglore','Karnataka',570000,987451213,'Shreya'),(1013,'abc','abc@gmail.com','YASHWANTPUR','dfsf','sfsgf',570000,954786214,'abc'),(1015,'Chiya','Chiya@gmail.com','Baglur','Bangalore','Karnataka',562157,95195152,'Chiya'),(1016,'Madhu','Madhu@gmail.com','Marathalli','Bangalore','Karnataka',562214,951753654,'Madhu'),(1017,'Deepak','Deepak@gmail.com','MGRoad','Delhi','Delhi',200145,852852852,'Deepak'),(1018,'Rahul','rahul@gmail.com','HMHalli','Bangalore','Karnataka',562157,814759045,'rahul');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_pin` AFTER INSERT ON `customer` FOR EACH ROW begin
     if new.pincode>=563000 or new.pincode<=560001
     then insert into pin_req values(new.pincode);
    end if;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingredient` (
  `Iid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `Quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`Iid`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (301,'Onion',50.50,212),(302,'Golden COrn',50.50,134),(303,'Crisp Capsicum',50.00,184),(304,'Tomato',50.00,143),(305,'Extra Cheese',65.00,351),(306,'Mushroom',50.00,124),(307,'Paneer',50.00,188),(308,'Barbecue Chicken',65.00,151),(309,'Peri Peri Chiken',65.00,132),(310,'Grilled Chicken',65.00,189);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderr`
--

DROP TABLE IF EXISTS `orderr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderr` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `qantity` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `odate` date NOT NULL,
  `otime` time NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `cid` (`cid`),
  KEY `pid` (`pid`),
  CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `orderr_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderr`
--

LOCK TABLES `orderr` WRITE;
/*!40000 ALTER TABLE `orderr` DISABLE KEYS */;
INSERT INTO `orderr` VALUES (10001,1009,201,2,289.00,'2018-10-08','14:16:55'),(10002,1009,203,1,314.00,'2018-02-18','09:16:55'),(10003,1002,203,3,314.00,'2015-06-08','05:16:15'),(10004,1005,205,1,289.00,'2016-09-18','11:16:19'),(10005,1007,202,1,219.00,'2018-07-14','19:12:09'),(10006,1006,202,2,294.00,'2017-09-18','19:11:38'),(10007,1008,207,1,291.00,'2017-11-16','16:47:38'),(10008,1001,206,1,288.00,'2016-11-14','10:12:09'),(10009,1003,209,2,542.00,'2018-05-14','12:12:39'),(10010,1003,209,1,296.00,'2017-03-02','08:19:39'),(10011,1004,202,1,275.00,'2018-11-24','12:42:55'),(10012,1004,202,1,275.00,'2018-11-24','12:43:15'),(10013,1018,209,1,129.00,'2018-11-24','12:47:47'),(10014,1018,206,1,225.00,'2018-11-25','12:04:20'),(10015,1018,204,1,255.00,'2018-11-27','10:02:58'),(10016,1018,206,1,225.00,'2019-02-09','21:05:38'),(10017,1018,209,1,129.00,'2019-02-09','21:06:00'),(10018,1018,205,1,255.00,'2019-02-09','23:53:10');
/*!40000 ALTER TABLE `orderr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin_req`
--

DROP TABLE IF EXISTS `pin_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pin_req` (
  `pincode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin_req`
--

LOCK TABLES `pin_req` WRITE;
/*!40000 ALTER TABLE `pin_req` DISABLE KEYS */;
INSERT INTO `pin_req` VALUES (566211),(570000),(570000),(570000),(951234),(200145);
/*!40000 ALTER TABLE `pin_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pizza_ingredient` (
  `pid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`iid`),
  KEY `iid` (`iid`),
  CONSTRAINT `pizza_ingredient_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `pizza_ingredient_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `ingredient` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingredient`
--

LOCK TABLES `pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `pizza_ingredient` DISABLE KEYS */;
INSERT INTO `pizza_ingredient` VALUES (201,301),(202,301),(201,302),(202,302),(204,302),(201,303),(202,303),(204,304),(208,307),(208,308),(210,309),(210,310);
/*!40000 ALTER TABLE `pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `Pid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `Quantity` int(11) DEFAULT '0',
  `Price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (201,'Margherita','Veg',158,253.00),(202,'Peri Peri Chicken','Non Veg',119,275.00),(203,'Non Veg Supreme','Non Veg',122,285.00),(204,'Peppy Paneer','Veg',92,255.00),(205,'Farm House','Veg',192,255.00),(206,'Deluxe Veggie','Veg',192,225.00),(207,'Cheese N Corn','Veg',91,115.00),(208,'Chicken Fiesta','Non Veg',134,249.00),(209,'Veggie Paradise','Veg',91,129.00),(210,'Chicken Tikka','Non Veg',112,239.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `desg` varchar(20) DEFAULT NULL,
  `rating` int(2) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `pno` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `pno` (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Ayush','Delivery Guy',8,18000.00,745976131),(2,'Shubham','Delivery Guy',6,10000.00,845976131),(3,'Tosh','Chef',6,19000.00,788886131),(4,'Anupam','Delivery Guy',9,20000.00,987541263),(5,'Amrit','Chef',4,16000.00,887541260),(6,'Rahul','Manager',10,40000.00,951357648),(7,'Rakesh','Delivery Guy',7,17000.00,852357648),(8,'Shivam','Chef',10,19500.00,777357648),(9,'Shaurya','Delivery Guy',4,11500.00,778857648),(10,'Amit','Delivery Guy',5,16500.00,778857678),(12,'ABC','Delivery Guy',0,10000.00,984753321),(13,'ABC','Chef',7,10000.00,884753321);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ch_rating` BEFORE INSERT ON `staff` FOR EACH ROW begin
if new.rating>10 or new.rating<0
then set new.rating=0;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v1_staff_details`
--

DROP TABLE IF EXISTS `v1_staff_details`;
/*!50001 DROP VIEW IF EXISTS `v1_staff_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v1_staff_details` AS SELECT 
 1 AS `Name`,
 1 AS `desg`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v2_product`
--

DROP TABLE IF EXISTS `v2_product`;
/*!50001 DROP VIEW IF EXISTS `v2_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v2_product` AS SELECT 
 1 AS `Name`,
 1 AS `Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wishlist` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '0',
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`cid`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1001,204,2,205.00),(1002,206,2,205.00),(1003,208,4,205.00),(1004,202,1,205.00),(1006,202,1,205.00),(1006,207,2,205.00),(1007,202,1,285.00),(1007,203,1,285.00),(1007,209,2,205.00),(1010,206,3,205.00);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v1_staff_details`
--

/*!50001 DROP VIEW IF EXISTS `v1_staff_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1_staff_details` AS select `staff`.`Name` AS `Name`,`staff`.`desg` AS `desg`,`staff`.`rating` AS `rating` from `staff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v2_product`
--

/*!50001 DROP VIEW IF EXISTS `v2_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v2_product` AS select `product`.`Name` AS `Name`,`product`.`Type` AS `Type` from `product` where (`product`.`Type` = 'Veg') */;
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

-- Dump completed on 2019-02-10  0:01:59
