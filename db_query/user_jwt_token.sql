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
-- Indexes for table `user_jwt_token`
--
ALTER TABLE `user_jwt_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_jwt_token`
--
ALTER TABLE `user_jwt_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
