-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: attendance_db
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `Attendance_attendance`
--

DROP TABLE IF EXISTS `Attendance_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_sessions` int NOT NULL,
  `attended_sessions` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Attendance_attendance_student_id_1979c0d8_fk_auth_user_id` (`student_id`),
  CONSTRAINT `Attendance_attendance_student_id_1979c0d8_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance_attendance`
--

LOCK TABLES `Attendance_attendance` WRITE;
/*!40000 ALTER TABLE `Attendance_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendance_attendancerecord`
--

DROP TABLE IF EXISTS `Attendance_attendancerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_attendancerecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `present` tinyint(1) NOT NULL,
  `student_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Attendance_attendanc_student_id_96d2eafd_fk_Attendanc` (`student_id`),
  KEY `Attendance_attendanc_subject_id_cc4e8622_fk_Attendanc` (`subject_id`),
  CONSTRAINT `Attendance_attendanc_student_id_96d2eafd_fk_Attendanc` FOREIGN KEY (`student_id`) REFERENCES `Attendance_student` (`id`),
  CONSTRAINT `Attendance_attendanc_subject_id_cc4e8622_fk_Attendanc` FOREIGN KEY (`subject_id`) REFERENCES `Attendance_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance_attendancerecord`
--

LOCK TABLES `Attendance_attendancerecord` WRITE;
/*!40000 ALTER TABLE `Attendance_attendancerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance_attendancerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendance_faculty`
--

DROP TABLE IF EXISTS `Attendance_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_faculty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance_faculty`
--

LOCK TABLES `Attendance_faculty` WRITE;
/*!40000 ALTER TABLE `Attendance_faculty` DISABLE KEYS */;
INSERT INTO `Attendance_faculty` VALUES (1,'avatars/faculty/richard-horvath-RAZU_R66vUc-unsplash.jpg','Poonam','Nandal','Poonam_nandal','shashikantkumarsharma71@gmail.com','CSE'),(2,'avatars/faculty/Portfolio.jpeg','Ragini','Kumari','ragini','ragini@gmail.com','CSE');
/*!40000 ALTER TABLE `Attendance_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendance_student`
--

DROP TABLE IF EXISTS `Attendance_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `roll_no` (`roll_no`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Attendance_student_user_id_0487f9c2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance_student`
--

LOCK TABLES `Attendance_student` WRITE;
/*!40000 ALTER TABLE `Attendance_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendance_subject`
--

DROP TABLE IF EXISTS `Attendance_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_year` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Attendance_subject_faculty_id_b5c3f4c9_fk_Attendance_faculty_id` (`faculty_id`),
  CONSTRAINT `Attendance_subject_faculty_id_b5c3f4c9_fk_Attendance_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `Attendance_faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance_subject`
--

LOCK TABLES `Attendance_subject` WRITE;
/*!40000 ALTER TABLE `Attendance_subject` DISABLE KEYS */;
INSERT INTO `Attendance_subject` VALUES (1,'DISCREATE MATHEMATICS','DM','BCS-DS-401','2024-2025','4','4CSA',1),(2,'CLOUD COMPUTER','CC','CCS','2024-2025','4','4CSA',2);
/*!40000 ALTER TABLE `Attendance_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendance_userprofile`
--

DROP TABLE IF EXISTS `Attendance_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Attendance_userprofile_user_id_3a4c154d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance_userprofile`
--

LOCK TABLES `Attendance_userprofile` WRITE;
/*!40000 ALTER TABLE `Attendance_userprofile` DISABLE KEYS */;
INSERT INTO `Attendance_userprofile` VALUES (1,'student',1),(2,'student',2),(3,'student',3),(4,'student',4),(5,'student',5),(6,'student',6),(7,'student',7),(8,'student',8),(9,'student',9);
/*!40000 ALTER TABLE `Attendance_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Faculty'),(2,'Student');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add student',7,'add_student'),(26,'Can change student',7,'change_student'),(27,'Can delete student',7,'delete_student'),(28,'Can view student',7,'view_student'),(29,'Can add faculty',8,'add_faculty'),(30,'Can change faculty',8,'change_faculty'),(31,'Can delete faculty',8,'delete_faculty'),(32,'Can view faculty',8,'view_faculty'),(33,'Can add subject',9,'add_subject'),(34,'Can change subject',9,'change_subject'),(35,'Can delete subject',9,'delete_subject'),(36,'Can view subject',9,'view_subject'),(37,'Can add attendance record',10,'add_attendancerecord'),(38,'Can change attendance record',10,'change_attendancerecord'),(39,'Can delete attendance record',10,'delete_attendancerecord'),(40,'Can view attendance record',10,'view_attendancerecord'),(41,'Can add user profile',11,'add_userprofile'),(42,'Can change user profile',11,'change_userprofile'),(43,'Can delete user profile',11,'delete_userprofile'),(44,'Can view user profile',11,'view_userprofile'),(45,'Can add attendance',12,'add_attendance'),(46,'Can change attendance',12,'change_attendance'),(47,'Can delete attendance',12,'delete_attendance'),(48,'Can view attendance',12,'view_attendance');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$djOBikTLdb6n8iP2YdtkUw$4BzWf6gduFIMFuXFNUPYxIyHcEROAA9lpvW8S3wJsPY=','2025-05-05 21:37:24.246234',1,'shashikantsharma','Shashikant','Admin','shashikantkumarsharma71@gmail.com',1,1,'2025-05-05 16:20:18.000000'),(2,'pbkdf2_sha256$1000000$K4Dcmrq4wKUsse0ejEHyOg$sP/piXrwluE37WS4YU0n9d9l/D834j4z2cZlIBcNtcw=','2025-05-05 16:31:00.349073',0,'Shashikant_sharma','','','',0,1,'2025-05-05 16:26:07.688401'),(3,'pbkdf2_sha256$1000000$6byeDopNgcrdtuclDuaoLH$u1SzUfLFdIvNCro6g0apzPpzT/2pGNgPR+21ifRee/U=','2025-05-05 21:32:12.445315',0,'ragini','Ragini','Kumari','ragini@gmail.com',0,1,'2025-05-05 16:32:02.758691'),(4,'pbkdf2_sha256$1000000$hdWpGoc4SUcTwKJ328fb3P$4PfwTNda6VEiePFyEDlW/izDGDCSUo1FlIuSdQcbrkA=',NULL,0,'Shashi','Shashi','Kant','shashi@gmail.com',0,1,'2025-05-05 16:33:29.356634'),(5,'pbkdf2_sha256$1000000$A6AMZg77oNmWYoRgpFp9xc$5BaAMQN13R3C41U+RF/wffTv9KPIIkf060QkKLVhCI0=',NULL,0,'shashikant','Shashi','Kant','shashi@gmail.com',0,1,'2025-05-05 16:35:03.597707'),(6,'pbkdf2_sha256$1000000$ZQ3h61eyEtSKHInswuK1vA$scG4CRufnKt5pEvj6OVsHB/kKTTuNMTiSXBxR+mel54=','2025-05-05 17:37:14.928867',0,'s','Shashi','Kant','shashi@gmail.com',0,1,'2025-05-05 17:01:11.910180'),(7,'pbkdf2_sha256$1000000$VKTS3gGGq0oD992RHKPKKM$z7f1XX/h3mLN1LsgyFwQC2DSoqZwQr4hbSgkCfTIoEU=',NULL,0,'Khushi','khushi','kumari','khushi@gmail.com',0,1,'2025-05-05 17:20:07.693580'),(8,'pbkdf2_sha256$1000000$ZV2mqUCw7ErXKMek82fiaz$r+WjTIhQQsKisZaOMZMruXQP7sgkvsy5Nv4wVk4od1o=','2025-05-05 18:52:10.851035',0,'Khushik','khushi','kumari','khushi@gmail.com',0,1,'2025-05-05 17:28:36.343265'),(9,'pbkdf2_sha256$1000000$V0p0IxV4fvNj7zxHCocFju$dL6KNmwTDLlRkEzHyhhQMpa/X6uQBp2qfIZaT+c5xjk=','2025-05-05 19:22:18.237855',0,'Santosh','santosh','sharma','sharma@gmail.com',0,1,'2025-05-05 19:22:03.854992');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1),(2,4,2),(3,5,2),(4,6,2),(5,7,2),(6,8,2),(7,9,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-05 16:21:31.636371','1','shashikantsharma',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(2,'2025-05-05 16:24:54.572094','1','Poonam Nandal',1,'[{\"added\": {}}]',8,1),(3,'2025-05-05 16:26:08.056120','2','Shashikant_sharma',1,'[{\"added\": {}}]',4,1),(4,'2025-05-05 16:27:07.000420','1','Shashikant Sharma',1,'[{\"added\": {}}]',7,1),(5,'2025-05-05 16:29:00.543990','1','DISCREATE MATHEMATICS',1,'[{\"added\": {}}]',9,1),(6,'2025-05-05 17:41:55.648499','1','shashikantsharma',2,'[]',4,1),(7,'2025-05-05 21:52:06.178324','3','santosh sharma',3,'',7,1),(8,'2025-05-05 21:52:11.806448','2','khushi kumari',3,'',7,1),(9,'2025-05-05 21:52:11.806492','1','Shashikant Sharma',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(12,'Attendance','attendance'),(10,'Attendance','attendancerecord'),(8,'Attendance','faculty'),(7,'Attendance','student'),(9,'Attendance','subject'),(11,'Attendance','userprofile'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-05 15:40:42.372117'),(2,'auth','0001_initial','2025-05-05 15:40:42.459947'),(3,'admin','0001_initial','2025-05-05 15:40:42.486680'),(4,'admin','0002_logentry_remove_auto_add','2025-05-05 15:40:42.490198'),(5,'admin','0003_logentry_add_action_flag_choices','2025-05-05 15:40:42.493536'),(6,'contenttypes','0002_remove_content_type_name','2025-05-05 15:40:42.518115'),(7,'auth','0002_alter_permission_name_max_length','2025-05-05 15:40:42.530710'),(8,'auth','0003_alter_user_email_max_length','2025-05-05 15:40:42.539932'),(9,'auth','0004_alter_user_username_opts','2025-05-05 15:40:42.543347'),(10,'auth','0005_alter_user_last_login_null','2025-05-05 15:40:42.556053'),(11,'auth','0006_require_contenttypes_0002','2025-05-05 15:40:42.556477'),(12,'auth','0007_alter_validators_add_error_messages','2025-05-05 15:40:42.560164'),(13,'auth','0008_alter_user_username_max_length','2025-05-05 15:40:42.574548'),(14,'auth','0009_alter_user_last_name_max_length','2025-05-05 15:40:42.589973'),(15,'auth','0010_alter_group_name_max_length','2025-05-05 15:40:42.597733'),(16,'auth','0011_update_proxy_permissions','2025-05-05 15:40:42.602940'),(17,'auth','0012_alter_user_first_name_max_length','2025-05-05 15:40:42.621840'),(18,'sessions','0001_initial','2025-05-05 15:40:42.627961'),(19,'Attendance','0001_initial','2025-05-05 15:48:43.963360'),(20,'Attendance','0002_alter_attendance_unique_together_attendance_date_and_more','2025-05-05 19:57:33.937259'),(21,'Attendance','0003_auto_20250505_1957','2025-05-05 19:57:33.939038'),(22,'Attendance','0004_alter_userprofile_role','2025-05-05 20:01:43.673491'),(23,'Attendance','0005_alter_attendancerecord_date_and_more','2025-05-05 20:28:55.767419'),(24,'Attendance','0002_alter_attendancerecord_present','2025-05-05 21:48:02.808744');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('70whx2zjk2vtzjdd7ip9fbas7tni3xpw','.eJxVjDsOwjAQBe_iGlnetUMMJX3OEO0PHECJFCcV4u4QKQW0b2bey_W0LqVfq839oO7swB1-NyZ52LgBvdN4m7xM4zIP7DfF77T6blJ7Xnb376BQLd86tlGZkK4SANQCNiGkwJnCCdgE2gyWkCXiUbNJIsWYGkFDSwws7v0B4944Jg:1uC3V6:1542QioK8JhR29KaiJVMKRwmqZaX20hzAvYFg5JSkJs','2025-05-19 21:37:24.249256'),('nkpj8oe0eavw7hd4a7wdd7m77wc61q0j','.eJxVjDkOwjAUBe_iGllevpdPSc8ZLK84gGwpTirE3cFSCnjlm9G8iPP7Vt0-8uqWRM7EktPvF3x85DZBuvt26zT2tq1LoFOhBx302lN-Xg73L1D9qDPLv0P0XBkFRQipsxJBYEmBm6RAckyMoTHMRjDWh4JSgxbcAEoQSN4fo6U12g:1uC0vC:tczHTmEdpZKelSrV6hqcJwA8hZEk5iYbOfiWyW2qZ0Q','2025-05-19 18:52:10.855482');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-06  3:25:17
