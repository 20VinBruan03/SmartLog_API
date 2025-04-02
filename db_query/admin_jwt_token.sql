-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2025 at 05:40 PM
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
-- Table structure for table `admin_jwt_token`
--

CREATE TABLE `admin_jwt_token` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `issued_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `status` enum('valid','revoked') NOT NULL DEFAULT 'valid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_jwt_token`
--

INSERT INTO `admin_jwt_token` (`id`, `admin_id`, `token`, `issued_at`, `expires_at`, `status`) VALUES
(1, 4, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDIzOTM0NDgsImV4cCI6MTc0MjM5NzA0OCwiZGF0YSI6eyJpZCI6NCwidXNlcm5hbWUiOiJBZG1pbiBBbmdlbCBDU1MgTWFzdGVyIiwicm9sZSI6ImFkbWluIiwiZXhwIjoxNzQyMzk3MDQ4fSwiaWQiOjR9.oXUu6cm5Ei3X9Y2zHYn4oxJDPh1C7sAsDT_Ebu8svQg', '2025-03-19 22:10:48', '2025-03-19 23:10:48', 'valid'),
(2, 4, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDIzOTY2MTksImV4cCI6MTc0MjQwMDIxOSwiZGF0YSI6eyJpZCI6NCwidXNlcm5hbWUiOiJBZG1pbiBBbmdlbCBDU1MgTWFzdGVyIiwicm9sZSI6ImFkbWluIiwiZXhwIjoxNzQyNDAwMjE5fSwiaWQiOjR9.JGoonCuo6yQ2GV6aQiMgXyZfosJDx38NPNKjTgJhSBI', '2025-03-19 23:03:39', '2025-03-20 00:03:39', 'valid'),
(3, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0MDAxNzQsImV4cCI6MTc0MjQwMzc3NCwiZGF0YSI6eyJpZCI6OCwidXNlcm5hbWUiOiJBZG1pbiBBbmdlbG8gQmxvY2tjaGFpbiBNYXN0ZXIiLCJyb2xlIjoiYWRtaW4iLCJleHAiOjE3NDI0MDM3NzR9LCJpZCI6OH0.6H3OXEvYICDqsvFVllmrY-X-QSQIoernpTVBnP', '2025-03-20 00:02:55', '2025-03-20 01:02:55', 'valid'),
(4, 4, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0Mjk2NzIsImV4cCI6MTc0MjQzMzI3MiwiZGF0YSI6eyJpZCI6NCwidXNlcm5hbWUiOiJBZG1pbiBBbmdlbCBDU1MgTWFzdGVyIiwicm9sZSI6ImFkbWluIiwiZXhwIjoxNzQyNDMzMjcyfSwiaWQiOjR9.ovDnTvl72ObMXmvy4nBC4OjSIt3bbH0anN2RBRkTHR0', '2025-03-20 08:14:32', '2025-03-20 09:14:32', 'valid'),
(5, 4, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0NDY5OTUsImV4cCI6MTc0MjQ1MDU5NSwiZGF0YSI6eyJpZCI6NCwidXNlcm5hbWUiOiJBZG1pbiBBbmdlbCBDU1MgTWFzdGVyIiwicm9sZSI6ImFkbWluIiwiZXhwIjoxNzQyNDUwNTk1fSwiaWQiOjR9.IyYJTBnfMxWbKN-3_ZwcwWEE4cVHlPkCB247nLdyILU', '2025-03-20 13:03:15', '2025-03-20 14:03:15', 'valid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_jwt_token`
--
ALTER TABLE `admin_jwt_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_jwt_token`
--
ALTER TABLE `admin_jwt_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_jwt_token`
--
ALTER TABLE `admin_jwt_token`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
