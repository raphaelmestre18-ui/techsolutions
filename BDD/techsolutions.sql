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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'Processeur i5','CPU 6 cœurs polyvalent'),(2,'RAM 16 Go','DDR4 2×8 Go'),(3,'SSD 500 Go','NVMe rapide'),(4,'Carte graphique GTX 1660','Jeux Full HD'),(5,'Boîtier + Alim 500W','Tour + alimentation'),(6,'Ryzen 9 7900X','CPU01'),(7,'Ryzen 7 7800X3D','CPU02'),(8,'Ryzen 9 7950X','CPU03'),(9,'Intel Core I9-14900K','CPU04'),(10,'Intel Core i7-14700K','CPU06'),(11,'intel Core Ultra 7 265K','CPU07'),(12,'Intel Core Ultra 9 285K','CPU08'),(13,'Intel Core i5-14600K','CPU09'),(14,'intel Core i3-14100','CPU10'),(15,'AMD Radeon RX 7800 XT','GPU01'),(16,'Geforce RTX 4060','GPU02'),(17,'PNY Quadro RTX 6000','GPU03'),(18,'RTX 3050','GPU04'),(19,'AMD Radeon RX 7600','GPU05'),(20,'Geforce RTX 5070','GPU06'),(21,'Corsair Vengeance DDR5 (2x16)go','RAM01'),(22,'G.Skill Trident Z5 32go','RAM02'),(23,'Kingston  Fury Renegade Pro DDR5 128go(4x32go)','RAM03'),(24,'Crucial DDR4 ECC 32go','RAM04'),(25,'G.Skill Ripjaws DDR5 64 go','RAM05'),(26,'Kingdton Fury Beast DDR5 (2x32)go','RAM06'),(27,'Crucial Pro DDR','RAM07'),(28,'Corsair Vengeance LPX DDR4','RAM08'),(29,'Be Quiet?! Pure Base 500','BT01'),(30,'Fractal Design Meshify C','BT02'),(31,'NZXT H510 Flow','BT03'),(32,'Thermaltake Core V21','BT04'),(33,'Lian Li PC-O11 Dynamic','BT05'),(34,'MSI MPG Gungnir 300R','BT06'),(35,'Corsair RM750e-750W-Gold','ALM01'),(36,'Pure Power 12M','ALM02'),(37,'Seasonic Focus GX-750-Gold','ALM03'),(38,'Corsair CX550M-550W-Bronze','ALM04'),(39,'System Power 10-450W-Bronze','ALM05'),(40,'Corsair HX1000i-1000W-Platinium','ALM06'),(41,'Seasonic Pime tX-850-850W ','ALM07');
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
INSERT INTO `pc_components` VALUES (1,6),(1,18),(1,23),(1,30),(1,40),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,13),(4,21),(4,29),(4,38),(8,7),(8,16),(8,23),(8,40);
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
INSERT INTO `pcs` VALUES (1,'PC_Dev','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2J6aUztWX09xF2H190IPT1kMdKFdNxgSaHw&s',549.00),(2,'PC_Designer','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgvucb0UTmwctGun2S_hAc9EB4R4Y6rCPr1Q&s',779.00),(3,'PC_ADMIN','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHgaivb3H9jN_8sQD-DH_EnTCnSHY_EFMzPg&s',999.00),(4,'PC_RSS','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7eL6lOs97d6qYJbNvXBeIEdAPL7MGqzfN6w&s',600.00),(6,'pc_direction','https://media.ldlc.com/r1600/ld/products/00/05/21/67/LD0005216778_2.jpg',600.00),(8,'PC_DESIGNER','https://media.ldlc.com/r1600/ld/products/00/05/21/67/LD0005216778_2.jpg',1500.00);
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

-- Dump completed on 2025-11-26 10:54:21
