-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Nov 30, 2017 at 10:02 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ewacon`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
`id` int(100) NOT NULL,
  `actionname` varchar(100) NOT NULL,
  `arcades` varchar(100) NOT NULL,
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `inuse` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `actionname`, `arcades`, `datestart`, `dateend`, `inuse`) VALUES
(1, 'actie naam tes 1', '1,2', '080808', '080808', 1);

-- --------------------------------------------------------

--
-- Table structure for table `arcades`
--

CREATE TABLE `arcades` (
`id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `longlat` varchar(100) NOT NULL,
  `phonetot` int(100) NOT NULL,
  `phonefailed` int(100) NOT NULL,
  `teamstot` int(100) NOT NULL,
  `dateplaced` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `lastused` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(100) NOT NULL,
  `arcadeid` int(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `longlat` varchar(100) NOT NULL,
  `phonetot` int(100) NOT NULL,
  `phonefail` int(100) NOT NULL,
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `archive`
--

INSERT INTO `archive` (`id`, `arcadeid`, `location`, `longlat`, `phonetot`, `phonefail`, `datestart`, `dateend`) VALUES
(1, 1, 'Ergens', '0,0', 7, 6, '20173', '231233');

-- --------------------------------------------------------

--
-- Table structure for table `highscores`
--

CREATE TABLE `highscores` (
  `linkid` varchar(100) NOT NULL,
  `game1` varchar(500) NOT NULL,
  `game2` varchar(500) NOT NULL,
  `game3` varchar(500) NOT NULL,
  `game4` varchar(500) NOT NULL,
  `game5` varchar(500) NOT NULL,
  `game6` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `linkid` varchar(100) NOT NULL,
  `team1name` varchar(100) NOT NULL,
  `team1tot` int(100) NOT NULL,
  `team2name` varchar(100) NOT NULL,
  `team2tot` int(100) NOT NULL,
  `team3name` varchar(100) NOT NULL,
  `team3tot` int(100) NOT NULL,
  `team4name` varchar(100) NOT NULL,
  `team4tot` int(100) NOT NULL,
  `team5name` varchar(100) NOT NULL,
  `team5tot` int(100) NOT NULL,
  `team6name` varchar(100) NOT NULL,
  `team6tot` int(100) NOT NULL,
  `team7name` varchar(100) NOT NULL,
  `team7tot` int(100) NOT NULL,
  `team8name` varchar(100) NOT NULL,
  `team8tot` int(100) NOT NULL,
  `team9name` varchar(100) NOT NULL,
  `team9tot` int(100) NOT NULL,
  `team10name` varchar(100) NOT NULL,
  `team10tot` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arcades`
--
ALTER TABLE `arcades`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `highscores`
--
ALTER TABLE `highscores`
 ADD PRIMARY KEY (`linkid`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
 ADD PRIMARY KEY (`linkid`), ADD UNIQUE KEY `linkid` (`linkid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `arcades`
--
ALTER TABLE `arcades`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
