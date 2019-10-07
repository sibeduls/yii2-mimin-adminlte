-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hardb
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `tbl_auth_assignment`
--

DROP TABLE IF EXISTS `tbl_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `tbl_idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `tbl_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auth_assignment`
--

LOCK TABLES `tbl_auth_assignment` WRITE;
/*!40000 ALTER TABLE `tbl_auth_assignment` DISABLE KEYS */;
INSERT INTO `tbl_auth_assignment` VALUES ('admin','1',1570425862);
/*!40000 ALTER TABLE `tbl_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_auth_item`
--

DROP TABLE IF EXISTS `tbl_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `tbl_idx-auth_item-type` (`type`),
  CONSTRAINT `tbl_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tbl_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auth_item`
--

LOCK TABLES `tbl_auth_item` WRITE;
/*!40000 ALTER TABLE `tbl_auth_item` DISABLE KEYS */;
INSERT INTO `tbl_auth_item` VALUES ('/*',2,NULL,NULL,NULL,1570425671,1570425671),('/mimin/*',2,NULL,NULL,NULL,1570425760,1570425760),('/site/*',2,NULL,NULL,NULL,1570425767,1570425767),('admin',1,NULL,NULL,NULL,1570425612,1570425612);
/*!40000 ALTER TABLE `tbl_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_auth_item_child`
--

DROP TABLE IF EXISTS `tbl_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `tbl_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auth_item_child`
--

LOCK TABLES `tbl_auth_item_child` WRITE;
/*!40000 ALTER TABLE `tbl_auth_item_child` DISABLE KEYS */;
INSERT INTO `tbl_auth_item_child` VALUES ('admin','/mimin/*'),('admin','/site/*');
/*!40000 ALTER TABLE `tbl_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_auth_rule`
--

DROP TABLE IF EXISTS `tbl_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auth_rule`
--

LOCK TABLES `tbl_auth_rule` WRITE;
/*!40000 ALTER TABLE `tbl_auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_migration`
--

LOCK TABLES `tbl_migration` WRITE;
/*!40000 ALTER TABLE `tbl_migration` DISABLE KEYS */;
INSERT INTO `tbl_migration` VALUES ('m000000_000000_base',1570367182),('m140506_102106_rbac_init',1570368214),('m151024_072453_create_route_table',1570368264),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1570368214),('m180523_151638_rbac_updates_indexes_without_prefix',1570368215),('m191006_130547_create_user_table',1570367185);
/*!40000 ALTER TABLE `tbl_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_route`
--

DROP TABLE IF EXISTS `tbl_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_route` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_route`
--

LOCK TABLES `tbl_route` WRITE;
/*!40000 ALTER TABLE `tbl_route` DISABLE KEYS */;
INSERT INTO `tbl_route` VALUES ('/*','*','',1),('/debug/*','*','debug',1),('/debug/default/*','*','debug/default',1),('/debug/default/db-explain','db-explain','debug/default',1),('/debug/default/download-mail','download-mail','debug/default',1),('/debug/default/index','index','debug/default',1),('/debug/default/toolbar','toolbar','debug/default',1),('/debug/default/view','view','debug/default',1),('/debug/user/*','*','debug/user',1),('/debug/user/reset-identity','reset-identity','debug/user',1),('/debug/user/set-identity','set-identity','debug/user',1),('/gii/*','*','gii',1),('/gii/default/*','*','gii/default',1),('/gii/default/action','action','gii/default',1),('/gii/default/diff','diff','gii/default',1),('/gii/default/index','index','gii/default',1),('/gii/default/preview','preview','gii/default',1),('/gii/default/view','view','gii/default',1),('/mimin/*','*','mimin',1),('/mimin/role/*','*','mimin/role',1),('/mimin/role/create','create','mimin/role',1),('/mimin/role/delete','delete','mimin/role',1),('/mimin/role/index','index','mimin/role',1),('/mimin/role/permission','permission','mimin/role',1),('/mimin/role/update','update','mimin/role',1),('/mimin/role/view','view','mimin/role',1),('/mimin/route/*','*','mimin/route',1),('/mimin/route/create','create','mimin/route',1),('/mimin/route/delete','delete','mimin/route',1),('/mimin/route/generate','generate','mimin/route',1),('/mimin/route/index','index','mimin/route',1),('/mimin/route/update','update','mimin/route',1),('/mimin/route/view','view','mimin/route',1),('/mimin/user/*','*','mimin/user',1),('/mimin/user/create','create','mimin/user',1),('/mimin/user/delete','delete','mimin/user',1),('/mimin/user/index','index','mimin/user',1),('/mimin/user/update','update','mimin/user',1),('/mimin/user/view','view','mimin/user',1),('/site/*','*','site',1),('/site/about','about','site',1),('/site/add-admin','add-admin','site',1),('/site/captcha','captcha','site',1),('/site/contact','contact','site',1),('/site/error','error','site',1),('/site/index','index','site',1),('/site/login','login','site',1),('/site/logout','logout','site',1);
/*!40000 ALTER TABLE `tbl_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'system','37mU78xdlKc2dkHNU_ek1uWiYvBfqU_l','$2y$13$t2ilAwkVSba72GK8Z1vCUO4R9LdGu/dT7P/20siP6uSxKuEg1Kl.G',NULL,'system@ethaner.com',10,1570367510,1570367510),(2,'jimmi','','$2y$13$OJOmId9g4v1QdUy8TfADuu1gtB3M1u1oJCXtbv0LJx4d4CzGA10KO',NULL,'jimmy@ethaner.co',10,1570368390,1570368390);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-07 12:30:36
