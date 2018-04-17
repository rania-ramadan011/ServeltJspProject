-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shoesdb
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_user_paid_products_idx` (`user_id`),
  KEY `products_user_paid_products_fk_idx` (`product_id`),
  CONSTRAINT `products_user_paid_products_fkey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_user_paid_products_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (122,4,3,3,450),(123,4,2,2,170);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_quantity` int(10) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Casio watch 1',150,9,'images/c-1.jpg','Men','Casio'),(2,'Omega watch 1',170,5,'images/c-2.jpg','Men','Omega'),(3,'Omega watch 2',150,7,'images/c-3.jpg','Women','Omega'),(4,'Casio watch 2',155,9,'images/p-3.png','Women','Casio'),(5,'timex watch 1',90,9,'images/p-4.png','Men','Timex'),(6,'Seiko watch 1',110,9,'images/p-5.png','Women','Seiko'),(7,'Seiko watch 2',143,9,'images/pr-2.jpg','Men','seiko');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_paid_products`
--

DROP TABLE IF EXISTS `user_paid_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_paid_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_user_paid_products_fk_idx` (`user_id`),
  KEY `products_user_paid_products_fk_idx` (`product_id`),
  CONSTRAINT `products_user_paid_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_user_paid_products_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_paid_products`
--

LOCK TABLES `user_paid_products` WRITE;
/*!40000 ALTER TABLE `user_paid_products` DISABLE KEYS */;
INSERT INTO `user_paid_products` VALUES (1,2,6,3,NULL),(2,4,2,4,680),(3,4,2,4,680),(4,4,4,4,620),(5,4,2,4,680),(6,4,2,4,680),(7,4,4,4,620),(8,4,4,4,620),(9,4,3,6,900),(10,4,3,6,900),(11,4,3,6,900),(12,4,3,6,900),(13,4,3,6,900),(14,4,2,4,680),(15,4,3,4,600),(16,4,3,2,300),(17,4,2,1,170),(18,4,2,3,510),(19,4,2,1,170),(20,4,3,2,300);
/*!40000 ALTER TABLE `user_paid_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `user_job` varchar(45) DEFAULT NULL,
  `creditNumber` varchar(50) DEFAULT NULL,
  `type_flag` varchar(45) DEFAULT 'user',
  `profile_pic` varchar(100) DEFAULT 'images/defaultprof.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Eman Elsayed','eman@12345','eman@gmail.com','1992-12-01 00:00:00','ios developer','2000','admin','images/eman.jpeg'),(2,'Yasmin Ahmed','yasmin@12345','yasmin@gmail.com','1996-01-26 00:00:00','ios developer','500','user','images/yasmin.jpeg'),(3,'Shimaa Mohamed','shimaa@12345','shimaa@gmail.com','1991-06-02 00:00:00','java developer','500','user','images/shimaa.jpg'),(4,'Rania Ramadan','rania@12345','rania@gmail.com','1996-02-20 00:00:00','android developer','0','user','images/rania.png'),(5,'ramia','12345','a@gmail.com',NULL,'aaaaaaaaaaaaaaaaaa','66','user','images/defaultprof.jpg'),(6,'gamal','6699999','aaaaaa@gmail.com',NULL,'aaa','22','user','images/defaultprof.jpg'),(8,'ali','122222','al@gmail.com',NULL,'ali','1447','user','images/defaultprof.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-20  0:50:09
