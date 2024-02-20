-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 02:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `companys`
--
CREATE DATABASE IF NOT EXISTS `companys` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `companys`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DNO` varchar(20) NOT NULL,
  `DNAME` varchar(20) DEFAULT NULL,
  `MGR_SSN` varchar(20) DEFAULT NULL,
  `MGR_START_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNO`, `DNAME`, `MGR_SSN`, `MGR_START_DATE`) VALUES
('1', 'ACCOUNTS', 'ABC09', '2016-01-03'),
('2', 'IT', 'ABC11', '2017-02-04'),
('3', 'HR', 'ABC01', '2016-04-05'),
('4', 'HELPDESK', 'ABC10', '2017-06-03'),
('5', 'SALES', 'ABC06', '2017-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

CREATE TABLE `dlocation` (
  `DLOC` varchar(20) NOT NULL,
  `DNO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`DLOC`, `DNO`) VALUES
('BENGALURU', '1'),
('BENGALURU', '2'),
('BENGALURU', '3'),
('MYSORE', '4'),
('MYSORE', '5');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` varchar(20) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `SUPERSSN` varchar(20) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `SUPERSSN`, `DNO`) VALUES
('ABC01', 'BEN SCOTT', 'BANGALORE', 'M', 450000, NULL, '3'),
('ABC02', 'HARRY SMITH', 'BANGALORE', 'M', 500000, 'ABC03', '5'),
('ABC03', 'LEAN BAKER', 'BANGALORE', 'M', 700000, 'ABC04', '5'),
('ABC04', 'MARTIN SCOTT', 'MYSORE', 'M', 500000, 'ABC06', '5'),
('ABC05', 'RAVAN HEGDE', 'MANGALORE', 'M', 650000, 'ABC06', '5'),
('ABC06', 'GIRISH HOSUR', 'MYSORE', 'M', 450000, 'ABC07', '5'),
('ABC07', 'NEELA SHARMA', 'BANGALORE', 'F', 800000, NULL, '5'),
('ABC08', 'ADYA KOLAR', 'MANGALORE', 'F', 350000, 'ABC09', '1'),
('ABC09', 'PRASANNA KUMAR', 'MANGALORE', 'M', 300000, NULL, '1'),
('ABC10', 'VEENA KUMARI', 'MYSORE', 'M', 600000, NULL, '4'),
('ABC11', 'DEEPAK RAJ', 'BANGALORE', 'M', 500000, NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `PNO` int(11) NOT NULL,
  `PNAME` varchar(20) DEFAULT NULL,
  `PLOCATION` varchar(20) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PNO`, `PNAME`, `PLOCATION`, `DNO`) VALUES
(1000, 'IOT', 'BENGALURU', '5'),
(1001, 'CLOUD', 'BENGALURU', '5'),
(1002, 'BIGDATA', 'BENGALURU', '5'),
(1003, 'SENSORS', 'BENGALURU', '3'),
(1004, 'BANK MANAGEMENT', 'BENGALURU', '1'),
(1005, 'SALARY MANAGEMENT', 'BANGALORE', '1'),
(1006, 'OPENSTACK', 'BENGALURU', '4'),
(1007, 'SMART CITY', 'BENGALURU', '2');

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `HOURS` int(11) DEFAULT NULL,
  `SSN` varchar(20) NOT NULL,
  `PNO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`HOURS`, `SSN`, `PNO`) VALUES
(7, 'ABC01', 1003),
(4, 'ABC02', 1000),
(6, 'ABC02', 1001),
(8, 'ABC02', 1002),
(10, 'ABC03', 1000),
(6, 'ABC04', 1002),
(3, 'ABC05', 1000),
(4, 'ABC06', 1001),
(5, 'ABC07', 1002),
(5, 'ABC08', 1004),
(6, 'ABC09', 1005),
(4, 'ABC10', 1006),
(10, 'ABC11', 1007);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DNO`),
  ADD KEY `MGR_SSN` (`MGR_SSN`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`DNO`,`DLOC`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `SUPERSSN` (`SUPERSSN`),
  ADD KEY `DNO` (`DNO`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PNO`),
  ADD KEY `DNO` (`DNO`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`SSN`,`PNO`),
  ADD KEY `PNO` (`PNO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGR_SSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SUPERSSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `project` (`PNO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
