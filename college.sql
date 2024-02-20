-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 02:41 PM
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
-- Database: `college`
--
CREATE DATABASE IF NOT EXISTS `college` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `college`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `1bi15cs101`
-- (See below for the actual view)
--
CREATE TABLE `1bi15cs101` (
`Subcode` char(7)
,`Test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `USN` char(10) NOT NULL,
  `SSID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`USN`, `SSID`) VALUES
('4MH12CS001', 101),
('4MH12CS023', 102),
('1BI15CS101', 103),
('4MH12CS098', 132),
('4MH12CS109', 134),
('4MH12CS056', 144);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Subcode` char(7) NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Sem` int(11) DEFAULT NULL,
  `CREDITS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Subcode`, `Title`, `Sem`, `CREDITS`) VALUES
('18CS50', 'CN', 4, 2),
('18CS52', 'DSA', 4, 4),
('18CS53', 'DBMS', 5, 4),
('18CS55', 'OS', 4, 4),
('18CS58', 'DAA', 8, 4),
('18CS82', 'AIML', 8, 4),
('18CS83', 'IOT', 8, 5),
('18CS84', 'CLOUD', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `USN` char(10) NOT NULL,
  `Subcode` char(7) NOT NULL,
  `SSID` int(11) NOT NULL,
  `Test1` int(11) NOT NULL,
  `Test2` int(11) NOT NULL,
  `Test3` int(11) NOT NULL,
  `FinalIA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`USN`, `Subcode`, `SSID`, `Test1`, `Test2`, `Test3`, `FinalIA`) VALUES
('1BI15CS101', '18CS50', 103, 25, 25, 17, 25),
('1BI15CS101', '18CS52', 103, 25, 6, 13, 19),
('4MH12CS001', '18CS53', 101, 21, 5, 17, 19),
('4MH12CS023', '18CS50', 102, 27, 15, 17, 22),
('4MH12CS056', '18CS82', 144, 29, 16, 29, 29),
('4MH12CS056', '18CS83', 144, 24, 26, 26, 26),
('4MH12CS056', '18CS84', 144, 27, 26, 25, 26.5),
('4MH12CS098', '18CS82', 132, 21, 5, 12, 16.5),
('4MH12CS098', '18CS83', 132, 21, 30, 17, 25.5),
('4MH12CS109', '18CS83', 134, 23, 12, 19, 21),
('4MH12CS109', '18CS84', 134, 23, 30, 17, 26.5);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `SSID` int(11) NOT NULL,
  `Sem` int(11) NOT NULL,
  `Sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`SSID`, `Sem`, `Sec`) VALUES
(101, 5, 'B'),
(102, 4, 'C'),
(103, 4, 'C'),
(106, 8, 'C'),
(132, 8, 'C'),
(134, 8, 'B'),
(144, 8, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `USN` char(10) NOT NULL,
  `SName` varchar(25) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `SName`, `Address`, `Phone`, `Gender`) VALUES
('1BI15CS101', 'Suha', 'Mysore', '93247', 'F'),
('1BI15CS105', 'Raj', 'Mysore', '932455', 'F'),
('4MH12CS001', 'Yash', 'Mysore', '93245', 'M'),
('4MH12CS023', 'Hani', 'Mysore', '93246', 'M'),
('4MH12CS056', 'June', 'Mysore', '95665', 'M'),
('4MH12CS098', 'Ina', 'Mysore', '956265', 'F'),
('4MH12CS109', 'Rahul', 'Mysore', '93265', 'M');

-- --------------------------------------------------------

--
-- Structure for view `1bi15cs101`
--
DROP TABLE IF EXISTS `1bi15cs101`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `1bi15cs101`  AS SELECT `iamarks`.`Subcode` AS `Subcode`, `iamarks`.`Test1` AS `Test1` FROM `iamarks` WHERE `iamarks`.`USN` = '1BI15CS101' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`USN`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`USN`,`Subcode`,`SSID`),
  ADD KEY `Subcode` (`Subcode`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`SSID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`),
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`Subcode`) REFERENCES `course` (`Subcode`),
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
