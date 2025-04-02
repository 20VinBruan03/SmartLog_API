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
-- Table structure for table `room_request`
--

CREATE TABLE `room_request` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `block` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_request`
--

INSERT INTO `room_request` (`id`, `room_id`, `user_id`, `block`, `purpose`, `date`, `starting_time`, `ending_time`, `status`, `created_at`) VALUES
(1, 20, 3, 'Block 2', 'lecture class', '2025-03-28', '12:00:00', '13:30:00', 'Pending', '2025-03-19 21:50:56'),
(2, 21, 4, 'Block 1', 'seminar', '2025-03-29', '14:00:00', '16:00:00', 'Pending', '2025-03-19 21:50:56'),
(3, 22, 5, 'Block 3', 'workshop', '2025-03-30', '09:00:00', '11:00:00', 'Pending', '2025-03-19 21:50:56'),
(4, 23, 6, 'Block 4', 'meeting', '2025-03-31', '10:30:00', '12:00:00', 'Approved', '2025-03-19 21:50:56'),
(6, 25, 8, 'Block 1', 'presentation', '2025-04-02', '08:00:00', '09:30:00', 'Pending', '2025-03-19 21:50:56'),
(7, 26, 9, 'Block 3', 'brainstorming session', '2025-04-03', '13:00:00', '14:30:00', 'Pending', '2025-03-19 21:50:56'),
(8, 27, 10, 'Block 4', 'training session', '2025-04-04', '16:00:00', '18:00:00', 'Pending', '2025-03-19 21:50:56'),
(13, 5, 5, 'Block 1', 'Meeting', '2025-04-01', '12:00:00', '13:30:00', 'Rejected', '2025-03-19 21:54:16'),
(14, 6, 6, 'Block 2', 'Training Session', '2025-04-02', '08:30:00', '10:00:00', 'Rejected', '2025-03-19 21:54:16'),
(16, 8, 8, 'Block 4', 'Brainstorming Session', '2025-04-04', '11:00:00', '12:30:00', 'Rejected', '2025-03-19 21:54:16'),
(17, 9, 9, 'Block 1', 'Workshop', '2025-04-05', '14:00:00', '16:00:00', 'Rejected', '2025-03-19 21:54:16'),
(18, 10, 10, 'Block 2', 'Lecture', '2025-04-06', '09:30:00', '11:00:00', 'Approved', '2025-03-19 21:54:16'),
(19, 11, 11, 'Block 3', 'Seminar', '2025-04-07', '10:30:00', '12:00:00', 'Rejected', '2025-03-19 21:54:16'),
(20, 12, 12, 'Block 4', 'Meeting', '2025-04-08', '13:00:00', '14:30:00', 'Approved', '2025-03-19 21:54:16'),
(21, 13, 13, 'Block 1', 'Conference', '2025-04-09', '08:00:00', '09:30:00', 'Approved', '2025-03-19 21:54:16'),
(22, 14, 14, 'Block 2', 'Training Session', '2025-04-10', '10:00:00', '11:30:00', 'Approved', '2025-03-19 21:54:16'),
(23, 15, 15, 'Block 3', 'Lecture', '2025-04-11', '13:00:00', '14:30:00', 'Approved', '2025-03-19 21:54:16'),
(24, 16, 16, 'Block 4', 'Brainstorming Session', '2025-04-12', '14:00:00', '15:30:00', 'Rejected', '2025-03-19 21:54:16'),
(25, 17, 17, 'Block 1', 'Presentation', '2025-04-13', '15:00:00', '16:30:00', 'Approved', '2025-03-19 21:54:16'),
(26, 18, 18, 'Block 2', 'Workshop', '2025-04-14', '09:30:00', '11:00:00', 'Approved', '2025-03-19 21:54:16'),
(27, 19, 19, 'Block 3', 'Meeting', '2025-04-15', '10:00:00', '11:30:00', 'Approved', '2025-03-19 21:54:16'),
(28, 20, 20, 'Block 4', 'Conference', '2025-04-16', '08:30:00', '10:00:00', 'Approved', '2025-03-19 21:54:16'),
(29, 21, 21, 'Block 1', 'Training Session', '2025-04-17', '13:00:00', '14:30:00', 'Pending', '2025-03-19 21:54:16'),
(30, 22, 22, 'Block 2', 'Seminar', '2025-04-18', '11:00:00', '12:30:00', 'Pending', '2025-03-19 21:54:16'),
(31, 23, 23, 'Block 3', 'Lecture', '2025-04-19', '12:00:00', '13:30:00', 'Pending', '2025-03-19 21:54:16'),
(32, 24, 24, 'Block 4', 'Presentation', '2025-04-20', '09:00:00', '10:30:00', 'Pending', '2025-03-19 21:54:16'),
(33, 25, 25, 'Block 1', 'Workshop', '2025-04-21', '14:30:00', '16:00:00', 'Pending', '2025-03-19 21:54:16'),
(34, 26, 26, 'Block 2', 'Brainstorming Session', '2025-04-22', '13:00:00', '14:30:00', 'Approved', '2025-03-19 21:54:16'),
(35, 27, 27, 'Block 3', 'Training Session', '2025-04-23', '08:00:00', '09:30:00', 'Pending', '2025-03-19 21:54:16'),
(36, 28, 28, 'Block 4', 'Conference', '2025-04-24', '15:00:00', '16:30:00', 'Approved', '2025-03-19 21:54:16'),
(37, 29, 29, 'Block 1', 'Seminar', '2025-04-25', '10:30:00', '12:00:00', 'Approved', '2025-03-19 21:54:16'),
(38, 30, 30, 'Block 2', 'Lecture', '2025-04-26', '14:00:00', '15:30:00', 'Pending', '2025-03-19 21:54:16'),
(44, 5, 44, '2', 'Computer Science Class', '2025-03-20', '12:00:00', '14:30:00', 'Rejected', '2025-03-20 13:08:35'),
(45, 6, 44, '4', 'Project Discussion', '2025-03-20', '14:00:00', '15:00:00', 'Approved', '2025-03-20 13:10:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room_request`
--
ALTER TABLE `room_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`user_id`),
  ADD KEY `room_request_ibfk_1` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room_request`
--
ALTER TABLE `room_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `room_request`
--
ALTER TABLE `room_request`
  ADD CONSTRAINT `room_request_ibfk2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_request_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
