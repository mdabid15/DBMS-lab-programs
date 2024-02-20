-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 02:40 PM
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
-- Database: `movies`
--
CREATE DATABASE IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `movies`;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `Act_id` int(11) NOT NULL,
  `Act_Name` varchar(25) NOT NULL,
  `Act_Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`Act_id`, `Act_Name`, `Act_Gender`) VALUES
(300, 'KRITI', 'F'),
(301, 'DEEPIKA', 'F'),
(510, 'YASH', 'M'),
(519, 'RANBIR', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Dir_id` int(11) NOT NULL,
  `Dir_Name` varchar(25) NOT NULL,
  `Dir_Phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Dir_id`, `Dir_Name`, `Dir_Phone`) VALUES
(102, 'RAJAMOULI', '9000755'),
(103, 'KARAN JOHAR', '9000001'),
(106, 'HITCHCOCK', '9000787'),
(109, 'STEVEN SPIELBERG', '9000766');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Mov_id` int(11) NOT NULL,
  `Mov_Title` varchar(50) NOT NULL,
  `Mov_Year` year(4) NOT NULL,
  `Mov_Lang` varchar(15) NOT NULL,
  `Dir_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`Mov_id`, `Mov_Title`, `Mov_Year`, `Mov_Lang`, `Dir_id`) VALUES
(1004, 'Black water', '1979', 'English', 106),
(1008, 'KGF', '2018', 'English', 106),
(1046, 'Tamasha', '2019', 'Hindi', 109),
(1067, 'Cliff', '1988', 'English', 109),
(1089, 'RRR', '1997', 'Hindi', 102),
(1090, 'Sawariya', '2020', 'Hindi', 103);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `Act_id` int(11) NOT NULL,
  `Mov_id` int(11) NOT NULL,
  `Role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`Act_id`, `Mov_id`, `Role`) VALUES
(300, 1008, 'HEROIN'),
(300, 1089, 'HEROIN'),
(301, 1004, 'HEROIN'),
(301, 1046, 'HEROIN'),
(510, 1008, 'HERO'),
(510, 1089, 'HERO'),
(519, 1004, 'HERO'),
(519, 1046, 'HERO'),
(519, 1067, 'HERO');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Mov_id` int(11) DEFAULT NULL,
  `Rev_Stars` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Mov_id`, `Rev_Stars`) VALUES
(1008, 5),
(1046, 5),
(1067, 5),
(1067, 5),
(1089, 5),
(1004, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`Act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Dir_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`Mov_id`),
  ADD KEY `Dir_id` (`Dir_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`Act_id`,`Mov_id`),
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`Dir_id`) REFERENCES `director` (`Dir_id`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`Act_id`) REFERENCES `actor` (`Act_id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`Mov_id`) REFERENCES `movie` (`Mov_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Mov_id`) REFERENCES `movie` (`Mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
