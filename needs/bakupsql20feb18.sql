-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 20 feb 2018 om 10:18
-- Serverversie: 10.2.7-MariaDB
-- PHP-versie: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jorisxt179_ewacon`
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
  `inuse` int(100) NOT NULL DEFAULT 1
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
  `phonetot` int(100) NOT NULL DEFAULT 0,
  `phonefailed` int(100) NOT NULL DEFAULT 0,
  `teamstot` int(100) NOT NULL DEFAULT 0,
  `dateplaced` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `lastused` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `arcades`
--

INSERT INTO `arcades` (`id`, `arcadeid`, `name`, `status`, `actionlink`, `location`, `longlat`, `phonetot`, `phonefailed`, `teamstot`, `dateplaced`, `dateend`, `lastused`) VALUES
(25, 1, 'Funky Phone One - EA Office', 2, 8, 'Eindhoven', '51.434862, 5.432669', 14, 7, 11, '09-01-2018', '31-12-2018', '2018-02-18 13:01:10'),
(26, 5, 'Hogeschool Leiden', 2, 10, 'Leiden', '52.171945, 4.469053', 50, 36, 1, '2018-01-15', '2018-02-08', '2018-02-08 11:33:18'),
(27, 4, 'Nimma zamelt in', 2, 10, 'Nijmegen', '51.824081, 5.864584', 114, 304, 1, '2018-01-15', '2018-02-08', '2018-02-07 15:48:57'),
(28, 3, 'Universiteit Leiden', 2, 10, 'Leiden', '52.160603, 4.485379', 251, 96, 1, '2018-01-15', '2018-02-08', '2018-02-08 17:08:53'),
(29, 2, 'Avans Hogeschool', 2, 10, 'Breda', '51.588044, 4.796566', 55, 53, 1, '2018-01-15', '2018-02-08', '2018-02-08 17:10:07'),
(30, 6, 'HAN - Hogeschool Arnhem Nijmegen', 2, 10, 'Arnhem', '51.993452, 5.950441', 5, 72, 1, '2018-01-15', '2018-02-08', '2018-01-29 16:04:31'),
(31, 7, 'TU/e Green Office', 2, 0, 'Eindhoven', '51.451691, 5.492258', 1, 6, 10, '2018-02-19', '2018-04-20', '2018-02-20 08:37:50');

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

--
-- Gegevens worden geëxporteerd voor tabel `highscores`
--

INSERT INTO `highscores` (`linkid`, `game1`, `game2`, `game3`, `game4`, `game5`, `game6`) VALUES
('Avans Hogeschool', '{\"name1\":\"rikmi\",\"score1\":\"5180\",\"name2\":\"rikmi\",\"score2\":\"4240\",\"name3\":\"mau\",\"score3\":\"2710\",\"name4\":\"b\",\"score4\":\"1700\",\"name5\":\"a\",\"score5\":\"1370\"}', '{\"name1\":\"dylan\",\"score1\":\"1005\",\"name2\":\"a@\",\"score2\":\"780\",\"name3\":\"koen\",\"score3\":\"765\",\"name4\":\"aw\",\"score4\":\"585\",\"name5\":\"y\",\"score5\":\"510\"}', '{\"name1\":\"mau\",\"score1\":\"3125\",\"name2\":\"janni\",\"score2\":\"1030\",\"name3\":\"a\",\"score3\":\"480\",\"name4\":\"ma\",\"score4\":\"470\",\"name5\":\"pv\",\"score5\":\"300\"}', '{\"name1\":\"mau\",\"score1\":\"1360\",\"name2\":\"nike\",\"score2\":\"1170\",\"name3\":\"a\",\"score3\":\"770\",\"name4\":\"ece\",\"score4\":\"1110\",\"name5\":\"ece\",\"score5\":\"510\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('Funky Phone One - EA Office', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"joris\",\"score1\":\"1185\",\"name2\":\".....\",\"score2\":\"0\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"benta\",\"score1\":\"340\",\"name2\":\".....\",\"score2\":\"0\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('HAN - Hogeschool Arnhem Nijmegen', '{\"name1\":\"baas\",\"score1\":\"890\",\"name2\":\".....\",\"score2\":\"0\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"a\",\"score1\":\"165\",\"name2\":\".....\",\"score2\":\"0\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"a\",\"score1\":\"90\",\"name2\":\"b\",\"score2\":\"70\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('Hogeschool Leiden', '{\"name1\":\"caca\",\"score1\":\"4130\",\"name2\":\"ba\",\"score2\":\"2600\",\"name3\":\"a\",\"score3\":\"2030\",\"name4\":\"y\",\"score4\":\"1980\",\"name5\":\"mop\",\"score5\":\"1390\"}', '{\"name1\":\"merel\",\"score1\":\"795\",\"name2\":\"xyz\",\"score2\":\"630\",\"name3\":\"a\",\"score3\":\"585\",\"name4\":\"a\",\"score4\":\"465\",\"name5\":\"lucho\",\"score5\":\"330\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"@mare\",\"score1\":\"660\",\"name2\":\"tin\",\"score2\":\"510\",\"name3\":\"im\",\"score3\":\"600\",\"name4\":\"a\",\"score4\":\"370\",\"name5\":\"pop\",\"score5\":\"300\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('StartupMix @ Radboud Universiteit', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"vos\",\"score1\":\"220\",\"name2\":\"nelis\",\"score2\":\"630\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('TU/e Green Office', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"jip\",\"score1\":\"990\",\"name2\":\"jip\",\"score2\":\"985\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"erwin\",\"score1\":\"310\",\"name2\":\".....\",\"score2\":\"0\",\"name3\":\".....\",\"score3\":\"0\",\"name4\":\".....\",\"score4\":\"0\",\"name5\":\".....\",\"score5\":\"0\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}'),
('Universiteit Leiden', '{\"name1\":\"p\",\"score1\":\"4170\",\"name2\":\"grkey\",\"score2\":\"3570\",\"name3\":\"nemo\",\"score3\":\"2990\",\"name4\":\"y\",\"score4\":\"2510\",\"name5\":\"anaal\",\"score5\":\"2460\"}', '{\"name1\":\"mike\",\"score1\":\"1110\",\"name2\":\"kippi\",\"score2\":\"1095\",\"name3\":\"br@m@\",\"score3\":\"810\",\"name4\":\"amm\",\"score4\":\"780\",\"name5\":\"a\",\"score5\":\"765\"}', '{\"name1\":\"esly\",\"score1\":\"2470\",\"name2\":\"vosco\",\"score2\":\"1950\",\"name3\":\"amm\",\"score3\":\"1425\",\"name4\":\"bcc\",\"score4\":\"1420\",\"name5\":\"mike\",\"score5\":\"1175\"}', '{\"name1\":\"aoife\",\"score1\":\"1700\",\"name2\":\"lies\",\"score2\":\"1640\",\"name3\":\"kippi\",\"score3\":\"1430\",\"name4\":\"lyonn\",\"score4\":\"1330\",\"name5\":\"kippi\",\"score5\":\"1240\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}', '{\"name1\":\"\",\"score1\":\"\",\"name2\":\"\",\"score2\":\"\",\"name3\":\"\",\"score3\":\"\",\"name4\":\"\",\"score4\":\"\",\"name5\":\"\",\"score5\":\"\"}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `teams`
--

CREATE TABLE `teams` (
  `linkid` varchar(100) NOT NULL,
  `team1name` varchar(100) NOT NULL DEFAULT 'team1',
  `team1tot` int(100) NOT NULL DEFAULT 0,
  `team2name` varchar(100) NOT NULL DEFAULT 'team2',
  `team2tot` int(100) NOT NULL DEFAULT 0,
  `team3name` varchar(100) NOT NULL DEFAULT 'team3',
  `team3tot` int(100) NOT NULL DEFAULT 0,
  `team4name` varchar(100) NOT NULL DEFAULT 'team4',
  `team4tot` int(100) NOT NULL DEFAULT 0,
  `team5name` varchar(100) NOT NULL DEFAULT 'team5',
  `team5tot` int(100) NOT NULL DEFAULT 0,
  `team6name` varchar(100) NOT NULL DEFAULT 'team6',
  `team6tot` int(100) NOT NULL DEFAULT 0,
  `team7name` varchar(100) NOT NULL DEFAULT 'team7',
  `team7tot` int(100) NOT NULL DEFAULT 0,
  `team8name` varchar(100) NOT NULL DEFAULT 'team8',
  `team8tot` int(100) NOT NULL DEFAULT 0,
  `team9name` varchar(100) NOT NULL DEFAULT 'team9',
  `team9tot` int(100) NOT NULL DEFAULT 0,
  `team10name` varchar(100) NOT NULL DEFAULT 'team10',
  `team10tot` int(100) NOT NULL DEFAULT 0,
  `team11name` varchar(100) NOT NULL DEFAULT 'team11',
  `team11tot` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `teams`
--

INSERT INTO `teams` (`linkid`, `team1name`, `team1tot`, `team2name`, `team2tot`, `team3name`, `team3tot`, `team4name`, `team4tot`, `team5name`, `team5tot`, `team6name`, `team6tot`, `team7name`, `team7tot`, `team8name`, `team8tot`, `team9name`, `team9tot`, `team10name`, `team10tot`, `team11name`, `team11tot`) VALUES
('Avans Hogeschool', 'team1', 55, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('Funky Phone One - EA Office', 'Geen Voorkeur', 12, 'team1', 2, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0),
('HAN - Hogeschool Arnhem Nijmegen', 'team1', 5, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('Hogeschool Leiden', 'team1', 50, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('StartupMix @ Radboud Universiteit', 'team1', 114, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('TU/e Green Office', 'team1', 0, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 1, 'team9', 0, 'team10', 0, 'team11', 0),
('Universiteit Leiden', 'team1', 251, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
