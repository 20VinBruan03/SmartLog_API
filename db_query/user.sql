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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
