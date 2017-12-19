-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Dec 19, 2017 at 02:43 PM
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
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `inuse` int(100) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `arcades`
--

CREATE TABLE `arcades` (
`id` int(100) NOT NULL,
  `arcadeid` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(100) DEFAULT NULL,
  `actionlink` int(11) DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `longlat` varchar(100) NOT NULL,
  `phonetot` int(100) NOT NULL DEFAULT '0',
  `phonefailed` int(100) NOT NULL DEFAULT '0',
  `teamstot` int(100) NOT NULL DEFAULT '0',
  `dateplaced` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `lastused` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `arcadeid` int(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `longlat` varchar(100) NOT NULL,
  `phonetot` int(100) NOT NULL,
  `phonefail` int(100) NOT NULL,
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `score` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `highscores`
--

CREATE TABLE `highscores` (
  `linkid` varchar(100) NOT NULL DEFAULT '',
  `game1` varchar(500) DEFAULT NULL,
  `game2` varchar(500) DEFAULT NULL,
  `game3` varchar(500) DEFAULT NULL,
  `game4` varchar(500) DEFAULT NULL,
  `game5` varchar(500) DEFAULT NULL,
  `game6` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `highscores`
--

INSERT INTO `highscores` (`linkid`, `game1`, `game2`, `game3`, `game4`, `game5`, `game6`) VALUES
('bahbla', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `linkid` int(100) NOT NULL,
  `team1name` varchar(100) NOT NULL DEFAULT 'team1',
  `team1tot` int(100) NOT NULL DEFAULT '0',
  `team2name` varchar(100) NOT NULL DEFAULT 'team2',
  `team2tot` int(100) NOT NULL DEFAULT '0',
  `team3name` varchar(100) NOT NULL DEFAULT 'team3',
  `team3tot` int(100) NOT NULL DEFAULT '0',
  `team4name` varchar(100) NOT NULL DEFAULT 'team4',
  `team4tot` int(100) NOT NULL DEFAULT '0',
  `team5name` varchar(100) NOT NULL DEFAULT 'team5',
  `team5tot` int(100) NOT NULL DEFAULT '0',
  `team6name` varchar(100) NOT NULL DEFAULT 'team6',
  `team6tot` int(100) NOT NULL DEFAULT '0',
  `team7name` varchar(100) NOT NULL DEFAULT 'team7',
  `team7tot` int(100) NOT NULL DEFAULT '0',
  `team8name` varchar(100) NOT NULL DEFAULT 'team8',
  `team8tot` int(100) NOT NULL DEFAULT '0',
  `team9name` varchar(100) NOT NULL DEFAULT 'team9',
  `team9tot` int(100) NOT NULL DEFAULT '0',
  `team10name` varchar(100) NOT NULL DEFAULT 'team10',
  `team10tot` int(100) NOT NULL DEFAULT '0',
  `team11name` varchar(100) NOT NULL DEFAULT 'team11',
  `team11tot` int(100) NOT NULL DEFAULT '0'
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
-- Indexes for table `archive`
--
ALTER TABLE `archive`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `highscores`
--
ALTER TABLE `highscores`
 ADD PRIMARY KEY (`linkid`), ADD UNIQUE KEY `linkid` (`linkid`);

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
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `arcades`
--
ALTER TABLE `arcades`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
