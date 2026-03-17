-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tcg_shop
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `categories`
--

USE tcg_shop;

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(60) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UQ_categories_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Booster Boxes'),(3,'Booster Packs'),(1,'Singles');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `email_address` varchar(60) NOT NULL,
  `account_username` varchar(60) NOT NULL,
  `account_password` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `shipping_address` varchar(60) NOT NULL,
  `billing_address` varchar(60) NOT NULL,
  `favorite_game` varchar(60) DEFAULT NULL,
  `tournaments_played` int NOT NULL DEFAULT (0.0),
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'kurtrussell2310@yahoo.com','KurtTheMan42','ghaeui23498sfnakhd9823hrn2urbksifgnhiu','Kurt','Russell','308 Negra Arroyo Lane, Albequerque, New Mexico, 87104','308 Negra Arroyo Lane, Albequerque, New Mexico, 87104','One Piece',4),(2,'thelebronj3802@gmail.com','TheGoat23','thiuowen4q3nmwmtj43iqfkj2gjkhqkhblfoa983nghnjes32n5ll8jmlw','Lebron','James','356 North Duncan Street, Tracy, New York, 10205','356 North Duncan Street, Tracy, New York, 10205','Magic: The Gathering',1),(3,'marketablepliars4123@outlook.com','MustacheMan68','kjngraenbk2ipovf9naeknkyh4ubhj5ku8s43uihhaknhhbaghr','Mark','Fischbach','9677, 3874 Paxton Ave, Cincinnati, Ohio 45209','825 Maxwell Farm Road, Chico, California 95928','Magic: The Gathering',0),(4,'timthetatman432@gmail.com','TimothyShatterer50','gbhnkerk892nflk2byiy3rkkjsfgr7knjuy4guyakngbjbys','Timothy','Chalamet','118 Cerullo Road, Louisville, Kentucky 4024','118 Cerullo Road, Louisville, Kentucky 4024','Pokemon',15),(5,'antoniobannedfromtheus352@gmail.com','AntonioBanters65','fnaregnie5hh53w4bkjqh2bkjq35jkhbne5k2knfgajh','Antonio','Banderas','4960 Rosewood Lane, New York, New York 10018','4960 Rosewood Lane, New York, New York 10018','Gundam',32),(6,'swiftlytaylor721@yahoo.com','SwifferT52','ngwui5o87q2hnfuoy23ibfo8h7843hngquy39mcw23inghw45yun','Taylor','Swift','371 Scenic Way, Latham, Illinois 62543','371 Scenic Way, Latham, Illinois 62543','One Piece',0),(7,'thecreatorofmusic@gmail.com','BigPoe029','ngjkasor9g8a2nb3bkfhay4bbj34nlkangkuy48bhjksbgfyuq3kubi24','Tyler','Okonma','329 William Street, Stroudsburg, Pennsylvania 18360','329 William Street, Stroudsburg, Pennsylvania 18360','Pokemon',6),(8,'bigthinkere492@outlook.com','HugeBrain391','rgfnkhjawkrhbgakuwefnlkaieryg9432nnk2buiu5482hbnkhn223i','Albert','Einstein','83 Main Street, West Crown Point, Indiana 46307','83 Main Street, West Crown Point, Indiana 46307','Gundam',78),(9,'everyonewannabeme938@gmail.com','TheDriver942','aregnhuy3b4ninq2i3nc7834h87q34ncnhq2m3cr87q23nc9782mchi','Ryan','Gosling','3641 Cambridge Place, Windsor Mill, Maryland 21244','3641 Cambridge Place, Windsor Mill, Maryland 21244','One Piece',52),(10,'icandothisallday4820@yahoo.com','WhateverMan311','ariugnaiwurgiqu348goq98fno8q34hqo98nff8qo47cn98q2c38m0h8ou','Chris','Evans','2435 B Street, New Brighton, Minnesota 55112','2435 B Street, New Brighton, Minnesota 55112','Pokemon',22);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_deatil_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_deatil_id`),
  KEY `FK_order_details_orders` (`order_id`),
  KEY `FK_order_details_products` (`product_id`),
  CONSTRAINT `FK_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_order_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `CK_order_details_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1,1),(2,2,1,5),(3,3,3,1),(4,4,4,1),(5,5,5,10),(6,6,6,1),(7,7,7,3),(8,8,8,1),(9,9,9,2),(10,10,10,1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_customers` (`customer_id`),
  CONSTRAINT `FK_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-03-13 19:47:58'),(2,2,'2026-03-13 19:47:58'),(3,3,'2026-03-13 19:47:58'),(4,4,'2026-03-13 19:47:58'),(5,5,'2026-03-13 19:47:58'),(6,6,'2026-03-13 19:47:58'),(7,7,'2026-03-13 19:47:58'),(8,8,'2026-03-13 19:47:58'),(9,9,'2026-03-13 19:47:58'),(10,10,'2026-03-13 19:47:58');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_brand` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_discount` decimal(10,2) NOT NULL DEFAULT (0.0),
  `stock_amount` int NOT NULL,
  `release_date` datetime NOT NULL,
  `product_language` varchar(60) NOT NULL DEFAULT (_utf8mb4'English'),
  PRIMARY KEY (`product_id`),
  KEY `products_fk_categories` (`category_id`),
  CONSTRAINT `products_fk_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Monkey D. Luffy','One Piece','An extremely hard to get Japanese Shonen Jump magazine promotional card. This card has yet to have an English counterpart and has been extremely sought after since it came out in Japan.',79.99,0.00,3,'2025-10-03 13:22:45','Japanese'),(2,1,'Portgas D. Ace','One Piece','A red and blue alternate art leader card from the 13th set of One Piece, Carrying On His Will. This leader has been dominating the meta and still remains one of the best leaders you can play.',64.99,0.00,11,'2025-11-07 09:06:32','English'),(3,2,'Carrying On His Will','One Piece','A booster box of the 13th set of One Piece, containing 24 booster packs and a gurantee of 2-3 alternate art cards or better.',215.99,20.00,6,'2025-11-07 09:06:32','English'),(4,2,'Extra Booster -One Piece Heroines Edition-','One Piece','A booster box of the 3rd extra booster set of One Piece, containing 24 booster packs and a gurantee of 2-3 alternate art cards or better.',299.99,30.00,13,'2026-02-20 12:02:45','English'),(5,1,'The One Ring','Magic: The Gathering','Extremely rare one of one card from The Lord of the Rings set that released back in 2023. There is only one of these cards in existence.',500000.00,0.00,1,'2023-06-23 04:29:59','English'),(6,3,'Lorwyn Eclipsed Collector Booster','Magic: The Gathering','A special booster pack of Magic: The Gathering that comes with 15 different holo-foil or better cards. These packs are great if you want to make your deck look nice!',39.99,2.00,48,'2026-01-23 12:49:21','English'),(7,2,'Dual Impact','Gundam','A booster box of the 2nd set from the Gundam Card Game containing 24 booster packs and a gurantee of 2-3 alternate art cards or better.',104.99,5.00,4,'2025-10-24 12:44:53','English'),(8,1,'Charizard','Pokemon','An original 1999 1st edition holo charizard card. This card is what changed pokemon for so many people and is still a legend in the community today.',5000.00,0.00,1,'1999-04-25 01:43:21','English'),(9,3,'Phantasmal Flames','Pokemon','A booster pack from one of the newest sets of Pokemon. This set contains the ultra rare golden mega charizard ex card that only a few people have been able to pull.',6.99,0.00,46,'2025-12-05 05:42:04','English'),(10,2,'Prismatic Evolutions','Pokemon','A booster pack containing 36 packs of prismatic evolutions. This set is known for its unforgiving hit rates, and with no guranteed hits, opening this set can be quite the gamble',249.99,10.00,2,'2025-01-12 06:08:31','English');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tcg_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13 21:33:24
