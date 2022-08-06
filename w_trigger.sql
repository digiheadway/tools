-- MySQL dump 10.19  Distrib 10.3.30-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wsenwtuzpk
-- ------------------------------------------------------
-- Server version	10.3.30-MariaDB-1:10.3.30+maria~stretch-log

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
-- Temporary table structure for view `active_vendors`
--

DROP TABLE IF EXISTS `active_vendors`;
/*!50001 DROP VIEW IF EXISTS `active_vendors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `active_vendors` (
  `trust_score` tinyint NOT NULL,
  `profile_id` tinyint NOT NULL,
  `dist_priority` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `company` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `capacity` tinyint NOT NULL,
  `main_balance` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `friends` tinyint NOT NULL,
  `Balance_Spent` tinyint NOT NULL,
  `Distributed_Today` tinyint NOT NULL,
  `subscription` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` enum('created','updated','deleted','paused','resumed','called') NOT NULL,
  `entity_type` enum('lead','vendor','distribution') NOT NULL,
  `entity_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `old` text DEFAULT NULL,
  `new` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13445 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `analytics`
--

DROP TABLE IF EXISTS `analytics`;
/*!50001 DROP VIEW IF EXISTS `analytics`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `analytics` (
  `revenue_loss` tinyint NOT NULL,
  `distributions_loss` tinyint NOT NULL,
  `uncaptured_leads` tinyint NOT NULL,
  `captured_leads` tinyint NOT NULL,
  `total_distributions` tinyint NOT NULL,
  `claims_attempted` tinyint NOT NULL,
  `claims_pending` tinyint NOT NULL,
  `claims_approved` tinyint NOT NULL,
  `claims_disapproved` tinyint NOT NULL,
  `claimed_amount` tinyint NOT NULL,
  `average_lead_revenue` tinyint NOT NULL,
  `total_revenue` tinyint NOT NULL,
  `average_valid_lead_revenue` tinyint NOT NULL,
  `average_distributed_lead_revenue` tinyint NOT NULL,
  `average_distribution` tinyint NOT NULL,
  `average_valid_distribution` tinyint NOT NULL,
  `invalid_leads` tinyint NOT NULL,
  `undistributed_leads` tinyint NOT NULL,
  `average_distributed_lead_cost` tinyint NOT NULL,
  `average_valid_lead_cost` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `total_cost` tinyint NOT NULL,
  `total_sales` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `conversion_analytics`
--

DROP TABLE IF EXISTS `conversion_analytics`;
/*!50001 DROP VIEW IF EXISTS `conversion_analytics`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `conversion_analytics` (
  `id` tinyint NOT NULL,
  `truecaller_status` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `entry` tinyint NOT NULL,
  `formid` tinyint NOT NULL,
  `page` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(5) NOT NULL,
  `date` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `demand_supply`
--

DROP TABLE IF EXISTS `demand_supply`;
/*!50001 DROP VIEW IF EXISTS `demand_supply`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `demand_supply` (
  `service` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `total_bhk_vendors` tinyint NOT NULL,
  `total_collect_vendors` tinyint NOT NULL,
  `days_from_today` tinyint NOT NULL,
  `collect` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `revenue_loss` tinyint NOT NULL,
  `dist_loss` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `distributions`
--

DROP TABLE IF EXISTS `distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `status` enum('delivered','claim_pending','claim_approved','claim_disapproved') NOT NULL DEFAULT 'delivered',
  `in_progress` int(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `quotation_sent` tinyint(1) NOT NULL DEFAULT 0,
  `last_whatsapped` text DEFAULT NULL,
  `last_called` text DEFAULT NULL,
  `vendor_checked` tinyint(1) DEFAULT 0,
  `vendor_rating` int(1) unsigned DEFAULT NULL,
  `dist_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `reason` varchar(255) DEFAULT NULL,
  `claim_response` varchar(255) DEFAULT NULL,
  `claim_ts` timestamp NULL DEFAULT NULL,
  `current_reminder` timestamp NULL DEFAULT NULL,
  `last_reminder` timestamp NULL DEFAULT NULL,
  `type` enum('auto','manual') DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `vendor_note` varchar(300) DEFAULT NULL,
  `claim_delay` bigint(20) GENERATED ALWAYS AS (timestampdiff(SECOND,`dist_ts`,`claim_ts`) * 1000) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`lead_id`,`vendor_id`),
  KEY `vendor_index` (`vendor_id`),
  KEY `lead_index` (`lead_id`),
  KEY `status_index` (`status`),
  CONSTRAINT `distributions_ibfk_7` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `distributions_ibfk_9` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21568 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `create_transaction_of_each_distribution` AFTER INSERT ON `distributions` FOR EACH ROW
BEGIN
    INSERT INTO 
      `transactions` (vendor_id, wallet_type, type, amount, note) 
    values 
       (
          NEW.vendor_id, 
          'main', 
          'lead_distributed', 
          (SELECT -1*price from leads WHERE id = NEW.lead_id),
           NEW.lead_id
       );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `create_transaction_on_claim_approve` AFTER UPDATE ON `distributions` FOR EACH ROW
BEGIN
IF(NEW.status = 'claim_approved' AND OLD.status <> 'claim_approved')  THEN 
   INSERT INTO 
      `transactions` (vendor_id, wallet_type, type, amount, note) 
    values 
       (
          NEW.vendor_id, 
          'voucher', 
          'claim_approved', 
          (SELECT price from leads WHERE id = NEW.lead_id),
            NEW.lead_id
       );
END IF;
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `create_transaction_on_distribution_delete` BEFORE DELETE ON `distributions` FOR EACH ROW
BEGIN
IF(OLD.status <> 'claim_approved')  THEN 
   INSERT INTO 
      `transactions` (vendor_id, wallet_type, type, amount, note) 
    values 
       (
          OLD.vendor_id, 
          'voucher', 
          'claim_approved', 
          (SELECT price from leads WHERE id = OLD.lead_id),
            OLD.lead_id
       );
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `distributions_analysis`
--

DROP TABLE IF EXISTS `distributions_analysis`;
/*!50001 DROP VIEW IF EXISTS `distributions_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `distributions_analysis` (
  `lead_id` tinyint NOT NULL,
  `distributions_count` tinyint NOT NULL,
  `claims_attempted` tinyint NOT NULL,
  `claim_pending` tinyint NOT NULL,
  `claim_approved` tinyint NOT NULL,
  `claim_disapproved` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `distributions_view`
--

DROP TABLE IF EXISTS `distributions_view`;
/*!50001 DROP VIEW IF EXISTS `distributions_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `distributions_view` (
  `claim_delay` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `lead_id` tinyint NOT NULL,
  `vendor_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `in_progress` tinyint NOT NULL,
  `sale` tinyint NOT NULL,
  `quotation_sent` tinyint NOT NULL,
  `last_whatsapped` tinyint NOT NULL,
  `last_called` tinyint NOT NULL,
  `vendor_checked` tinyint NOT NULL,
  `vendor_rating` tinyint NOT NULL,
  `dist_ts` tinyint NOT NULL,
  `reason` tinyint NOT NULL,
  `claim_ts` tinyint NOT NULL,
  `current_reminder` tinyint NOT NULL,
  `last_reminder` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `created_by` tinyint NOT NULL,
  `vendor_note` tinyint NOT NULL,
  `dist_date` tinyint NOT NULL,
  `dist_month` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `collect` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `from_to` varchar(300) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `rating` float NOT NULL DEFAULT 0,
  `status` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `status` (`status`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lead_prices`
--

DROP TABLE IF EXISTS `lead_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_type` varchar(40) NOT NULL,
  `local_price` int(4) NOT NULL,
  `line_price` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `lead_search`
--

DROP TABLE IF EXISTS `lead_search`;
/*!50001 DROP VIEW IF EXISTS `lead_search`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `lead_search` (
  `price` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `re_from` tinyint NOT NULL,
  `re_to` tinyint NOT NULL,
  `re_date` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `entry` tinyint NOT NULL,
  `collect` tinyint NOT NULL,
  `page` tinyint NOT NULL,
  `note` tinyint NOT NULL,
  `Call_After` tinyint NOT NULL,
  `Note_For_Vendor` tinyint NOT NULL,
  `Note_For_Distributor` tinyint NOT NULL,
  `page_id` tinyint NOT NULL,
  `verified` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `entry_id` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `items` tinyint NOT NULL,
  `quotation` tinyint NOT NULL,
  `budget` tinyint NOT NULL,
  `ref` tinyint NOT NULL,
  `formid` tinyint NOT NULL,
  `truecaller_request_id` tinyint NOT NULL,
  `Vendors` tinyint NOT NULL,
  `COUNT(vendor_id)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(300) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `price` int(4) DEFAULT NULL,
  `bhk` varchar(300) DEFAULT 'NA',
  `re_from` varchar(300) DEFAULT NULL,
  `re_to` varchar(300) DEFAULT NULL,
  `re_date` varchar(300) DEFAULT NULL,
  `entry` timestamp NOT NULL DEFAULT current_timestamp(),
  `collect` varchar(300) DEFAULT NULL,
  `page` varchar(1000) DEFAULT 'NA',
  `note` text DEFAULT NULL,
  `Call_After` bigint(16) DEFAULT NULL,
  `Note_For_Vendor` varchar(50) DEFAULT NULL,
  `Note_For_Distributor` varchar(50) DEFAULT NULL,
  `page_id` varchar(20) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `level` varchar(100) DEFAULT 'Normal Level',
  `status` varchar(100) DEFAULT 'Unread',
  `entry_id` int(11) DEFAULT NULL,
  `type` enum('Line','Local','All') DEFAULT NULL,
  `items` varchar(1200) DEFAULT NULL,
  `quotation` varchar(300) DEFAULT NULL,
  `budget` varchar(300) DEFAULT NULL,
  `ref` text DEFAULT 'NA',
  `formid` varchar(80) DEFAULT NULL,
  `truecaller_request_id` varchar(64) DEFAULT NULL,
  `moving_gap` int(11) GENERATED ALWAYS AS (to_days(str_to_date(`re_date`,'%M %d, %Y')) - to_days(cast(`entry` as date))) VIRTUAL,
  `entry_month` int(2) GENERATED ALWAYS AS (month(`entry`)) VIRTUAL,
  `entry_date` date GENERATED ALWAYS AS (cast(`entry` as date)) VIRTUAL,
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `source` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `truecaller_request_id` (`truecaller_request_id`),
  KEY `entry_index` (`entry`),
  KEY `verified` (`verified`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=20918 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `set_customer_notifications` AFTER UPDATE ON `leads` FOR EACH ROW
BEGIN
DECLARE relocation_date date;
DECLARE relocation_notification_ts datetime; 

SET relocation_date = STR_TO_DATE(NEW.re_date, '%M %d, %Y');
SET relocation_notification_ts = concat(relocation_date, ' ', current_time()); 

IF(NEW.verified != OLD.verified AND NEW.verified = 1 AND relocation_date > curdate()) THEN 
   INSERT INTO notifications(name, numbers,timestamp,message_id) VALUES
     (NEW.name, NEW.phone,DATE_ADD(NOW(), INTERVAL 6 HOUR) ,'tips_document'),
    (NEW.name, NEW.phone,relocation_notification_ts ,'customer_on_relocation_date'),
    (NEW.name, NEW.phone,relocation_notification_ts + interval 3 day,'after_3_days_of_relocation'),
    (NEW.name, NEW.phone,relocation_notification_ts + interval 10 day ,'after_10_days_of_relocation');

    IF(relocation_date >= curdate() + interval 2 day) THEN
        INSERT INTO notifications(name, numbers,timestamp,message_id) VALUES
        (NEW.name, NEW.phone, now() + interval 1 day ,'customer_on_next_day');
    END IF;  

    IF(relocation_date >= curdate() + interval 4 day) THEN
        INSERT INTO notifications(name, numbers,timestamp,message_id) VALUES
        (NEW.name, NEW.phone, relocation_notification_ts - interval 2 day ,'before_2_days_of_relocation');
    END IF;   

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `leads_analysis`
--

DROP TABLE IF EXISTS `leads_analysis`;
/*!50001 DROP VIEW IF EXISTS `leads_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `leads_analysis` (
  `distributions_count` tinyint NOT NULL,
  `distributions_loss` tinyint NOT NULL,
  `revenue_loss` tinyint NOT NULL,
  `claims_attempted` tinyint NOT NULL,
  `claim_pending` tinyint NOT NULL,
  `claim_approved` tinyint NOT NULL,
  `claim_disapproved` tinyint NOT NULL,
  `claimed_amount` tinyint NOT NULL,
  `lead_revenue` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `collect` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `entry` tinyint NOT NULL,
  `entry_date` tinyint NOT NULL,
  `days_from_today` tinyint NOT NULL,
  `verified` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `leads_view`
--

DROP TABLE IF EXISTS `leads_view`;
/*!50001 DROP VIEW IF EXISTS `leads_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `leads_view` (
  `price` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `re_from` tinyint NOT NULL,
  `re_to` tinyint NOT NULL,
  `re_date` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `entry` tinyint NOT NULL,
  `collect` tinyint NOT NULL,
  `page` tinyint NOT NULL,
  `note` tinyint NOT NULL,
  `Call_After` tinyint NOT NULL,
  `Note_For_Vendor` tinyint NOT NULL,
  `Note_For_Distributor` tinyint NOT NULL,
  `verified` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `items` tinyint NOT NULL,
  `quotation` tinyint NOT NULL,
  `budget` tinyint NOT NULL,
  `ref` tinyint NOT NULL,
  `formid` tinyint NOT NULL,
  `moving_gap` tinyint NOT NULL,
  `entry_month` tinyint NOT NULL,
  `entry_date` tinyint NOT NULL,
  `updated_ts` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `_session` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `err_msg` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message_id` varchar(200) NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paytm_recharges`
--

DROP TABLE IF EXISTS `paytm_recharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paytm_recharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_phone` bigint(20) NOT NULL,
  `status` enum('pending','success','fail') NOT NULL DEFAULT 'pending',
  `amount` int(11) NOT NULL,
  `net_amount` int(11) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `vendor_id` int(11) DEFAULT NULL,
  `bank_txn_id` bigint(20) DEFAULT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `qp` varchar(300) DEFAULT NULL,
  `ref` varchar(100) DEFAULT NULL,
  `txn_message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `check_for_new_vendor` BEFORE INSERT ON `paytm_recharges` FOR EACH ROW
BEGIN
IF EXISTS(SELECT * from vendors where phone = NEW.vendor_phone) THEN
   SET NEW.vendor_id = (SELECT id from vendors where phone = NEW.vendor_phone);
END IF;
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `add_transaction_after_payment` AFTER UPDATE ON `paytm_recharges` FOR EACH ROW
BEGIN
DECLARE gst FLOAT;
 SET gst =  CAST((NEW.net_amount * 0.18) as INT);
IF(NEW.status != OLD.status and NEW.status = 'success') THEN
 
   INSERT INTO 
      `transactions` (vendor_id, wallet_type, type, amount, note) 
    values 
       (
          NEW.vendor_id, 
          'main', 
          'balance_added', 
          NEW.net_amount,
           CONCAT('Paytm/', NEW.amount, '-', (NEW.amount - NEW.net_amount - gst), '-', gst  , '=', NEW.net_amount  ,'/',  NEW.payment_mode  ,'/', NEW.ref , '/id_ ', NEW.id)
       );
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `reminders_view`
--

DROP TABLE IF EXISTS `reminders_view`;
/*!50001 DROP VIEW IF EXISTS `reminders_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reminders_view` (
  `id` tinyint NOT NULL,
  `current_reminder` tinyint NOT NULL,
  `lead_id` tinyint NOT NULL,
  `lead_name` tinyint NOT NULL,
  `vendor_name` tinyint NOT NULL,
  `vendor_phone` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `traffic`
--

DROP TABLE IF EXISTS `traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(128) DEFAULT NULL,
  `ref` text DEFAULT NULL,
  `truecaller_request_id` varchar(64) DEFAULT NULL,
  `form_id` varchar(40) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `page` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  CONSTRAINT `traffic_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(6) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `type` enum('balance_added','lead_distributed','claim_approved','voucher_redeemed','referral_bonus','other') NOT NULL,
  `note` text DEFAULT NULL,
  `wallet_type` enum('main','voucher') NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `type_index` (`type`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28343 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `update_vendor_balance` AFTER INSERT ON `transactions` FOR EACH ROW
BEGIN
IF(NEW.wallet_type = 'main') THEN
    UPDATE vendors SET main_balance = main_balance + NEW.amount WHERE id = NEW.vendor_id;
ELSEIF(NEW.wallet_type = 'voucher') THEN
    UPDATE vendors SET voucher_balance = voucher_balance  + NEW.amount WHERE id = NEW.vendor_id;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `transactions_view`
--

DROP TABLE IF EXISTS `transactions_view`;
/*!50001 DROP VIEW IF EXISTS `transactions_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `transactions_view` (
  `type` tinyint NOT NULL,
  `count` tinyint NOT NULL,
  `vendor_id` tinyint NOT NULL,
  `wallet_type` tinyint NOT NULL,
  `total_amount` tinyint NOT NULL,
  `date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `truecaller_api_requests`
--

DROP TABLE IF EXISTS `truecaller_api_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truecaller_api_requests` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `requestId` varchar(64) DEFAULT NULL,
  `status` text NOT NULL,
  `accessToken` varchar(64) DEFAULT NULL,
  `endpoint` varchar(100) DEFAULT NULL,
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `requestId` (`requestId`)
) ENGINE=InnoDB AUTO_INCREMENT=3411 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(20) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `type` enum('Admin','Verifier','Manager') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Id` (`id`),
  UNIQUE KEY `Phone_Number` (`phone`),
  UNIQUE KEY `Login_Id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `vendor_scores`
--

DROP TABLE IF EXISTS `vendor_scores`;
/*!50001 DROP VIEW IF EXISTS `vendor_scores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vendor_scores` (
  `history_performance` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `spent_rate` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `support_rating` tinyint NOT NULL,
  `security_score` tinyint NOT NULL,
  `claim_approval_rate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_balance` int(10) NOT NULL DEFAULT 0,
  `voucher_balance` int(10) DEFAULT 0,
  `name` text NOT NULL DEFAULT 'NA',
  `phone` bigint(20) NOT NULL,
  `login_id` varchar(10) DEFAULT NULL,
  `prospect_id` bigint(10) DEFAULT -1,
  `otp` mediumint(6) unsigned zerofill DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `can_claim` tinyint(1) NOT NULL DEFAULT 1,
  `notify_low_balance` tinyint(1) NOT NULL DEFAULT 0,
  `remind_on_every_call` tinyint(1) NOT NULL DEFAULT 1,
  `friends` varchar(100) DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `bhk` varchar(200) DEFAULT NULL,
  `company` text DEFAULT NULL,
  `city` tinytext DEFAULT NULL,
  `zone` text DEFAULT NULL,
  `subscription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `verification_status` enum('Not Submitted','In Review','Submit Again','Only Personal Verification','Only Business Verification','Fully Verified') NOT NULL DEFAULT 'Not Submitted',
  `note` varchar(300) DEFAULT NULL,
  `dist_priority` float NOT NULL DEFAULT 1,
  `support_rating` smallint(6) NOT NULL DEFAULT 20,
  UNIQUE KEY `Id` (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`wsenwtuzpk`@`%`*/ /*!50003 TRIGGER `set_low_balance_notification` BEFORE UPDATE ON `vendors` FOR EACH ROW
BEGIN
IF(NEW.main_balance != OLD.main_balance) THEN
   IF(NEW.main_balance <= 500 ) THEN 
       SET NEW.notify_low_balance = 1;
   ELSE
        SET NEW.notify_low_balance = 0;
   END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `vendors_view`
--

DROP TABLE IF EXISTS `vendors_view`;
/*!50001 DROP VIEW IF EXISTS `vendors_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vendors_view` (
  `profile_id` tinyint NOT NULL,
  `trust_score` tinyint NOT NULL,
  `support_rating` tinyint NOT NULL,
  `can_claim` tinyint NOT NULL,
  `created_dt` tinyint NOT NULL,
  `prospect_id` tinyint NOT NULL,
  `note` tinyint NOT NULL,
  `verification_status` tinyint NOT NULL,
  `login_id` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `active` tinyint NOT NULL,
  `capacity` tinyint NOT NULL,
  `friends` tinyint NOT NULL,
  `bhk` tinyint NOT NULL,
  `company` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `main_balance` tinyint NOT NULL,
  `voucher_balance` tinyint NOT NULL,
  `Balance_Spent` tinyint NOT NULL,
  `zone` tinyint NOT NULL,
  `Total_Delivered` tinyint NOT NULL,
  `Claim_Pending` tinyint NOT NULL,
  `Claim_Approved` tinyint NOT NULL,
  `Claim_Disapproved` tinyint NOT NULL,
  `Total_Leads_Distributed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `active_vendors`
--

/*!50001 DROP TABLE IF EXISTS `active_vendors`*/;
/*!50001 DROP VIEW IF EXISTS `active_vendors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `active_vendors` AS select `vv`.`trust_score` AS `trust_score`,`vv`.`profile_id` AS `profile_id`,`vendors`.`dist_priority` AS `dist_priority`,`vendors`.`name` AS `name`,`vendors`.`bhk` AS `bhk`,`vendors`.`company` AS `company`,`vendors`.`id` AS `id`,`vendors`.`capacity` AS `capacity`,`vendors`.`main_balance` AS `main_balance`,`vendors`.`phone` AS `phone`,`vendors`.`city` AS `city`,`vendors`.`friends` AS `friends`,sum(`l`.`price`) AS `Balance_Spent`,(select count(0) from `distributions` where cast(`distributions`.`dist_ts` as date) = cast(current_timestamp() - interval 0 day as date) and `distributions`.`vendor_id` = `vendors`.`id`) AS `Distributed_Today`,`vendors`.`subscription` AS `subscription` from (((`vendors` left join `distributions` `d` on(`d`.`vendor_id` = `vendors`.`id`)) left join `leads` `l` on(`l`.`id` = `d`.`lead_id`)) left join `vendors_view` `vv` on(`vendors`.`id` = `vv`.`id`)) where `vendors`.`active` = 1 and `vendors`.`main_balance` > 0 group by `vendors`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `analytics`
--

/*!50001 DROP TABLE IF EXISTS `analytics`*/;
/*!50001 DROP VIEW IF EXISTS `analytics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `analytics` AS select sum(`l`.`revenue_loss`) AS `revenue_loss`,sum(`l`.`distributions_loss`) AS `distributions_loss`,(select sum(`leads`.`phone` is null) from `leads` where cast(`leads`.`entry` as date) = cast(`l`.`entry` as date) group by cast(`leads`.`entry` as date)) AS `uncaptured_leads`,sum(`l`.`phone` is not null) AS `captured_leads`,sum(`l`.`distributions_count`) AS `total_distributions`,sum(`l`.`claims_attempted`) AS `claims_attempted`,sum(`l`.`claim_pending`) AS `claims_pending`,sum(`l`.`claim_approved`) AS `claims_approved`,sum(`l`.`claim_disapproved`) AS `claims_disapproved`,sum(`l`.`claimed_amount`) AS `claimed_amount`,avg(`l`.`lead_revenue`) AS `average_lead_revenue`,sum(`l`.`lead_revenue`) AS `total_revenue`,avg(if(`l`.`verified` = 1,`l`.`lead_revenue`,NULL)) AS `average_valid_lead_revenue`,avg(if(`l`.`status` = 'Delivered',`l`.`lead_revenue`,NULL)) AS `average_distributed_lead_revenue`,avg(`l`.`distributions_count`) AS `average_distribution`,avg(if(`l`.`verified` = 1,`l`.`distributions_count`,NULL)) AS `average_valid_distribution`,sum(`l`.`verified` = 0) AS `invalid_leads`,sum(`l`.`status` <> 'Delivered') AS `undistributed_leads`,`c`.`amount` / sum(`l`.`status` = 'Delivered') AS `average_distributed_lead_cost`,`c`.`amount` / sum(`l`.`verified` = 1) AS `average_valid_lead_cost`,cast(`l`.`entry` as date) AS `date`,`c`.`amount` AS `total_cost`,(select sum(`transactions`.`amount`) from `transactions` where `transactions`.`type` = 'balance_added' and cast(`transactions`.`timestamp` as date) = cast(`l`.`entry` as date)) AS `total_sales` from (`leads_analysis` `l` left join `costs` `c` on(`c`.`date` = cast(`l`.`entry` as date))) where `l`.`phone` is not null group by cast(`l`.`entry` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `conversion_analytics`
--

/*!50001 DROP TABLE IF EXISTS `conversion_analytics`*/;
/*!50001 DROP VIEW IF EXISTS `conversion_analytics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `conversion_analytics` AS select `l`.`id` AS `id`,`t`.`status` AS `truecaller_status`,`l`.`phone` AS `phone`,`l`.`entry` AS `entry`,`l`.`formid` AS `formid`,if(`l`.`page` = 'Call',`l`.`page`,'Website') AS `page` from (`leads` `l` left join `truecaller_api_requests` `t` on(`l`.`truecaller_request_id` = `t`.`requestId`)) order by `l`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `demand_supply`
--

/*!50001 DROP TABLE IF EXISTS `demand_supply`*/;
/*!50001 DROP VIEW IF EXISTS `demand_supply`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `demand_supply` AS select if(locate(substring_index(`leads_analysis`.`collect`,'#',1),'Gurgaon,Delhi,Noida'),'In service','Out of service') AS `service`,substring_index(`leads_analysis`.`collect`,'#',1) AS `city`,substring_index(`leads_analysis`.`collect`,'#',-1) AS `type`,(select count(0) from `vendors` where locate(`leads_analysis`.`bhk`,`vendors`.`bhk`) and locate(`leads_analysis`.`collect`,`vendors`.`city`) and `vendors`.`active` = 1 and `vendors`.`main_balance` + `vendors`.`voucher_balance` > 0) AS `total_bhk_vendors`,(select count(0) from `vendors` where locate(`leads_analysis`.`collect`,`vendors`.`city`) and `vendors`.`active` = 1 and `vendors`.`main_balance` + `vendors`.`voucher_balance` > 0) AS `total_collect_vendors`,`leads_analysis`.`days_from_today` AS `days_from_today`,`leads_analysis`.`collect` AS `collect`,`leads_analysis`.`bhk` AS `bhk`,sum(`leads_analysis`.`revenue_loss`) AS `revenue_loss`,sum(`leads_analysis`.`distributions_loss`) AS `dist_loss` from `leads_analysis` where `leads_analysis`.`verified` = 1 and `leads_analysis`.`revenue_loss` is not null and `leads_analysis`.`revenue_loss` <> 0 group by `leads_analysis`.`days_from_today`,`leads_analysis`.`collect`,`leads_analysis`.`bhk` order by cast(replace(`leads_analysis`.`days_from_today`,'-',0) as signed),sum(`leads_analysis`.`revenue_loss`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `distributions_analysis`
--

/*!50001 DROP TABLE IF EXISTS `distributions_analysis`*/;
/*!50001 DROP VIEW IF EXISTS `distributions_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `distributions_analysis` AS select `distributions`.`lead_id` AS `lead_id`,count(0) AS `distributions_count`,sum(`distributions`.`status` <> 'delivered') AS `claims_attempted`,sum(`distributions`.`status` = 'claim_pending') AS `claim_pending`,sum(`distributions`.`status` = 'claim_approved') AS `claim_approved`,sum(`distributions`.`status` = 'claim_disapproved') AS `claim_disapproved` from `distributions` group by `distributions`.`lead_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `distributions_view`
--

/*!50001 DROP TABLE IF EXISTS `distributions_view`*/;
/*!50001 DROP VIEW IF EXISTS `distributions_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `distributions_view` AS select `d`.`claim_delay` AS `claim_delay`,`d`.`id` AS `id`,`d`.`lead_id` AS `lead_id`,`d`.`vendor_id` AS `vendor_id`,`d`.`status` AS `status`,`d`.`in_progress` AS `in_progress`,`d`.`sale` AS `sale`,`d`.`quotation_sent` AS `quotation_sent`,`d`.`last_whatsapped` AS `last_whatsapped`,`d`.`last_called` AS `last_called`,`d`.`vendor_checked` AS `vendor_checked`,`d`.`vendor_rating` AS `vendor_rating`,`d`.`dist_ts` AS `dist_ts`,`d`.`reason` AS `reason`,`d`.`claim_ts` AS `claim_ts`,`d`.`current_reminder` AS `current_reminder`,`d`.`last_reminder` AS `last_reminder`,`d`.`type` AS `type`,`d`.`created_by` AS `created_by`,`d`.`vendor_note` AS `vendor_note`,date_format(`d`.`dist_ts`,'%m %b') AS `dist_date`,date_format(`d`.`dist_ts`,'%M') AS `dist_month`,`l`.`bhk` AS `bhk`,`l`.`collect` AS `collect` from (`distributions` `d` left join `leads_view` `l` on(`l`.`id` = `d`.`lead_id`)) where `l`.`entry` between curdate() - interval 30 day and curdate() + interval 1 day */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lead_search`
--

/*!50001 DROP TABLE IF EXISTS `lead_search`*/;
/*!50001 DROP VIEW IF EXISTS `lead_search`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `lead_search` AS select `l`.`price` AS `price`,`l`.`id` AS `id`,`l`.`phone` AS `phone`,`l`.`bhk` AS `bhk`,`l`.`re_from` AS `re_from`,`l`.`re_to` AS `re_to`,`l`.`re_date` AS `re_date`,`l`.`name` AS `name`,`l`.`entry` AS `entry`,`l`.`collect` AS `collect`,`l`.`page` AS `page`,`l`.`note` AS `note`,`l`.`Call_After` AS `Call_After`,`l`.`Note_For_Vendor` AS `Note_For_Vendor`,`l`.`Note_For_Distributor` AS `Note_For_Distributor`,`l`.`page_id` AS `page_id`,`l`.`verified` AS `verified`,`l`.`level` AS `level`,`l`.`status` AS `status`,`l`.`entry_id` AS `entry_id`,`l`.`type` AS `type`,`l`.`items` AS `items`,`l`.`quotation` AS `quotation`,`l`.`budget` AS `budget`,`l`.`ref` AS `ref`,`l`.`formid` AS `formid`,`l`.`truecaller_request_id` AS `truecaller_request_id`,group_concat(`d`.`vendor_id` separator ', ') AS `Vendors`,count(`d`.`vendor_id`) AS `COUNT(vendor_id)` from (`leads` `l` left join `distributions` `d` on(`d`.`lead_id` = `l`.`id`)) group by `d`.`lead_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leads_analysis`
--

/*!50001 DROP TABLE IF EXISTS `leads_analysis`*/;
/*!50001 DROP VIEW IF EXISTS `leads_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leads_analysis` AS select if(`da`.`distributions_count` is null,0,`da`.`distributions_count`) AS `distributions_count`,if(`da`.`distributions_count` is null,4,4 - `da`.`distributions_count`) AS `distributions_loss`,if(`da`.`distributions_count` is null,4 * `l`.`price`,(4 - `da`.`distributions_count`) * `l`.`price`) AS `revenue_loss`,`da`.`claims_attempted` AS `claims_attempted`,`da`.`claim_pending` AS `claim_pending`,`da`.`claim_approved` AS `claim_approved`,`da`.`claim_disapproved` AS `claim_disapproved`,`da`.`claim_approved` * `l`.`price` AS `claimed_amount`,if(`l`.`status` = 'Delivered',`da`.`distributions_count` * `l`.`price`,0) AS `lead_revenue`,`l`.`phone` AS `phone`,`l`.`status` AS `status`,`l`.`collect` AS `collect`,`l`.`bhk` AS `bhk`,`l`.`level` AS `level`,`l`.`price` AS `price`,`l`.`id` AS `id`,`l`.`entry` AS `entry`,`l`.`entry_date` AS `entry_date`,if(curdate() - `l`.`entry_date` <= 3,'0-3',if(curdate() - `l`.`entry_date` between 4 and 7,'4-7','7-1')) AS `days_from_today`,`l`.`verified` AS `verified` from (`leads` `l` left join `distributions_analysis` `da` on(`da`.`lead_id` = `l`.`id`)) where `l`.`phone` <> '' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leads_view`
--

