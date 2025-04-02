-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2025 at 12:48 PM
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
-- Database: `smartlog`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dtr`
--

CREATE TABLE `dtr` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `numberOFhrs` varchar(2) NOT NULL,
  `remarks` varchar(40) NOT NULL,
  `expert_teacher_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dtr`
--

INSERT INTO `dtr` (`id`, `user_id`, `name`, `date`, `time_in`, `time_out`, `numberOFhrs`, `remarks`, `expert_teacher_id`, `created_at`) VALUES
(11, 19, '', '0000-00-00', '10:00:00', '11:00:00', '5', 'PENDING', 0, '2025-04-01 15:40:17'),
(12, 19, '', '2025-11-01', '10:00:00', '11:00:00', '5', 'PENDING', 0, '2025-04-01 15:42:52'),
(13, 9, '', '2025-11-01', '10:00:00', '11:00:00', '5', 'PENDING', 0, '2025-04-01 15:49:17'),
(14, 10, '', '2025-11-01', '10:00:00', '11:00:00', '5', 'PENDING', 20, '2025-04-02 07:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `id_number` varchar(255) NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','FACULTY','STUDENT') NOT NULL,
  `department` text DEFAULT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  `hk_discount` varchar(255) DEFAULT NULL,
  `expert_teacher` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`, `id_number`, `year`, `course`, `role`, `department`, `contact_number`, `hk_discount`, `expert_teacher`, `created_at`) VALUES
(19, 'lorenlegarda@phinmaed.com', '$2y$10$h4QTG8kPSq/Zs3LihA4Mmu1.0t5RSIX5CWmntzp/4m.CqjdTYp7la', 'LOREN LEGARDA', '1212', 'II', 'BSIT', 'ADMIN', 'CITE', '09518898815', '', '', '2025-04-01 14:36:43'),
(20, 'bukasnadefense@gmail.com', '$2y$10$0VDz0/HipWA8PW4YzSyHCeVJ8fd2pvba.6VZJxfZ4saHWpjjpKd9K', 'Gisella', '1212', 'II', 'BSIT', 'STUDENT', 'CITE', '09518898815', '', '', '2025-04-02 00:33:52'),
(21, 'hehey@gmail.com', '$2y$10$L5AZm7rz7ldyQYovx0fGAOGaTq3fZ8.nxSm5JVWLZLVU9QDUjD9eK', 'Gisella', '1212', 'II', 'BSIT', 'STUDENT', 'CITE', '09518898815', '', '', '2025-04-02 00:37:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dtr`
--
ALTER TABLE `dtr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dtr_ibfk_1` (`user_id`),
  ADD KEY `dtr_fk` (`expert_teacher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dtr`
--
ALTER TABLE `dtr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dtr`
--
ALTER TABLE `dtr`
  ADD CONSTRAINT `dtr_fk` FOREIGN KEY (`expert_teacher_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `dtr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
