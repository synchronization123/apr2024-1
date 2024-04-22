/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.24-MariaDB : Database - myappsec
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myappsec` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `myappsec`;

/*Table structure for table `analysis` */

DROP TABLE IF EXISTS `analysis`;

CREATE TABLE `analysis` (
  `analysis_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `jira_id` varchar(255) DEFAULT NULL,
  `category` enum('Security jira','Functional jira') DEFAULT NULL,
  `jira_type` enum('epic','story','Bug','TI') DEFAULT NULL,
  `SonarQube` enum('Pass','Fail') DEFAULT NULL,
  `Contrast` enum('Pass','Fail') DEFAULT NULL,
  `Dep_Check` enum('Pass','Fail') DEFAULT NULL,
  `Manual_Secure_Code_Review` enum('Pass','Fail') DEFAULT NULL,
  `Manual_Security_Testing` enum('Pass','Fail') DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `delete_flag` enum('0','1') DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`analysis_id`),
  KEY `assignment_id` (`assignment_id`),
  CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `patches` (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `analysis` */

insert  into `analysis`(`analysis_id`,`assignment_id`,`jira_id`,`category`,`jira_type`,`SonarQube`,`Contrast`,`Dep_Check`,`Manual_Secure_Code_Review`,`Manual_Security_Testing`,`Remark`,`delete_flag`,`created_by`,`timestamp`) values 
(1,10,'ytyy','Functional jira','story','Fail','Pass','Fail','Fail','Pass','testing',NULL,'1','2024-04-21 03:37:51'),
(2,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','',NULL,'1','2024-04-21 03:38:30'),
(3,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','',NULL,'1','2024-04-21 03:38:30'),
(4,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','',NULL,'1','2024-04-21 03:40:45'),
(5,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','',NULL,'1','2024-04-21 03:40:49'),
(6,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass',';','0','1','2024-04-21 17:26:57'),
(7,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','','0','1','2024-04-21 17:26:59'),
(8,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','lkl','0','1','2024-04-21 17:27:01'),
(9,10,'','Security jira','epic','Pass','Pass','Pass','Pass','Pass','','0','1','2024-04-21 17:27:06'),
(10,10,'56','Security jira','epic','Pass','Pass','Pass','Pass','Pass','','1','1','2024-04-21 17:23:59'),
(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2024-04-21 17:23:35');

/*Table structure for table `assignments` */

DROP TABLE IF EXISTS `assignments`;

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `rm_pm` varchar(255) DEFAULT NULL,
  `assigned_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `delete_flag` tinyint(1) DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `assignments` */

insert  into `assignments`(`assignment_id`,`title`,`description`,`assigned_to`,`product_name`,`rm_pm`,`assigned_date`,`delete_flag`,`created_by`,`timestamp`) values 
(4,'Fourth Assignment','Fourth Assignment desc','1','DMR','dino','2024-04-20 00:00:00',1,'admin','2024-04-20 05:18:53'),
(5,'Fifth Assignment5','Fifth Assignment desciption5','1','DMR','jack2','2024-04-20 00:00:00',1,'admin','2024-04-20 05:22:16'),
(6,'Sixth Assignment6','Sixth Assignment 6','1','DMR','jack2','2024-04-20 00:00:00',1,'admin','2024-04-20 05:27:02'),
(7,'Seventh Assignment7','Seventh Assignment description7','1','DMR','dan7','2024-04-20 00:00:00',0,'admin','2024-04-20 05:30:39'),
(8,'Eighth Assignment22','Eighth Assignment desc22','1','CMR','','2024-04-20 00:00:00',1,'admin','2024-04-20 06:16:08'),
(9,'10th assignment','10th assignment','1','DMR','jack','2024-04-20 00:00:00',0,'admin','2024-04-20 21:17:06'),
(10,'9th assignment','9th assignment','1','DMR','Ron','2024-04-20 00:00:00',0,'admin','2024-04-20 21:19:17'),
(11,'yut','jhjj','1','DMR','yut','2024-04-21 00:00:00',0,'admin','2024-04-21 10:52:08'),
(12,'ytt','hgfhh','1','CMR','ghgfh','2024-04-21 00:00:00',1,'admin','2024-04-21 10:55:39'),
(13,'fgf','fg','1','CMR','fg','2024-04-21 00:00:00',1,'admin','2024-04-21 10:57:27'),
(14,'eleven','eleven11','2','CMR','dan789','2024-04-21 00:00:00',0,'admin','2024-04-21 12:13:49');

/*Table structure for table `certification` */

DROP TABLE IF EXISTS `certification`;

CREATE TABLE `certification` (
  `certification_id` int(11) NOT NULL AUTO_INCREMENT,
  `certification_status` varchar(50) DEFAULT 'Approved',
  `delete_flag` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`certification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `certification` */

insert  into `certification`(`certification_id`,`certification_status`,`delete_flag`) values 
(1,'Approved',0),
(2,'Approved with Exception',0),
(3,'Rejected',0),
(4,'OnHold',0);

/*Table structure for table `file_access` */

DROP TABLE IF EXISTS `file_access`;

CREATE TABLE `file_access` (
  `file_access_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `in_menu` tinyint(1) DEFAULT NULL,
  `delete_flag` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

/*Data for the table `file_access` */

insert  into `file_access`(`file_access_id`,`file_name`,`role_id`,`display_name`,`in_menu`,`delete_flag`,`timestamp`,`created_by`) values 
(17,'addanalysis.php',1,NULL,NULL,0,'2024-04-22 10:27:30',NULL),
(18,'addanalysis.php',2,NULL,NULL,0,'2024-04-22 10:27:33',NULL),
(19,'addanalysis.php',3,NULL,NULL,0,'2024-04-22 10:27:35',NULL),
(20,'addanalysis.php',4,NULL,NULL,0,'2024-04-22 10:27:36',NULL),
(21,'addanalysis.php',5,NULL,NULL,0,'2024-04-22 10:27:40',NULL),
(22,'addanalysis.php',6,NULL,NULL,0,'2024-04-22 10:27:47',NULL),
(23,'addanalysis.php',7,NULL,NULL,0,'2024-04-22 10:28:08',NULL),
(24,'addpatchdetails.php',1,NULL,NULL,0,'2024-04-22 10:28:21',NULL),
(25,'addpatchdetails.php',2,NULL,NULL,0,'2024-04-22 10:28:26',NULL),
(26,'addpatchdetails.php',3,NULL,NULL,0,'2024-04-22 10:28:27',NULL),
(27,'addpatchdetails.php',4,NULL,NULL,0,'2024-04-22 10:28:29',NULL),
(28,'addpatchdetails.php',5,NULL,NULL,0,'2024-04-22 10:28:30',NULL),
(29,'addpatchdetails.php',6,NULL,NULL,0,'2024-04-22 10:28:40',NULL),
(30,'addpatchdetails.php',7,NULL,NULL,0,'2024-04-22 10:28:43',NULL),
(31,'assignments.php',1,NULL,NULL,0,'2024-04-22 10:29:34',NULL),
(32,'assignments.php',2,NULL,NULL,0,'2024-04-22 10:29:36',NULL),
(33,'assignments.php',3,NULL,NULL,0,'2024-04-22 10:29:38',NULL),
(34,'assignments.php',4,NULL,NULL,0,'2024-04-22 10:29:39',NULL),
(35,'assignments.php',5,NULL,NULL,0,'2024-04-22 10:29:41',NULL),
(36,'assignments.php',6,NULL,NULL,0,'2024-04-22 10:29:43',NULL),
(37,'assignments.php',7,NULL,NULL,0,'2024-04-22 10:29:44',NULL),
(38,'dashboard.php',1,'Dashboard',0,0,'2024-04-22 10:29:46',NULL),
(39,'dashboard.php',2,'Dashboard',0,0,'2024-04-22 10:29:48',NULL),
(40,'dashboard.php',3,'Dashboard',0,0,'2024-04-22 10:29:50',NULL),
(41,'dashboard.php',4,'Dashboard',0,0,'2024-04-22 10:29:52',NULL),
(42,'dashboard.php',5,'Dashboard',0,0,'2024-04-22 10:29:53',NULL),
(43,'dashboard.php',6,'Dashboard',0,0,'2024-04-22 10:29:55',NULL),
(44,'dashboard.php',7,'Dashboard',0,0,'2024-04-22 10:30:55',NULL),
(45,'leadapproval.php',3,NULL,NULL,0,'2024-04-22 10:31:37',NULL),
(46,'leftmenu.php',1,NULL,NULL,0,'2024-04-22 10:31:52',NULL),
(47,'leftmenu.php',2,NULL,NULL,0,'2024-04-22 10:31:55',NULL),
(48,'leftmenu.php',3,NULL,NULL,0,'2024-04-22 10:31:58',NULL),
(49,'leftmenu.php',4,NULL,NULL,0,'2024-04-22 10:31:59',NULL),
(50,'leftmenu.php',5,NULL,NULL,0,'2024-04-22 10:32:02',NULL),
(51,'leftmenu.php',6,NULL,NULL,0,'2024-04-22 10:32:04',NULL),
(52,'leftmenu.php',7,NULL,NULL,0,'2024-04-22 10:32:15',NULL),
(53,'logout.php',1,NULL,NULL,0,'2024-04-22 10:32:27',NULL),
(54,'logout.php',2,NULL,NULL,0,'2024-04-22 10:32:28',NULL),
(55,'logout.php',3,NULL,NULL,0,'2024-04-22 10:32:30',NULL),
(56,'logout.php',4,NULL,NULL,0,'2024-04-22 10:32:32',NULL),
(57,'logout.php',5,NULL,NULL,0,'2024-04-22 10:32:34',NULL),
(58,'logout.php',6,NULL,NULL,0,'2024-04-22 10:32:35',NULL),
(59,'logout.php',7,NULL,NULL,0,'2024-04-22 10:32:37',NULL),
(60,'mentorreview.php',4,NULL,NULL,0,'2024-04-22 10:32:38',NULL),
(61,'printpreview.php',5,NULL,NULL,0,'2024-04-22 10:33:26',NULL),
(62,'profile.php',1,NULL,NULL,0,'2024-04-22 10:33:36',NULL),
(63,'profile.php',2,NULL,NULL,0,'2024-04-22 10:33:37',NULL),
(64,'profile.php',3,NULL,NULL,0,'2024-04-22 10:33:39',NULL),
(65,'profile.php',4,NULL,NULL,0,'2024-04-22 10:33:43',NULL),
(66,'profile.php',5,NULL,NULL,0,'2024-04-22 10:33:46',NULL),
(67,'profile.php',6,NULL,NULL,0,'2024-04-22 10:33:48',NULL),
(68,'profile.php',7,NULL,NULL,0,'2024-04-22 10:33:58',NULL),
(69,'view_assignments.php',3,'View All Patches',0,0,'2024-04-22 10:34:11',NULL),
(70,'view_assignments.php',4,'View All Patches',0,0,'2024-04-22 10:34:13',NULL),
(71,'view_assignments_analyst.php',5,'View Patches',0,0,'2024-04-22 10:34:34',NULL),
(72,'view_assignments_lead.php',3,'Patches for Approval',0,0,'2024-04-22 10:34:54',NULL),
(73,'view_assignments_mentor.php',4,'Patches for Review',0,0,'2024-04-22 10:34:57',NULL),
(74,'view_assignments.php',7,'View All Patches',0,0,'2024-04-22 10:35:00',NULL);

/*Table structure for table `patches` */

DROP TABLE IF EXISTS `patches`;

CREATE TABLE `patches` (
  `patches_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `security_validation_status` varchar(255) DEFAULT NULL,
  `third_party_verified` varchar(255) DEFAULT NULL,
  `contrast_verified` varchar(255) DEFAULT NULL,
  `sonar_verified` varchar(255) DEFAULT NULL,
  `secure_code_review` varchar(255) DEFAULT NULL,
  `conclusion` varchar(255) DEFAULT NULL,
  `qa_env_url` varchar(255) DEFAULT NULL,
  `contrast_server_name` varchar(255) DEFAULT NULL,
  `qa_servers` varchar(255) DEFAULT NULL,
  `tech_imp_count` varchar(255) DEFAULT NULL,
  `bug_count` varchar(255) DEFAULT NULL,
  `story_count` varchar(255) DEFAULT NULL,
  `epic_count` varchar(255) DEFAULT NULL,
  `summary_url` varchar(255) DEFAULT 'Summary',
  `rm_pm` varchar(255) DEFAULT NULL,
  `assigned_date` date DEFAULT NULL,
  `eta` date DEFAULT NULL,
  `security_jira` int(11) DEFAULT NULL,
  `functional_jira` int(11) DEFAULT NULL,
  `koc_date` date DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `emanager_ir` varchar(255) DEFAULT NULL,
  `delete_flag` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(255) DEFAULT NULL,
  `Column_30` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_31` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_32` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_33` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_34` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_35` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_36` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_37` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_38` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_39` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_40` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_41` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_42` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_43` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_44` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_45` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_46` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_47` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_48` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_49` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_50` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_51` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_52` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_53` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_54` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_55` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_56` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_57` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_58` enum('NA','Done','Not done') DEFAULT 'NA',
  `Column_59` enum('NA','Done','Not done') DEFAULT 'NA',
  `no_of_jiras_tested` int(11) DEFAULT NULL,
  `changelog_reviewers` varchar(255) DEFAULT NULL,
  `total_time_taken` time DEFAULT NULL,
  `mentor_feedback` varchar(500) DEFAULT NULL,
  `lead_feedback` varchar(500) DEFAULT NULL,
  `mentor_username` varchar(255) DEFAULT NULL,
  `lead_username` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Not Started',
  `aging` int(11) GENERATED ALWAYS AS (to_days(curdate()) - to_days(`assigned_date`)) VIRTUAL,
  `total_jira` int(11) GENERATED ALWAYS AS (`security_jira` + `functional_jira`) VIRTUAL,
  `total_no_of_jiras` int(11) GENERATED ALWAYS AS (`security_jira` + `functional_jira`) VIRTUAL,
  `certification_status` varchar(50) DEFAULT '',
  PRIMARY KEY (`patches_id`),
  KEY `assignment_id` (`assignment_id`),
  CONSTRAINT `patches_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `patches` */

insert  into `patches`(`patches_id`,`assignment_id`,`title`,`description`,`assigned_to`,`product_name`,`comments`,`security_validation_status`,`third_party_verified`,`contrast_verified`,`sonar_verified`,`secure_code_review`,`conclusion`,`qa_env_url`,`contrast_server_name`,`qa_servers`,`tech_imp_count`,`bug_count`,`story_count`,`epic_count`,`summary_url`,`rm_pm`,`assigned_date`,`eta`,`security_jira`,`functional_jira`,`koc_date`,`notes`,`comment`,`emanager_ir`,`delete_flag`,`timestamp`,`updated_by`,`Column_30`,`Column_31`,`Column_32`,`Column_33`,`Column_34`,`Column_35`,`Column_36`,`Column_37`,`Column_38`,`Column_39`,`Column_40`,`Column_41`,`Column_42`,`Column_43`,`Column_44`,`Column_45`,`Column_46`,`Column_47`,`Column_48`,`Column_49`,`Column_50`,`Column_51`,`Column_52`,`Column_53`,`Column_54`,`Column_55`,`Column_56`,`Column_57`,`Column_58`,`Column_59`,`no_of_jiras_tested`,`changelog_reviewers`,`total_time_taken`,`mentor_feedback`,`lead_feedback`,`mentor_username`,`lead_username`,`status`,`certification_status`) values 
(1,7,'Seventh Assignment','Seventh Assignment description','1','CMR','','Done','NA','NA','Done','Not Done','','','','','','','','','View Summary',NULL,'2024-04-20','2024-04-22',0,0,'0000-00-00','','','6767767',1,'2024-04-20 09:00:39',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA',0,'','00:00:00','','yyu77','3','4','InProgress','Rejected'),
(2,8,'Eighth Assignment909','Eighth Assignment desc90','1','CMR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'View Summary','dan7','2024-04-20','2024-04-27',26,46,'2024-04-30','78890','778','780909',1,'2024-04-20 09:46:08',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Not Started',''),
(3,9,'10th assignment','10th assignment','1','DMR','','','','','','','','','','','6','7','100','99','Summary',NULL,'2024-04-20','2024-05-02',0,0,'0000-00-00','','','',0,'2024-04-21 00:47:06',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','','','NA','NA','NA','NA','NA','NA','','','NA','NA','NA','NA','NA','NA','NA',0,'','00:00:00','','dui','3','4','Not Started',''),
(4,10,'9th assignment','9th assignment','1','DMR','7','6','5','4','3','2','1','10','9','8','13','12','55555','10','Summary',NULL,'2024-04-20','2024-04-22',5,6,'2024-04-26','67','7','568',0,'2024-04-21 00:49:17',NULL,'NA','','','','','','','','','','','','','','','','','','','','','','','','','','','Not done','','Done',2,'3','00:00:04','99','80','3','4','Mentor Review Pending',''),
(5,11,'yut','jhjj','1','DMR','','','','','','','','','','','','','','','Summary',NULL,'2024-04-21','2024-04-23',0,0,'0000-00-00','','','',0,'2024-04-21 14:22:08',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','','','NA','NA','NA','NA','NA','NA','','','NA','NA','NA','NA','NA','NA','NA',0,'','00:00:00','tim','','3','4','Not Started',''),
(6,12,'ytt','hgfhh','1','CMR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Summary',NULL,'2024-04-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2024-04-21 14:25:39',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Not Started',''),
(7,13,'fgf','fg','1','CMR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Summary',NULL,'2024-04-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-04-21 14:27:27',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Not Started',''),
(8,14,'eleven','eleven11','1','CMR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Summary',NULL,'2024-04-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2024-04-21 15:43:49',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Not Started',''),
(9,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Summary','dan789','2024-04-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2024-04-21 15:43:49',NULL,'NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Not Started','');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `delete_flag` tinyint(1) DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`product_id`,`product_name`,`delete_flag`,`created_by`,`timestamp`) values 
(1,'CMR',0,NULL,'2024-04-20 08:24:11'),
(2,'DMR',0,NULL,'2024-04-20 08:24:15');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `roles` */

insert  into `roles`(`role_id`,`role_name`,`delete_flag`) values 
(1,'admin',0),
(2,'manager',0),
(3,'lead',0),
(4,'mentor',0),
(5,'analyst',0),
(6,'coordinator',0),
(7,'pm',0);

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT 0,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `status` */

insert  into `status`(`status_id`,`status_name`,`role_id`,`delete_flag`) values 
(1,'Not Started',5,0),
(2,'InProgress',5,0),
(3,'Terv Closed & IR Addressed',5,0),
(4,'Mentor Review Pending',5,0),
(5,'Mentor Reviewed Completed',4,0),
(6,'Lead Approval Pending',4,0),
(7,'Lead Approved Completed',3,0);

/*Table structure for table `summary` */

DROP TABLE IF EXISTS `summary`;

CREATE TABLE `summary` (
  `summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `epic_count` int(11) DEFAULT NULL,
  `story_count` int(11) DEFAULT NULL,
  `bug_count` int(11) DEFAULT NULL,
  `tech_imp_count` int(11) DEFAULT NULL,
  `qa_servers` varchar(255) DEFAULT NULL,
  `contrast_server_name` varchar(255) DEFAULT NULL,
  `qa_env_url` varchar(255) DEFAULT NULL,
  `conclusion` varchar(255) DEFAULT NULL,
  `secure_code_review` enum('NA','Done','Not Done') DEFAULT 'NA',
  `sonar_verified` enum('NA','Done','Not Done') DEFAULT 'NA',
  `contrast_verified` enum('NA','Done','Not Done') DEFAULT 'NA',
  `third_party_verified` enum('NA','Done','Not Done') DEFAULT 'NA',
  `security_validation_status` enum('Approved','Approved with Exception','Rejected') DEFAULT 'Approved',
  `comments` varchar(255) DEFAULT NULL,
  `deleteflag` enum('0','1') DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `summary` */

insert  into `summary`(`summary_id`,`assignment_id`,`epic_count`,`story_count`,`bug_count`,`tech_imp_count`,`qa_servers`,`contrast_server_name`,`qa_env_url`,`conclusion`,`secure_code_review`,`sonar_verified`,`contrast_verified`,`third_party_verified`,`security_validation_status`,`comments`,`deleteflag`,`timestamp`,`created_by`) values 
(1,0,0,0,0,0,'','','','','NA','NA','NA','NA','Approved','','0','2024-04-20 23:11:39',NULL),
(2,0,10,20,30,40,'60','70','90','90','NA','NA','NA','NA','Approved','565','0','2024-04-20 23:12:27',NULL),
(3,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2024-04-20 23:20:10',1),
(4,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2024-04-20 23:20:13',1),
(5,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2024-04-20 23:21:10',1),
(6,10,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NA','NA','NA','NA','Approved',NULL,'0','2024-04-21 00:49:17',NULL),
(7,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NA','NA','NA','NA','Approved',NULL,'0','2024-04-21 14:22:08',NULL),
(8,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NA','NA','NA','NA','Approved',NULL,'0','2024-04-21 14:25:39',NULL),
(9,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NA','NA','NA','NA','Approved',NULL,'0','2024-04-21 14:27:27',NULL),
(10,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NA','NA','NA','NA','Approved',NULL,'0','2024-04-21 15:43:49',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `ufname` varchar(255) DEFAULT NULL,
  `ulname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `delete_flag` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password_hash`,`ufname`,`ulname`,`email`,`role_id`,`delete_flag`,`timestamp`,`created_by`) values 
(1,'admin','$2y$10$PxmidOVR/JKBOXREzjCQFuhMh1z89TGEtrmBoGGnfvXvDEPylAXBq','admin','admin','admin@test.com',5,0,'2024-04-20 08:16:10',NULL),
(2,'analyst','$2y$10$/s8BOqYLjakfpe9Gg3r8keEbAmPI06tyl6OJoJsqMrTHIeXO2vDdy','Analyst','Analyst','analyst@test.com',5,0,'2024-04-21 15:57:48',NULL),
(3,'mentor','$2y$10$/s8BOqYLjakfpe9Gg3r8keEbAmPI06tyl6OJoJsqMrTHIeXO2vDdy','A','B','abhijeet@test.com',4,0,'2024-04-21 23:52:20',NULL),
(4,'lead','$2y$10$/s8BOqYLjakfpe9Gg3r8keEbAmPI06tyl6OJoJsqMrTHIeXO2vDdy','AB','BA','abhijee1t@test.com',3,0,'2024-04-21 23:53:18',NULL);

/* Trigger structure for table `assignments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_assignment_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_assignment_insert` AFTER INSERT ON `assignments` FOR EACH ROW 
BEGIN
    INSERT INTO patches (assignment_id, title, description, assigned_to, product_name, assigned_date)
    VALUES (NEW.assignment_id, NEW.title, NEW.description, NEW.assigned_to, NEW.product_name, NEW.assigned_date);
END */$$


DELIMITER ;

/* Trigger structure for table `assignments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_assignment_insert1` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_assignment_insert1` AFTER INSERT ON `assignments` FOR EACH ROW 
BEGIN
    INSERT INTO summary (assignment_id) VALUES (NEW.assignment_id);
END */$$


DELIMITER ;

/* Trigger structure for table `assignments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_into_patches` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_into_patches` AFTER INSERT ON `assignments` FOR EACH ROW 
BEGIN
    IF NEW.rm_pm IS NOT NULL THEN
        INSERT INTO patches (assignment_id, rm_pm)
        VALUES (NEW.assignment_id, NEW.rm_pm);
    END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
