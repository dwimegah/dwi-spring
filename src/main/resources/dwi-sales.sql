-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dwi-sales
CREATE DATABASE IF NOT EXISTS `dwi-sales` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dwi-sales`;

-- Dumping structure for table dwi-sales.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `status` int(20) DEFAULT '1',
  `gender` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table dwi-sales.customer: ~12 rows (approximately)
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `age`, `email`, `mobile_number`, `date_started`, `status`, `gender`) VALUES
	(2, 'Andrew', 'Sherman', 27, 'andrew@gmail.com', '2829102345', '2000-02-01', 1, 0),
	(3, 'Mary', 'Stera', 32, 'ahsn_332@yahoo.com', '234234234', '2010-04-07', 1, 1),
	(4, 'Sam', 'Smithy', 54, 'smihgsh@gmail.com', '947276222', '2004-06-24', 1, 0),
	(5, 'Wendy', 'Wailer', 76, 'wnehy32@yahoo.com', '76643334', '2016-02-05', 1, 1),
	(7, 'Cory', 'Mant', 29, 'coregsy@yahoo.com', '8263833443', '2010-06-14', 0, 0),
	(8, 'Albert', 'Sui', 30, 'al34b@gmail.com', '893237234', '2016-07-25', 1, 0),
	(9, 'Penny', 'Doris', 37, 'penshykj@email.com', '4393032334', '2012-12-19', 2, 1),
	(10, 'Robert', 'Cena', 45, 'rob555@robaer.com', '82739222333', '2011-11-24', 1, 0),
	(23, 'Randy', 'Chan', 36, 'ran@yahoo.com', '3829374233', '2014-06-04', 0, 0),
	(24, 'Mary', 'Sue', 43, 'mmmshye@gmail.com', '3222399332', '2011-02-22', 2, 1),
	(25, 'Der', 'Ham', 22, 'hsye@yahoo.com', '3829304233', '2014-11-19', 2, 1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table dwi-sales.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table dwi-sales.hibernate_sequence: 1 rows
DELETE FROM `hibernate_sequence`;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table dwi-sales.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `madein` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table dwi-sales.product: ~2 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `brand`, `madein`, `price`, `available`) VALUES
	(1, 'server', 'ibm', 'china', 1500, 1),
	(2, 'mouse', 'logitac', 'china', 15, 1),
	(3, 'pensil', 'greebel', 'china', 10000, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table dwi-sales.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table dwi-sales.role: ~1 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roleid`, `role`) VALUES
	(1, 'SUPERUSER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table dwi-sales.users
CREATE TABLE IF NOT EXISTS `users` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table dwi-sales.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userid`, `name`, `password`, `email`, `active`) VALUES
	(1, 'test', '$2a$10$aKFfgpqyi6jHquS8CSUhsuGEAVolsiLuZwcPB4kEvZGB.CNCYGDEi', 'test@mail.com', NULL),
	(2, 'Dwi Mega', '$2a$10$RUiCp7vTXEO8Ng1OQPd27.3NgXzhlzC0ktbaIe2FO7t7wfiXarVa2', 'dwi@gmail.com', NULL),
	(3, 'coba', '$2a$10$Mv3XOJw7eH5ROHJkj4iCRuhv4rP7KLMIE1jaxZJd66cFuZMBRD7.q', 'coba@gmail.com', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table dwi-sales.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `FKbo5ik0bthje7hum554xb17ry6` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table dwi-sales.user_role: 1 rows
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`userid`, `roleid`) VALUES
	(1, 1),
	(2, 1),
	(3, 1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
