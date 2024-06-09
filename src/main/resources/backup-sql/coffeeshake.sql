CREATE DATABASE  IF NOT EXISTS `coffeeshake` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coffeeshake`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: coffeeshake
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` bigint NOT NULL AUTO_INCREMENT,
  `name_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'frappes'),(2,'malteadas'),(3,'especial'),(4,'pollo broaster'),(5,'bebidas calientes'),(6,'postres'),(7,'jugos'),(8,'bebidas'),(9,'extras'),(10,'gaseosas');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id_detail` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `subtotal_price` double NOT NULL,
  `unit_price` double NOT NULL,
  `id_order` bigint NOT NULL,
  `id_product` bigint NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `FKsta0q8hk1lt2vdu92u4e5vr4a` (`id_order`),
  KEY `FKicrtfcntxfkyrnoaqh1croidl` (`id_product`),
  CONSTRAINT `FKicrtfcntxfkyrnoaqh1croidl` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  CONSTRAINT `FKsta0q8hk1lt2vdu92u4e5vr4a` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` bigint NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `method_payment` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `type_order` varchar(255) DEFAULT NULL,
  `waiting_time` int NOT NULL,
  `id_user` bigint NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `FKp1jglhdt6fpf5plvbns0gp5ns` (`id_user`),
  CONSTRAINT `FKp1jglhdt6fpf5plvbns0gp5ns` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name_product` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `id_category` bigint NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `FK5cxv31vuhc7v32omftlxa8k3c` (`id_category`),
  CONSTRAINT `FK5cxv31vuhc7v32omftlxa8k3c` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Frappe De Manjar',_binary '','default.png','Frappe De Manjar',10,1),(2,'Frappe De Fresa',_binary '','default.png','Frappe De Fresa',12,1),(3,'Frappe De Oreo',_binary '',NULL,'Frappe De Oreo',10,1),(4,'Frío',_binary '',NULL,'Frappe De Frappuchino',10,1),(5,'Malteada De Chocolate',_binary '',NULL,'Malteada De Chocolate',12,2),(6,'Malteada De Café',_binary '',NULL,'Malteada De Café',12,2),(7,'Malteada De Lúcuma',_binary '',NULL,'Malteada De Lúcuma',12,2),(8,'Malteada De Princesa',_binary '',NULL,'Malteada De Princesa',13,2),(9,'Malteada De Morochas',_binary '',NULL,'Malteada De Morochas',13,2),(10,'Papas Fritas Y Ensalada',_binary '',NULL,'Milanesa De Pollo',10,3),(11,'Papas Fritas Y Ensalada',_binary '',NULL,'Carne A La Parrilla',14,3),(12,'Papas, Carne, Salami Y Tocino',_binary '',NULL,'Hamburguesa Mixta',6.5,3),(13,'Papas Y Pollo',_binary '',NULL,'Hamburguesa De Pollo',5.5,3),(14,'6 Alitas De Pollo, Papas Fritas Y Ensalada',_binary '',NULL,'Alitas Criolla X6',20.5,3),(15,'10 Alitas De Pollo, Papas Fritas Y Ensalada',_binary '',NULL,'Alitas Criolla X10',28,3),(16,'5 Alitas Criollas, Papa, Camote Y Ensalada',_binary '',NULL,'Combo Para 4',45,3),(17,'8 Alitas Criollas, 6 Piezas De Pollo Broaster, Papa, Camote Y Ensalada',_binary '',NULL,'Combo Para 6',45,3),(18,'14 Nuggets Y Papas Fritas',_binary '',NULL,'Nuggets Porcion 2',20.5,3),(19,'Alitas, Papas Y Ensalada',_binary '',NULL,'Alitas Honey Hot X6',24,3),(20,'Alitas, Papas Y Ensalada',_binary '',NULL,'Alitas Honey Hot X10',24,3),(21,'Alitas, Papas Y Ensalada',_binary '',NULL,'Alitas Acevichadas X6',24,3),(22,'Alitas, Papas Y Ensalada',_binary '',NULL,'Alitas Acevichadas X10',29,3),(23,'2 Piezas De Broaster Y Papas Fritas',_binary '',NULL,'Pollo Broaster 2 Piezas',18,4),(24,'3 Piezas De Broaster Y Papas Fritas',_binary '',NULL,'Pollo Broaster 3 Piezas',25,4),(25,'Chocolate Con Leche',_binary '',NULL,'Chocolate Con Leche',6,5),(26,'Cappuchino',_binary '',NULL,'Cappuchino',6.5,5),(27,'Te, Manzanilla, Anis Y Hierba Luisa',_binary '',NULL,'Infusiones',2,5),(28,'Pan Con Jamón',_binary '',NULL,'Pan Con Jamón',1,5),(29,'Pan Con Queso',_binary '',NULL,'Pan Con Queso',1,5),(30,'Pan Con Doble Queso',_binary '',NULL,'Pan Con Doble Queso',2,5),(31,'Pan Con Jamón Y Queso',_binary '',NULL,'Pan Con Jamón Y Queso',1.5,5),(32,'Ensalada De Fruta Ojuelas + Helado',_binary '',NULL,'Ensalada De Fruta Ojuelas + Helado',10,6),(33,'Ensalada De Fruta Y Helado',_binary '',NULL,'Ensalada De Fruta Y Helado',9,6),(34,'Helado de su preferencia',_binary '','default.png','Ensalada De Fruta + Helado',10,6),(35,'Ensalada De Fruta Y Ojuela',_binary '','default.png','Ensalada De Fruta Y Ojuela',8.5,6),(36,'Helado Chocolate',_binary '','default.png','Helado Chocolate',8.5,6),(37,'Helado Chocochips',_binary '','default.png','Helado Chocochips',8,6),(38,'Helado Lúcuma',_binary '','default.png','Helado Lúcuma',8,6),(39,'Helado Tricolor',_binary '','default.png','Helado Tricolor',8,6),(40,'Helado De Menta',_binary '','default.png','Helado De Menta',13,6),(41,'Helado Princesa',_binary '','default.png','Helado Princesa',10,6),(42,'Helado Morochas',_binary '','default.png','Helado Morochas',10,6),(43,'Helado Vainilla',_binary '','default.png','Helado Vainilla',8,6),(44,'Jugo de Fresa',_binary '','default.png','Jugo De Fresa',6,7),(45,'Jugo de Piña',_binary '','default.png','Jugo De Piña',6,7),(46,'Jugo de Papaya',_binary '','default.png','Jugo De Papaya',5,7),(47,'Jugo De Plátano',_binary '','default.png','Jugo De Plátano',5,7),(48,'Jugo Surtido',_binary '','default.png','Jugo Surtido',6,7),(49,'Jugo Especial',_binary '','default.png','Jugo Especial',7,7),(50,'Jugo De Papaya Con Leche',_binary '','default.png','Jugo De Papaya Con Leche',6,7),(51,'Sin Lactosa',_binary '','default.png','Jugo De Fresa Con Leche',8,7),(52,'Jugo De Arándano Con Lecha',_binary '','default.png','Jugo De Arándano Con Leche',8,7),(53,'Machu Picchu',_binary '','default.png','Machu Picchu',11,8),(54,'Pisco Sour',_binary '','default.png','Pisco Sour',8,8),(55,'Laguna Azul',_binary '','default.png','Laguna Azul',11,8),(56,'Trio De Amor',_binary '','default.png','Trio De Amor',11,8),(57,'Algarrobina',_binary '','default.png','Algarrobina',14,8),(58,'Piña Colada',_binary '','default.png','Piña Colada',13,8),(59,'Mojito De Fresa',_binary '','default.png','Mojito De Fresa',12,8),(60,'Limonada Frozen',_binary '','default.png','Limonada Frozen',7.5,8),(61,'Limonada Rose',_binary '','default.png','Limonada Rose',8,8),(62,'Limonada Blue',_binary '','default.png','Limonada Blue',8,8),(63,'Cerveza',_binary '','default.png','Cerveza',9,9),(64,'Maracuyá Jarra',_binary '','default.png','Maracuyá Jarra',13,9),(65,'Chicha Morada Jarra',_binary '','default.png','Chicha Morada Jarra',13,9),(66,'Vino',_binary '','default.png','Vino',28,9),(67,'Porción De Papas',_binary '','default.png','Porción De Papas',5,9),(68,'Media Jarra De Maracuyá',_binary '','default.png','Media Jarra De Maracuyá',7.5,9),(69,'San Luis, 750 ml',_binary '','default.png','Agua Mineral 750 ml',3,10),(70,'600 ml',_binary '','default.png','Inca Kola 600 ml',4,10),(71,'600 ml',_binary '','default.png','Coca Cola 600 ml',4,10),(72,'1L',_binary '','default.png','Inca Kola 1L',8,10),(77,'Descripcion de prueba',_binary '','default.png','Producto para editar',400,8),(78,'Descripcion de prueba 2',_binary '','default.png','Producto prueba 2',120000,7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` bigint NOT NULL,
  `name_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrador'),(2,'repartidor'),(3,'camarero básico'),(4,'camarero avanzado'),(5,'cliente');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `lastnames` varchar(255) DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'4564',_binary '','Encoder','Prueba','$2a$10$v2wGJEUest65irxsS9DM/.W5QTrWwUPG8vTQHUDVdOFfkC6z0B0Y.','936245721','default.png','prueba');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id_user_role` bigint NOT NULL AUTO_INCREMENT,
  `role_id_role` bigint DEFAULT NULL,
  `user_id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id_user_role`),
  KEY `FK3xro8py7lok7galqeac68a67o` (`role_id_role`),
  KEY `FKdoblidlgryqlt2vjhx75ht0rx` (`user_id_user`),
  CONSTRAINT `FK3xro8py7lok7galqeac68a67o` FOREIGN KEY (`role_id_role`) REFERENCES `role` (`id_role`),
  CONSTRAINT `FKdoblidlgryqlt2vjhx75ht0rx` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (5,5,5);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'coffeeshake'
--

--
-- Dumping routines for database 'coffeeshake'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_category_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_category_by_name`(IN category_name VARCHAR(255))
BEGIN
    SELECT * FROM category WHERE name_category = category_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_order_by_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_order_by_status`(IN order_status VARCHAR(255))
BEGIN
    SELECT * FROM orders WHERE status_ = order_status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_order_by_user_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_order_by_user_id`(IN user_id BIGINT)
BEGIN
    SELECT * FROM orders WHERE id_user = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_order_detail_by_order_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_order_detail_by_order_id`(IN order_id BIGINT)
BEGIN
    SELECT * FROM order_detail WHERE id_order = order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_products_available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_products_available`()
BEGIN
    SELECT * FROM product WHERE enabled = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_products_by_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_products_by_category`(IN category_name VARCHAR(255))
BEGIN
    SELECT * FROM product p
    INNER JOIN category c ON p.id_category = c.id_category
    WHERE c.name_category = category_name AND p.enabled = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_products_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_products_by_name`(IN product_name VARCHAR(255))
BEGIN
    SELECT * FROM product WHERE name_product LIKE CONCAT('%', product_name, '%') AND enabled = 1;
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

-- Dump completed on 2024-06-08 19:36:23
