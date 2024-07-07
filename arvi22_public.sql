-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2022 at 01:18 AM
-- Server version: 8.0.22
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arvi22_public`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int NOT NULL,
  `department_id` int NOT NULL,
  `reason` text COLLATE utf8mb4_bin NOT NULL,
  `document` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `against` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `info` text COLLATE utf8mb4_bin NOT NULL,
  `customer_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `department_id`, `reason`, `document`, `against`, `info`, `customer_id`, `status`) VALUES
(3, 5, 'asd asd asd as das d', 'team.jpg', 'asdasdas', 'asd asd as da sd as', 1, 0),
(4, 4, 'asd asd asd ', 'homedec.png', 'asdasd', 'asdasd asd as da sd asd asd a sa sda sd asd asd asdasdasd as d asd', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_bin NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `district` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `post_office` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `id_proof` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `mobile`, `dob`, `gender`, `state`, `district`, `city`, `pincode`, `post_office`, `id_proof`, `username`, `password`, `status`) VALUES
(1, 'Akshay', 'asd asdasd', '88282822828', '2024-07-03', 'Male', 'asdasd', 'asd', 'asdasd', '838383', 'asasd', 'messi.jpg', 'asdasd', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `head` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `address`, `mobile`, `username`, `password`, `head`) VALUES
(2, 'MSEB', 'Sai nagar, Arvi', '9096722806', 'asas@gmail.com', '1234', 'Mr. Mangesh Rao'),
(3, 'Civil Department', 'Shivaji Nagar, Arvi', '9096722832', 'civil', '1234', 'Mr. Ganesh Mane'),
(4, 'Agricultural', 'Krushi Bhavan, Arvi', '9282829292', 'krushi', '1234', 'Mr. Mahadev'),
(5, 'Food', 'Sabji Market, Arvi', '9282829243', 'food', 'ASAS', 'Mrs. Meena Sharma');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`) VALUES
(2, 'Telecom Department may not raise 5G reserve price concerns with Trai Telecom Department may not raise 5G reserve price concerns with Trai', 'A senior official told ET that the DoT is likely to seek clarifications by this weekend or early next week on certain issues, including on the reserve price for the millimetre wave (mmWave) in the 27.5 GHz to 28.5 GHz band that can be used both for terrestrial and satellite communication services.'),
(3, 'Maharashtra: Deputy CM Ajit Pawar disproves alleged attack on Rana couple, Somaiya Maharashtra: Deputy CM Ajit Pawar disproves alleged attack on Rana couple, Somaiya', 'Nobody should take law into their hands, and they should also not try to incite people. Why should one be attacked, everyone is free to go anywhere in the state, why should you be attacked for this? This should not have happened; there are no two opinions on this in the government,\" Pawar told journalists.'),
(4, 'Since when reciting Hanuman Chalisa has became seditious, asks BJP; backs Ranas Since when reciting Hanuman Chalisa has became seditious, asks BJP; backs Ranas', 'As the announcement triggered angry reactions from Shiv Sena supporters, many of whom laid siege to the residence of the Ranas in Mumbais Khar, the couple had to be whisked away by police. They were remanded in judicial custody by a Mumbai court on Sunday.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
