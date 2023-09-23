-- MySQL dump 10.19  Distrib 10.3.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: Fourth-Reich.local    Database: eshop
-- ------------------------------------------------------
-- Server version	10.11.1-MariaDB

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
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernummer` int(11) NOT NULL,
  `order_datum` datetime NOT NULL,
  `produkt` varchar(80) NOT NULL,
  `antal` int(11) NOT NULL DEFAULT 0,
  `pris` int(11) NOT NULL,
  `kund_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordernummer` (`ordernummer`),
  KEY `kund_id` (`kund_id`),
  CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`ordernummer`) REFERENCES `order` (`ordernummer`),
  CONSTRAINT `faktura_ibfk_2` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hylla`
--

DROP TABLE IF EXISTS `hylla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hylla` (
  `namn` char(10) NOT NULL,
  `antal` int(11) DEFAULT 0,
  PRIMARY KEY (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hylla`
--

LOCK TABLES `hylla` WRITE;
/*!40000 ALTER TABLE `hylla` DISABLE KEYS */;
INSERT INTO `hylla` VALUES ('AAA',0),('AAB',0),('AAC',0),('ABA',0),('ABB',0);
/*!40000 ALTER TABLE `hylla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hylla_rader`
--

DROP TABLE IF EXISTS `hylla_rader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hylla_rader` (
  `produkt_id` varchar(40) NOT NULL,
  `antal` int(11) DEFAULT 0,
  `hylla_namn` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`produkt_id`),
  KEY `hylla_namn` (`hylla_namn`),
  CONSTRAINT `hylla_rader_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produkt_kod`),
  CONSTRAINT `hylla_rader_ibfk_2` FOREIGN KEY (`hylla_namn`) REFERENCES `hylla` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hylla_rader`
--

LOCK TABLES `hylla_rader` WRITE;
/*!40000 ALTER TABLE `hylla_rader` DISABLE KEYS */;
INSERT INTO `hylla_rader` VALUES ('ahogir1',12,'AAB'),('berdel1',0,'AAC'),('calnig1',10,'ABA'),('chaman1',7,'AAA'),('oneman1',2,'ABB');
/*!40000 ALTER TABLE `hylla_rader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `namn` varchar(80) NOT NULL,
  PRIMARY KEY (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('action'),('adventure'),('comedy'),('fantasy'),('supernatural');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_rader`
--

DROP TABLE IF EXISTS `kategori_rader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori_rader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produkt_id` varchar(40) NOT NULL,
  `kategori_namn` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produkt_id` (`produkt_id`),
  KEY `kategori_namn` (`kategori_namn`),
  CONSTRAINT `kategori_rader_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produkt_kod`),
  CONSTRAINT `kategori_rader_ibfk_2` FOREIGN KEY (`kategori_namn`) REFERENCES `kategori` (`namn`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_rader`
--

LOCK TABLES `kategori_rader` WRITE;
/*!40000 ALTER TABLE `kategori_rader` DISABLE KEYS */;
INSERT INTO `kategori_rader` VALUES (1,'chaman1','fantasy'),(2,'chaman1','action'),(3,'ahogir1','comedy'),(4,'berdel1','adventure'),(5,'berdel1','fantasy'),(6,'calnig1','supernatural'),(7,'oneman1','action'),(8,'oneman1','comedy'),(9,'oneman1','fantasy');
/*!40000 ALTER TABLE `kategori_rader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fornamn` varchar(20) DEFAULT NULL,
  `efternamn` varchar(20) DEFAULT NULL,
  `adress` varchar(30) DEFAULT NULL,
  `postnummer` varchar(10) DEFAULT NULL,
  `ort` varchar(30) DEFAULT NULL,
  `land` varchar(30) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES (1,'Jonathan','Göransson','Rött hus','424 24','Lyckeby','Sverige','070 424 242'),(2,'Marcus','Björnbäck','Gult hus','696 96','Verkö','Sverige','070 696 969'),(3,'Leo','Karlsson','Blått hus','133 77','Tving','Sverige','070 133 769'),(4,'Kalle','Alsing','Vit hus','420 42','Stenungsund','Sverige','070 420 420'),(5,'William','Petermann','Röd lägenhet','111 19','Rödeby','Sverige','010 192 873');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kundregister`
--

DROP TABLE IF EXISTS `kundregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kundregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kund_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kund_id` (`kund_id`),
  CONSTRAINT `kundregister_ibfk_1` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundregister`
--

LOCK TABLES `kundregister` WRITE;
/*!40000 ALTER TABLE `kundregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `kundregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hylla` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hylla` (`hylla`),
  CONSTRAINT `lager_ibfk_1` FOREIGN KEY (`hylla`) REFERENCES `hylla` (`namn`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES (1,'AAA'),(2,'AAB'),(3,'AAC'),(4,'ABA'),(5,'ABB');
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tidstampel` timestamp NULL DEFAULT current_timestamp(),
  `handelse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2023-03-09 11:01:06','\'Ny produkt lades till med produktid chaman1.\''),(2,'2023-03-09 11:01:06','\'Ny produkt lades till med produktid ahogir1.\''),(3,'2023-03-09 11:01:06','\'Ny produkt lades till med produktid berdel1.\''),(4,'2023-03-09 11:01:06','\'Ny produkt lades till med produktid calnig1.\''),(5,'2023-03-09 11:01:06','\'Ny produkt lades till med produktid oneman1.\'');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ordernummer` int(11) NOT NULL AUTO_INCREMENT,
  `status` char(20) DEFAULT 'inte verifierad',
  `order_datum` timestamp NULL DEFAULT current_timestamp(),
  `order_updaterad` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `order_raderad` timestamp NULL DEFAULT NULL,
  `order_bestalld` timestamp NULL DEFAULT NULL,
  `order_skickad` timestamp NULL DEFAULT NULL,
  `kund_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ordernummer`),
  KEY `kund_id` (`kund_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'inte verifierad','2023-03-09 11:01:25','2023-03-09 11:52:28',NULL,'2023-03-09 11:52:28',NULL,2),(2,'inte verifierad','2023-03-09 11:12:56',NULL,NULL,NULL,NULL,3),(3,'inte verifierad','2023-03-09 12:10:29',NULL,NULL,NULL,NULL,4),(4,'inte verifierad','2023-03-09 12:10:33',NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_rader`
--

DROP TABLE IF EXISTS `order_rader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_rader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `produkt_id` varchar(40) NOT NULL,
  `antal` int(11) DEFAULT 0,
  `pris` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`,`produkt_id`),
  KEY `produkt_id` (`produkt_id`),
  CONSTRAINT `order_rader_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`ordernummer`),
  CONSTRAINT `order_rader_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produkt_kod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_rader`
--

LOCK TABLES `order_rader` WRITE;
/*!40000 ALTER TABLE `order_rader` DISABLE KEYS */;
INSERT INTO `order_rader` VALUES (1,1,'ahogir1',1,149.00),(2,1,'calnig1',1,101.00),(3,1,'oneman1',1,106.00),(4,2,'ahogir1',1,149.00),(5,2,'oneman1',1,106.00),(6,4,'ahogir1',3,149.00),(7,4,'chaman1',4,103.00),(8,4,'oneman1',2,106.00),(9,3,'oneman1',1,106.00),(10,4,'calnig1',7,101.00);
/*!40000 ALTER TABLE `order_rader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista`
--

DROP TABLE IF EXISTS `plocklista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plocklista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernummer` int(11) NOT NULL,
  `order_datum` datetime NOT NULL,
  `produkt` varchar(80) NOT NULL,
  `antal` int(11) NOT NULL DEFAULT 0,
  `hylla` char(10) NOT NULL,
  `kund_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordernummer` (`ordernummer`),
  KEY `kund_id` (`kund_id`),
  CONSTRAINT `plocklista_ibfk_1` FOREIGN KEY (`ordernummer`) REFERENCES `order` (`ordernummer`),
  CONSTRAINT `plocklista_ibfk_2` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista`
--

LOCK TABLES `plocklista` WRITE;
/*!40000 ALTER TABLE `plocklista` DISABLE KEYS */;
/*!40000 ALTER TABLE `plocklista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `produkt_kod` varchar(40) NOT NULL,
  `pris` decimal(10,2) DEFAULT NULL,
  `namn` varchar(80) NOT NULL,
  `bildlank` varchar(100) DEFAULT NULL,
  `beskrivning` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`produkt_kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES ('ahogir1',149.00,'Aho-girl: A Clueless Girl 1','/img/eshop/aho_girl_vol1.jpg','Yoshiko is a hopefully clueless high school girl.'),('berdel1',462.00,'Berserk Deluxe Volume 1','/img/eshop/berserk_deluxe_vol1.jpg','Have you got the Guts? Kentaro Miura\'s Berserk has outraged, horrified, and delighted...'),('calnig1',101.00,'Call of the Night, Vol. 1','/img/eshop/call_of_the_night_vol1.jpg','Antisocial, dorky boy seeks fun-loving, sexy vampire for blood-sucking and transforming...'),('chaman1',103.00,'Chainsaw Man, Vol. 1','/img/eshop/chainsaw_man_vol1.jpg','Broke young man + chainsaw demon = Chainsaw Man!'),('oneman1',106.00,'One-Punch Man, Vol. 1','/img/eshop/one_punch_man_vol1.jpg','Nothing about Saitama passes the eyeball test when it comes to superheroes, from his...');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dbadm`@`%`*/ /*!50003 TRIGGER log_product_insert
AFTER INSERT
ON `produkt` FOR EACH ROW
    INSERT INTO `log` (`tidstampel`, `handelse`)
        VALUES (NOW(), CONCAT("'Ny produkt lades till med produktid ", NEW.produkt_kod, ".'")) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dbadm`@`%`*/ /*!50003 TRIGGER log_product_update
AFTER UPDATE
ON `produkt` FOR EACH ROW
    INSERT INTO `log` (`tidstampel`, `handelse`)
        VALUES (NOW(), CONCAT("'Detaljer om produktid ", NEW.produkt_kod, " uppdaterades.'")) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dbadm`@`%`*/ /*!50003 TRIGGER log_product_delete
AFTER DELETE
ON `produkt` FOR EACH ROW
    INSERT INTO `log` (`tidstampel`, `handelse`)
        VALUES (NOW(), CONCAT("'Produkten med produktid ", OLD.produkt_kod, "raderades.'")) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produktregister`
--

DROP TABLE IF EXISTS `produktregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produktregister` (
  `id` varchar(40) NOT NULL,
  `namn` varchar(80) NOT NULL,
  `antal` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `produktregister_ibfk_1` FOREIGN KEY (`id`) REFERENCES `produkt` (`produkt_kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktregister`
--

LOCK TABLES `produktregister` WRITE;
/*!40000 ALTER TABLE `produktregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `produktregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshop'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `in_lager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` FUNCTION `in_lager`(amount INT
) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    IF amount = 0 THEN
        RETURN 'Slut';
    END IF;
    RETURN 'Finns';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` FUNCTION `order_status`(o_skapad TIMESTAMP,
    o_updaterad TIMESTAMP,
    o_raderad TIMESTAMP,
    o_bestalld TIMESTAMP,
    o_skickad TIMESTAMP
) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    IF o_skickad IS NOT NULL THEN
        RETURN 'skickad';
    ELSEIF o_bestalld IS NOT NULL THEN
        RETURN 'beställd';
    ELSEIF o_raderad IS NOT NULL THEN
        RETURN 'raderad';
    ELSEIF o_updaterad IS NOT NULL THEN
        RETURN 'uppdaterad';
    ELSEIF o_skapad IS NOT NULL THEN
        RETURN 'skapad';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `add_product`(
    a_id VARCHAR(40),
    a_price DECIMAL(10,2),
    a_name VARCHAR(80),
    a_picture VARCHAR(100),
    a_description VARCHAR(100)
)
BEGIN
    INSERT INTO 
        `produkt` 
    VALUES 
        (a_id, a_price, a_name, a_picture, a_description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `create_order`(
    a_id INT
)
BEGIN
    INSERT INTO `order`
        (`kund_id`)
    VALUES 
        (a_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `create_order_row`(
    o_id INT,
    p_id VARCHAR(40),
    amount INT,
    price DECIMAL(10,2)
)
BEGIN
    INSERT IGNORE INTO `order_rader`
        (`order_id`,`produkt_id`,`antal`,`pris`)
    VALUES 
        (o_id, p_id, amount, price);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `delete_product`(
    a_id VARCHAR(40)
)
BEGIN
    START TRANSACTION;
        DELETE FROM `hylla_rader`
        WHERE
            `produkt_id` = a_id;
        
        DELETE FROM `kategori_rader`
        WHERE
            `produkt_id` = a_id;

        DELETE FROM `produkt`
        WHERE
            `produkt_kod` = a_id;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_amount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `insert_amount`(
    a_id VARCHAR(40),
    a_shelf VARCHAR(80),
    a_amount VARCHAR(10)
)
BEGIN
    START TRANSACTION;
        INSERT INTO `produkt`
            (`produkt_kod`, `namn`)
        VALUES
            (a_id, a_id)
        ON DUPLICATE KEY UPDATE
            `produkt_kod` = a_id;
        
        INSERT INTO `hylla_rader`
            (`produkt_id`, `antal`, `hylla_namn`)
        VALUES
            (a_id, a_amount, a_shelf) 
        ON DUPLICATE KEY UPDATE
            `antal` =  `antal` + a_amount;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `picklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `picklist`(
    a_id INT
)
BEGIN
    SELECT 
        o.`ordernummer`,
        DATE_FORMAT(o.`order_datum`, "%y-%m-%d | %H:%i:%s") AS `order_datum`,
        p.namn AS produkt,
        r.`antal` AS antal,
        hy.hylla_namn AS hylla,
        in_lager(hy.antal) AS `lager_status`
    FROM `order` AS o
        LEFT OUTER JOIN `order_rader` AS r
            ON o.`ordernummer` = r.`order_id`
        LEFT OUTER JOIN hylla_rader AS hy
            ON r.`produkt_id` = hy.produkt_id
        LEFT OUTER JOIN produkt AS p
            ON r.`produkt_id` = p.produkt_kod
    WHERE 
        o.`ordernummer` = a_id
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `search_inventory`(
    a_str VARCHAR(30)
)
BEGIN
    SELECT 
        produkt_kod AS id,
        namn,
        hy.hylla_namn AS hylla,
        hy.antal
    FROM produkt AS p
        LEFT OUTER JOIN hylla_rader AS hy
            ON p.produkt_kod = hy.produkt_id
        LEFT OUTER JOIN kategori_rader AS kr
            ON p.produkt_kod = kr.produkt_id
    WHERE
        produkt_kod LIKE a_str
        OR namn LIKE a_str
        OR hy.hylla_namn LIKE a_str
    GROUP BY
        produkt_kod
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `search_orders`(
    a_id INT
)
BEGIN
    SELECT 
        o.`ordernummer`,
        DATE_FORMAT(o.`order_datum`, "%y-%m-%d | %H:%i:%s") AS `order_datum`,
        order_status(o.`order_datum`, o.`order_updaterad`, o.`order_raderad`, o.`order_bestalld`, o.`order_skickad`) AS `status`,
        COUNT(rader.`order_id`) AS rader,
        o.`kund_id`,
        CONCAT(k.fornamn," ",k.efternamn) AS namn
    FROM `order` AS o
        LEFT OUTER JOIN `order_rader` AS rader
            ON o.`ordernummer` = rader.`order_id`
        JOIN `kund` as k
                ON o.`kund_id` = k.`id`
    WHERE
        o.`ordernummer` = a_id
        OR o.`kund_id` = a_id
    GROUP BY o.`ordernummer`
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_category`()
BEGIN
    SELECT * FROM kategori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_customer`()
BEGIN
    SELECT 
        CONCAT(fornamn," ",efternamn) AS namn,
        adress,
        postnummer,
        ort,
        telefon,
        id
    FROM kund
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_info_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_info_product`(
    a_id VARCHAR(40)
)
BEGIN
    SELECT * FROM `produkt` WHERE produkt_kod = a_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_inventory`()
BEGIN
    SELECT 
        produkt_kod AS id,
        namn,
        hy.hylla_namn AS hylla,
        hy.antal
    FROM produkt AS p
        LEFT OUTER JOIN hylla_rader AS hy
            ON p.produkt_kod = hy.produkt_id
        LEFT OUTER JOIN kategori_rader AS kr
            ON p.produkt_kod = kr.produkt_id
    GROUP BY
        produkt_kod
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_log`(
    a_limit INT
)
BEGIN
    SELECT 
        DATE_FORMAT(`tidstampel`, "%H:%i:%s | %y-%m-%d") AS `tidstämpel`,
        `handelse` AS `händelse`
    FROM `log`
    ORDER BY `id` DESC
    LIMIT a_limit
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_order`(
    o_id INT
)
BEGIN
    SELECT 
        *
    FROM `order_rader`
    WHERE 
        order_id = o_id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_orders`()
BEGIN
    SELECT 
        o.`ordernummer`,
        DATE_FORMAT(o.`order_datum`, "%y-%m-%d | %H:%i:%s") AS `order_datum`,
        order_status(o.`order_datum`, o.`order_updaterad`, o.`order_raderad`, o.`order_bestalld`, o.`order_skickad`) AS `status`,
        COUNT(rader.`order_id`) AS rader,
        o.`kund_id`,
        CONCAT(k.fornamn," ",k.efternamn) AS namn
    FROM `order` AS o
        LEFT OUTER JOIN `order_rader` AS rader
            ON o.`ordernummer` = rader.`order_id`
        JOIN `kund` as k
                ON o.`kund_id` = k.`id`
    GROUP BY o.`ordernummer`
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order_overview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_order_overview`(
    o_id INT
)
BEGIN
    SELECT 
        o.`ordernummer`,
        DATE_FORMAT(o.`order_datum`, "%y-%m-%d | %H:%i:%s") AS `order_datum`,
        order_status(o.`order_datum`, o.`order_updaterad`, o.`order_raderad`, o.`order_bestalld`, o.`order_skickad`) AS `status`,
        COUNT(rader.`order_id`) AS rader,
        o.`kund_id`,
        CONCAT(k.fornamn," ",k.efternamn) AS namn
    FROM `order` AS o
        LEFT OUTER JOIN `order_rader` AS rader
            ON o.`ordernummer` = rader.`order_id`
        JOIN `kund` as k
                ON o.`kund_id` = k.`id`
    WHERE order_id = o_id
    GROUP BY o.`ordernummer`
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_order_products`()
BEGIN
    SELECT 
        namn,
        produkt_kod,
        pris,
        bildlank,
        beskrivning,
        hy.antal,
        GROUP_CONCAT(CONCAT(" ", kr.kategori_namn)) AS kategori
    FROM produkt AS p
        LEFT OUTER JOIN hylla_rader AS hy
            ON p.produkt_kod = hy.produkt_id
        LEFT OUTER JOIN kategori_rader AS kr
            ON p.produkt_kod = kr.produkt_id
    GROUP BY
        p.produkt_kod
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_products`()
BEGIN
    SELECT 
        produkt_kod,
        namn,
        pris,
        hy.antal,
        GROUP_CONCAT(CONCAT(" ", kr.kategori_namn)) AS kategori
    FROM produkt AS p
        LEFT OUTER JOIN hylla_rader AS hy
            ON p.produkt_kod = hy.produkt_id
        LEFT OUTER JOIN kategori_rader AS kr
            ON p.produkt_kod = kr.produkt_id
    GROUP BY
        p.produkt_kod
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_products_limited` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_products_limited`()
BEGIN
    SELECT 
        produkt_kod AS id,
        namn
    FROM produkt
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_shelves`()
BEGIN
    SELECT `hylla` FROM `lager`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_amount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `update_amount`(
    a_id VARCHAR(40),
    a_shelf VARCHAR(80),
    a_amount VARCHAR(10)
)
BEGIN
    UPDATE `hylla_rader` SET
        `antal` =  `antal` - a_amount
    WHERE
        `produkt_id` = a_id
        AND `hylla_namn` = a_shelf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_order_status_orderd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `update_order_status_orderd`(
    o_id INT
)
BEGIN
    UPDATE `order` SET
        `order_bestalld` =  CURRENT_TIMESTAMP
    WHERE
        `ordernummer` = o_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_order_status_shipped` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `update_order_status_shipped`(
    o_id INT
)
BEGIN
    UPDATE `order` SET
        `order_skickad` =  CURRENT_TIMESTAMP
    WHERE
        `ordernummer` = o_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `update_product`(
    a_id VARCHAR(40),
    a_price DECIMAL(10,2),
    a_name VARCHAR(80),
    a_picture VARCHAR(100),
    a_description VARCHAR(100)
)
BEGIN
    UPDATE `produkt` SET
        `pris` = a_price,
        `namn` = a_name,
        `bildlank` = a_picture,
        `beskrivning` = a_description
    WHERE
        `produkt_kod` = a_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-09 13:19:48
