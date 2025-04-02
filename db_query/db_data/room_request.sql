-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 12:05 PM
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

--
-- Dumping data for table `room_request`
--

INSERT INTO `room_request` (`room_id`, `user_id`, `block`, `purpose`, `date`, `starting_time`, `ending_time`, `status`, `created_at`) VALUES
(6, 6, 'Block 4', 'seminar', '2025-03-18', '13:00:00', '15:00:00', 'pending', '2025-03-17 11:50:24'),
(8, 10, 'Block 2', 'training session', '2025-03-20', '15:00:00', '17:00:00', 'pending', '2025-03-17 11:50:24'),
(9, 7, 'Block 3', 'lecture class', '2025-03-21', '16:00:00', '18:00:00', 'pending', '2025-03-17 11:50:24'),
(10, 8, 'Block 4', 'seminar', '2025-03-22', '17:00:00', '19:00:00', 'pending', '2025-03-17 11:50:24'),
(1, 1, 'Block 1', 'Lecture class', '2025-03-13', '09:00:00', '11:00:00', 'pending', '2025-03-17 12:05:02'),
(2, 2, 'Block 2', 'Seminar', '2025-03-14', '10:00:00', '12:00:00', 'pending', '2025-03-17 12:05:02'),
(3, 3, 'Block 3', 'Workshop', '2025-03-15', '14:00:00', '16:00:00', 'pending', '2025-03-17 12:05:02'),
(4, 4, 'Block 4', 'Lecture class', '2025-03-16', '08:30:00', '10:30:00', 'pending', '2025-03-17 12:05:02'),
(5, 5, 'Block 5', 'Group Discussion', '2025-03-17', '11:00:00', '13:00:00', 'pending', '2025-03-17 12:05:02'),
(6, 6, 'Block 6', 'Lecture class', '2025-03-18', '15:00:00', '17:00:00', 'pending', '2025-03-17 12:05:02'),
(7, 7, 'Block 7', 'Lecture class', '2025-03-19', '13:30:00', '15:30:00', 'pending', '2025-03-17 12:05:02'),
(8, 8, 'Block 8', 'Lab Session', '2025-03-20', '09:30:00', '11:30:00', 'pending', '2025-03-17 12:05:02'),
(9, 9, 'Block 9', 'Lecture class', '2025-03-21', '12:00:00', '14:00:00', 'pending', '2025-03-17 12:05:02'),
(10, 10, 'Block 10', 'Project Review', '2025-03-22', '14:30:00', '16:30:00', 'pending', '2025-03-17 12:05:02'),
(11, 11, 'Block 11', 'Workshop', '2025-03-23', '08:00:00', '10:00:00', 'pending', '2025-03-17 12:05:02'),
(12, 12, 'Block 12', 'Lecture class', '2025-03-24', '16:00:00', '18:00:00', 'pending', '2025-03-17 12:05:02'),
(13, 13, 'Block 13', 'Seminar', '2025-03-25', '10:30:00', '12:30:00', 'pending', '2025-03-17 12:05:02');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
