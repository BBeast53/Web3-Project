-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 29, 2025 at 09:25 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`primary_id`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`, `area_of_needed_help`, `education_level`, `username`, `password`) VALUES
(1, 'Benjamin', 'Biester', '2025-03-18', 'bbiester2022@students.curry.edu', '9254130045', '', 'Associate', 'the', '$2y$10$uBnUbSPkATl23fzLMfTVRO45Zst79DyPIgKfKij.WjPIYuYF8ghuS'),
(2, 'Test', 'Student', '2025-03-18', 'test@student.com', '1234567891', 'Science', 'Pre-K', 'Test', '$2y$10$kX1pkgff8yGkUFHvaoVV1OP5lhOqvUbhzE3KQihUoebpCmh33pYXm'),
(3, 'Another', 'Test', '2025-03-14', 'atest@test.com', '0987654321', 'Testing', 'Bachelors', 'Another', '$2y$10$8Sq9T5kJEd0hcEYQitUZweS4YsDZLHAHKkDdbARcPwIcsvIU4mD1e'),
(4, 'F', 'Man', '2025-03-01', 'f@man.com', '1234567890', 'Science', 'Pre-K', 'f', '$2y$10$emmMLAP2rzQD2EIkZAhhP.HY1rlDn0eMNXxw0iwEpozt2yGblKDpW'),
(5, 't', 'manm', '2025-03-04', 't@mann.com', '1234567890', 'math', 'Pre-K', 't', '$2y$10$pKQyw.LW/Lbv8a6LhXrpX.XohFlHbqtGNKBy2/pwlBa57WW.G8qCe'),
(6, 'm', 'mm', '2001-12-12', 'm@mm.com', '0988901234', 'math', 'Pre-K', 'm', '$2y$10$IvqTfwNrFTgQCmMGEEQBtefEC4geewbNUi/98nM3YQtLHQ/3hconG'),
(7, 'd', 'd', '2025-04-01', 'd@d.com', '1234567890', '', 'Pre-K', 'd', '$2y$10$OTSMVGlPP9eoC/lNsPomCOCUP0mnlIcLpzl9VJoDGWkoodJ9qNh4i'),
(8, 'The', 'Test', '2004-02-08', 'test@gmail.com', '1234567890', '', 'Associate', 'atestingusername', '$2y$10$8XhE3CSbMKWFTUNDhE1nt.608KKiHGObaxGZrqRINZjCc6j6/CaKC'),
(9, 'Re', 'Direct', '2025-02-04', 'redirect@email.com', '1234567890', '', 'Masters', 're', '$2y$10$l8uqs4eWQEyCXXF5whSVsu9yZLMMWFSqbtf.HdkElbH/opI2MMlPm'),
(10, 'Re', 'Direct', '2025-02-04', 'redirect@email.com', '1234567890', '', 'Masters', 'redirecting', '$2y$10$wru20VidczFaolNye5z3FOphtQ5pAojV8zC71SUqfPxnaxl3dwTm2'),
(11, 'The direct', 'Test', '2025-04-03', 'test@gmail.com', '1234567890', '', 'Pre-K', 'theDirector', '$2y$10$taL5J/IAT2HhhsWQExR4Jem44l/6CSJUqjnZzz3wZpQioSJccvGH.'),
(12, 'The director', 'Test', '2025-04-03', 'test@gmail.com', '1234567890', '', 'Pre-K', 'theDirectorrew', '$2y$10$jPBFsDa3DTqaVMGTrrbTHOhdIGASE.ZHtVd5dKyRUTSdo0wotvNk2'),
(13, 'tesseet', 'safd', '2025-04-02', 'e@mail.com', '12343256567', '', 'Pre-K', 'super', '$2y$10$t7GcE0n1rtuZMtzDAS6Ow.sVOk3JAUEiWdGSml09Se3TNOZfEA1yO'),
(14, 'Pass', 'Test', '2025-04-02', 'passtest@passtest.com', '1234567890', '', 'High School', 'passtest', '$2y$10$e2jI3j15BtwKPm77rPkh/ubTOgVjH8.BcEu05y74DUL9UN1AJOx8a');

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
  `field_of_specialty` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price_per_hour` double NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `about` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `available_days` varchar(250) NOT NULL,
  `Rating` int NOT NULL,
  PRIMARY KEY (`primary_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`primary_id`, `tutor_id`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`, `field_of_specialty`, `price_per_hour`, `username`, `password`, `about`, `available_days`, `Rating`) VALUES
