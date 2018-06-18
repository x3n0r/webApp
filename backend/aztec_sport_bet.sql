-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2018 at 02:23 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aztec_sport_bet`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbet`
--

CREATE TABLE `tbet` (
  `user_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `match_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `host_goals` int(11) NOT NULL,
  `guest_goals` int(11) NOT NULL,
  `payed` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tmatches`
--

CREATE TABLE `tmatches` (
  `matches_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `host_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `guest_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `host_goals` int(11) NOT NULL,
  `guest_goals` int(11) NOT NULL,
  `match_type_id` varchar(36) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tmatch_type`
--

CREATE TABLE `tmatch_type` (
  `match_type_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `bet_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tteams`
--

CREATE TABLE `tteams` (
  `teams_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `team_code` char(3) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `imgUrl` varchar(128) COLLATE utf8_bin NOT NULL,
  `name_d` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ttournament`
--

CREATE TABLE `ttournament` (
  `tournament_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tusers`
--

CREATE TABLE `tusers` (
  `user_id` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbet`
--
ALTER TABLE `tbet`
  ADD PRIMARY KEY (`user_id`,`match_id`),
  ADD KEY `bet_match_fk_constraints` (`match_id`);

--
-- Indexes for table `tmatches`
--
ALTER TABLE `tmatches`
  ADD PRIMARY KEY (`matches_id`),
  ADD KEY `match_tournament_fk_constraints` (`tournament_id`),
  ADD KEY `match_teams_guest_fk_constraints` (`guest_id`),
  ADD KEY `match_teams_host_fk_constraints` (`host_id`),
  ADD KEY `match_match_type_fk_contraint` (`match_type_id`);

--
-- Indexes for table `tmatch_type`
--
ALTER TABLE `tmatch_type`
  ADD PRIMARY KEY (`match_type_id`);

--
-- Indexes for table `tteams`
--
ALTER TABLE `tteams`
  ADD PRIMARY KEY (`teams_id`);

--
-- Indexes for table `ttournament`
--
ALTER TABLE `ttournament`
  ADD PRIMARY KEY (`tournament_id`);

--
-- Indexes for table `tusers`
--
ALTER TABLE `tusers`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbet`
--
ALTER TABLE `tbet`
  ADD CONSTRAINT `bet_match_fk_constraints` FOREIGN KEY (`match_id`) REFERENCES `tmatches` (`matches_id`),
  ADD CONSTRAINT `bet_user_fk_constraints` FOREIGN KEY (`user_id`) REFERENCES `tusers` (`user_id`);

--
-- Constraints for table `tmatches`
--
ALTER TABLE `tmatches`
  ADD CONSTRAINT `match_match_type_fk_contraint` FOREIGN KEY (`match_type_id`) REFERENCES `tmatch_type` (`match_type_id`),
  ADD CONSTRAINT `match_teams_guest_fk_constraints` FOREIGN KEY (`guest_id`) REFERENCES `tteams` (`teams_id`),
  ADD CONSTRAINT `match_teams_host_fk_constraints` FOREIGN KEY (`host_id`) REFERENCES `tteams` (`teams_id`),
  ADD CONSTRAINT `match_tournament_fk_constraints` FOREIGN KEY (`tournament_id`) REFERENCES `ttournament` (`tournament_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
