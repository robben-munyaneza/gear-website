-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 28, 2013 at 07:59 AM
-- Server version: 5.5.8-log
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invoices`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `clientid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `clientname` varchar(140) NOT NULL,
  `contactname` varchar(120) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clientid`, `clientname`, `contactname`, `address`, `phone`, `email`) VALUES
(1, 'Rwanda Mountain Tea', 'U. Jacques', 'Nyabugogo', '0788123456', 'rwandatea@gmail.com'),
(2, 'Petrocom Rwanda', 'M. Jules', 'Kinamba', '0788654321', 'petrocom@gmail.com'),
(3, 'Almond Tree Films Rwanda', 'Richard Mugawaneza', 'Kabeza', '0788434242', 'richmugwa@gmail.com'),
(4, 'Hirwa Group', 'Aime KALISA', 'Kimironko', '0788545454', 'aimek2000@gmail.com'),
(10, 'Rwanda Education Board', 'Mukantwari Louise', 'Remera', '0788222222', 'info@reb.rw'),
(11, 'MIFOTRA', '-', '-', '-', '-'),
(12, 'Cogebanque', '-', '-', '-', '-'),
(13, 'Tigo Rwanda', '-', '-', '-', '-'),
(14, 'Minicom', '-', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `invoiceid` bigint(12) NOT NULL AUTO_INCREMENT,
  `invoicenumber` varchar(10) NOT NULL,
  `clientid` mediumint(9) NOT NULL,
  `userid` int(4) NOT NULL,
  `status` enum('Paid','Not Paid') NOT NULL,
  `invdate` datetime NOT NULL,
  `remind_date` datetime NOT NULL,
  `remindstatus` enum('Yes','No') NOT NULL,
  `totalcash` float NOT NULL,
  `inwords` varchar(2000) NOT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoiceid`, `invoicenumber`, `clientid`, `userid`, `status`, `invdate`, `remind_date`, `remindstatus`, `totalcash`, `inwords`) VALUES
(5, '001/13', 4, 6, 'Not Paid', '2013-11-05 15:00:00', '0000-00-00 00:00:00', 'No', 0, '-'),
(28, '002/13', 10, 6, 'Paid', '2013-11-18 14:47:04', '0000-00-00 00:00:00', 'No', 0, '18'),
(32, '006/13', 2, 6, 'Not Paid', '2013-11-19 08:23:16', '0000-00-00 00:00:00', 'No', 0, '17'),
(33, '004/13', 11, 6, 'Not Paid', '2013-11-19 15:09:25', '0000-00-00 00:00:00', 'No', 0, '19'),
(36, '005/13', 3, 6, 'Not Paid', '2013-11-20 17:28:51', '0000-00-00 00:00:00', 'No', 0, '16'),
(37, '006/13', 12, 6, 'Not Paid', '2013-11-21 06:56:00', '0000-00-00 00:00:00', 'No', 0, '23'),
(38, '007/13', 13, 6, 'Not Paid', '2013-11-21 07:32:04', '0000-00-00 00:00:00', 'No', 0, '24'),
(39, '008/13', 14, 6, 'Not Paid', '2013-11-21 09:59:23', '0000-00-00 00:00:00', 'No', 0, '25');

-- --------------------------------------------------------

--
-- Table structure for table `in_records`
--

