-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 02:31 PM
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
-- Database: `salesmen`
--
CREATE DATABASE IF NOT EXISTS `salesmen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `salesmen`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `Cust_Name` varchar(25) NOT NULL,
  `City` varchar(15) NOT NULL,
  `Grade` int(11) NOT NULL,
  `Salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_id`, `Cust_Name`, `City`, `Grade`, `Salesman_id`) VALUES
(10, 'PREETHI', 'BANGALORE', 100, NULL),
(11, 'VIVEK', 'MANGALORE', 300, NULL),
(12, 'BHASKAR', 'CHENNAI', 400, 2000),
(13, 'CHETHAN', 'BANGALORE', 200, 2000),
(14, 'MAMATHA', 'BANGALORE', 400, 3000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `highorder`
-- (See below for the actual view)
--
CREATE TABLE `highorder` (
`Salesman_id` int(11)
,`Customer_id` int(11)
,`Purchase_Amt` int(11)
,`Ord_Date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Ord_No` int(11) NOT NULL,
  `Purchase_Amt` int(11) NOT NULL,
  `Ord_Date` date NOT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Ord_No`, `Purchase_Amt`, `Ord_Date`, `Customer_id`, `Salesman_id`) VALUES
(51, 450, '0000-00-00', 10, 2000),
(52, 1000, '0000-00-00', 13, 2000),
(53, 3500, '0000-00-00', 14, 3000),
(54, 550, '0000-00-00', 12, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `Salesman_id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `City` varchar(15) NOT NULL,
  `Commission` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`Salesman_id`, `Name`, `City`, `Commission`) VALUES
(2000, 'RAVI', 'BANGALORE', 20),
(3000, 'KUMAR', 'MYSORE', 15),
(4000, 'SMITH', 'DELHI', 30),
(5000, 'HARSHA', 'HYDRABAD', 15);

-- --------------------------------------------------------

--
-- Structure for view `highorder`
--
DROP TABLE IF EXISTS `highorder`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `highorder`  AS SELECT `x`.`Salesman_id` AS `Salesman_id`, `x`.`Customer_id` AS `Customer_id`, `x`.`Purchase_Amt` AS `Purchase_Amt`, `x`.`Ord_Date` AS `Ord_Date` FROM `orders` AS `x` WHERE `x`.`Purchase_Amt` = (select max(`y`.`Purchase_Amt`) from `orders` `y` where `x`.`Ord_Date` = `y`.`Ord_Date`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD KEY `Salesman_id` (`Salesman_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Ord_No`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Salesman_id` (`Salesman_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`Salesman_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Salesman_id`) REFERENCES `salesman` (`Salesman_id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Salesman_id`) REFERENCES `salesman` (`Salesman_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
