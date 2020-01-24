-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2020 at 01:22 PM
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
-- Database: `filmu_duomenu_baze`
--

-- --------------------------------------------------------

--
-- Table structure for table `asmenys`
--

CREATE TABLE `asmenys` (
  `id` int(10) UNSIGNED NOT NULL,
  `vardas` varchar(256) NOT NULL,
  `pavarde` varchar(256) NOT NULL,
  `gim_metai` int(10) NOT NULL,
  `salis` varchar(256) NOT NULL,
  `tautybe` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asmenys`
--

INSERT INTO `asmenys` (`id`, `vardas`, `pavarde`, `gim_metai`, `salis`, `tautybe`) VALUES
(1, 'Peter', 'Jackson', 1961, 'Naujoji Zelandija', 'zelandietis'),
(2, 'Fran', 'Walsh', 1959, 'Naujoji Zelandija', 'zelandietis'),
(3, 'Orlando', 'Bloom', 1977, 'Anglija', 'anglas'),
(4, 'Elijah', 'Wood', 1981, 'Amerika', 'amerikietis'),
(5, 'Howard', 'Shore', 1946, 'Kanada', 'kanadietis'),
(6, 'Andrew', 'Lesnie', 1956, 'Australija', 'australas'),
(7, 'David', 'Fincher', 1962, 'Amerika', 'amerikietis'),
(8, 'Jim', 'Uhls', 1957, 'Amerika', 'amerikietis'),
(9, 'Arnon', 'Milchan', 1944, 'Izraelis', 'palestinietis'),
(10, 'Edward', 'Norton', 1969, 'Amerika', 'amerikietis'),
(11, 'Brad', 'Pitt', 1963, 'Amerika', 'amerikietis'),
(12, 'Dust', 'Brothers', 0, '', ''),
(13, 'Jeff', 'Cronenweth', 1962, 'Amerika', 'amerikietis'),
(14, 'Christopher', 'Nolan', 1970, 'Anglija', 'anglas'),
(15, 'Chris', 'Brigham', 0, '', ''),
(16, 'Leonardo', 'DiCaprio', 1974, 'Amerika', 'amerikietis'),
(17, 'Joseph', 'Gordon-Levitt', 1981, 'Amerika', 'amerikietis'),
(18, 'Hans', 'Zimmer', 1957, 'Vokietija', 'vokietis'),
(19, 'Wally', 'Pfister', 1961, 'Amerika', 'amerikietis'),
(20, 'Irvin', 'Kershner', 1923, 'Amerika', 'amerikietis'),
(21, 'George', 'Lucas', 1944, 'Amerika', 'amerikietis'),
(22, 'Mark', 'Hamill', 1951, 'Amerika', 'amerikietis'),
(23, 'Leigh', 'Brackett', 1915, 'Amerika', 'amerikietis'),
(24, 'Harrison', 'Ford', 1942, 'Amerika', 'amerikietis'),
(25, 'John', 'Williams', 1932, 'Amerika', 'amerikietis'),
(26, 'Peter', 'Suschitzky', 1941, 'Lenkija', 'lenkas'),
(27, 'Todd', 'Phillips', 1970, 'Amerika', 'amerikietis'),
(28, 'Joaquin', 'Phoenix', 1974, 'Puerto Rikas', 'puertorikietis'),
(29, 'Robert', 'De Niro', 1943, 'Amerika', 'amerikietis'),
(30, 'Hildur', 'Guðnadóttir', 1982, 'Islandija', 'islandietis'),
(31, 'Lawrence', 'Sher', 1970, 'Amerika', 'amerikietis'),
(32, 'James', 'Cameron', 1954, 'Kanada', 'kanadietis'),
(33, 'Arnold', 'Schwarzenegger', 1947, 'Austrija', 'austras'),
(34, 'Linda', 'Hamilton', 1956, 'Amerika', 'amerikietis'),
(35, 'Brad', 'Fiedel', 1951, 'Amerika', 'amerikietis'),
(36, 'Adam', 'Greenberg', 1939, 'Lenkija', 'lenkas'),
(37, 'Ridley', 'Scott', 1937, 'Anglija', 'anglas'),
(38, 'David', 'Franzoni', 1947, 'Amerika', 'amerikietis'),
(39, 'Russell', 'Crowe', 1964, 'Naujoji Zelandija', 'zelandietis'),
(40, 'John', 'Mathieson', 1961, 'Anglija', 'anglas'),
(41, 'Aaron', 'Ryder', 1971, 'Amerika', 'amerikietis'),
(42, 'Guy', 'Pearce', 1967, 'Anglija', 'anglas'),
(43, 'Carrie-Anne', 'Moss', 1967, 'Kanada', 'kanadietis'),
(44, 'David', 'Julyan', 1967, 'Anglija', 'anglas');

-- --------------------------------------------------------

--
-- Table structure for table `filmai`
--

CREATE TABLE `filmai` (
  `id` int(10) UNSIGNED NOT NULL,
  `filmo_pav` varchar(256) NOT NULL,
  `metai` int(11) NOT NULL,
  `trukme` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filmai`
--

INSERT INTO `filmai` (`id`, `filmo_pav`, `metai`, `trukme`) VALUES
(1, 'The Lord of the Rings: The Return of the King', 2003, '3'),
(2, 'Fight Club', 1999, '2'),
(3, 'Inception', 2010, '2'),
(4, 'Star Wars: Episode V - The Empire Strikes Back', 1980, '2'),
(5, 'Joker', 2019, '2'),
(6, 'Terminator 2: Judgment Day', 1991, '2'),
(7, 'Gladiator', 2000, '2'),
(8, 'Memento', 2000, '2');

-- --------------------------------------------------------

--
-- Table structure for table `filmai_asmenys`
--

CREATE TABLE `filmai_asmenys` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_filmo` int(11) NOT NULL,
  `id_asmens` int(11) NOT NULL,
  `role` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filmai_asmenys`
--

INSERT INTO `filmai_asmenys` (`id`, `id_filmo`, `id_asmens`, `role`) VALUES
(1, 1, 1, 'direktorius'),
(2, 1, 1, 'prodiuseris'),
(3, 1, 2, 'scenaristas'),
(4, 1, 3, 'aktorius'),
(5, 1, 4, 'aktorius'),
(6, 1, 5, 'kompozitorius'),
(7, 1, 6, 'kinematografas'),
(8, 2, 7, 'direktorius'),
(9, 2, 9, 'prodiuseris'),
(10, 2, 8, 'scenaristas'),
(13, 2, 11, 'aktorius'),
(14, 2, 10, 'aktorius'),
(15, 2, 12, 'kompozitorius'),
(16, 2, 13, 'kinematografas'),
(17, 3, 14, 'direktorius'),
(18, 3, 15, 'prodiuseris'),
(19, 3, 14, 'scenaristas'),
(20, 3, 16, 'aktorius'),
(21, 3, 17, 'aktorius'),
(22, 3, 18, 'kompozitorius'),
(23, 3, 19, 'kinematografas'),
(24, 4, 20, 'direktorius'),
(25, 4, 21, 'prodiuseris'),
(26, 4, 23, 'scenaristas'),
(27, 4, 22, 'aktorius'),
(28, 4, 24, 'aktorius'),
(29, 4, 25, 'kompozitorius'),
(30, 4, 26, 'kinematografas'),
(31, 5, 27, 'direktorius'),
(32, 5, 27, 'prodiuseris'),
(33, 5, 27, 'scenaristas'),
(34, 5, 28, 'aktorius'),
(35, 5, 29, 'aktorius'),
(36, 5, 30, 'kompozitorius'),
(37, 5, 31, 'kinematografas'),
(38, 6, 32, 'direktorius'),
(39, 6, 32, 'prodiuseris'),
(40, 6, 32, 'scenaristas'),
(41, 6, 33, 'aktorius'),
(42, 6, 34, 'aktorius'),
(43, 6, 35, 'kompozitorius'),
(44, 6, 36, 'kinematografas'),
(45, 7, 37, 'direktorius'),
(46, 7, 38, 'prodiuseris'),
(47, 7, 38, 'scenaristas'),
(48, 7, 39, 'aktorius'),
(49, 7, 28, 'aktorius'),
(50, 7, 18, 'kompozitorius'),
(51, 7, 40, 'kinematografas'),
(52, 8, 14, 'direktorius'),
(53, 8, 41, 'prodiuseris'),
(54, 8, 14, 'scenaristas'),
(55, 8, 42, 'aktorius'),
(56, 8, 43, 'aktorius'),
(57, 8, 44, 'kompozitorius'),
(58, 8, 19, 'kinematografas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asmenys`
--
ALTER TABLE `asmenys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filmai`
--
ALTER TABLE `filmai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filmai_asmenys`
--
ALTER TABLE `filmai_asmenys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asmenys`
--
ALTER TABLE `asmenys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `filmai`
--
ALTER TABLE `filmai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `filmai_asmenys`
--
ALTER TABLE `filmai_asmenys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
