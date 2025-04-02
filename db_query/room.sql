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
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_building` text NOT NULL,
  `room_number` varchar(11) NOT NULL,
  `status` enum('Available','Occupied','Closed') NOT NULL,
  `equipment` text DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_building`, `room_number`, `status`, `equipment`, `capacity`, `room_type`) VALUES
(1, 'PTC', '210', 'Occupied', 'Air Conditioner, Monitor, Wi-Fi', 50, 'Lecture'),
(5, 'PTC', '216', 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
(6, 'PTC', '213', 'Available', 'Air Conditioner, Computer', 50, 'Lecture'),
(7, 'ITS', '211', 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
(8, 'ITS', '122', 'Available', 'Wi-Fi', 50, 'Lecture'),
(9, 'ITS', '123', 'Available', 'Air Conditioner, Monitor', 50, 'Lecture'),
(10, 'ITS', '124', 'Available', 'Whiteboard', 50, 'Lecture'),
(11, 'ITS', '127', 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
(12, 'ITS', '128', 'Available', 'Air Conditioner', 50, 'Lecture'),
(13, 'ITS', '129', 'Available', 'Computer, Wi-Fi', 50, 'Lecture'),
(14, 'ITS', '100', 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
(15, 'PTC', '233', 'Available', 'Air Conditioner, Computer', 50, 'Lecture'),
(16, 'PTC', '400', 'Available', 'Monitor, Wi-Fi, Whiteboard', 50, 'Lecture'),
(17, 'PTC', '900', 'Available', 'Air Conditioner, Whiteboard', 50, 'Lecture'),
(18, 'PTC', '201', 'Available', 'Wi-Fi', 50, 'Lecture'),
(19, 'PTC', '202', 'Occupied', 'Computer', 50, 'Lecture'),
(20, 'PTC', '203', 'Available', 'Air Conditioner', 50, 'Lecture'),
(21, 'PTC', '204', 'Available', 'Wi-Fi, Computer', 50, 'Lecture'),
(22, 'PTC', '205', 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
(23, 'PTC', '206', 'Available', 'Air Conditioner, Monitor', 50, 'Lecture'),
(24, 'PTC', '207', 'Available', 'Wi-Fi', 50, 'Lecture'),
(25, 'PTC', '208', 'Available', 'Air Conditioner, Whiteboard', 50, 'Lecture'),
(26, 'PTC', '209', 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
(27, 'ITS', '105', 'Available', 'Computer, Whiteboard', 50, 'Lecture'),
(28, 'ITS', '106', 'Available', 'Wi-Fi', 50, 'Lecture'),
(29, 'ITS', '107', 'Available', 'Air Conditioner, Computer', 50, 'Lecture'),
(30, 'ITS', '108', 'Available', 'Monitor, Whiteboard', 50, 'Lecture'),
(31, 'ITS', '109', 'Available', 'Wi-Fi', 50, 'Lecture'),
(32, 'ITS', '110', 'Available', 'Computer, Wi-Fi', 50, 'Lecture'),
(33, 'ITS', '111', 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
(34, 'ITS', '112', 'Available', 'Air Conditioner', 50, 'Lecture'),
(35, 'ITS', '113', 'Available', 'Computer, Monitor', 50, 'Lecture'),
(36, 'ITS', '114', 'Occupied', 'Wi-Fi, Monitor', 50, 'Lecture'),
(37, 'ITS', '115', 'Available', 'Air Conditioner, Wi-Fi', 50, 'Lecture'),
(38, 'ITS', '116', 'Available', 'Monitor, Whiteboard', 50, 'Lecture'),
(39, 'ITS', '117', 'Available', 'Wi-Fi, Computer', 50, 'Lecture'),
(40, 'ITS', '118', 'Available', 'Air Conditioner', 50, 'Lecture'),
(41, 'ITS', '119', 'Available', 'Wi-Fi', 50, 'Lecture'),
(42, 'ITS', '120', 'Available', 'Computer', 50, 'Lecture'),
(43, 'ITS', '121', 'Available', 'Monitor', 50, 'Lecture'),
(44, 'PTC', '220', 'Available', 'Wi-Fi, Whiteboard', 50, 'Lecture'),
(45, 'PTC', '221', 'Available', 'Air Conditioner, Monitor', 50, 'Lecture'),
(46, 'PTC', '222', 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
(47, 'PTC', '223', 'Available', 'Air Conditioner, Wi-Fi', 50, 'Lecture'),
(48, 'PTC', '224', 'Available', 'Monitor, Whiteboard', 50, 'Lecture'),
(49, 'PTC', '330', 'Available', 'Monitor, Air Conditioner', 50, 'Lecture'),
(50, 'PTC', '222', 'Available', 'Air Conditioner, Monitor, Computer', 12, 'Lecture Room'),
(51, 'PTC', '222', 'Available', 'Air Conditioner, Monitor, Computer', 12, 'Lecture Room'),
(52, 'PTC', '330', 'Available', 'Monitor, Air Conditioner', 50, 'Lecture'),
(53, 'PTC', '123', 'Available', 'Air Conditioner, Monitor, Computer', 12, 'Laboratory Room'),
(54, 'PTC', '122', 'Available', 'Air Conditioner', 223, 'Lecture Room'),
(55, 'ITS', '900', 'Available', 'Air Conditioner, Monitor, Computer, Whiteboard, Wi-Fi', 11, 'Laboratory Room'),
(56, 'ITS', '900', 'Available', 'Air Conditioner, Monitor, Computer, Whiteboard, Wi-Fi', 11, 'Laboratory Room'),
(57, 'PTC', '330', 'Available', 'Monitor, Air Conditioner', 50, 'Lecture'),
(58, 'ITS', '900', 'Available', 'Air Conditioner, Monitor, Computer, Whiteboard, Wi-Fi', 11, 'Laboratory Room'),
(59, 'PTC', '282', 'Available', 'Monitor', 8228, 'Lecture Room'),
(60, 'PTC', '933', 'Available', 'Air Conditioner, Monitor', 29229, 'Lecture Room'),
(61, 'PTC', '933988', 'Available', 'Air Conditioner, Monitor', 29229, 'Lecture Room');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
