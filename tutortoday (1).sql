-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 18, 2025 at 09:18 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutortoday`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `primary_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `area_of_needed_help` text NOT NULL,
  `education_level` enum('Pre-K','Elementary','Middle School','High School','Associate','Bachelors','Masters') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`primary_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`primary_id`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`, `area_of_needed_help`, `education_level`, `username`, `password`) VALUES
(1, 'Benjamin', 'Biester', '2025-03-18', 'bbiester2022@students.curry.edu', '9254130045', '', 'Associate', 'the', '$2y$10$uBnUbSPkATl23fzLMfTVRO45Zst79DyPIgKfKij.WjPIYuYF8ghuS'),
(2, 'Test', 'Student', '2025-03-18', 'test@student.com', '1234567891', 'Science', 'Pre-K', 'Test', '$2y$10$kX1pkgff8yGkUFHvaoVV1OP5lhOqvUbhzE3KQihUoebpCmh33pYXm'),
(3, 'Another', 'Test', '2025-03-14', 'atest@test.com', '0987654321', 'Testing', 'Bachelors', 'Another', '$2y$10$8Sq9T5kJEd0hcEYQitUZweS4YsDZLHAHKkDdbARcPwIcsvIU4mD1e'),
(4, 'F', 'Man', '2025-03-01', 'f@man.com', '1234567890', 'Science', 'Pre-K', 'f', '$2y$10$emmMLAP2rzQD2EIkZAhhP.HY1rlDn0eMNXxw0iwEpozt2yGblKDpW'),
(5, 't', 'manm', '2025-03-04', 't@mann.com', '1234567890', 'math', 'Pre-K', 't', '$2y$10$pKQyw.LW/Lbv8a6LhXrpX.XohFlHbqtGNKBy2/pwlBa57WW.G8qCe'),
(6, 'm', 'mm', '2001-12-12', 'm@mm.com', '0988901234', 'math', 'Pre-K', 'm', '$2y$10$IvqTfwNrFTgQCmMGEEQBtefEC4geewbNUi/98nM3YQtLHQ/3hconG');

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
CREATE TABLE IF NOT EXISTS `tutors` (
  `primary_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tutor_id` int NOT NULL,
  `first_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `field_of_specialty` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `weekly_schedule` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price_per_hour` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`primary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
