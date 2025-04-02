-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 11:56 AM
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
-- Dumping data for table `room`
--
INSERT INTO `room` (`room_building`, `room_number`, `status`, `equipment`, `capacity`, `room_type`) 
VALUES
('PTC', 210, 'Available', 'Air Conditioner, Monitor, Wi-Fi', 50, 'Lecture'),
('PTC', 211, 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
('PTC', 219, 'Available', 'Air Conditioner, Computer, Whiteboard', 50, 'Lecture'),
('PTC', 218, 'Available', 'Wi-Fi, Whiteboard', 50, 'Lecture'),
('PTC', 216, 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
('PTC', 213, 'Available', 'Air Conditioner, Computer', 50, 'Lecture'),
('ITS', 211, 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
('ITS', 122, 'Available', 'Wi-Fi', 50, 'Lecture'),
('ITS', 123, 'Available', 'Air Conditioner, Monitor', 50, 'Lecture'),
('ITS', 124, 'Available', 'Whiteboard', 50, 'Lecture'),
('ITS', 127, 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
('ITS', 128, 'Available', 'Air Conditioner', 50, 'Lecture'),
('ITS', 129, 'Available', 'Computer, Wi-Fi', 50, 'Lecture'),
('ITS', 100, 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
('PTC', 233, 'Available', 'Air Conditioner, Computer', 50, 'Lecture'),
('PTC', 400, 'Available', 'Monitor, Wi-Fi, Whiteboard', 50, 'Lecture'),
('PTC', 900, 'Available', 'Air Conditioner, Whiteboard', 50, 'Lecture'),
('PTC', 201, 'Available', 'Wi-Fi', 50, 'Lecture'),
('PTC', 202, 'Available', 'Computer', 50, 'Lecture'),
('PTC', 203, 'Available', 'Air Conditioner', 50, 'Lecture'),
('PTC', 204, 'Available', 'Wi-Fi, Computer', 50, 'Lecture'),
('PTC', 205, 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
('PTC', 206, 'Available', 'Air Conditioner, Monitor', 50, 'Lecture'),
('PTC', 207, 'Available', 'Wi-Fi', 50, 'Lecture'),
('PTC', 208, 'Available', 'Air Conditioner, Whiteboard', 50, 'Lecture'),
('PTC', 209, 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
('ITS', 105, 'Available', 'Computer, Whiteboard', 50, 'Lecture'),
('ITS', 106, 'Available', 'Wi-Fi', 50, 'Lecture'),
('ITS', 107, 'Available', 'Air Conditioner, Computer', 50, 'Lecture'),
('ITS', 108, 'Available', 'Monitor, Whiteboard', 50, 'Lecture'),
('ITS', 109, 'Available', 'Wi-Fi', 50, 'Lecture'),
('ITS', 110, 'Available', 'Computer, Wi-Fi', 50, 'Lecture'),
('ITS', 111, 'Available', 'Monitor, Wi-Fi', 50, 'Lecture'),
('ITS', 112, 'Available', 'Air Conditioner', 50, 'Lecture'),
('ITS', 113, 'Available', 'Computer, Monitor', 50, 'Lecture'),
('ITS', 114, 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
('ITS', 115, 'Available', 'Air Conditioner, Wi-Fi', 50, 'Lecture'),
('ITS', 116, 'Available', 'Monitor, Whiteboard', 50, 'Lecture'),
('ITS', 117, 'Available', 'Wi-Fi, Computer', 50, 'Lecture'),
('ITS', 118, 'Available', 'Air Conditioner', 50, 'Lecture'),
('ITS', 119, 'Available', 'Wi-Fi', 50, 'Lecture'),
('ITS', 120, 'Available', 'Computer', 50, 'Lecture'),
('ITS', 121, 'Available', 'Monitor', 50, 'Lecture'),
('PTC', 220, 'Available', 'Wi-Fi, Whiteboard', 50, 'Lecture'),
('PTC', 221, 'Available', 'Air Conditioner, Monitor', 50, 'Lecture'),
('PTC', 222, 'Available', 'Wi-Fi, Monitor', 50, 'Lecture'),
('PTC', 223, 'Available', 'Air Conditioner, Wi-Fi', 50, 'Lecture'),
('PTC', 224, 'Available', 'Monitor, Whiteboard', 50, 'Lecture');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
