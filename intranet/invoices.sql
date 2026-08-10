-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2013 at 08:17 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clientid`, `clientname`, `contactname`, `address`, `phone`, `email`) VALUES
(1, 'Rwanda Mountain Tea', 'U. Jacques', 'Nyabugogo', '0788123456', 'rwandatea@gmail.com'),
(2, 'Petrocom Rwanda', 'M. Jules', 'Kinamba', '0788654321', 'petrocom@gmail.com'),
(3, 'Almond Tree Films Rwanda', 'Richard Mugawaneza', 'Kabeza', '0788434242', 'richmugwa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `invoiceid` bigint(12) NOT NULL AUTO_INCREMENT,
  `invoicenumber` varchar(10) NOT NULL,
  `clientid` mediumint(9) NOT NULL,
  `userid` int(4) NOT NULL,
  `status` enum('Paid','Not Paid','In Progress') NOT NULL,
  `invdate` datetime NOT NULL,
  `remind_date` datetime NOT NULL,
  `remindstatus` enum('Yes','No') NOT NULL,
  `totalcash` float NOT NULL,
  `inwords` varchar(2000) NOT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoiceid`, `invoicenumber`, `clientid`, `userid`, `status`, `invdate`, `remind_date`, `remindstatus`, `totalcash`, `inwords`) VALUES
(1, '001/13', 2, 5, 'Not Paid', '2013-11-08 00:00:00', '0000-00-00 00:00:00', 'No', 0, '-'),
(2, '002/13', 3, 6, 'Not Paid', '2013-11-08 00:00:00', '0000-00-00 00:00:00', 'No', 0, '-');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `in_records`
--

INSERT INTO `in_records` (`recid`, `invoiceid`, `serviceid`, `duration`, `scope`, `cost`, `sdetails`, `startfrom`) VALUES
(1, 1, 1, 3, 'Month(s)', 600000, 'Advertising on the home page.Place: Top banner', '2013-11-08'),
(2, 1, 4, 1, 'Day(s)', 15000, 'Registering petrocom.com TLD', '2013-11-08'),
(3, 1, 5, 1, 'Day(s)', 150000, 'basic web design and testing', '2013-11-08'),
(4, 2, 4, 1, 'Month(s)', 15000, 'Domain registration', '2013-11-08'),
(5, 2, 6, 1, 'Month(s)', 60000, '', '2013-11-08');

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
  PRIMARY KEY (`setid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setid`, `vat`, `showhiddenservices`, `defcurrency`, `account`, `address`, `contacts`) VALUES
(1, 18, 'No', 'Rwf', '0304501-51/Rwf/BK', 'PO Box:3477 Kigali-Rwanda\r\nEts Ndamage 4th floor\r\nPhones: +250 788 49 69 15\r\n	+250 788 74 29 08', 'info@igihe.com\r\nmarketing@igihe.com\r\nWebsite: www.igihe.com\r\nTIN/VAT: 767676');

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
(5, 'emile', '202cb962ac59075b964b07152d234b70', 'Emile', 'Murekezi', 'Admin', 'Marketing Manager', 'emurekezi@igihe.com', 'Active'),
(6, 'ange', '38f629170ac3ab74b9d6d2cc411c2f3c', 'Uwase', 'Ange', 'User', 'Administrative Secretary', 'uwase@igihe.org', 'Active');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
