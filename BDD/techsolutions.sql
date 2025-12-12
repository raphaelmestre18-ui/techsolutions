-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: techsolutions
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2y$10$s/hXfxI5KzSuNkDxQvUoJOJTfa1Wl0mTNjoBGY1OxPUFTS2Aq5SxO','2025-12-05 09:39:50');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'Processeur i5','CPU 6 cœurs polyvalent'),(2,'RAM 16 Go','DDR4 2×8 Go'),(3,'SSD 500 Go','NVMe rapide'),(4,'Carte graphique GTX 1660','Jeux Full HD'),(5,'Boîtier + Alim 500W','Tour + alimentation'),(42,'AMD Ryzen 7 7700X',NULL),(43,'Intel Core i7-13700F',NULL),(44,'AMD Ryzen 7 7800X3D',NULL),(45,'AMD Ryzen 9 7950X',NULL),(46,'Intel Core i7 14700F',NULL),(47,'AMD Ryzen 9 7900X',NULL),(48,'Intel Core i9-14900K',NULL),(49,'AMD Ryzen 5 7600',NULL),(50,'Intel Core i5-13500',NULL),(51,'Amd Ryzen 7 7700 ',NULL),(52,'AMD Ryzen 5 5600G',NULL),(53,'intel core i5-12400',NULL),(54,'Intel Core i7-13700F',NULL),(55,'MSI B650 ',NULL),(56,'ASUS TUF B760-plus WIFI D4',NULL),(57,'MSI MAG B650 TOMAHAWK WIFI',NULL),(58,'ASUS ROG STRIX X670E-E WIFI',NULL),(59,'ASUS PRIME X670-P WIFI',NULL),(60,'ASUS PRIME Z790-P ',NULL),(61,'MSI MAG Z790 WIFI',NULL),(62,'32GB DDR5 6000Mhz Corsair vengeance',NULL),(63,'32GB DDR5-6000 (2x16GB) G.Skill Trident Z5 ',NULL),(64,'32GB DDR5-5600 (1x32GB) Kingston Fury Beast ',NULL),(65,'128GB DDR5-5600 (4x32GB) Kingston Fury Beast ',NULL),(66,'16GB DDR5-5200 (2x8GB) Kingston Fury Beast ',NULL),(67,'32GB DDR4-3200 (2x16GB) Corsair Vengeance LPX ',NULL),(68,'16GB DDR4-3200 (2x8GB) Crucial Ballistix ',NULL),(69,'SSD NVMe 1TO Samsung 980 PRO ',NULL),(70,'SSD NVMe 1TO WD Black SN850X ',NULL),(71,'SSD NVMe 2TB Samsung 990 PRO ',NULL),(72,'SSD NVMe 500GB Samsung 980 ',NULL),(73,'SSD NVMe 500GB Crucial P3 ',NULL),(74,'GeForce GTX 1650 ',NULL),(75,'GeForce RTX 4060 ',NULL),(76,'Geforce RTX 5070',NULL),(77,'Geforce RTX 5060',NULL),(78,'750W Gold Corsair RM750e ',NULL),(79,'750W Gold be quiet! Pure Power 13 M ',NULL),(80,'850W Gold Corsair RM850x ',NULL),(81,'850W Gold Seasonic Focus GX-850 ',NULL),(82,'1000W Gold Corsair RM1000x ',NULL),(83,'550W Bronze Corsair Cx550 ',NULL),(84,'Crossair CX650  Bronze',NULL),(85,'Fractal Design Meshify C ',NULL),(86,'be quiet! Pure Base 500DX ',NULL),(87,'Fractal Design Torrent ',NULL),(88,'NZXT H7 Flow ',NULL),(89,'Fractal Design Focus 2 Solid ',NULL),(90,'be quiet! Pure Rock 2 ',NULL),(91,'NZXT Kraken Z73 ',NULL),(92,'Noctua NH-D15 chromax.black ',NULL),(93,'logitech Lift ',NULL),(94,'logitech Marathon Mouse M705',NULL),(95,'Logitech MX Vertical',NULL),(96,'Logitech MX Keys S ',NULL),(97,'INOVU LK120',NULL),(98,'Autocollant pour clavier , gros caractères et braille(destinée aux personnes malvoyants)',NULL),(99,'Logitech Brio 100',NULL),(100,'Logitech Brio 4K B2C',NULL),(101,'MSI 23.8 Led- PRO MP2412',NULL),(102,'AOC 23.8 LED 24B31H',NULL),(103,'ASUS 27 LED PRO ART PA278QV',NULL),(104,'MSI 34 LED Modern MD342CQPW',NULL),(105,'Altyk XXL',NULL),(106,'Altyk M',NULL),(107,'Windows 11 Pro',NULL),(108,'Bitdefender Premium Security',NULL),(109,'Norton 360 Advanced',NULL),(110,'Imprimante HP Smart Tank 7605',NULL),(111,'Imprimante HD Laser Jet Pro 3002dn',NULL);
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_components`
--

DROP TABLE IF EXISTS `pc_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_components` (
  `pc_id` int(10) unsigned NOT NULL,
  `component_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pc_id`,`component_id`),
  KEY `component_id` (`component_id`),
  CONSTRAINT `pc_components_ibfk_1` FOREIGN KEY (`pc_id`) REFERENCES `pcs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pc_components_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_components`
--

LOCK TABLES `pc_components` WRITE;
/*!40000 ALTER TABLE `pc_components` DISABLE KEYS */;
INSERT INTO `pc_components` VALUES (1,51),(1,55),(1,62),(1,69),(1,74),(1,78),(1,85),(1,90),(2,53),(2,56),(2,68),(2,72),(2,83),(2,89),(3,43),(3,56),(3,67),(3,71),(3,74),(3,79),(3,88),(3,92),(4,50),(4,60),(4,68),(4,72),(4,89),(6,44),(6,59),(6,63),(6,71),(6,75),(6,80),(6,87),(6,91),(8,49),(8,57),(8,63),(8,70),(8,75),(8,78),(8,86),(8,90);
/*!40000 ALTER TABLE `pc_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcs`
--

DROP TABLE IF EXISTS `pcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcs`
--

LOCK TABLES `pcs` WRITE;
/*!40000 ALTER TABLE `pcs` DISABLE KEYS */;
INSERT INTO `pcs` VALUES (1,'PC_Dev','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2J6aUztWX09xF2H190IPT1kMdKFdNxgSaHw&s',0.00),(2,'PC_Marketing','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgvucb0UTmwctGun2S_hAc9EB4R4Y6rCPr1Q&s',779.00),(3,'PC_ADMIN','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHgaivb3H9jN_8sQD-DH_EnTCnSHY_EFMzPg&s',999.00),(4,'PC_RH','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7eL6lOs97d6qYJbNvXBeIEdAPL7MGqzfN6w&s',600.00),(6,'pc_direction','https://media.ldlc.com/r1600/ld/products/00/05/21/67/LD0005216778_2.jpg',600.00),(8,'PC_DESIGNER','https://media.ldlc.com/r1600/ld/products/00/05/21/67/LD0005216778_2.jpg',1500.00);
/*!40000 ALTER TABLE `pcs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12 11:43:31
