-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery
-- ------------------------------------------------------
-- Server version	8.0.0-dmr-log

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
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1,'Avenida Paulista, 1500',-23.56168,-46.656139,'2021-01-06 10:25:28',0),(2,'Avenida Paulista, 1500',-22.946779,-43.217753,'2021-01-06 10:26:02',1),(3,'Avenida Paulista, 1500',-25.439787,-49.237759,'2021-01-06 10:26:03',0),(4,'Avenida Paulista, 1500',-23.56168,-46.656139,'2021-01-06 10:26:03',0),(5,'Avenida Paulista, 1500',-23.56168,-46.656139,'2021-01-06 10:26:03',1),(6,'Avenida Paulista, 1500',-23.56168,-46.656139,'2021-01-06 10:26:03',0),(7,'Avenida Paulista, 1500',-23.56168,-46.656139,'2021-01-06 10:26:03',0),(8,'Avenida Paulista, 1500',-23.56168,-46.656139,'2021-01-06 14:29:57',0);
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_product`
--

DROP TABLE IF EXISTS `tb_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_product` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FKsu03ywlcvyqg5y78qey2q25lc` (`product_id`),
  CONSTRAINT `FK40anaevs16kmc2tbh7wc511fq` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`id`),
  CONSTRAINT `FKsu03ywlcvyqg5y78qey2q25lc` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_product`
--

LOCK TABLES `tb_order_product` WRITE;
/*!40000 ALTER TABLE `tb_order_product` DISABLE KEYS */;
INSERT INTO `tb_order_product` VALUES (1,1),(6,1),(2,2),(4,2),(8,2),(3,3),(1,4),(3,4),(5,4),(2,5),(6,5),(7,5),(8,5),(4,6),(5,6),(7,7),(2,8);
/*!40000 ALTER TABLE `tb_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_uri` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'Pizza de bacon com mussarela, orégano, molho especial e tempero da casa.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/pizza_bacon.jpg','Pizza Bacon',49.9),(2,'Pizza à moda da casa, com molho especial e todos ingredientes básicos, e queijo à sua escolha.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/pizza_moda.jpg','Pizza Moda da Casa',59.9),(3,'Pizza Portuguesa com molho especial, mussarela, presunto, ovos e especiarias.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/pizza_portuguesa.jpg','Pizza Portuguesa',45),(4,'Risoto de carne com especiarias e um delicioso molho de acompanhamento.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/risoto_carne.jpg','Risoto de Carne',52),(5,'Risoto Funghi feito com ingredientes finos e o toque especial do chef.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/risoto_funghi.jpg','Risoto Funghi',59.95),(6,'Macarrão fresco espaguete com molho especial e tempero da casa.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/macarrao_espaguete.jpg','Macarrão Espaguete',35.9),(7,'Macarrão fusili com toque do chef e especiarias.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/macarrao_fusili.jpg','Macarrão Fusili',38),(8,'Macarrão penne fresco ao dente com tempero especial.','https://raw.githubusercontent.com/devsuperior/sds2/master/assets/macarrao_penne.jpg','Macarrão Penne',37.9);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'delivery'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-06 17:05:09
