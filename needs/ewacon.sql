-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Dec 06, 2017 at 09:46 AM
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
  `inuse` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `actionname`, `datestart`, `dateend`, `inuse`) VALUES
(2, 'Actieee ', '', '', 1),
(3, 'Actieee 2', '', '', 1),
(4, 'asdfasw', '2017-12-29', '', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arcades`
--

INSERT INTO `arcades` (`id`, `name`, `status`, `location`, `longlat`, `phonetot`, `phonefailed`, `teamstot`, `dateplaced`, `dateend`, `lastused`) VALUES
(11, 'Klokgebouw', 2, 'Klokgebouw', '51.448929, 5.457522', 12, 2, 2, '2017-12-08', '2017-12-28', '2017-12-05 09:31:40'),
(13, 'Kast Yeihais', 2, 'error', '3', 0, 0, 2, '2017-12-08', '2017-12-04', '2017-12-05 09:36:27'),
(15, 'sdfsdfsdfsdfsdfsfsdf', 2, 'sdfs', '', 0, 0, 0, '', '', '2017-12-05 09:36:38'),
(17, 'Tanne', 2, 'test', 'undefined', 0, 0, 3, '2017-12-09', '2017-12-16', '2017-12-04 20:31:08'),
(18, 'Kast Timmy', 2, 'Eindhovuhhh', '51.433100, 5.432181', 0, 0, 4, '2017-12-16', '2017-12-29', '2017-12-05 08:49:26'),
(19, 'Afgebouwd 20-12 112', 1, 'sdfds', '3', 0, 0, 2, '2017-12-08', '2017-12-04', '2017-12-05 10:03:17'),
(20, 'saf', 1, '', '', 0, 0, 0, '', '', '2017-12-06 08:36:59');

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

--
-- Dumping data for table `archive`
--

INSERT INTO `archive` (`id`, `type`, `arcadeid`, `location`, `longlat`, `phonetot`, `phonefail`, `datestart`, `dateend`, `score`) VALUES
(1, '', 1, 'Ergens', '0,0', 7, 6, '20173', '231233', '');

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

--
-- Dumping data for table `highscores`
--

INSERT INTO `highscores` (`linkid`, `game1`, `game2`, `game3`, `game4`, `game5`, `game6`) VALUES
('Kast Timmy', '', '', '', '', '', ''),
('Kast Yeihais', '', '', '', '', '', ''),
('Klokgebouw', '', '', '', '', '', ''),
('saf', '', '', '', '', '', ''),
('sdfs', '', '', '', '', '', ''),
('Tanne', '', '', '', '', '', ''),
('yoo', '', '', '', '', '', '');

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
  `team10tot` int(100) NOT NULL,
  `team11name` varchar(100) NOT NULL,
  `team11tot` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`linkid`, `team1name`, `team1tot`, `team2name`, `team2tot`, `team3name`, `team3tot`, `team4name`, `team4tot`, `team5name`, `team5tot`, `team6name`, `team6tot`, `team7name`, `team7tot`, `team8name`, `team8tot`, `team9name`, `team9tot`, `team10name`, `team10tot`, `team11name`, `team11tot`) VALUES
('Kast Timmy', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0),
('Kast Yeihais', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0),
('Klokgebouw', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0),
('saf', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0),
('sdfs', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0),
('Tanne', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0),
('yoo', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0);

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
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `arcades`
--
ALTER TABLE `arcades`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
