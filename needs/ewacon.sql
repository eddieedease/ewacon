-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Gegenereerd op: 11 jun 2018 om 16:29
-- Serverversie: 5.7.22-0ubuntu18.04.1
-- PHP-versie: 7.0.30-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewacon`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `actions`
--

INSERT INTO `actions` (`id`, `actionname`, `datestart`, `dateend`, `inuse`) VALUES
(10, 'Funky Phone Challenge 2017', '', '2018-01-08', 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `arcades`
--

INSERT INTO `arcades` (`id`, `arcadeid`, `name`, `status`, `actionlink`, `location`, `longlat`, `phonetot`, `phonefailed`, `teamstot`, `dateplaced`, `dateend`, `lastused`) VALUES
(26, 5, 'Hogeschool Leiden', 2, 10, 'Leiden', '52.171945, 4.469053', 50, 36, 1, '2018-01-15', '2018-02-08', '2018-02-08 11:33:18'),
(33, 8, 'TUe Green Office', 2, 0, 'Eindhoven', '51.447837, 5.487626', 2, 4, 11, '2018-02-19', '2018-04-20', '2018-02-25 11:02:45');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `archive`
--

CREATE TABLE `archive` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `actionlink` int(100) NOT NULL,
  `arcadeid` int(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `longlat` varchar(100) NOT NULL,
  `phonetot` int(100) NOT NULL,
  `phonefail` int(100) NOT NULL,
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `teamscores` longtext,
  `highscores` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `archive`
--

INSERT INTO `archive` (`id`, `name`, `actionlink`, `arcadeid`, `location`, `longlat`, `phonetot`, `phonefail`, `datestart`, `dateend`, `teamscores`, `highscores`) VALUES
(5, 'EDEASEEEEE3', 0, 99, 'Eindhoven', '51.447837, 5.487626', 2, 4, '2018-02-19', '2018-04-20', NULL, NULL),
(6, 'EDEASEEEEE2', 0, 99, 'Eindhoven', '51.447837, 5.487626', 2, 4, '2018-02-19', '2018-04-20', NULL, NULL),
(7, 'EDEASEEEEE', 0, 99, 'Eindhoven', '51.447837, 5.487626', 2, 4, '2018-02-19', '2018-04-20', NULL, NULL),
(8, 'EDTESTTT', 0, 8, 'Eindhoven', '51.447837, 5.487626', 2, 4, '2018-02-19', '2018-04-20', NULL, NULL),
(9, 'Universiteit Leiden', 10, 3, 'Leiden', '52.160603, 4.485379', 251, 96, '2018-01-15', '2018-02-08', NULL, NULL),
(10, 'Avans Hogeschool', 10, 2, 'Breda', '51.588044, 4.796566', 55, 53, '2018-01-15', '2018-02-08', NULL, NULL),
(11, 'Nimma zamelt in', 10, 4, 'Nijmegen', '51.824081, 5.864584', 114, 304, '2018-01-15', '2018-02-08', NULL, NULL),
(12, 'Funky Phone One - EA Office', 8, 1, 'Eindhoven', '51.434862, 5.432669', 14, 7, '09-01-2018', '31-12-2018', NULL, NULL),
(13, 'HAN - Hogeschool Arnhem Nijmegen', 10, 6, 'Arnhem', '51.993452, 5.950441', 5, 72, '2018-01-15', '2018-02-08', '{\"team1\":{\"name\":\"team1\",\"scoretot\":\"5\"},\"team2\":{\"name\":\"team2\",\"scoretot\":\"0\"},\"team3\":{\"name\":\"team3\",\"scoretot\":\"0\"},\"team4\":{\"name\":\"team4\",\"scoretot\":\"0\"},\"team5\":{\"name\":\"team5\",\"scoretot\":\"0\"},\"team6\":{\"name\":\"team6\",\"scoretot\":\"0\"},\"team7\":{\"name\":\"team7\",\"scoretot\":\"0\"},\"team8\":{\"name\":\"team8\",\"scoretot\":\"0\"},\"team9\":{\"name\":\"team9\",\"scoretot\":\"0\"},\"team10\":{\"name\":\"team10\",\"scoretot\":\"0\"},\"team11\":{\"name\":\"team11\",\"scoretot\":\"0\"},\"team12\":{\"name\":\"\",\"scoretot\":\"0\"},\"team13\":{\"name\":\"\",\"scoretot\":\"0\"},\"team14\":{\"name\":\"\",\"scoretot\":\"0\"},\"team15\":{\"name\":\"\",\"scoretot\":\"0\"}}', '{\"game1\":null,\"game2\":null,\"game3\":null,\"game4\":null}');

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

--
-- Gegevens worden geëxporteerd voor tabel `highscores`
--

INSERT INTO `highscores` (`linkid`, `game1`, `game2`, `game3`, `game4`, `game5`, `game6`) VALUES
('Hogeschool Leiden', '{\"name1\":\"caca\",\"score1\":\"4130\",\"name2\":\"ba\",\"score2\":\"2600\",\"name3\":\"a\",\"score3\":\"2030\",\"name4\":\"y\",\"score4\":\"1980\",\"name5\":\"mop\",\"score5\":\"1390\"}', '{\"name1\":\"merel\",\"score1\":\"795\",\"name2\":\"xyz\",\"score2\":\"630\",\"name3\":\"a\",\"score3\":\"585\",\"name4\":\"a\",\"score4\":\"465\",\"name5\":\"lucho\",\"score5\":\"330\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"@mare\",\"score1\":\"660\",\"name2\":\"tin\",\"score2\":\"510\",\"name3\":\"im\",\"score3\":\"600\",\"name4\":\"a\",\"score4\":\"370\",\"name5\":\"pop\",\"score5\":\"300\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('StartupMix @ Radboud Universiteit', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"vos\",\"score1\":\"220\",\"name2\":\"nelis\",\"score2\":\"630\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('TUe Green Office', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"jurry\",\"score1\":\"15955\",\"name2\":\"basan\",\"score2\":\"1540\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"d\",\"score1\":\"380\",\"name2\":\"bert\",\"score2\":\"310\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}');

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
  `team11tot` int(100) NOT NULL DEFAULT '0',
  `team12name` varchar(100) NOT NULL DEFAULT 'team12',
  `team12tot` int(100) NOT NULL DEFAULT '0',
  `team13name` varchar(100) NOT NULL DEFAULT 'team13',
  `team13tot` int(100) NOT NULL DEFAULT '0',
  `team14name` varchar(100) NOT NULL DEFAULT 'team14',
  `team14tot` int(100) NOT NULL DEFAULT '0',
  `team15name` varchar(100) NOT NULL DEFAULT 'team15',
  `team15tot` int(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `teams`
--

INSERT INTO `teams` (`linkid`, `team1name`, `team1tot`, `team2name`, `team2tot`, `team3name`, `team3tot`, `team4name`, `team4tot`, `team5name`, `team5tot`, `team6name`, `team6tot`, `team7name`, `team7tot`, `team8name`, `team8tot`, `team9name`, `team9tot`, `team10name`, `team10tot`, `team11name`, `team11tot`, `team12name`, `team12tot`, `team13name`, `team13tot`, `team14name`, `team14tot`, `team15name`, `team15tot`) VALUES
('Hogeschool Leiden', 'team1', 50, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0, '', 0, '', 0, '', 0, '', 0),
('StartupMix @ Radboud Universiteit', 'team1', 114, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0, '', 0, '', 0, '', 0, '', 0),
('TUe Green Office', 'team1', 0, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 1, 'team9', 4, 'team10', 0, 'team11', 0, 'team12', 0, 'team13', 0, 'team14', 0, 'team15', 0);

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
  ADD PRIMARY KEY (`linkid`),
  ADD UNIQUE KEY `linkid` (`linkid`);

--
-- Indexen voor tabel `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`linkid`),
  ADD UNIQUE KEY `linkid` (`linkid`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT voor een tabel `arcades`
--
ALTER TABLE `arcades`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT voor een tabel `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