/*!50001 DROP TABLE IF EXISTS `leads_view`*/;
/*!50001 DROP VIEW IF EXISTS `leads_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leads_view` AS select `leads`.`price` AS `price`,`leads`.`id` AS `id`,`leads`.`phone` AS `phone`,`leads`.`bhk` AS `bhk`,`leads`.`re_from` AS `re_from`,`leads`.`re_to` AS `re_to`,`leads`.`re_date` AS `re_date`,`leads`.`name` AS `name`,`leads`.`entry` AS `entry`,`leads`.`collect` AS `collect`,substring_index(substring_index(`leads`.`page`,'&kw=',-1),'&',1) AS `page`,`leads`.`note` AS `note`,`leads`.`Call_After` AS `Call_After`,`leads`.`Note_For_Vendor` AS `Note_For_Vendor`,`leads`.`Note_For_Distributor` AS `Note_For_Distributor`,`leads`.`verified` AS `verified`,`leads`.`level` AS `level`,`leads`.`status` AS `status`,`leads`.`type` AS `type`,`leads`.`items` AS `items`,`leads`.`quotation` AS `quotation`,`leads`.`budget` AS `budget`,`leads`.`ref` AS `ref`,`leads`.`formid` AS `formid`,`leads`.`moving_gap` AS `moving_gap`,`leads`.`entry_month` AS `entry_month`,`leads`.`entry_date` AS `entry_date`,`leads`.`updated_ts` AS `updated_ts` from `leads` where `leads`.`phone` <> '' and octet_length(`leads`.`phone`) > 9 and `leads`.`entry` between curdate() - interval 30 day and curdate() + interval 1 day */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reminders_view`
--

/*!50001 DROP TABLE IF EXISTS `reminders_view`*/;
/*!50001 DROP VIEW IF EXISTS `reminders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `reminders_view` AS select `d`.`id` AS `id`,`d`.`current_reminder` AS `current_reminder`,`l`.`id` AS `lead_id`,`l`.`name` AS `lead_name`,`v`.`name` AS `vendor_name`,`v`.`phone` AS `vendor_phone` from ((`distributions` `d` left join `vendors` `v` on(`v`.`id` = `d`.`vendor_id`)) left join `leads` `l` on(`l`.`id` = `d`.`lead_id`)) where `d`.`current_reminder` is not null and `d`.`current_reminder` between current_timestamp() - interval 30 minute and current_timestamp() + interval 30 minute */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transactions_view`
--

/*!50001 DROP TABLE IF EXISTS `transactions_view`*/;
/*!50001 DROP VIEW IF EXISTS `transactions_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `transactions_view` AS select `transactions`.`type` AS `type`,count(0) AS `count`,`transactions`.`vendor_id` AS `vendor_id`,`transactions`.`wallet_type` AS `wallet_type`,sum(`transactions`.`amount`) AS `total_amount`,date_format(`transactions`.`timestamp`,'%d %b') AS `date` from `transactions` group by cast(`transactions`.`timestamp` as date),`transactions`.`type`,`transactions`.`vendor_id` order by `transactions`.`timestamp` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendor_scores`
--

/*!50001 DROP TABLE IF EXISTS `vendor_scores`*/;
/*!50001 DROP VIEW IF EXISTS `vendor_scores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vendor_scores` AS select 20 - ifnull(sum(`rating`.`status` = 'Issue Not Resolved') / count(`l`.`id`),0) * 200 AS `history_performance`,ifnull(sum(`rating`.`rating`) / count(`rating`.`rating`),4) * 4 AS `rating`,least(5,sum(`l`.`price`) / 5000) AS `spent_rate`,`vendors`.`id` AS `id`,`vendors`.`support_rating` AS `support_rating`,least(30,(`vendors`.`voucher_balance` + `vendors`.`main_balance`) / 500) AS `security_score`,least(5,ifnull(sum(`d`.`status` = 'claim_approved') / sum(`d`.`status` <> 'delivered'),0) * 20) AS `claim_approval_rate` from (((`vendors` left join `distributions` `d` on(`d`.`vendor_id` = `vendors`.`id`)) left join `leads` `l` on(`l`.`id` = `d`.`lead_id`)) left join `feedback` `rating` on(`rating`.`vendor_id` = `vendors`.`id`)) group by `vendors`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendors_view`
--

