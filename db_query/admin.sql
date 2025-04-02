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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