(12, 0, 'Rebecca', 'Bagel', '0000-00-00', '', '', 'Mathematics', 0, '', '', '', '', 5),
(13, 0, 'Rebecca', 'Bagel', '0000-00-00', '', '', 'Mathematics', 0, 'rebecca_bagel1', 'aG7!kQzP93', '', '', 5),
(14, 0, 'Lanna', 'Ding', '0000-00-00', '', '', 'Mathematics', 0, 'lanna_ding2', 'Wv4@tLmR85', '', '', 5),
(15, 0, 'Linda', 'White', '0000-00-00', '', '', 'Mathematics', 0, 'linda_white3', 'Xy8#sBgD92', '', '', 4),
(16, 0, 'Marcus', 'Pan', '0000-00-00', '', '', 'Science', 0, 'marcus_pan4', 'Nf2%vGhK71', '', '', 4),
(17, 0, 'Ben', 'Mark', '0000-00-00', '', '', 'Science', 0, 'ben_mark5', 'Ko3!mLtV66', '', '', 3),
(18, 0, 'Bigby', 'Wolf', '0000-00-00', '', '', 'Science', 0, 'bigby_wolf6', 'Jp6#xYqH45', '', '', 2),
(19, 0, 'Barry', 'Cuda', '0000-00-00', '', '', 'Reading', 0, 'barry_cuda7', 'Rz9@tPvD82', '', '', 3),
(20, 0, 'Fred', 'Jones', '0000-00-00', '', '', 'Reading', 0, 'fred_jones8', 'Vm5$zKpL78', '', '', 2),
(21, 0, 'Cristal', 'Clear', '0000-00-00', '', '', 'Reading', 0, 'cristal_clear9', 'Hn1!uWmR31', '', '', 5),
(22, 0, 'Tiffany', 'Breakfast', '0000-00-00', '', '', 'Writing', 0, 'tiffany_breakfast10', 'Fg4@qKrP64', '', '', 5),
(23, 0, 'Howard', 'Lovecraft', '0000-00-00', '', '', 'Writing', 0, 'howard_lovecraft11', 'Lp7%tXwE88', '', '', 3),
(24, 0, 'Pen', 'Cill', '0000-00-00', '', '', 'Writing', 0, 'pen_cill12', 'Ax6#vLkD23', '', '', 3),
(25, 0, 'Justin', 'Time', '0000-00-00', '', '', 'History', 0, 'justin_time13', 'Jk3@rPwE91', '', '', 5),
(26, 0, 'Ben', 'There', '0000-00-00', '', '', 'History', 0, 'ben_there14', 'Yd5!tNcU39', '', '', 4),
(27, 0, 'Dunn', 'That', '0000-00-00', '', '', 'History', 0, 'dunn_that15', 'Mv8$wLpD54', '', '', 3),
(28, 0, 'Rhok\'zan', 'Selva Oscura', '0000-00-00', '', '', 'Language Learning', 0, 'rhokzan_selvaoscura16', 'Tq6#nWuR73', '', '', 5),
(29, 0, 'Ln\'eta', 'Darling', '0000-00-00', '', '', 'Language Learning', 0, 'lneta_darling17', 'Cp2@xMrF77', '', '', 4),
(30, 0, 'Estir', 'King\'N\'Yellow', '0000-00-00', '', '', 'Language Learning', 0, 'estir_kingnyellow18', 'Zw9%vBpD60', '', '', 3),
(31, 0, 'Jonah', 'Scott', '0000-00-00', '', '', 'Music', 0, 'jonah_scott19', 'Hu3@rLpW41', '', '', 5),
(32, 0, 'Kylie', 'McNeill', '0000-00-00', '', '', 'Music', 0, 'kylie_mcneill20', 'Lr7#qGmZ32', '', '', 5),
(33, 0, 'Zac', 'Brown', '0000-00-00', '', '', 'Music', 0, 'zac_brown21', 'Xo5!kMtP76', '', '', 5),
(34, 0, 'Davey', 'Wally', '0000-00-00', '', '', 'Technology', 0, 'davey_wally22', 'Ba6@rTpD57', '', '', 5),
(35, 0, 'Lizzie', 'Row', '0000-00-00', '', '', 'Technology', 0, 'lizzie_row23', 'Gc8%tFpW90', '', '', 5),
(36, 0, 'Quin', 'Tyrant', '0000-00-00', '', '', 'Technology', 0, 'quin_tyrant24', 'Vu1!mLpE63', '', '', 1),
(37, 0, 'Ben', 'Barnes', '0000-00-00', '', '', 'Economics', 0, 'ben_barnes25', 'Rn5@xGtP45', '', '', 5),
(38, 0, 'James', 'McAvoy', '0000-00-00', '', '', 'Economics', 0, 'james_mcavoy26', 'Qz2!rWpX70', '', '', 4),
(39, 0, 'Ben', 'Barrington', '0000-00-00', '', '', 'Economics', 0, 'ben_barrington27', 'Ap9#tLlD85', '', '', 2),
(40, 0, 'Doc', 'Holliday', '0000-00-00', '', '', 'Social Studies', 0, 'doc_holliday28', 'Xg4@vRmP12', '', '', 5),
(41, 0, 'Wyatt', 'Earp', '0000-00-00', '', '', 'Social Studies', 0, 'wyatt_earp29', 'Nl3$uPwQ49', '', '', 5),
(42, 0, 'Johnny', 'Ringo', '0000-00-00', '', '', 'Social Studies', 0, 'johnny_ringo30', 'Mv2@zLpE56', '', '', 1),
(43, 0, 'Nyanlathotep', 'Akabaka', '0000-00-00', '', '', 'Arts & Humanities', 0, 'nyanlathotep_akabaka31', 'Rf6!vMpW38', '', '', 4),
(44, 0, 'Mark', 'Pliers', '0000-00-00', '', '', 'Arts & Humanities', 0, 'mark_pliers32', 'Ug8#xRpQ27', '', '', 3),
(45, 0, 'Kidd', 'Ace', '0000-00-00', '', '', 'Arts & Humanities', 0, 'kidd_ace33', 'Bx7@qZwD94', '', '', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
