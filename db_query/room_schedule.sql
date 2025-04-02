-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2025 at 05:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roomfinder_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `room_schedule`
--

CREATE TABLE `room_schedule` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `block` varchar(40) DEFAULT NULL,
  `date` date NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_schedule`
--

INSERT INTO `room_schedule` (`id`, `room_id`, `block`, `date`, `starting_time`, `ending_time`) VALUES
(5, 5, 'Block 5', '2025-03-26', '13:00:00', '14:00:00'),
(6, 6, 'Block 6', '2025-03-26', '14:00:00', '15:00:00'),
(7, 7, 'Block 7', '2025-03-26', '15:00:00', '16:00:00'),
(8, 8, 'Block 8', '2025-03-26', '16:00:00', '17:00:00'),
(9, 9, 'Block 9', '2025-03-26', '09:30:00', '10:30:00'),
(10, 10, 'Block 10', '2025-03-26', '10:30:00', '11:30:00'),
(11, 11, 'Block 11', '2025-03-26', '11:30:00', '12:30:00'),
(12, 12, 'Block 12', '2025-03-26', '12:30:00', '13:30:00'),
(13, 13, 'Block 13', '2025-03-26', '13:30:00', '14:30:00'),
(14, 14, 'Block 14', '2025-03-26', '14:30:00', '15:30:00'),
(15, 15, 'Block 15', '2025-03-26', '15:30:00', '16:30:00'),
(16, 16, 'Block 16', '2025-03-26', '16:30:00', '17:30:00'),
(17, 17, 'Block 17', '2025-03-26', '09:00:00', '10:00:00'),
(18, 18, 'Block 18', '2025-03-26', '10:00:00', '11:00:00'),
(19, 19, 'Block 19', '2025-03-26', '11:00:00', '12:00:00'),
(20, 20, 'Block 20', '2025-03-26', '12:00:00', '13:00:00'),
(21, 21, 'Block 21', '2025-03-26', '13:00:00', '14:00:00'),
(22, 22, 'Block 22', '2025-03-26', '14:00:00', '15:00:00'),
(23, 23, 'Block 23', '2025-03-26', '15:00:00', '16:00:00'),
(24, 24, 'Block 24', '2025-03-26', '16:00:00', '17:00:00'),
(25, 25, 'Block 25', '2025-03-26', '09:30:00', '10:30:00'),
(26, 26, 'Block 26', '2025-03-26', '10:30:00', '11:30:00'),
(27, 27, 'Block 27', '2025-03-26', '11:30:00', '12:30:00'),
(28, 28, 'Block 28', '2025-03-26', '12:30:00', '13:30:00'),
(29, 29, 'Block 29', '2025-03-26', '13:30:00', '14:30:00'),
(30, 30, 'Block 30', '2025-03-26', '14:30:00', '15:30:00'),
(31, 31, 'Block 31', '2025-03-26', '15:30:00', '16:30:00'),
(32, 32, 'Block 32', '2025-03-26', '16:30:00', '17:30:00'),
(33, 33, 'Block 33', '2025-03-26', '09:00:00', '10:00:00'),
(34, 34, 'Block 34', '2025-03-26', '10:00:00', '11:00:00'),
(35, 35, 'Block 35', '2025-03-26', '11:00:00', '12:00:00'),
(36, 36, 'Block 36', '2025-03-26', '12:00:00', '13:00:00'),
(37, 37, 'Block 37', '2025-03-26', '13:00:00', '14:00:00'),
(38, 38, 'Block 38', '2025-03-26', '14:00:00', '15:00:00'),
(39, 39, 'Block 39', '2025-03-26', '15:00:00', '16:00:00'),
(40, 40, 'Block 40', '2025-03-26', '16:00:00', '17:00:00'),
(41, 41, 'Block 41', '2025-03-26', '09:30:00', '10:30:00'),
(42, 42, 'Block 42', '2025-03-26', '10:30:00', '11:30:00'),
(43, 43, 'Block 43', '2025-03-26', '11:30:00', '12:30:00'),
(44, 44, 'Block 44', '2025-03-26', '12:30:00', '13:30:00'),
(45, 45, 'Block 45', '2025-03-26', '13:30:00', '14:30:00'),
(46, 46, 'Block 46', '2025-03-26', '14:30:00', '15:30:00'),
(47, 47, 'Block 47', '2025-03-26', '15:30:00', '16:30:00'),
(48, 48, 'Block 48', '2025-03-26', '16:30:00', '17:30:00'),
(53, 13, 'Block 1', '2025-04-09', '08:00:00', '09:30:00'),
(54, 15, 'Block 3', '2025-03-20', '09:00:00', '11:30:00'),
(56, 1, '4', '2025-03-20', '10:30:00', '11:30:00'),
(57, 1, 'Block 8', '2025-03-20', '01:00:00', '23:59:00'),
(58, 19, 'Block 8', '2025-03-20', '01:00:00', '23:59:00'),
(59, 36, 'Block 8', '2025-03-20', '01:00:00', '23:59:00'),
(60, 6, '4', '2025-03-20', '14:00:00', '15:00:00'),
(61, 19, 'Block 3', '2025-04-15', '10:00:00', '11:30:00'),
(62, 20, 'Block 4', '2025-04-16', '08:30:00', '10:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room_schedule`
--
ALTER TABLE `room_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_id` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room_schedule`
--
ALTER TABLE `room_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `room_schedule`
--
ALTER TABLE `room_schedule`
  ADD CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
