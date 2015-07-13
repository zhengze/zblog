-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zblog
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=MyISAM;
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
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add classify',7,'add_classify'),(20,'Can change classify',7,'change_classify'),(21,'Can delete classify',7,'delete_classify'),(22,'Can add tag',8,'add_tag'),(23,'Can change tag',8,'change_tag'),(24,'Can delete tag',8,'delete_tag'),(25,'Can add article',9,'add_article'),(26,'Can change article',9,'change_article'),(27,'Can delete article',9,'delete_article'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(34,'Can add photo',12,'add_photo'),(35,'Can change photo',12,'change_photo'),(36,'Can delete photo',12,'delete_photo'),(37,'Can add album',13,'add_album'),(38,'Can change album',13,'change_album'),(39,'Can delete album',13,'delete_album'),(40,'Can add music',14,'add_music'),(41,'Can change music',14,'change_music'),(42,'Can delete music',14,'delete_music');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$15000$S4TkDYmjUcyA$5QIkazF7WCJBKq3t23kHl+WI+w0sQpiERHbL7hNQ7c0=','2015-07-10 19:25:08',1,'admin','','','',1,1,'2015-06-16 04:23:24'),(2,'pbkdf2_sha256$15000$1TSfdwfmtSZZ$fXhO4y34r0SKjlnt/i4OYM1PoRGe/k/KKuM/vllICFA=','2015-06-16 05:27:33',0,'zhanghai','','','',1,1,'2015-06-16 05:27:05');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=MyISAM;
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
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-06-16 04:23:43','1','日记',1,'',7,1),(2,'2015-06-16 04:23:55','2','python',1,'',7,1),(3,'2015-06-16 04:24:20','1','python',1,'',8,1),(4,'2015-06-16 04:24:26','2','django',1,'',8,1),(5,'2015-06-16 04:25:54','1','第一篇博文',1,'',9,1),(6,'2015-06-16 05:27:05','2','zhanghai',1,'',3,1),(7,'2015-06-16 05:27:22','2','zhanghai',2,'Changed is_staff.',3,1),(8,'2015-06-16 05:57:28','2','第一篇博文',1,'',9,1),(9,'2015-06-16 05:59:01','2','django and tornado比较',2,'Changed title and content.',9,1),(10,'2015-06-16 05:59:01','2','django and tornado比较',2,'Changed title and content.',9,1),(11,'2015-06-16 07:23:46','2','django and tornado比较',2,'Changed content.',9,1),(12,'2015-06-17 06:05:38','3','日记1',1,'',9,1),(13,'2015-06-17 06:06:16','3','日记1',2,'Changed content.',9,1),(14,'2015-07-10 06:32:55','3','瞌睡',1,'',8,1),(15,'2015-07-10 06:33:00','4','日记2',1,'',9,1),(17,'2015-07-10 11:46:24','1','动漫',1,'',12,1),(19,'2015-07-10 12:48:44','2','静物',1,'',12,1),(22,'2015-07-10 14:29:04','1','小女孩',2,'Changed description.',12,1),(23,'2015-07-10 17:25:16','5','时间测试',1,'',9,1),(24,'2015-07-10 17:29:18','3','人物',1,'',13,1),(25,'2015-07-10 17:29:20','3','美女',1,'',12,1),(26,'2015-07-10 22:52:46','5','时间测试',2,'Changed content.',9,1),(27,'2015-07-10 22:53:13','5','时间测试',2,'Changed content.',9,1),(28,'2015-07-10 22:54:00','2','django and tornado比较',2,'Changed content.',9,1),(29,'2015-07-10 22:54:34','2','django and tornado比较',2,'Changed content.',9,1),(30,'2015-07-11 00:43:15','1','陈奕迅-淘汰',1,'',14,1),(31,'2015-07-11 02:08:55','1','陈奕迅-淘汰',3,'',14,1),(32,'2015-07-11 02:10:03','2','当你老了-张海',1,'',14,1),(33,'2015-07-11 02:20:37','3','那些花儿-张海',1,'',14,1),(34,'2015-07-11 03:23:20','4','植物园',1,'',13,1),(35,'2015-07-11 03:23:22','4','红花',1,'',12,1),(36,'2015-07-11 03:24:44','5','蓝花',1,'',12,1),(37,'2015-07-11 03:25:15','6','樱花',1,'',12,1),(38,'2015-07-11 04:00:04','7','白雪公主',1,'',12,1),(39,'2015-07-11 04:00:22','8','安静的美男子',1,'',12,1),(40,'2015-07-11 04:00:56','9','一起撑伞',1,'',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'classify','zblog','classify'),(8,'tag','zblog','tag'),(9,'article','zblog','article'),(10,'log entry','admin','logentry'),(12,'photo','zblog','photo'),(13,'album','zblog','album'),(14,'music','zblog','music');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'zblog','0001_initial','2015-06-16 04:22:53'),(2,'contenttypes','0001_initial','2015-06-16 04:22:57'),(3,'auth','0001_initial','2015-06-16 04:22:57'),(4,'admin','0001_initial','2015-06-16 04:22:57'),(5,'sessions','0001_initial','2015-06-16 04:22:57'),(6,'sites','0001_initial','2015-06-16 04:22:57'),(7,'zblog','0002_auto_20150616_1522','2015-06-16 07:22:43'),(8,'zblog','0002_auto_20150710_0934','2015-07-10 01:34:50'),(9,'zblog','0003_photoclassify_cover','2015-07-10 13:35:53'),(10,'zblog','0004_auto_20150710_2150','2015-07-10 13:50:21'),(11,'zblog','0005_auto_20150711_0124','2015-07-10 17:24:22'),(12,'zblog','0006_photo_created_time','2015-07-10 17:26:51'),(13,'zblog','0007_auto_20150711_0245','2015-07-10 18:45:45'),(14,'zblog','0008_auto_20150711_0335','2015-07-10 19:35:29');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4cyxpmcy5ptp8kbjxegvi619xhgp3m8f','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-24 19:25:08'),('659j3pephmkudmo4vcuh1lx1y0tt06qq','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-24 01:30:01'),('855rshm2zgi1nnk5ld495616lrf21t1p','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-24 19:22:57'),('cy03cl7323nyippa513uvf54dfthwh9o','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-06-30 05:32:05'),('dhh0l7tn1l0dy8xqexvc6sth23gw8rxj','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-06-30 07:23:07'),('ivrljynkj4j91jmm8d1bkbu0jjruecfr','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-01 06:04:44'),('yp6qf71qzm325rvtfkyej0b3e12eiwi9','NzdlM2VlODY5YzcyYjgwZDhjOWQ0NmIwNzlhYjBlYjJhODA3N2RkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0ZDk1MzhlOTZjM2Q3NzcyMDFjMDIyNjIyMGU1ZDAxZjk1NjdiOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-24 19:01:32');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zblog_album`
--

DROP TABLE IF EXISTS `zblog_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `zblog_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cover` varchar(100),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zblog_album`
--

LOCK TABLES `zblog_album` WRITE;
/*!40000 ALTER TABLE `zblog_album` DISABLE KEYS */;
INSERT INTO `zblog_album` VALUES (1,'动漫','images/covers/2015/07/10/1.jpg'),(2,'静物','images/covers/2015/07/10/9d82d158ccbf6c81b41c6de9be3eb13533fa4083.jpg'),(3,'人物','images/covers/2015/07/11/fd039245d688d43f60a74022791ed21b0ff43bd0.jpg'),(4,'植物园','images/covers/2015/07/11/psb_5.jpg');
/*!40000 ALTER TABLE `zblog_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zblog_article`
--

DROP TABLE IF EXISTS `zblog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `zblog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime NOT NULL,
  `classify_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zblog_article_563b15ab` (`classify_id`),
  KEY `zblog_article_76f094bc` (`tag_id`),
  CONSTRAINT `zblog_article_classify_id_26d26536c3d504f8_fk_zblog_classify_id` FOREIGN KEY (`classify_id`) REFERENCES `zblog_classify` (`id`),
  CONSTRAINT `zblog_article_tag_id_6b8b66a5d07fcbe3_fk_zblog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `zblog_tag` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zblog_article`
--

LOCK TABLES `zblog_article` WRITE;
/*!40000 ALTER TABLE `zblog_article` DISABLE KEYS */;
INSERT INTO `zblog_article` VALUES (2,'django and tornado比较','在各种语言平台中，python涌现的web框架恐怕是最多的；猜想原因应该是在py中构造框架十分简单，使得轮子不断被发明。\r\n\r\n这里记述一下我了解过的两个py web框架，供大家参考，希望能起他山之石的作用。\r\n\r\n====== Django ======\r\nDjango 应该是最出名的py框架，Google App Engine甚至Erlang都有框架受它影响。\r\n\r\nDjango是走大而全的方向，它最出名的是其全自动化的管理后台：只需要使用起ORM，做简单的对象定义，它就能自动生成数据库结构、以及全功能的管理后台。\r\n\r\nDjango提供的方便，也意味着Django内置的ORM跟框架内的其他模块耦合程度高。\r\n\r\n应用程序必须使用Django内置的ORM，否则就不能享受到框架内提供的种种基于其ORM的便利；理论上可以切换掉其ORM模块，但这就相当于要把装修完毕的房子拆除重新装修，倒不如一开始就去毛胚房做全新的装修。\r\n\r\nDjango的卖点是超高的开发效率，其性能扩展有限；采用Django的项目，在流量达到一定规模后，都需要对其进行重构，才能满足性能的要求。\r\n\r\n\r\nRuby的Rails也有类似的问题；以Twitter为例，推特到了今日的规模，不要说Rails，甚至是连Ruby都需要抛弃重来。\r\n\r\n就我的感觉Django适用的是中小型的网站，或者是作为大型网站快速实现产品雏形的工具。\r\n\r\n===== Django 模板 =====\r\nDjango的模板系统设计十分有意思，也应该其框架内影响最大、争议最大的部分。\r\n\r\nDjango模板的设计哲学是彻底的将代码、样式分离；asp.net提倡将代码/模板分离，但技术上还是可以混合；而Django则是从根本上杜绝在模板中进行编码、处理数据的可能。\r\n\r\n比方说，asp.net模板中可以写：\r\n<%\r\n  int i;\r\n  for(i==0;i<10;i++){\r\n  ....\r\n  }\r\n%>\r\n\r\nDjango是彻底不支持嵌入类似上面的代码，仅能使用其模板内置的函数；这实际上，是为其模板构造了一种“新语言”；由于此“新语言”十分简单，所以也能够将其模板移植到不同平台。\r\n\r\n大多数情况下，Django的模板功能是足够的，但对于特殊（有时“特殊”也不是十分特殊）的情况，还是需要在模板中嵌入代码，那么就需要根据其模板系统的规则做模板扩展。有时候，模板中直接写一行代码能够解决的问题，用模板扩展实现后，会变成十几行代码。\r\n\r\n是否容忍在模板中编程，正是Django模板争议最大之处。\r\n\r\n====== Tornado ======\r\nTornado( http://www.tornadoweb.org )是Facebook开源出来的框架，其哲学跟Django近乎两个极端。\r\n\r\nTornado走的是少而精的方向，它也有提供模板功能；虽然不鼓励，但作者是可以允许在模板进行少量编码（直接嵌入单行py代码）的。\r\n\r\n如果跟asp.net相比，Tornado有点类似仅实现了AsyncHttpHandler；除此之外，全部需要自己去实现。\r\n\r\n好吧，其实它有模板，有国际化支持，甚至还有内置的OAuth/OpenID模块，方便做第三方登录，它其实也直接实现了Http服务器。\r\n\r\n但它没有ORM（仅有一个mysql的超简单封装），甚至没有Session支持，更不要说Django那样自动化的后台。\r\n\r\n假设是一个大型网站，在高性能的要求下，框架的各个部分往往都需要定制，可以复用的模块非常少；一个以Django开发的网站，各部分经过不断的定制，Django框架剩下的，很有可能也就是tornado一开始所能提供的这部分。\r\n\r\n殊途同归。\r\n\r\n===== HTTP服务器 =====\r\nTornado为了高效实现Comet/后端异步调用HTTP接口，是直接内嵌了HTTP服务器。\r\n\r\n前端无需加apache / lighttpd / nginx等也可以供浏览器访问；但它并没有完整实现HTTP 1.1的协议，所以官方文档是推荐用户在生产环境下在前端使用nginx，后端反向代理到多个Tornado实例。\r\n\r\nTornado本身是单线程的异步网络程序，它默认启动时，会根据CPU数量运行多个实例；充分利用CPU多核的优势。\r\n\r\n===== 单线程异步 =====\r\n网站基本都会有数据库操作，而Tornado是单线程的，这意味着如果数据库查询返回过慢，整个服务器响应会被堵塞。\r\n\r\n数据库查询，实质上也是远程的网络调用；理想情况下，是将这些操作也封装成为异步的；但Tornado对此并**没有**提供任何支持。\r\n\r\n这是Tornado的**设计**，而不是缺陷。\r\n\r\n一个系统，要满足高流量；是必须解决数据库查询速度问题的！\r\n\r\n数据库若存在查询性能问题，整个系统无论如何优化，数据库都会是瓶颈，拖慢整个系统！\r\n\r\n异步并**不能**从本质上提到系统的性能；它仅仅是避免多余的网络响应等待，以及切换线程的CPU耗费。\r\n\r\n如果数据库查询响应太慢，需要解决的是数据库的性能问题；而不是调用数据库的前端Web应用。\r\n\r\n对于实时返回的数据查询，理想情况下需要确保所有数据都在内存中，数据库硬盘IO应该为0；这样的查询才能足够快；而如果数据库查询足够快，那么前端web应用也就无将数据查询封装为异步的必要。\r\n\r\n就算是使用协程，异步程序对于同步程序始终还是会提高复杂性；需要衡量的是处理这些额外复杂性是否值得。\r\n\r\n如果后端有查询实在是太慢，无法绕过，Tornaod的建议是将这些查询在后端封装独立封装成为HTTP接口，然后使用Tornado内置的异步HTTP客户端进行调用。','2015-07-10 22:54:34',2,2,22),(3,'日记1','标签： date truncatechars','2015-06-17 06:05:15',1,2,16),(4,'日记2','有点瞌睡','2015-07-10 06:32:43',1,3,6),(5,'时间测试','时间测试\r\n','2015-07-10 22:53:13',2,2,2);
/*!40000 ALTER TABLE `zblog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zblog_classify`
--

DROP TABLE IF EXISTS `zblog_classify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `zblog_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zblog_classify`
--

