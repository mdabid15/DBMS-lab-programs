-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 02:38 PM
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
-- Database: `library1`
--
CREATE DATABASE IF NOT EXISTS `library1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library1`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BOOK_ID` int(11) NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `PUB_YEAR` varchar(20) DEFAULT NULL,
  `PUB_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BOOK_ID`, `TITLE`, `PUB_YEAR`, `PUB_NAME`) VALUES
(1, 'BASICS OF EXCEL', 'JAN-2017', 'SAPNA'),
(2, 'PROGRAMMING MINDSET', 'JUN-2018', 'PLANETZ'),
(4, 'DBMS FOR BEGINNERS', 'SEP-2015', 'PLANETZ'),
(5, 'WEB SERVICES', 'MAY-2017', 'OZONE');

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `AUTHOR_NAME` varchar(20) NOT NULL,
  `BOOK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`AUTHOR_NAME`, `BOOK_ID`) VALUES
('SRI DEVI', 1),
('DEEPAK', 2),
('SWATHI', 4),
('PRATHIMA', 5);

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `NO_OF_COPIES` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `PROGRAMME_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`NO_OF_COPIES`, `BOOK_ID`, `PROGRAMME_ID`) VALUES
(10, 1, 100),
(16, 1, 101),
(20, 2, 102),
(6, 2, 103),
(3, 4, 101),
(7, 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `BOOK_ID` int(11) NOT NULL,
  `PROGRAMME_ID` int(11) NOT NULL,
  `CARD_NO` int(11) NOT NULL,
  `DATE_OUT` date DEFAULT NULL,
  `DUE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`BOOK_ID`, `PROGRAMME_ID`, `CARD_NO`, `DATE_OUT`, `DUE_DATE`) VALUES
(1, 100, 501, '2017-01-01', '2017-01-31'),
(1, 101, 504, '2017-04-09', '2017-07-08'),
(2, 103, 501, '2017-02-21', '2017-04-21'),
(4, 101, 501, '2017-03-11', '2017-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `CARD_NO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`CARD_NO`) VALUES
(500),
(501),
(502),
(503),
(504);

-- --------------------------------------------------------

--
-- Table structure for table `library_programme`
--

CREATE TABLE `library_programme` (
  `PROGRAMME_ID` int(11) NOT NULL,
  `PROGRAMME_NAME` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_programme`
--

INSERT INTO `library_programme` (`PROGRAMME_ID`, `PROGRAMME_NAME`, `ADDRESS`) VALUES
(100, 'HSR LAYOUT', 'BANGALORE'),
(101, 'KENGERI', 'BANGALORE'),
(102, 'BANASHANKARI', 'BANGALORE'),
(103, 'SHANKARA NAGAR', 'MANGALORE'),
(104, 'MANIPAL', 'UDUPI');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `NAME` varchar(20) NOT NULL,
  `PHONE` int(11) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`NAME`, `PHONE`, `ADDRESS`) VALUES
('OZONE', 931313131, 'CHENNAI'),
('PEARSON', 913131313, 'HYDERABAD'),
('PENGUIN', 921212121, 'NEW YORK'),
('PLANETZ', 914141414, 'BANGALORE'),
('SAPNA', 912121212, 'BANGALORE');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_books`
-- (See below for the actual view)
--
CREATE TABLE `v_books` (
`BOOK_ID` int(11)
,`TITLE` varchar(20)
,`NO_OF_COPIES` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_publication`
-- (See below for the actual view)
--
CREATE TABLE `v_publication` (
`PUB_YEAR` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v_books`
--
DROP TABLE IF EXISTS `v_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_books`  AS SELECT `b`.`BOOK_ID` AS `BOOK_ID`, `b`.`TITLE` AS `TITLE`, `c`.`NO_OF_COPIES` AS `NO_OF_COPIES` FROM ((`book` `b` join `book_copies` `c`) join `library_programme` `l`) WHERE `b`.`BOOK_ID` = `c`.`BOOK_ID` AND `c`.`PROGRAMME_ID` = `l`.`PROGRAMME_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `v_publication`
--
DROP TABLE IF EXISTS `v_publication`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_publication`  AS SELECT `book`.`PUB_YEAR` AS `PUB_YEAR` FROM `book` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BOOK_ID`),
  ADD KEY `PUB_NAME` (`PUB_NAME`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`BOOK_ID`,`AUTHOR_NAME`);

--
-- Indexes for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD PRIMARY KEY (`BOOK_ID`,`PROGRAMME_ID`),
  ADD KEY `PROGRAMME_ID` (`PROGRAMME_ID`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`BOOK_ID`,`PROGRAMME_ID`,`CARD_NO`),
  ADD KEY `PROGRAMME_ID` (`PROGRAMME_ID`),
  ADD KEY `CARD_NO` (`CARD_NO`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`CARD_NO`);

--
-- Indexes for table `library_programme`
--
ALTER TABLE `library_programme`
  ADD PRIMARY KEY (`PROGRAMME_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`NAME`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PUB_NAME`) REFERENCES `publisher` (`NAME`) ON DELETE CASCADE;

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`BOOK_ID`) ON DELETE CASCADE;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`BOOK_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`PROGRAMME_ID`) REFERENCES `library_programme` (`PROGRAMME_ID`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`BOOK_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`PROGRAMME_ID`) REFERENCES `library_programme` (`PROGRAMME_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_3` FOREIGN KEY (`CARD_NO`) REFERENCES `card` (`CARD_NO`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
