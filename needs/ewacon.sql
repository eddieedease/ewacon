-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Machine: localhost:8889
-- Gegenereerd op: 09 jan 2018 om 14:17
-- Serverversie: 5.5.38
-- PHP-versie: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `ewacon`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `actions`
--

CREATE TABLE `actions` (
`id` int(100) NOT NULL,
  `actionname` varchar(100) NOT NULL,
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `inuse` int(100) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `arcades`
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `archive`
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
-- Tabelstructuur voor tabel `highscores`
--

CREATE TABLE `highscores` (
  `linkid` varchar(100) NOT NULL DEFAULT '',
  `game1` varchar(500) DEFAULT '{"name1":"","score1":"","name2":"","score2":"","name3":"","score3":"","name4":"","score4":"","name5":"","score5":""}',
  `game2` varchar(500) DEFAULT '{"name1":"","score1":"","name2":"","score2":"","name3":"","score3":"","name4":"","score4":"","name5":"","score5":""}',
  `game3` varchar(500) DEFAULT '{"name1":"","score1":"","name2":"","score2":"","name3":"","score3":"","name4":"","score4":"","name5":"","score5":""}',
  `game4` varchar(500) DEFAULT '{"name1":"","score1":"","name2":"","score2":"","name3":"","score3":"","name4":"","score4":"","name5":"","score5":""}',
  `game5` varchar(500) DEFAULT '{"name1":"","score1":"","name2":"","score2":"","name3":"","score3":"","name4":"","score4":"","name5":"","score5":""}',
  `game6` varchar(500) DEFAULT '{"name1":"","score1":"","name2":"","score2":"","name3":"","score3":"","name4":"","score4":"","name5":"","score5":""}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `teams`
--

CREATE TABLE `teams` (
  `linkid` varchar(100) NOT NULL,
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
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `actions`
--
ALTER TABLE `actions`
 ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `arcades`
--
ALTER TABLE `arcades`
 ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `archive`
--
ALTER TABLE `archive`
 ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `highscores`
--
ALTER TABLE `highscores`
 ADD PRIMARY KEY (`linkid`), ADD UNIQUE KEY `linkid` (`linkid`);

--
-- Indexen voor tabel `teams`
--
ALTER TABLE `teams`
 ADD PRIMARY KEY (`linkid`), ADD UNIQUE KEY `linkid` (`linkid`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `actions`
--
ALTER TABLE `actions`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `arcades`
--
ALTER TABLE `arcades`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
