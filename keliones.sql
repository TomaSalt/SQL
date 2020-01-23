-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2020 at 12:53 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keliones`
--

-- --------------------------------------------------------

--
-- Table structure for table `marsrutai`
--

CREATE TABLE `marsrutai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL,
  `kaina` decimal(10,2) NOT NULL,
  `trukme` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marsrutai`
--

INSERT INTO `marsrutai` (`id`, `pav`, `kaina`, `trukme`) VALUES
(1, 'Kaunas-Vilnius', '50.00', 2),
(2, 'Kaunas-Jonava', '12.00', 0.6),
(3, 'Kaunas-Klaipeda', '80.00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `marsrutai_miestai`
--

CREATE TABLE `marsrutai_miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_miesto` int(10) UNSIGNED NOT NULL,
  `id_marsruto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marsrutai_miestai`
--

INSERT INTO `marsrutai_miestai` (`id`, `id_miesto`, `id_marsruto`) VALUES
(1, 3, 1),
(2, 4, 1),
(3, 2, 1),
(4, 5, 1),
(5, 6, 1),
(6, 2, 2),
(7, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `miestai`
--

CREATE TABLE `miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_rajono` int(10) UNSIGNED DEFAULT NULL,
  `pav` varchar(256) DEFAULT NULL,
  `ilguma` float DEFAULT NULL,
  `platuma` float DEFAULT NULL,
  `gyv_sk` bigint(20) DEFAULT NULL,
  `plotas` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `miestai`
--

INSERT INTO `miestai` (`id`, `id_rajono`, `pav`, `ilguma`, `platuma`, `gyv_sk`, `plotas`) VALUES
(1, 2, 'Jonava', 60.9333, 10.6925, 30000, 13.67),
(2, 1, 'Kaunas', 54.8981, 23.9036, 270000, 157),
(3, 1, 'Rumšiškės', 0, 0, 15000, 10),
(4, 2, 'Kaišiadorys', 0, 0, 22000, 20),
(5, 2, 'Elektrenai', 0, 0, 23000, 18),
(6, NULL, 'Vievis', 0, 0, 22500, 17);

-- --------------------------------------------------------

--
-- Table structure for table `rajonai`
--

CREATE TABLE `rajonai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rajonai`
--

INSERT INTO `rajonai` (`id`, `pav`) VALUES
(1, 'Kauno'),
(2, 'Jonavos');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `marsrutai`
--
ALTER TABLE `marsrutai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marsrutai_miestai`
--
ALTER TABLE `marsrutai_miestai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marsruto` (`id_marsruto`),
  ADD KEY `id_miesto` (`id_miesto`);

--
-- Indexes for table `miestai`
--
ALTER TABLE `miestai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rajono` (`id_rajono`);

--
-- Indexes for table `rajonai`
--
ALTER TABLE `rajonai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `marsrutai`
--
ALTER TABLE `marsrutai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marsrutai_miestai`
--
ALTER TABLE `marsrutai_miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `miestai`
--
ALTER TABLE `miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rajonai`
--
ALTER TABLE `rajonai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marsrutai_miestai`
--
ALTER TABLE `marsrutai_miestai`
  ADD CONSTRAINT `marsrutai_miestai_ibfk_1` FOREIGN KEY (`id_marsruto`) REFERENCES `marsrutai` (`id`),
  ADD CONSTRAINT `marsrutai_miestai_ibfk_2` FOREIGN KEY (`id_miesto`) REFERENCES `miestai` (`id`);

--
-- Constraints for table `miestai`
--
ALTER TABLE `miestai`
  ADD CONSTRAINT `miestai_ibfk_1` FOREIGN KEY (`id_rajono`) REFERENCES `rajonai` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
