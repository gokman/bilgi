-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bilgiBizim
--

CREATE DATABASE IF NOT EXISTS bilgiBizim;
USE bilgiBizim;

--
-- Definition of table `bilgiBizim`.`activity_dtl`
--

DROP TABLE IF EXISTS `bilgiBizim`.`activity_dtl`;
CREATE TABLE  `bilgiBizim`.`activity_dtl` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_subs_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `participant_status` tinyint(4) NOT NULL,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  `activity_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`activity_dtl_id`),
  KEY `activity_dtl_to_mst` (`activity_id`),
  CONSTRAINT `activity_dtl_to_mst` FOREIGN KEY (`activity_id`) REFERENCES `activity_mst` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`activity_dtl`
--

/*!40000 ALTER TABLE `activity_dtl` DISABLE KEYS */;
LOCK TABLES `activity_dtl` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `activity_dtl` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`activity_mst`
--

DROP TABLE IF EXISTS `bilgiBizim`.`activity_mst`;
CREATE TABLE  `bilgiBizim`.`activity_mst` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `saloon_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL,
  `detail` varchar(500) NOT NULL,
  `inactive_ind` bit(1) NOT NULL,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `activity_to_saloon` (`saloon_id`),
  CONSTRAINT `activity_to_saloon` FOREIGN KEY (`saloon_id`) REFERENCES `saloon_mst` (`saloon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`activity_mst`
--

/*!40000 ALTER TABLE `activity_mst` DISABLE KEYS */;
LOCK TABLES `activity_mst` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `activity_mst` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`lookup_dtl`
--

DROP TABLE IF EXISTS `bilgiBizim`.`lookup_dtl`;
CREATE TABLE  `bilgiBizim`.`lookup_dtl` (
  `header_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `short_value` varchar(100) NOT NULL,
  `detail_value` varchar(200) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`header_id`,`detail_id`),
  CONSTRAINT `lookup_hdr_to_dtl` FOREIGN KEY (`header_id`) REFERENCES `lookup_hdr` (`header_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`lookup_dtl`
--

/*!40000 ALTER TABLE `lookup_dtl` DISABLE KEYS */;
LOCK TABLES `lookup_dtl` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `lookup_dtl` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`lookup_hdr`
--

DROP TABLE IF EXISTS `bilgiBizim`.`lookup_hdr`;
CREATE TABLE  `bilgiBizim`.`lookup_hdr` (
  `header_id` int(11) NOT NULL,
  `header_name` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`lookup_hdr`
--

/*!40000 ALTER TABLE `lookup_hdr` DISABLE KEYS */;
LOCK TABLES `lookup_hdr` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `lookup_hdr` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`revenue_transaction`
--

DROP TABLE IF EXISTS `bilgiBizim`.`revenue_transaction`;
CREATE TABLE  `bilgiBizim`.`revenue_transaction` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `saloon_id` int(11) NOT NULL,
  `trans_qty` int(11) NOT NULL,
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `fee_to_user` (`user_id`),
  KEY `fee_to_saloon` (`saloon_id`),
  CONSTRAINT `fee_to_saloon` FOREIGN KEY (`saloon_id`) REFERENCES `saloon_mst` (`saloon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_to_user` FOREIGN KEY (`user_id`) REFERENCES `user_mst` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`revenue_transaction`
--

/*!40000 ALTER TABLE `revenue_transaction` DISABLE KEYS */;
LOCK TABLES `revenue_transaction` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `revenue_transaction` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`saloon_mst`
--

DROP TABLE IF EXISTS `bilgiBizim`.`saloon_mst`;
CREATE TABLE  `bilgiBizim`.`saloon_mst` (
  `saloon_id` int(11) NOT NULL AUTO_INCREMENT,
  `saloon_no` varchar(50) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  `attribute6` varchar(200) DEFAULT NULL,
  `attribute7` varchar(200) DEFAULT NULL,
  `attribute8` varchar(200) DEFAULT NULL,
  `attribute9` varchar(200) DEFAULT NULL,
  `attribute10` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`saloon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`saloon_mst`
--

/*!40000 ALTER TABLE `saloon_mst` DISABLE KEYS */;
LOCK TABLES `saloon_mst` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `saloon_mst` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`saloon_user_dtl`
--

DROP TABLE IF EXISTS `bilgiBizim`.`saloon_user_dtl`;
CREATE TABLE  `bilgiBizim`.`saloon_user_dtl` (
  `saloon_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `saloon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `branch` varchar(50) NOT NULL,
  `user_status` varchar(20) NOT NULL,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  `attribute6` varchar(200) DEFAULT NULL,
  `attribute7` varchar(200) DEFAULT NULL,
  `attribute8` varchar(200) DEFAULT NULL,
  `attribute9` varchar(200) DEFAULT NULL,
  `attribute10` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`saloon_user_id`),
  KEY `saloon_mst_conn` (`saloon_id`),
  KEY `user_mst_conn` (`user_id`),
  CONSTRAINT `saloon_mst_conn` FOREIGN KEY (`saloon_id`) REFERENCES `saloon_mst` (`saloon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_mst_conn` FOREIGN KEY (`user_id`) REFERENCES `user_mst` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`saloon_user_dtl`
--

/*!40000 ALTER TABLE `saloon_user_dtl` DISABLE KEYS */;
LOCK TABLES `saloon_user_dtl` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `saloon_user_dtl` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`user_dtl`
--

DROP TABLE IF EXISTS `bilgiBizim`.`user_dtl`;
CREATE TABLE  `bilgiBizim`.`user_dtl` (
  `user_id` int(11) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `height` tinyint(4) DEFAULT NULL,
  `weight` tinyint(4) DEFAULT NULL,
  `branch` varchar(40) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `user_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  `attribute6` varchar(200) DEFAULT NULL,
  `attribute7` varchar(200) DEFAULT NULL,
  `attribute8` varchar(200) DEFAULT NULL,
  `attribute9` varchar(200) DEFAULT NULL,
  `attribute10` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_dtl_id`),
  KEY `user_dtl_to_mst` (`user_id`),
  CONSTRAINT `user_dtl_to_mst` FOREIGN KEY (`user_id`) REFERENCES `user_mst` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`user_dtl`
--

/*!40000 ALTER TABLE `user_dtl` DISABLE KEYS */;
LOCK TABLES `user_dtl` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_dtl` ENABLE KEYS */;


--
-- Definition of table `bilgiBizim`.`user_mst`
--

DROP TABLE IF EXISTS `bilgiBizim`.`user_mst`;
CREATE TABLE  `bilgiBizim`.`user_mst` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(32) NOT NULL,
  `user_mail` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` varchar(200) DEFAULT NULL,
  `attribute6` varchar(200) DEFAULT NULL,
  `attribute7` varchar(200) DEFAULT NULL,
  `attribute8` varchar(200) DEFAULT NULL,
  `attribute9` varchar(200) DEFAULT NULL,
  `attribute10` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bilgiBizim`.`user_mst`
--

/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
LOCK TABLES `user_mst` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
