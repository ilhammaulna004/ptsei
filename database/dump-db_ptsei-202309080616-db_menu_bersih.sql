-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ptsei
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,NULL),(2,0,6,'Admin','fa-tasks','',NULL,NULL,'2023-08-27 05:09:20'),(3,2,7,'Users','fa-users','auth/users',NULL,NULL,'2023-08-27 05:09:20'),(7,2,8,'Operation log','fa-history','auth/logs',NULL,NULL,'2023-09-07 16:15:08'),(13,0,2,'Customer','fa-male','/customer',NULL,'2023-08-27 00:13:11','2023-08-27 00:15:39'),(14,0,3,'Jasa','fa-cubes','/jasa',NULL,'2023-08-27 00:14:19','2023-08-27 00:15:39'),(15,0,4,'Job Order','fa-server','/job-order',NULL,'2023-08-27 00:15:06','2023-08-27 00:15:39'),(16,0,5,'Job Order Detail','fa-bars','/job-order-detail',NULL,'2023-08-27 05:09:15','2023-08-27 05:09:20');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (481,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-02 23:25:50','2023-09-02 23:25:50'),(482,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-02 23:25:54','2023-09-02 23:25:54'),(483,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:01:56','2023-09-03 03:01:56'),(484,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:02:43','2023-09-03 03:02:43'),(485,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:06:21','2023-09-03 03:06:21'),(486,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:06:42','2023-09-03 03:06:42'),(487,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:08:11','2023-09-03 03:08:11'),(488,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:08:35','2023-09-03 03:08:35'),(489,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:09:08','2023-09-03 03:09:08'),(490,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:13:50','2023-09-03 03:13:50'),(491,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:14:35','2023-09-03 03:14:35'),(492,1,'admin/job-order/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:14:38','2023-09-03 03:14:38'),(493,1,'admin/job-order/11/edit','GET','127.0.0.1','[]','2023-09-03 03:14:43','2023-09-03 03:14:43'),(494,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:14:47','2023-09-03 03:14:47'),(495,1,'admin/job-order/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:15:08','2023-09-03 03:15:08'),(496,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:15:14','2023-09-03 03:15:14'),(497,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:20:28','2023-09-03 03:20:28'),(498,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:23:21','2023-09-03 03:23:21'),(499,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:23:31','2023-09-03 03:23:31'),(500,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:36:19','2023-09-03 03:36:19'),(501,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:36:41','2023-09-03 03:36:41'),(502,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:36:45','2023-09-03 03:36:45'),(503,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:36:50','2023-09-03 03:36:50'),(504,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:37:50','2023-09-03 03:37:50'),(505,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:43:49','2023-09-03 03:43:49'),(506,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:43:53','2023-09-03 03:43:53'),(507,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:46:44','2023-09-03 03:46:44'),(508,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:46:47','2023-09-03 03:46:47'),(509,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 03:47:05','2023-09-03 03:47:05'),(510,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-03 03:50:44','2023-09-03 03:50:44'),(511,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-03 00:00:00\",\"end\":\"2023-09-03 00:00:00\"},\"_pjax\":\"#pjax-container\"}','2023-09-03 03:50:55','2023-09-03 03:50:55'),(512,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_pjax\":\"#pjax-container\"}','2023-09-03 03:51:13','2023-09-03 03:51:13'),(513,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"}}','2023-09-03 04:13:56','2023-09-03 04:13:56'),(514,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"}}','2023-09-03 04:15:18','2023-09-03 04:15:18'),(515,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"}}','2023-09-03 04:17:57','2023-09-03 04:17:57'),(516,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"nomor_job_order\":\"Te\",\"_pjax\":\"#pjax-container\"}','2023-09-03 04:18:04','2023-09-03 04:18:04'),(517,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_pjax\":\"#pjax-container\"}','2023-09-03 04:18:08','2023-09-03 04:18:08'),(518,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"}}','2023-09-03 04:20:30','2023-09-03 04:20:30'),(519,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"_pjax\":\"#pjax-container\"}','2023-09-03 04:20:36','2023-09-03 04:20:36'),(520,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\"}','2023-09-03 04:22:22','2023-09-03 04:22:22'),(521,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":\"Te\",\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"bekas\",\"_pjax\":\"#pjax-container\"}','2023-09-03 04:22:29','2023-09-03 04:22:29'),(522,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"_pjax\":\"#pjax-container\",\"nomor_job_order\":\"Te\",\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"pack\"}','2023-09-03 04:22:37','2023-09-03 04:22:37'),(523,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"_pjax\":\"#pjax-container\"}','2023-09-03 04:22:39','2023-09-03 04:22:39'),(524,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"_pjax\":\"#pjax-container\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:22:46','2023-09-03 04:22:46'),(525,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:23:01','2023-09-03 04:23:01'),(526,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:42:24','2023-09-03 04:42:24'),(527,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:42:28','2023-09-03 04:42:28'),(528,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:42:47','2023-09-03 04:42:47'),(529,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:43:02','2023-09-03 04:43:02'),(530,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:43:13','2023-09-03 04:43:13'),(531,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:43:19','2023-09-03 04:43:19'),(532,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:43:36','2023-09-03 04:43:36'),(533,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:44:04','2023-09-03 04:44:04'),(534,1,'admin/job-order','GET','127.0.0.1','{\"selesai_date_riksa\":{\"start\":\"2023-09-01 00:00:00\",\"end\":\"2023-09-30 00:00:00\"},\"_scope_\":\"customer_id\",\"nomor_job_order\":null,\"customer\":null,\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:44:08','2023-09-03 04:44:08'),(535,1,'admin/job-order','GET','127.0.0.1','{\"_scope_\":\"customer_id\",\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\",\"_pjax\":\"#pjax-container\"}','2023-09-03 04:44:11','2023-09-03 04:44:11'),(536,1,'admin/job-order','GET','127.0.0.1','{\"_scope_\":\"customer_id\",\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:44:15','2023-09-03 04:44:15'),(537,1,'admin/job-order','GET','127.0.0.1','{\"_scope_\":\"customer_id\",\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:45:06','2023-09-03 04:45:06'),(538,1,'admin/job-order','GET','127.0.0.1','{\"_scope_\":\"customer_id\",\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:45:59','2023-09-03 04:45:59'),(539,1,'admin/job-order','GET','127.0.0.1','{\"_scope_\":\"customer_id\",\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\"}','2023-09-03 04:47:22','2023-09-03 04:47:22'),(540,1,'admin/job-order','GET','127.0.0.1','{\"_scope_\":\"customer_id\",\"3fc73fba1853905c1a0b4e3bb3f5af78\":\"ind\",\"_pjax\":\"#pjax-container\"}','2023-09-03 04:48:13','2023-09-03 04:48:13'),(541,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 08:53:42','2023-09-03 08:53:42'),(542,1,'admin/job-order-detail','GET','127.0.0.1','[]','2023-09-03 09:03:23','2023-09-03 09:03:23'),(543,1,'admin/job-order-detail','GET','127.0.0.1','{\"761719b1c5d1a747271e7c296363d200\":null,\"691eabc37cc80fce47de35fd0ba36cc2\":\"Ela\",\"qty\":{\"start\":null,\"end\":null},\"price_per_unit\":{\"start\":null,\"end\":null},\"total_price\":{\"start\":null,\"end\":null},\"mulai_date_riksa\":{\"start\":null,\"end\":null},\"selesai_date_riksa\":{\"start\":null,\"end\":null},\"mulai_pengecekan\":{\"start\":null,\"end\":null},\"selesai_pengecekan\":{\"start\":null,\"end\":null},\"created_at\":{\"start\":null,\"end\":null},\"_pjax\":\"#pjax-container\"}','2023-09-03 09:03:42','2023-09-03 09:03:42'),(544,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:03:46','2023-09-03 09:03:46'),(545,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"761719b1c5d1a747271e7c296363d200\":null,\"691eabc37cc80fce47de35fd0ba36cc2\":null,\"qty\":{\"start\":null,\"end\":null},\"price_per_unit\":{\"start\":\"0\",\"end\":\"5000000\"},\"total_price\":{\"start\":null,\"end\":null},\"mulai_date_riksa\":{\"start\":null,\"end\":null},\"selesai_date_riksa\":{\"start\":null,\"end\":null},\"mulai_pengecekan\":{\"start\":null,\"end\":null},\"selesai_pengecekan\":{\"start\":null,\"end\":null},\"created_at\":{\"start\":null,\"end\":null}}','2023-09-03 09:04:10','2023-09-03 09:04:10'),(546,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:04:14','2023-09-03 09:04:14'),(547,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"761719b1c5d1a747271e7c296363d200\":null,\"691eabc37cc80fce47de35fd0ba36cc2\":null,\"qty\":{\"start\":\"3\",\"end\":\"4\"},\"price_per_unit\":{\"start\":null,\"end\":null},\"total_price\":{\"start\":null,\"end\":null},\"mulai_date_riksa\":{\"start\":null,\"end\":null},\"selesai_date_riksa\":{\"start\":null,\"end\":null},\"mulai_pengecekan\":{\"start\":null,\"end\":null},\"selesai_pengecekan\":{\"start\":null,\"end\":null},\"created_at\":{\"start\":null,\"end\":null}}','2023-09-03 09:04:26','2023-09-03 09:04:26'),(548,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:04:29','2023-09-03 09:04:29'),(549,1,'admin/job-order-detail','GET','127.0.0.1','[]','2023-09-03 09:06:28','2023-09-03 09:06:28'),(550,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:06:35','2023-09-03 09:06:35'),(551,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"761719b1c5d1a747271e7c296363d200\":null,\"691eabc37cc80fce47de35fd0ba36cc2\":null,\"03d9772bd73f0b166edace23fddc1d0d\":\"tos\",\"qty\":{\"start\":null,\"end\":null},\"price_per_unit\":{\"start\":null,\"end\":null},\"total_price\":{\"start\":null,\"end\":null},\"mulai_date_riksa\":{\"start\":null,\"end\":null},\"selesai_date_riksa\":{\"start\":null,\"end\":null},\"mulai_pengecekan\":{\"start\":null,\"end\":null},\"selesai_pengecekan\":{\"start\":null,\"end\":null},\"created_at\":{\"start\":null,\"end\":null}}','2023-09-03 09:06:45','2023-09-03 09:06:45'),(552,1,'admin/job-order-detail','GET','127.0.0.1','{\"761719b1c5d1a747271e7c296363d200\":null,\"691eabc37cc80fce47de35fd0ba36cc2\":null,\"03d9772bd73f0b166edace23fddc1d0d\":\"tos\",\"qty\":{\"start\":null,\"end\":null},\"price_per_unit\":{\"start\":null,\"end\":null},\"total_price\":{\"start\":null,\"end\":null},\"mulai_date_riksa\":{\"start\":null,\"end\":null},\"selesai_date_riksa\":{\"start\":null,\"end\":null},\"mulai_pengecekan\":{\"start\":null,\"end\":null},\"selesai_pengecekan\":{\"start\":null,\"end\":null},\"created_at\":{\"start\":null,\"end\":null}}','2023-09-03 09:08:38','2023-09-03 09:08:38'),(553,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:08:43','2023-09-03 09:08:43'),(554,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:08:45','2023-09-03 09:08:45'),(555,1,'admin/job-order-detail','GET','127.0.0.1','[]','2023-09-03 09:09:25','2023-09-03 09:09:25'),(556,1,'admin/job-order-detail','GET','127.0.0.1','{\"761719b1c5d1a747271e7c296363d200\":null,\"691eabc37cc80fce47de35fd0ba36cc2\":null,\"03d9772bd73f0b166edace23fddc1d0d\":null,\"qty\":{\"start\":null,\"end\":null},\"price_per_unit\":{\"start\":null,\"end\":null},\"total_price\":{\"start\":null,\"end\":null},\"mulai_date_riksa\":{\"start\":null,\"end\":null},\"selesai_date_riksa\":{\"start\":null,\"end\":null},\"mulai_pengecekan\":{\"start\":null,\"end\":null},\"selesai_pengecekan\":{\"start\":null,\"end\":null},\"created_at\":{\"start\":null,\"end\":null},\"description\":\"des\",\"_pjax\":\"#pjax-container\"}','2023-09-03 09:09:32','2023-09-03 09:09:32'),(557,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:09:38','2023-09-03 09:09:38'),(558,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-03 09:11:20','2023-09-03 09:11:20'),(559,1,'admin','GET','127.0.0.1','[]','2023-09-04 19:45:28','2023-09-04 19:45:28'),(560,1,'admin','GET','127.0.0.1','[]','2023-09-04 19:48:54','2023-09-04 19:48:54'),(561,1,'admin','GET','127.0.0.1','[]','2023-09-04 19:49:53','2023-09-04 19:49:53'),(562,1,'admin','GET','127.0.0.1','[]','2023-09-04 20:35:24','2023-09-04 20:35:24'),(563,1,'admin','GET','127.0.0.1','[]','2023-09-04 20:35:58','2023-09-04 20:35:58'),(564,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:38:13','2023-09-04 20:38:13'),(565,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:38:22','2023-09-04 20:38:22'),(566,1,'admin/helpers/terminal/artisan','POST','127.0.0.1','{\"c\":\"cache:clear\",\"_token\":\"QMmVKnTeFJFmhspVCZRQyQaoRR8mDRqeezzUirvM\"}','2023-09-04 20:38:56','2023-09-04 20:38:56'),(567,1,'admin/helpers/terminal/artisan','POST','127.0.0.1','{\"c\":\"config:clear\",\"_token\":\"QMmVKnTeFJFmhspVCZRQyQaoRR8mDRqeezzUirvM\"}','2023-09-04 20:39:08','2023-09-04 20:39:08'),(568,1,'admin/helpers/terminal/artisan','POST','127.0.0.1','{\"c\":\"db:monitor\",\"_token\":\"QMmVKnTeFJFmhspVCZRQyQaoRR8mDRqeezzUirvM\"}','2023-09-04 20:39:18','2023-09-04 20:39:18'),(569,1,'admin/helpers/terminal/artisan','POST','127.0.0.1','{\"c\":\"view:clear\",\"_token\":\"QMmVKnTeFJFmhspVCZRQyQaoRR8mDRqeezzUirvM\"}','2023-09-04 20:39:30','2023-09-04 20:39:30'),(570,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:40:01','2023-09-04 20:40:01'),(571,1,'admin/customer','GET','127.0.0.1','[]','2023-09-04 20:41:02','2023-09-04 20:41:02'),(572,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:19','2023-09-04 20:41:19'),(573,1,'admin/jasa','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:32','2023-09-04 20:41:32'),(574,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:34','2023-09-04 20:41:34'),(575,1,'admin/customer/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:37','2023-09-04 20:41:37'),(576,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:39','2023-09-04 20:41:39'),(577,1,'admin/customer/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:44','2023-09-04 20:41:44'),(578,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:41:47','2023-09-04 20:41:47'),(579,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:42:01','2023-09-04 20:42:01'),(580,1,'admin/job-order','GET','127.0.0.1','[]','2023-09-04 20:43:08','2023-09-04 20:43:08'),(581,1,'admin/job-order/10/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:43:13','2023-09-04 20:43:13'),(582,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-04 20:43:26','2023-09-04 20:43:26'),(583,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 00:38:36','2023-09-05 00:38:36'),(584,1,'admin/job-order-detail','GET','127.0.0.1','[]','2023-09-05 00:40:35','2023-09-05 00:40:35'),(585,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 00:40:44','2023-09-05 00:40:44'),(586,1,'admin','GET','127.0.0.1','[]','2023-09-05 18:28:27','2023-09-05 18:28:27'),(587,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:31:00','2023-09-05 18:31:00'),(588,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:31:02','2023-09-05 18:31:02'),(589,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:31:05','2023-09-05 18:31:05'),(590,1,'admin/jasa','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:32:52','2023-09-05 18:32:52'),(591,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:33:45','2023-09-05 18:33:45'),(592,1,'admin/job-order/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:34:31','2023-09-05 18:34:31'),(593,1,'admin/customer','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:35:21','2023-09-05 18:35:21'),(594,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:35:25','2023-09-05 18:35:25'),(595,1,'admin/job-order/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:35:29','2023-09-05 18:35:29'),(596,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:35:50','2023-09-05 18:35:50'),(597,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:39:37','2023-09-05 18:39:37'),(598,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:40:00','2023-09-05 18:40:00'),(599,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:40:01','2023-09-05 18:40:01'),(600,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}','2023-09-05 18:40:04','2023-09-05 18:40:04'),(601,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:43:48','2023-09-05 18:43:48'),(602,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:44:09','2023-09-05 18:44:09'),(603,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:44:25','2023-09-05 18:44:25'),(604,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:44:31','2023-09-05 18:44:31'),(605,1,'admin/job-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:44:46','2023-09-05 18:44:46'),(606,1,'admin/job-order-detail','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-05 18:44:51','2023-09-05 18:44:51'),(607,1,'admin','GET','127.0.0.1','[]','2023-09-07 15:54:15','2023-09-07 15:54:15'),(608,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:14:18','2023-09-07 16:14:18'),(609,1,'admin/auth/menu/4','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"Zz6ylIRCW644G40sFSkgc6nRG3I5itZvUkzM4qlX\"}','2023-09-07 16:14:46','2023-09-07 16:14:46'),(610,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:14:47','2023-09-07 16:14:47'),(611,1,'admin/auth/menu/5','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"Zz6ylIRCW644G40sFSkgc6nRG3I5itZvUkzM4qlX\"}','2023-09-07 16:14:51','2023-09-07 16:14:51'),(612,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:14:51','2023-09-07 16:14:51'),(613,1,'admin/auth/menu/6','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"Zz6ylIRCW644G40sFSkgc6nRG3I5itZvUkzM4qlX\"}','2023-09-07 16:14:57','2023-09-07 16:14:57'),(614,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:14:58','2023-09-07 16:14:58'),(615,1,'admin/auth/menu/8','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"Zz6ylIRCW644G40sFSkgc6nRG3I5itZvUkzM4qlX\"}','2023-09-07 16:15:04','2023-09-07 16:15:04'),(616,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:15:05','2023-09-07 16:15:05'),(617,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"Zz6ylIRCW644G40sFSkgc6nRG3I5itZvUkzM4qlX\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":7}]}]\"}','2023-09-07 16:15:08','2023-09-07 16:15:08'),(618,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:15:09','2023-09-07 16:15:09'),(619,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-09-07 16:15:23','2023-09-07 16:15:23'),(620,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:15:26','2023-09-07 16:15:26'),(621,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:15:30','2023-09-07 16:15:30'),(622,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-09-07 16:15:33','2023-09-07 16:15:33');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'Admin helpers','ext.helpers','','/helpers/*','2023-08-27 00:12:07','2023-08-27 00:12:07');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2023-08-27 00:07:16','2023-08-27 00:07:16');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$C2InlugGa9IUXWPFVaY92e.R92I/EWx09EwgtofE5bCi4bwLY7dCy','Administrator',NULL,'4W0xip9x0F25mdzpvH7w08RgAZJfXhPzpVScqa3cuO62Oj24fM5g8tWMNbKc','2023-08-27 00:07:16','2023-08-27 00:07:16');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'PT Isra Presisi','PT Isra Presisi','123','Delta Silicon','1','2023-08-31 16:13:56','2023-08-31 16:13:56',NULL),(2,'PT Wahana Duta Jaya Rucika','PT Wahana Duta Jaya Rucika','1234','Cibitung','12','2023-08-31 16:14:29','2023-08-31 16:14:29',NULL),(3,'PP Persero','PP Persero','123',NULL,'123','2023-08-31 16:36:39','2023-08-31 16:36:39',NULL),(4,'PT Toso Industry','PT Toso Industry','12345','EJIP','1234','2023-08-31 16:37:04','2023-08-31 16:37:04',NULL),(5,'PT Handi Makmur','PT Handi Makmur','123456','Bogor','123456','2023-08-31 16:37:29','2023-08-31 16:37:29',NULL),(6,'RS Unimedika','RS Unimedika','1234567','Setu','1234567','2023-08-31 16:37:48','2023-08-31 16:37:48',NULL),(7,'PT Internusa Keramik Tangerang','PT Internusa Keramik Tangerang','12345678','Tangerang','12345678','2023-08-31 16:38:05','2023-08-31 16:38:05',NULL),(8,'PT Yuto Packaging Technology','PT Yuto Packaging Technology','1123123','Bekasi','1233321','2023-09-01 08:27:06','2023-09-01 08:27:06',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jasa`
--

DROP TABLE IF EXISTS `jasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jasa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jasa`
--

LOCK TABLES `jasa` WRITE;
/*!40000 ALTER TABLE `jasa` DISABLE KEYS */;
INSERT INTO `jasa` VALUES (1,'Elavator',0,'2023-08-31 16:38:26','2023-08-31 16:38:26',NULL),(2,'Listrik',0,'2023-08-31 16:38:37','2023-08-31 16:38:37',NULL),(3,'Petir',0,'2023-08-31 16:38:48','2023-08-31 16:38:48',NULL),(4,'Fire',0,'2023-08-31 16:39:00','2023-08-31 16:39:00',NULL),(5,'PAA',0,'2023-08-31 16:39:11','2023-08-31 16:39:11',NULL),(6,'PTP',0,'2023-08-31 16:39:20','2023-08-31 16:39:20',NULL),(7,'PTP',0,'2023-08-31 16:39:33','2023-08-31 16:39:33',NULL),(8,'PUBT',0,'2023-08-31 16:39:44','2023-08-31 16:39:44',NULL);
/*!40000 ALTER TABLE `jasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_order`
--

DROP TABLE IF EXISTS `job_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomor_job_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `mulai_date_riksa` datetime DEFAULT NULL,
  `selesai_date_riksa` datetime DEFAULT NULL,
  `nomor_po` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_pembayaran` datetime DEFAULT NULL,
  `status_pembayaran` int(11) NOT NULL DEFAULT 0,
  `project_by` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_order_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_order`
--

LOCK TABLES `job_order` WRITE;
/*!40000 ALTER TABLE `job_order` DISABLE KEYS */;
INSERT INTO `job_order` VALUES (10,'TESJONOX',8,150000000,'2023-09-01 00:00:00','2023-09-30 00:00:00','INI NOMOR PO','2023-09-29 00:00:00',0,'HAM','descriptiondescriptiondescription','2023-09-01 09:18:39','2023-09-02 22:07:52',NULL),(11,'SEI/2023/09/03/1',4,100000000,'2023-09-03 00:00:00','2023-09-30 00:00:00','PO-2023-08-08-13','2023-09-30 00:00:00',0,'HAM','YOWASAP','2023-09-02 23:13:49','2023-09-02 23:13:49',NULL);
/*!40000 ALTER TABLE `job_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_order_detail`
--

DROP TABLE IF EXISTS `job_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_order_id` int(11) NOT NULL,
  `jasa_id` int(11) NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `price_per_unit` double NOT NULL DEFAULT 0,
  `total_price` double NOT NULL DEFAULT 0,
  `mulai_date_riksa` datetime DEFAULT NULL,
  `selesai_date_riksa` datetime DEFAULT NULL,
  `mulai_pengecekan` datetime DEFAULT NULL,
  `selesai_pengecekan` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_order_detail_job_order_id_index` (`job_order_id`),
  KEY `job_order_detail_jasa_id_index` (`jasa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_order_detail`
--

LOCK TABLES `job_order_detail` WRITE;
/*!40000 ALTER TABLE `job_order_detail` DISABLE KEYS */;
INSERT INTO `job_order_detail` VALUES (1,10,1,1,5000000,5000000,'2023-09-01 00:00:00','2023-09-30 00:00:00','2023-09-01 00:00:00','2023-09-30 00:00:00','asd','2023-09-01 09:18:39','2023-09-02 22:07:52','2023-09-02 22:07:52'),(2,10,6,1,10000000,10000000,'2023-09-01 00:00:00','2023-09-30 00:00:00','2023-09-01 00:00:00','2023-09-30 00:00:00',NULL,'2023-09-01 09:18:39','2023-09-02 22:07:52','2023-09-02 22:07:52'),(3,10,1,1,5000000,5000000,'2023-09-01 00:00:00','2023-09-30 00:00:00','2023-09-01 00:00:00','2023-09-30 00:00:00','asd','2023-09-02 22:07:52','2023-09-02 22:07:52',NULL),(4,10,6,1,10000000,10000000,'2023-09-01 00:00:00','2023-09-30 00:00:00','2023-09-01 00:00:00','2023-09-30 00:00:00',NULL,'2023-09-02 22:07:52','2023-09-02 22:07:52',NULL),(5,10,8,1,100000000,100000000,'2023-09-03 00:00:00','2023-09-30 00:00:00','2023-09-03 00:00:00','2023-09-30 00:00:00','descriptiondescription','2023-09-02 22:07:52','2023-09-02 22:07:52',NULL),(6,11,1,4,5000000,20000000,'2023-09-03 00:00:00','2023-09-30 00:00:00','2023-09-03 00:00:00','2023-09-30 00:00:00',NULL,'2023-09-02 23:13:49','2023-09-02 23:13:49',NULL),(7,11,3,2,20000000,40000000,'2023-09-03 00:00:00','2023-09-30 00:00:00','2023-09-24 00:00:00','2023-09-30 00:00:00',NULL,'2023-09-02 23:13:49','2023-09-02 23:13:49',NULL),(8,11,1,4,10000000,40000000,'2023-09-03 00:00:00','2023-09-30 00:00:00','2023-09-03 00:00:00','2023-09-30 00:00:00',NULL,'2023-09-02 23:13:49','2023-09-02 23:13:49',NULL);
/*!40000 ALTER TABLE `job_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2023_08_20_154535_create_customer_table',2),(7,'2023_08_20_160401_create_jasa_table',2),(8,'2023_08_27_064158_create_job_order_table',2),(9,'2023_08_27_064602_create_job_order_detail_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_ptsei'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-08  6:16:00