/*!50001 DROP TABLE IF EXISTS `vendors_view`*/;
/*!50001 DROP VIEW IF EXISTS `vendors_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wsenwtuzpk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vendors_view` AS select concat(lcase(substring_index(`vendors`.`company`,' ',1)),'-',`vendors`.`id`) AS `profile_id`,ifnull(round((`vs`.`security_score` + `vs`.`claim_approval_rate` + `vs`.`spent_rate` + `vs`.`support_rating` + `vs`.`rating` + `vs`.`history_performance`) / 10,1),0) AS `trust_score`,`vendors`.`support_rating` AS `support_rating`,`vendors`.`can_claim` AS `can_claim`,`vendors`.`created_dt` AS `created_dt`,`vendors`.`prospect_id` AS `prospect_id`,`vendors`.`note` AS `note`,`vendors`.`verification_status` AS `verification_status`,`vendors`.`login_id` AS `login_id`,`vendors`.`id` AS `id`,`vendors`.`name` AS `name`,`vendors`.`active` AS `active`,`vendors`.`capacity` AS `capacity`,`vendors`.`friends` AS `friends`,`vendors`.`bhk` AS `bhk`,`vendors`.`company` AS `company`,`vendors`.`phone` AS `phone`,`vendors`.`city` AS `city`,`vendors`.`main_balance` AS `main_balance`,`vendors`.`voucher_balance` AS `voucher_balance`,sum(`l`.`price`) AS `Balance_Spent`,`vendors`.`zone` AS `zone`,sum(`d`.`status` = 'delivered') AS `Total_Delivered`,sum(`d`.`status` = 'claim_pending') AS `Claim_Pending`,sum(`d`.`status` = 'claim_approved') AS `Claim_Approved`,sum(`d`.`status` = 'claim_disapproved') AS `Claim_Disapproved`,sum(`d`.`status` <> 'claim_approved') AS `Total_Leads_Distributed` from (((`vendors` left join `distributions` `d` on(`d`.`vendor_id` = `vendors`.`id`)) left join `leads` `l` on(`l`.`id` = `d`.`lead_id`)) left join `vendor_scores` `vs` on(`vs`.`id` = `vendors`.`id`)) group by `vendors`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-05 14:23:28
