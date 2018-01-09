-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 09 jan 2018 om 10:13
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
(5, 'Actieloos', '', '', 2),
(6, 'Nieuwe actie', '', '2017-12-19', 2),
(7, 'Funky Phone Challenge HO', '', '2018-02-08', 1);

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
(20, 1, 'TestArcade 1', 2, 6, 'Hurksestraat', '51.433488, 5.436982', 9, 14, 4, '2017-12-08', '2017-12-30', '2018-01-09 09:02:22'),
(21, 2, 'Testarcade 2 ', 2, 5, 'Eindhoven The Office', '51.433615, 5.437486', 23, 8, 7, '2017-12-19', '', '2017-12-22 08:24:38'),
(22, 1, 'basa', 1, 0, '', '', 0, 0, 0, '', '', '2017-12-19 14:25:30'),
(23, 3, 'Huize Petterson Achterhoek', 2, 5, 'Terborg', '51.933000, 6.390317', 15, 0, 7, '2017-12-19', '2017-12-31', '2017-12-19 15:19:04'),
(24, 5, 'Start Up Mix @ Radboud Universiteit', 1, 7, 'Nijmegen', '51.819507, 5.865503', 0, 0, 0, '2018-01-15', '2018-02-08', '2017-12-21 17:10:26');

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
  `game1` varchar(500) DEFAULT NULL,
  `game2` varchar(500) DEFAULT NULL,
  `game3` varchar(500) DEFAULT NULL,
  `game4` varchar(500) DEFAULT NULL,
  `game5` varchar(500) DEFAULT NULL,
  `game6` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `highscores`
--

INSERT INTO `highscores` (`linkid`, `game1`, `game2`, `game3`, `game4`, `game5`, `game6`) VALUES
('basa', NULL, NULL, NULL, NULL, NULL, NULL),
('Huize Petterson Achterhoek', NULL, NULL, NULL, NULL, NULL, NULL),
('Start Up Mix @ Radboud Universiteit', NULL, NULL, NULL, NULL, NULL, NULL),
('TestArcade 1', NULL, NULL, NULL, NULL, NULL, NULL),
('Testarcade 2 ', NULL, NULL, NULL, NULL, NULL, NULL);

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
('basa', 'team1', 0, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('Huize Petterson Achterhoek', 'Geen Voorkeur', 5, 'Karen', 1, 'Joris', 1, 'Andre', 2, 'Christine', 2, 'Harry', 1, 'Fien', 3, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('Start Up Mix @ Radboud Universiteit', 'team1', 0, 'team2', 0, 'team3', 0, 'team4', 0, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('TestArcade 1', 'Aapjes', 1, 'Orangs', 5, 'Stokstaartjes', 1, 'Panda', 2, 'team5', 0, 'team6', 0, 'team7', 0, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0),
('Testarcade 2 ', 'Geen voorkeur', 14, 'apen', 3, 'test', 0, 'test3', 0, 'sdgfg4', 2, 'fasfdafe', 0, 'olifanten', 4, 'team8', 0, 'team9', 0, 'team10', 0, 'team11', 0);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `arcades`
--
ALTER TABLE `arcades`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
