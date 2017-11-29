-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Nov 29, 2017 at 09:32 AM
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
  `lastused` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arcades`
--

INSERT INTO `arcades` (`id`, `name`, `status`, `location`, `longlat`, `phonetot`, `phonefailed`, `teamstot`, `dateplaced`, `dateend`, `lastused`) VALUES
(1, 'test1', 1, 'Eindhoven', '0,0', 15, 1, 4, '090909', '090909', '090909'),
(2, 'test2', 1, 'Roosendaal', '100,500', 20, 4, 5, '090909', '090909', '090909'),
(3, '', 0, '', '', 0, 0, 0, '', '', ''),
(4, 'bahbla', 0, 'Somewhere', '', 0, 0, 0, '', '', '');

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
  `arcadename` varchar(100) NOT NULL,
  `game1` varchar(500) NOT NULL,
  `game2` varchar(500) NOT NULL,
  `game3` varchar(500) NOT NULL,
  `game4` varchar(500) NOT NULL,
  `game5` varchar(500) NOT NULL,
  `game6` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `highscores`
--

INSERT INTO `highscores` (`arcadename`, `game1`, `game2`, `game3`, `game4`, `game5`, `game6`) VALUES
('test1', '{ "name":"John" }', '{ "name":"John" }', '{ "name":"John" }', '{ "name":"John" }', '{ "name":"John" }', '{ "name":"John" }');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(100) NOT NULL,
  `team1name` varchar(100) NOT NULL,
  `team1tot` int(100) NOT NULL,
  `team2name` varchar(100) NOT NULL,
  `team2ot` int(100) NOT NULL,
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
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team1name`, `team1tot`, `team2name`, `team2ot`, `team3name`, `team3tot`, `team4name`, `team4tot`, `team5name`, `team5tot`, `team6name`, `team6tot`, `team7name`, `team7tot`, `team8name`, `team8tot`, `team9name`, `team9tot`, `team10name`, `team10tot`) VALUES
(1, 'team1', 34, 'team2', 23, 'team3', 12, 'team4', 6, 'team5', 22, 'team6', 34, 'team7', 32, 'team8', 23, 'team9', 43, 'team10', 56);

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
 ADD PRIMARY KEY (`arcadename`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
 ADD PRIMARY KEY (`id`);

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
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