LOCK TABLES `zblog_classify` WRITE;
/*!40000 ALTER TABLE `zblog_classify` DISABLE KEYS */;
INSERT INTO `zblog_classify` VALUES (1,'日记'),(2,'python');
/*!40000 ALTER TABLE `zblog_classify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zblog_music`
--

DROP TABLE IF EXISTS `zblog_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `zblog_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `mp3` varchar(100) NOT NULL,
  `created_time` datetime,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zblog_music`
--

LOCK TABLES `zblog_music` WRITE;
/*!40000 ALTER TABLE `zblog_music` DISABLE KEYS */;
INSERT INTO `zblog_music` VALUES (2,'当你老了-张海','music/2015/07/11/当你老了-张海.mp3','2015-07-11 02:10:03'),(3,'那些花儿-张海','music/2015/07/11/那些花儿-张海.mp3','2015-07-11 02:20:37');
/*!40000 ALTER TABLE `zblog_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zblog_photo`
--

DROP TABLE IF EXISTS `zblog_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `zblog_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `created_time` datetime,
  PRIMARY KEY (`id`),
  KEY `zblog_photo_fd5db417` (`album_id`),
  CONSTRAINT `zblog_photo_album_id_785c726540a76656_fk_zblog_album_id` FOREIGN KEY (`album_id`) REFERENCES `zblog_album` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zblog_photo`
--

LOCK TABLES `zblog_photo` WRITE;
/*!40000 ALTER TABLE `zblog_photo` DISABLE KEYS */;
INSERT INTO `zblog_photo` VALUES (1,'images/2015/07/10/1.jpg','小女孩',1,NULL),(2,'images/2015/07/10/9d82d158ccbf6c81b41c6de9be3eb13533fa4083.jpg','静物',2,NULL),(3,'images/2015/07/11/fd039245d688d43f60a74022791ed21b0ff43bd0.jpg','美女',3,'2015-07-10 17:29:20'),(4,'images/2015/07/11/psb_1.jpg','红花',4,'2015-07-11 03:23:22'),(5,'images/2015/07/11/psb_2.jpg','蓝花',4,'2015-07-11 03:24:44'),(6,'images/2015/07/11/psb_3.jpg','樱花',4,'2015-07-11 03:25:15'),(7,'images/2015/07/11/4610b912c8fcc3ced994523a9045d688d43f2066.jpg','白雪公主',1,'2015-07-11 04:00:04'),(8,'images/2015/07/11/78310a55b319ebc4548a54988026cffc1f1716c4.jpg','安静的美男子',1,'2015-07-11 04:00:22'),(9,'images/2015/07/11/f636afc379310a556db4f1fdb54543a982261022.jpg','一起撑伞',1,'2015-07-11 04:00:56');
/*!40000 ALTER TABLE `zblog_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zblog_tag`
--

DROP TABLE IF EXISTS `zblog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = latin1 */;
CREATE TABLE `zblog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zblog_tag`
--

LOCK TABLES `zblog_tag` WRITE;
/*!40000 ALTER TABLE `zblog_tag` DISABLE KEYS */;
INSERT INTO `zblog_tag` VALUES (1,'python'),(2,'django'),(3,'瞌睡');
/*!40000 ALTER TABLE `zblog_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-11 17:36:06
