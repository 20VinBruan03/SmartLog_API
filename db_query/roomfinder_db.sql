-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2025 at 05:39 PM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Administrator','Staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `role`) VALUES
(3, 'Mr. Agape', '12@gmail.com', '$2y$10$xz8xOuppf00IPak2vfBwS.GCobfZTIPuclM9yWtGbaPnsogY7sT/G', 'Administrator'),
(4, 'Admin Angel CSS Master', 'admin@gmail.com', '$2y$10$l10U4SYLtqEfAriIOK2DJOpeZtKzw3HloYUB3PTi.zGdZpMFP306C', 'Administrator'),
(5, 'Admin Ruff', 'ruff@gmail.com', '$2y$10$3dNxlR/IshupbU9PvTM4VeEwjORpsOEHRGGAbP9Fadp7BNb1J/QQy', 'Administrator'),
(6, 'Admin Glenn', 'adminqq@gmail.com', '$2y$10$vW5CstW.u1TclsAsX.Iv3OhbrcxGTxK1uZQjTpYkFiTmm3O6tYrdq', 'Administrator'),
(7, 'Admin Antonio', 'antonio@gmail.com', '$2y$10$BxswtfkYxVrlwBrHeAxbN.MVdP1mLsmZW4UnSt8lW7pE0jHaKPtxG', 'Administrator'),
(8, 'Admin Angelo Blockchain Master', 'admin11@gmail.com', '$2y$10$p6fsUOquayyrPrgYMrjjjuL5DxnGBeIdOiVO7LaAwotjuO1ir8rGu', 'Administrator'),
(9, 'Admin Figma Boi', 'figma@gmail.com', '$2y$10$809gS3OcOl0TcLM/g4rKE.slDyWGbFXXV3hc6Yg1Jpy17B4wD9bYm', 'Administrator'),
(10, 'Admin SQL', 'sql@gmail.com', '$2y$10$KCT1Da.MXtPQcIpz/Hk6YuxRnCrPNrIY7pNA17Mm3H8aT6h4pMO4C', 'Administrator'),
(11, 'Staff Antonio', 'staff1@gmail.com', '$2y$10$YGMkFWWpUH8RMmFWVWIvm.BmbfgeX8FYNA9cKnyt.lAY6W5byT/Oi', 'Staff'),
(12, 'Staff Bernabe', 'staff11@gmail.com', '$2y$10$jhPgOhvML3X7ALjVtdvtN.TLiZenG13tZI5SrplgXFyYhHgi2r1Nq', 'Staff'),
(13, 'Staff MIchael', '1212@gmail.com', '$2y$10$.TZGRQ3rNwzjI0DfgfyV8.lWz0FaXa8xyI2pQbmjXLDynp88D9pXO', 'Staff'),
(14, 'Staff', 'sandda@gmail.com', '$2y$10$poTOFck4vpvNWhO2UE8UCes3cPxPVENbHu8PFP0Gp0B3Xjw1UN/RK', 'Staff'),
(15, 'Staff Arg', 'arg@gmail.com', '$2y$10$8k.MVWG8sa8mSpT9YqB6EOmcdbIyUtpmiNbx.5Nvk3v15zZRhabwq', 'Staff'),
(16, 'New Staff', 'st@gmail.com', '$2y$10$CP0Gs8PuX2vRFraGACNi0OSP8rNSOHcqoaTlHlHRsJ9SUH9dGAZA6', 'Staff'),
(17, 'STa STa', 'sta@gmail.com', '$2y$10$FlCPVAnvehGm2t4vH665HeaI5IU.stl0RXny0ThP0xPALgy1sg8gy', 'Staff'),
(18, 'Stafff Lang ako', 'sana@gmail.com', '$2y$10$q.LeLqXuyAHXnfvvGOmuguQSbZRgfPBc2g4TdMUFR9ERQca7htA7K', 'Staff'),
(19, 'Admin John Doe', 'johndoe@gmail.com', '$2y$10$VhMjLXHhtBgo4lHb9ch1FeTp1iXFiI0nLylcW3rhnIHjiHvZz9kTmG', 'Administrator'),
(20, 'Admin Sarah', 'sarah@gmail.com', '$2y$10$XzpSO23.7yTkP7UwAz16saEwDCKUtQKle8BOWa1PU3Z7jTGbUs7zHS', 'Administrator'),
(22, 'Staff Lisa', 'lisa@gmail.com', '$2y$10$QygZpTQZGVMLvYPg5yAwLO5IkZnB73kLxy1Rkp2tX1DWtcm7hVv4t.', 'Staff'),
(23, 'Staff Mark', 'mark@gmail.com', '$2y$10$kvBf.VKYHVmdqI5IF8CHs5VVNmqpSjei1DT1YsS/5IFRgMyOxIMdHK', 'Staff'),
(24, 'Staff Elena', 'elena@gmail.com', '$2y$10$D9.cZ0qzchFLRTdxpZ87g8dmRSgBvWgmc6uP6K8GlkMIqa02y9xOa', 'Staff'),
(25, 'Staff Jackson', 'jackson@gmail.com', '$2y$10$VFVZnaW6lRl07yXw/90sct5Da2vsNlwD8ikzj4kty2X4MbBMy8j6U', 'Staff'),
(26, 'Admin William', 'william@gmail.com', '$2y$10$S5HQUa9g8vnKyxdhHF1zlkzZb70FlpSgdByQ7VbSlr1gsW6Z/mrT0W', 'Administrator'),
(27, 'Admin Laura', 'laura@gmail.com', '$2y$10$PdlQz23k1C85pfy5lH4Z1fTeOszSFCk3WpSptPvTQ9vklEdlq.m2Ma', 'Administrator'),
(28, 'Admin Bryan', 'bryan@gmail.com', '$2y$10$19Xmz0Z0WwGz3eq9Xm00TpaHkLdslnpv2EdBGG04Vf5VrUq34ylfzF', 'Administrator'),
(29, 'Staff Thomas', 'thomas@gmail.com', '$2y$10$a9hpj1yavf9IZ8GQlY.k0wpuVxX5fVrkxvxWmD.jcQXMmlXQ4n7SS', 'Staff'),
(30, 'Staff Rachel', 'rachel@gmail.com', '$2y$10$XpIjYX9z9lXlOC8kIFvUw8yFevYo8r4SYZs3g9yXFY6Ew1eq5lg0J.', 'Staff'),
(32, 'Staff Alice', 'alice@gmail.com', '$2y$10$2rHwv.OYckZgTf17K2Gx6MlB2hTQt8bY1hdK7LyyXOqFh4Yq1W.Qm', 'Staff'),
(33, 'Staff Emily', 'emily@gmail.com', '$2y$10$ZTzpd7J3fp89DN2hP1gA2m0XZn3V4t5DNCn12lz0cKqDGFgF43oFz', 'Staff'),
(34, 'Admin Charles', 'charles@gmail.com', '$2y$10$Jq1mf6Pv1EXhAZmn9KB2YNjm0WjP2HFhFq9TVTzTfkd7sMiZYbwv6w', 'Administrator'),
(35, 'Admin Amanda', 'amanda@gmail.com', '$2y$10$qu37v2.sYBQKfoYHgAgbFqsqtmqndTkWoq5ndwS5Z16jk1hmiRb29m', 'Administrator'),
(36, 'Admin Zack', 'zack@gmail.com', '$2y$10$NMOyZZdRz0xsv5jBBd5lN41k8YnG9k0pU8dd7Su0U8kOMwUznIpmz', 'Administrator'),
(37, 'Staff James', 'james@gmail.com', '$2y$10$x4j3DmnznpnrE6ZT6oFm0DmjFGzX7pFs.Ck3Kr.y5HkmnBcOpso66', 'Staff'),
(38, 'Staff Sophia', 'sophia@gmail.com', '$2y$10$HTPjN7g1rTyvPttX0hgQnKqAw85GGiQZQh7Ym9FcMmMO5wLDl9pQC', 'Staff'),
(41, 'Admin Peter', 'peter@gmail.com', '$2y$10$GCOqQgpX4Gjwm2GSMZjzNWdGZpHcDHzk1zJtJ1tZh1lOmuUst9ScTK', 'Administrator'),
(42, 'Staff Naomi', 'naomi@gmail.com', '$2y$10$OCkqSlb.mwweV84OwWiXZy9QpP0zqVpBAtGhX2gT2HH9YmIZJgVvsy', 'Staff'),
(43, 'Staff Victoria', 'victoria@gmail.com', '$2y$10$ds17.D9TzhF0mfUqQg5UqF67VGLfhgxaCgfzOqHfSl5IjTpWjG63m', 'Staff'),
(45, 'Admin Greg', 'greg@gmail.com', '$2y$10$VGsBh1.MZ5zpJgrH4P0FljwZ8Rl29yIjoNlmFydf8nseL.XA9Yh4u4', 'Administrator'),
(46, 'Staff Noah', 'noah@gmail.com', '$2y$10$TgfiYgXhYsD3nFVqPjX5l4ZkCZmyPnxzHzP5JXKCrjRm3tmhohUtQ', 'Staff'),
(47, 'Staff Isla', 'isla@gmail.com', '$2y$10$R2dkn5EVXLcRxzI8u3o2.e27OeG9bYZ3iugFlYDlUUSztf.yj3UcsG', 'Staff'),
(48, 'Admin Daniel', 'daniel@gmail.com', '$2y$10$JjxBqKmMlph5ly1wGgq.1JYoEE9v9dV5G8gB59nF6my9hoZ5glIHem', 'Administrator');

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

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Teacher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `teacher_id`, `username`, `email`, `password`, `role`) VALUES
(2, '20202', 'Teacher Luke', 'luke@gmail.com', '$2y$10$J2pDNYB88vD9beEZSkFUbOMdXZKb0jCEvslm4I80WVZ2qOYNRe/e2', 'Teacher'),
(3, '30303', 'Teacher Grace', 'grace@gmail.com', '$2y$10$QhLMzvBtbj11nUy1Yy/.N4tzZ21jQg3yXY5R7ft8s12YVeblBp3dS', 'Teacher'),
(4, '40404', 'Teacher Mark', 'mark@gmail.com', '$2y$10$8jDVs9ZzMzH9Dz9wChOr6AAV7JWpuaP2CevRI2Qm3VZsFPxyV0mbK', 'Teacher'),
(5, '50505', 'Teacher Lily', 'lily@gmail.com', '$2y$10$Gq5QcClTM4oHb6lDgseKfaGy3HKjR78IX3GiL0Qd8dw4i1nO8bE6y', 'Teacher'),
(6, '60606', 'Teacher Alice', 'alice@gmail.com', '$2y$10$CKnAkaFPOzyqXZ9dlduI2SZn3eyuV79hFkKmwhk1BdrWz9jgl0f6i', 'Teacher'),
(8, '80808', 'Teacher Ava', 'ava@gmail.com', '$2y$10$HzJh7f4D60pARUP19t5j3hTsmgJikTS9R3c8DoMMpZ2jq1k3zPjeq', 'Teacher'),
(9, '90909', 'Teacher Noah', 'noah@gmail.com', '$2y$10$RDE9QpddCk.aCVLh6fTz6Hg6fHp5Wz16Viw2Dh8QJlh1jv6L0XOVy', 'Teacher'),
(10, '10001', 'Teacher Sophia', 'sophia@gmail.com', '$2y$10$VqBnxTh5DpFbnfyeOPJ98Wpk88XIz6g.g5IF28lj5pMUn2Nf8/xkW', 'Teacher'),
(11, '10111', 'Teacher John', 'john@gmail.com', '$2y$10$KvB7RvhR6XHpPtn5qJYm4C6tYIcUHErw5wO1AMM4DNMJtCFS0pK4C', 'Teacher'),
(12, '20212', 'Teacher Sarah', 'sarah@gmail.com', '$2y$10$5VoLK6UpD4H6M6Vu0yD6/qXT3tx7QLVZ7eL5GTa2i9lpkNzj2/8hG', 'Teacher'),
(13, '30313', 'Teacher Mike', 'mike@gmail.com', '$2y$10$9QoZW9JIV8qO5c6eGnHzrmXytRZT5jjFtvBztC9J7Ta0ywO9P7mle', 'Teacher'),
(14, '40414', 'Teacher Emma', 'emma@gmail.com', '$2y$10$Z1W4FT0Q4gQWoQb3gDwlfB5DZTpgIFeRU9EObPZYXU93EqJ8kfhwK', 'Teacher'),
(15, '50515', 'Teacher James', 'james@gmail.com', '$2y$10$MZn5I.OT1Vfq9K2ldGsdFbPUIvAKFyIpxu3JrFJ1ZxOguqfTwkm5e', 'Teacher'),
(16, '60616', 'Teacher Olivia', 'olivia@gmail.com', '$2y$10$Jh27rb4vnugknFh9e3.yxh7ZGxQdo8rTdwDGGheKfEl6L7unZd.F8y', 'Teacher'),
(17, '70717', 'Teacher Daniel', 'daniel@gmail.com', '$2y$10$FyfMwqhb15Jj3eS7z7kGZe93F5VtoY5eX5ZZd9PjdYXtMXckpqFIS', 'Teacher'),
(18, '80818', 'Teacher Chloe', 'chloe@gmail.com', '$2y$10$34vXpnQdkhtOnWyLzFJYbZuHfeD9PZRO9t0bQxMjT2vbO3ztVQTiu', 'Teacher'),
(19, '90919', 'Teacher Logan', 'logan@gmail.com', '$2y$10$hVpA0dqsqCUwHb2TaSrxPOnrkVeN9MEuIuCbxqbZa4MfVeCpbbWsC', 'Teacher'),
(20, '10010', 'Teacher Mia', 'mia@gmail.com', '$2y$10$rpqtmkseHfeYYFJSDFgD84vjZJnlRlb.m0FOr2wbAqdmIdXBEX2LK', 'Teacher'),
(21, '10120', 'Teacher Jack', 'jack@gmail.com', '$2y$10$GyL5.ZtOmgRT0tyfoX8XweAGbmBqZcsl9ddpA08TjAKokxZkYWvLK', 'Teacher'),
(22, '20221', 'Teacher Lucas', 'lucas@gmail.com', '$2y$10$aGhje3aN8oJibg9i9dAbGFYuElOelHXX9i9cVdV2RCK2hBaJWJST6', 'Teacher'),
(23, '30322', 'Teacher Abigail', 'abigail@gmail.com', '$2y$10$gqERmqaNaFtmYFbHt1fvH2cmQd6czFf.E9YtDTfDFXauKf6q5wDWx', 'Teacher'),
(24, '40423', 'Teacher Nathan', 'nathan@gmail.com', '$2y$10$ssGgtAC9dW1BzF3QyZx9OxSrmqwvPRwXTXsZpln2lOrXnFpfYw6T6', 'Teacher'),
(25, '50524', 'Teacher Victoria', 'victoria@gmail.com', '$2y$10$zTx5U7e0Lez4EzFfhUkPp5Qn1TSYcAhkqpkQl1EqK9SKOrwTboV0y', 'Teacher'),
(26, '60625', 'Teacher Aiden', 'aiden@gmail.com', '$2y$10$YZlCBKTcWeHi4doCmW3K7kvroOQjoEqblHjmOLdbSb9AxMeZpkFVu', 'Teacher'),
(27, '70726', 'Teacher Isabel', 'isabel@gmail.com', '$2y$10$0g2B8OjtVAw4DOuDXrklXl2HQExyGpMHiOdwrK7aSE4CwMpnSQhC2', 'Teacher'),
(28, '80827', 'Teacher Ethan', 'ethan@gmail.com', '$2y$10$wQzxC1GZECuxn7vH/8kMbiAYj1c7ER5F6EuFDhPoOxw9pyTgbI9D2', 'Teacher'),
(29, '90928', 'Teacher Zoe', 'zoe@gmail.com', '$2y$10$zy65bPLNTFPzoWQqaH9hEo2hzFpGv6rQ7TYk/AD7xONUMVJgoAtZC', 'Teacher'),
(30, '10029', 'Teacher Ben', 'ben@gmail.com', '$2y$10$Zwh0R9PEy.k8Fk6E4HJqae7BMQB.HOVhbcr1BOtEwfFJvPybK3k/q', 'Teacher'),
(31, '10130', 'Teacher Hannah', 'hannah@gmail.com', '$2y$10$H52pTdtUwB2.71aLkB9fd9PNTcRMwVbty/loGSgFFdxhztrzw0z.a', 'Teacher'),
(32, '20231', 'Teacher Samuel', 'samuel@gmail.com', '$2y$10$nkIiDa8t8v4bG1XBmVdLHVzTTCtsV61yVJcmLGSxf2yX6UWeH1mwO', 'Teacher'),
(33, '30332', 'Teacher Sophia', 'sophia2@gmail.com', '$2y$10$E0bFzFlGVFh97tJQy61yE4ZPMUSlVLBxUzAYWlxe7jzH.CURGeNK6', 'Teacher'),
(34, '40433', 'Teacher Oliver', 'oliver@gmail.com', '$2y$10$5VQy4VjpFE1X3Y9X8XZ94Z9wwirZnsDbOpO7XZxy5PWTw9ObWqDRO', 'Teacher'),
(35, '50534', 'Teacher Grace', 'grace2@gmail.com', '$2y$10$uDNHdwD19J8l71cTYO1USc1F6f1meAfugOLQ9ZyOXjzJ8sgUjfoE', 'Teacher'),
(36, '60635', 'Teacher Lucas', 'lucas2@gmail.com', '$2y$10$OXMzyOh0vI7lNSlfxAGH1knYwv2f.lTt6mcZ8sbIEY8kvV9PHkdd6', 'Teacher'),
(37, '70736', 'Teacher Julian', 'julian@gmail.com', '$2y$10$4Yj4zyjkp1Y7sKFFgf5XbFdWPHlQm0Fx9BF20BDK5yLV38K0vhHlq', 'Teacher'),
(38, '80837', 'Teacher Mia', 'mia2@gmail.com', '$2y$10$3Mjk5T9p4S6pC5updrdmQI6GG0mR2izF6fK6V.3RM.e3sY8/giEkG', 'Teacher'),
(39, '90938', 'Teacher Grace', 'grace3@gmail.com', '$2y$10$V.0tsIDk5lVXEw0qVGHs8gKY5eeR0zZ9rrB1XW1SDe8Z.p45ZZ3jy', 'Teacher'),
(40, '10039', 'Teacher Charlotte', 'charlotte@gmail.com', '$2y$10$J85W0uLwTbi9SHKmX4yCxlGFQU5AnTmaNqu0BDOlgFFvDKt0gOpSi', 'Teacher'),
(41, '10140', 'Teacher Elijah', 'elijah@gmail.com', '$2y$10$zM6RUBKDvI6nlXxD7LVpqNYFkb7QXfhGHOT2FgOSepejZT41v3G6C', 'Teacher'),
(42, '20241', 'Teacher Victoria', 'victoria2@gmail.com', '$2y$10$Xjz1hQvbsro2Hjj2qtPxbMOZb2s4YyMlA5s7O3whHWt0yGmwmXNC2', 'Teacher'),
(43, '30342', 'Teacher Noah', 'noah2@gmail.com', '$2y$10$M7O8u2NnlOM4oUJnz7oOqON8SReA.fKfS8IwyZJhGQwnMks.Rp6pa', 'Teacher'),
(44, '123-123', 'teacher', 'teacher@gmail.com', '$2y$10$VUyochiIIz3cih3lDbar.eMzLIeOx0z8idhbOYt/KUHWK933s0da2', 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `user_jwt_token`
--

CREATE TABLE `user_jwt_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `issued_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `status` enum('valid','revoked') NOT NULL DEFAULT 'valid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_jwt_token`
--

INSERT INTO `user_jwt_token` (`id`, `user_id`, `token`, `issued_at`, `expires_at`, `status`) VALUES
(1, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0MzM4OTQsImV4cCI6MTc0MjQzNzQ5NCwiZGF0YSI6eyJpZCI6NDQsInVzZXJuYW1lIjoidGVhY2hlciIsInJvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNzQyNDM3NDk0fSwiaWQiOjQ0fQ.qzS6bSyOeOVLGlenZ0JpyAFrL23ktiw2dbKCpess7-c', '2025-03-20 09:24:54', '2025-03-20 10:24:54', 'valid'),
(2, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0MzcxMjgsImV4cCI6MTc0MjQ0MDcyOCwiZGF0YSI6eyJpZCI6NDQsInVzZXJuYW1lIjoidGVhY2hlciIsInJvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNzQyNDQwNzI4fSwiaWQiOjQ0fQ.QtavOxsXOJOkX89u7fKPDbcaN6Ny4uVbp8RtSm-valE', '2025-03-20 10:18:48', '2025-03-20 11:18:48', 'valid'),
(3, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0Mzc3NzYsImV4cCI6MTc0MjQ0MTM3NiwiZGF0YSI6eyJpZCI6NDQsInVzZXJuYW1lIjoidGVhY2hlciIsInJvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNzQyNDQxMzc2fSwiaWQiOjQ0fQ.-C7iEppn2eAtPpYRcCfWBz6PoymtfZBvB6NyIKNgDPY', '2025-03-20 10:29:36', '2025-03-20 11:29:36', 'valid'),
(4, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0NDA1MDMsImV4cCI6MTc0MjQ0NDEwMywiZGF0YSI6eyJpZCI6NDQsInVzZXJuYW1lIjoidGVhY2hlciIsInJvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNzQyNDQ0MTAzfSwiaWQiOjQ0fQ.RLAH7y2q7pYGPo-SbmkJTQTEGDIBTsxk3iQQKuClhlQ', '2025-03-20 11:15:03', '2025-03-20 12:15:03', 'valid'),
(5, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDI0NDA2MDYsImV4cCI6MTc0MjQ0NDIwNiwiZGF0YSI6eyJpZCI6NDQsInVzZXJuYW1lIjoidGVhY2hlciIsInJvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNzQyNDQ0MjA2fSwiaWQiOjQ0fQ.8EPRho8oUdK61oHySV3DYeOMzyONobGq6nc5TATpWP0', '2025-03-20 11:16:46', '2025-03-20 12:16:46', 'valid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin_jwt_token`
--
ALTER TABLE `admin_jwt_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_request`
--
ALTER TABLE `room_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`user_id`),
  ADD KEY `room_request_ibfk_1` (`room_id`);

--
-- Indexes for table `room_schedule`
--
ALTER TABLE `room_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_id` (`room_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_jwt_token`
--
ALTER TABLE `user_jwt_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `admin_jwt_token`
--
ALTER TABLE `admin_jwt_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `room_request`
--
ALTER TABLE `room_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `room_schedule`
--
ALTER TABLE `room_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user_jwt_token`
--
ALTER TABLE `user_jwt_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_jwt_token`
--
ALTER TABLE `admin_jwt_token`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_request`
--
ALTER TABLE `room_request`
  ADD CONSTRAINT `room_request_ibfk2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_request_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_schedule`
--
ALTER TABLE `room_schedule`
  ADD CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