CREATE TABLE IF NOT EXISTS `in_records` (
  `recid` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` bigint(12) NOT NULL,
  `serviceid` mediumint(9) NOT NULL,
  `duration` int(4) NOT NULL,
  `scope` enum('Day(s)','Week(s)','Month(s)') NOT NULL,
  `cost` bigint(20) NOT NULL,
  `sdetails` text,
  `startfrom` date NOT NULL,
  PRIMARY KEY (`recid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `in_records`
--

INSERT INTO `in_records` (`recid`, `invoiceid`, `serviceid`, `duration`, `scope`, `cost`, `sdetails`, `startfrom`) VALUES
(8, 5, 2, 3, 'Month(s)', 25000, 'Banner in the article', '2013-11-18'),
(9, 0, 0, 0, '', 0, '', '0000-00-00'),
(10, 0, 0, 0, '', 0, '', '0000-00-00'),
(11, 0, 0, 0, '', 0, '', '0000-00-00'),
(12, 0, 0, 0, '', 0, '', '0000-00-00'),
(13, 0, 0, 0, '', 0, '', '0000-00-00'),
(14, 0, 0, 0, '', 0, '', '0000-00-00'),
(15, 0, 0, 0, '', 0, '', '0000-00-00'),
(16, 0, 0, 0, '', 0, '', '0000-00-00'),
(17, 0, 0, 0, '', 0, '', '0000-00-00'),
(18, 0, 0, 0, '', 0, '', '0000-00-00'),
(19, 0, 0, 0, '', 0, '', '0000-00-00'),
(20, 0, 0, 0, '', 0, '', '0000-00-00'),
(21, 0, 0, 0, '', 0, '', '0000-00-00'),
(22, 0, 0, 0, '', 0, '', '0000-00-00'),
(23, 0, 0, 0, '', 0, '', '0000-00-00'),
(24, 0, 0, 0, '', 0, '', '0000-00-00'),
(25, 0, 0, 0, '', 0, '', '0000-00-00'),
(26, 0, 0, 0, '', 0, '', '0000-00-00'),
(27, 0, 0, 0, '', 0, '', '0000-00-00'),
(28, 0, 0, 0, '', 0, '', '0000-00-00'),
(29, 0, 0, 0, '', 0, '', '0000-00-00'),
(30, 0, 0, 0, '', 0, '', '0000-00-00'),
(50, 28, 1, 2, 'Month(s)', 600000, 'Top Banner', '0000-00-00'),
(57, 32, 3, 1, 'Month(s)', 200000, '', '0000-00-00'),
(58, 32, 6, 1, 'Month(s)', 60000, 'Baby plan', '0000-00-00'),
(59, 33, 1, 5, 'Day(s)', 21000, 'Advertising on igihe.com home page.', '0000-00-00'),
(64, 36, 4, 1, 'Month(s)', 25000, 'hirwa.rw domain registration', '0000-00-00'),
(65, 36, 1, 2, 'Month(s)', 450000, 'Home page top banner for 2 months', '0000-00-00'),
(66, 37, 2, 1, 'Month(s)', 200000, 'Article Banner', '0000-00-00'),
(67, 38, 3, 2, 'Month(s)', 300000, 'Advertising in sports section', '0000-00-00'),
(68, 39, 1, 1, 'Month(s)', 200000, 'Advertisement', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `proforma`
--

CREATE TABLE IF NOT EXISTS `proforma` (
  `proformaid` bigint(12) NOT NULL AUTO_INCREMENT,
  `proformanumber` varchar(10) NOT NULL,
  `client` varchar(140) NOT NULL,
  `userid` int(4) NOT NULL,
  `proformadate` datetime NOT NULL,
  `totalcash` varchar(120) NOT NULL,
  `inwords` varchar(100) NOT NULL,
  PRIMARY KEY (`proformaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `proforma`
--

INSERT INTO `proforma` (`proformaid`, `proformanumber`, `client`, `userid`, `proformadate`, `totalcash`, `inwords`) VALUES
(16, '002/13', '3', 6, '2013-11-18 07:50:37', 'ATFL/2013/05', 'Yes'),
(17, '003/13', '2', 6, '2013-11-18 07:54:56', '', 'Yes'),
(18, '003/13', '10', 6, '2013-11-18 14:46:19', '', 'Yes'),
(19, '004/13', '11', 6, '2013-11-19 15:03:59', '', 'Yes'),
(20, '005/13', 'Malina Interiors', 6, '2013-11-20 17:53:26', '', 'No'),
(21, '006/13', 'RSSB', 6, '2013-11-20 17:58:59', '', 'No'),
(22, '007/13', 'MTN Rwanda', 6, '2013-11-20 18:00:45', '', 'No'),
(23, '008/13', '12', 6, '2013-11-21 06:54:30', '50/22', 'Yes'),
(24, '009/13', '13', 6, '2013-11-21 07:14:25', 'TGO/RW/13/0129', 'Yes'),
(25, '010/13', '14', 6, '2013-11-21 09:57:52', 'MCO/13/002333', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `pro_records`
--

CREATE TABLE IF NOT EXISTS `pro_records` (
  `recid` bigint(11) NOT NULL AUTO_INCREMENT,
  `proformaid` bigint(12) NOT NULL,
  `serviceid` mediumint(9) NOT NULL,
  `duration` int(4) NOT NULL,
  `scope` enum('Day(s)','Week(s)','Month(s)') NOT NULL,
  `cost` bigint(20) NOT NULL,
  `sdetails` text,
  `startfrom` date NOT NULL,
  PRIMARY KEY (`recid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `pro_records`
--

INSERT INTO `pro_records` (`recid`, `proformaid`, `serviceid`, `duration`, `scope`, `cost`, `sdetails`, `startfrom`) VALUES
(10, 16, 4, 1, 'Month(s)', 25000, 'hirwa.rw domain registration', '2013-11-18'),
(11, 16, 1, 2, 'Month(s)', 450000, 'Home page top banner for 2 months', '2013-11-18'),
(12, 17, 3, 1, 'Month(s)', 200000, '', '2013-11-18'),
(13, 17, 6, 1, 'Month(s)', 60000, 'Baby plan', '2013-11-18'),
(14, 18, 1, 2, 'Month(s)', 600000, 'Top Banner', '2013-11-18'),
(15, 19, 1, 5, 'Day(s)', 21000, 'Advertising on igihe.com home page.', '2013-11-19'),
(16, 20, 4, 1, 'Day(s)', 20000, 'malina.rw domaina registration', '2013-11-20'),
(17, 21, 1, 3, 'Month(s)', 550000, 'Top banner (gif animated image)', '2013-11-20'),
(18, 22, 3, 3, 'Month(s)', 200000, 'MTN Zone banner 100X500px', '2013-11-20'),
(19, 23, 2, 1, 'Month(s)', 200000, 'Article Banner', '2013-11-21'),
(24, 24, 3, 2, 'Month(s)', 300000, 'Advertising in sports section', '2013-11-21'),
(25, 25, 1, 1, 'Month(s)', 200000, 'Advertisement', '2013-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `serviceid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `show` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serviceid`, `servicename`, `details`, `show`) VALUES
(1, 'Advertising Home Top Banner', 'Home page Top banner 900X80', 'Yes'),
(2, 'Advertising article right banner', 'Banner 50X800', 'Yes'),
(3, 'Advertising section top banner', 'Banner 900X80', 'Yes'),
(4, 'Domain registration', '.rw .net .com .org .biz .co domains', 'Yes'),
(5, '&quot;Gira Website&quot; Web development', 'Standard Web Design', 'Yes'),
(6, 'Basic Hosting', 'Basic hosting ...', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `setid` int(11) NOT NULL AUTO_INCREMENT,
  `vat` float NOT NULL,
  `showhiddenservices` enum('Yes','No') NOT NULL DEFAULT 'No',
  `defcurrency` varchar(10) NOT NULL,
  `account` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `contacts` text NOT NULL,
  `bankname` varchar(120) NOT NULL,
  `accountname` varchar(240) NOT NULL,
  `branch` varchar(240) NOT NULL,
  `swiftcode` varchar(120) NOT NULL,
  PRIMARY KEY (`setid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setid`, `vat`, `showhiddenservices`, `defcurrency`, `account`, `address`, `contacts`, `bankname`, `accountname`, `branch`, `swiftcode`) VALUES
(1, 18, 'No', 'Rwf', '0304501-51', 'PO Box:3477 Kigali-Rwanda\r\nEts Ndamage 4th floor\r\nPhones: +250 788 49 69 15\r\n	+250 788 74 29 08', 'info@igihe.com\r\nmarketing@igihe.com\r\nWebsite: www.igihe.com\r\nTIN/VAT: 767676', 'Bank of Kigali', 'Igihe Ltd', 'Town Branch', 'BKIGRWRW');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `lname` varchar(120) NOT NULL,
  `rights` varchar(20) NOT NULL,
  `poste` varchar(250) NOT NULL,
  `email` varchar(120) NOT NULL,
  `status` enum('Active','Blocked') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `fname`, `lname`, `rights`, `poste`, `email`, `status`) VALUES
(1, 'romeoboris', 'f30aa7a662c728b7407c54ae6bfd27d1', 'Romeo', 'Boris', 'Admin', 'Developer', 'boristart@gmail.com', 'Active'),
(5, 'emile', 'f30aa7a662c728b7407c54ae6bfd27d1', 'Emile', 'Murekezi', 'Admin', 'Marketing Manager', 'emurekezi@igihe.com', 'Active'),
(6, 'ange', 'f30aa7a662c728b7407c54ae6bfd27d1', 'Uwase', 'Ange', 'User', 'Administrative Secretary', 'uwase@igihe.org', 'Active');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
