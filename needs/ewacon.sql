-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Gegenereerd op: 21 nov 2017 om 11:37
-- Serverversie: 10.1.26-MariaDB-1
-- PHP-versie: 7.0.25-1

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
  `arcades` varchar(100) NOT NULL,
  `datestart` varchar(100) NOT NULL,
  `dateend` varchar(100) NOT NULL,
  `inuse` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `arcades`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `archive`
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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `highscores`
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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `teams`
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
-- Indexen voor tabel `highscores`
--
ALTER TABLE `highscores`
  ADD PRIMARY KEY (`arcadename`);

--
-- Indexen voor tabel `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `arcades`
--
ALTER TABLE `arcades`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
