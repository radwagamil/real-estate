-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2018 at 07:42 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.0.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `istanbul_real_estate`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `username` varchar(300) NOT NULL,
  `hashed_password` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_super` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `username`, `hashed_password`, `created_at`, `updated_at`, `is_super`) VALUES
(1, 'Mohammed Saudi', 'msaudi.cse@gmail.com', 'msaudi', '$2y$10$jzrGynzH38vA4dRgTYK7H.2ToZEMbHmAvQyxCaGrXwwDazZlT7xQi', '2018-12-22 13:37:20', '2018-12-22 13:37:20', 0),
(3, 'radwa gamil', 'radwa@gmail.com', 'roziii', '$2y$10$32hLLApPKr2fn2lyGdkS1uRiLtLzB0i.YDocsJxMFMdlcKnwZY9UC', '2018-12-22 13:43:40', '2018-12-22 13:43:40', 0),
(4, 'Asmaa gamal', 'asmaa@gmail.com', 'Ayyasha', '$2y$10$ckuEGFW.iv0nj2M6s9XV6.ZvQeSv9pquwuL7mkpbE.pMsfF.G6rQq', '2018-12-22 13:56:28', '2018-12-22 13:56:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` double NOT NULL,
  `longitude` varchar(300) NOT NULL,
  `latitude` varchar(300) NOT NULL,
  `num_of_view` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `propriety_service`
--

CREATE TABLE `propriety_service` (
  `propriety_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_around`
--

CREATE TABLE `service_around` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `propriety_service`
--
ALTER TABLE `propriety_service`
  ADD KEY `propriety_id` (`propriety_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_around`
--
ALTER TABLE `service_around`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_around`
--
ALTER TABLE `service_around`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `property_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

--
-- Constraints for table `propriety_service`
--
ALTER TABLE `propriety_service`
  ADD CONSTRAINT `propriety_service_ibfk_1` FOREIGN KEY (`propriety_id`) REFERENCES `property` (`id`),
  ADD CONSTRAINT `propriety_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service_around` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
