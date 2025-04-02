-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 11:58 AM
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
-- Dumping data for table `user`
--
INSERT INTO `user` (`teacher_id`, `username`, `email`, `password`, `role`) VALUES
('10101', 'Teacher Emily', 'emily@gmail.com', '$2y$10$A6h6Qntp.wF22M7zk1Xj7L47XeorOIJ51RiOGVdFY1esZV5AKf46u', 'Teacher'),
('20202', 'Teacher Luke', 'luke@gmail.com', '$2y$10$J2pDNYB88vD9beEZSkFUbOMdXZKb0jCEvslm4I80WVZ2qOYNRe/e2', 'Teacher'),
('30303', 'Teacher Grace', 'grace@gmail.com', '$2y$10$QhLMzvBtbj11nUy1Yy/.N4tzZ21jQg3yXY5R7ft8s12YVeblBp3dS', 'Teacher'),
('40404', 'Teacher Mark', 'mark@gmail.com', '$2y$10$8jDVs9ZzMzH9Dz9wChOr6AAV7JWpuaP2CevRI2Qm3VZsFPxyV0mbK', 'Teacher'),
('50505', 'Teacher Lily', 'lily@gmail.com', '$2y$10$Gq5QcClTM4oHb6lDgseKfaGy3HKjR78IX3GiL0Qd8dw4i1nO8bE6y', 'Teacher'),
('60606', 'Teacher Alice', 'alice@gmail.com', '$2y$10$CKnAkaFPOzyqXZ9dlduI2SZn3eyuV79hFkKmwhk1BdrWz9jgl0f6i', 'Teacher'),
('70707', 'Teacher Harry', 'harry@gmail.com', '$2y$10$E12Lg42NjCzmjXOD2xk4PvZ2YliFJ7z8ZZmPbhZyvvMTNvcA2UaxO', 'Teacher'),
('80808', 'Teacher Ava', 'ava@gmail.com', '$2y$10$HzJh7f4D60pARUP19t5j3hTsmgJikTS9R3c8DoMMpZ2jq1k3zPjeq', 'Teacher'),
('90909', 'Teacher Noah', 'noah@gmail.com', '$2y$10$RDE9QpddCk.aCVLh6fTz6Hg6fHp5Wz16Viw2Dh8QJlh1jv6L0XOVy', 'Teacher'),
('10001', 'Teacher Sophia', 'sophia@gmail.com', '$2y$10$VqBnxTh5DpFbnfyeOPJ98Wpk88XIz6g.g5IF28lj5pMUn2Nf8/xkW', 'Teacher'),
('10111', 'Teacher John', 'john@gmail.com', '$2y$10$KvB7RvhR6XHpPtn5qJYm4C6tYIcUHErw5wO1AMM4DNMJtCFS0pK4C', 'Teacher'),
('20212', 'Teacher Sarah', 'sarah@gmail.com', '$2y$10$5VoLK6UpD4H6M6Vu0yD6/qXT3tx7QLVZ7eL5GTa2i9lpkNzj2/8hG', 'Teacher'),
('30313', 'Teacher Mike', 'mike@gmail.com', '$2y$10$9QoZW9JIV8qO5c6eGnHzrmXytRZT5jjFtvBztC9J7Ta0ywO9P7mle', 'Teacher'),
('40414', 'Teacher Emma', 'emma@gmail.com', '$2y$10$Z1W4FT0Q4gQWoQb3gDwlfB5DZTpgIFeRU9EObPZYXU93EqJ8kfhwK', 'Teacher'),
('50515', 'Teacher James', 'james@gmail.com', '$2y$10$MZn5I.OT1Vfq9K2ldGsdFbPUIvAKFyIpxu3JrFJ1ZxOguqfTwkm5e', 'Teacher'),
('60616', 'Teacher Olivia', 'olivia@gmail.com', '$2y$10$Jh27rb4vnugknFh9e3.yxh7ZGxQdo8rTdwDGGheKfEl6L7unZd.F8y', 'Teacher'),
('70717', 'Teacher Daniel', 'daniel@gmail.com', '$2y$10$FyfMwqhb15Jj3eS7z7kGZe93F5VtoY5eX5ZZd9PjdYXtMXckpqFIS', 'Teacher'),
('80818', 'Teacher Chloe', 'chloe@gmail.com', '$2y$10$34vXpnQdkhtOnWyLzFJYbZuHfeD9PZRO9t0bQxMjT2vbO3ztVQTiu', 'Teacher'),
('90919', 'Teacher Logan', 'logan@gmail.com', '$2y$10$hVpA0dqsqCUwHb2TaSrxPOnrkVeN9MEuIuCbxqbZa4MfVeCpbbWsC', 'Teacher'),
('10010', 'Teacher Mia', 'mia@gmail.com', '$2y$10$rpqtmkseHfeYYFJSDFgD84vjZJnlRlb.m0FOr2wbAqdmIdXBEX2LK', 'Teacher'),
('10120', 'Teacher Jack', 'jack@gmail.com', '$2y$10$GyL5.ZtOmgRT0tyfoX8XweAGbmBqZcsl9ddpA08TjAKokxZkYWvLK', 'Teacher'),
('20221', 'Teacher Lucas', 'lucas@gmail.com', '$2y$10$aGhje3aN8oJibg9i9dAbGFYuElOelHXX9i9cVdV2RCK2hBaJWJST6', 'Teacher'),
('30322', 'Teacher Abigail', 'abigail@gmail.com', '$2y$10$gqERmqaNaFtmYFbHt1fvH2cmQd6czFf.E9YtDTfDFXauKf6q5wDWx', 'Teacher'),
('40423', 'Teacher Nathan', 'nathan@gmail.com', '$2y$10$ssGgtAC9dW1BzF3QyZx9OxSrmqwvPRwXTXsZpln2lOrXnFpfYw6T6', 'Teacher'),
('50524', 'Teacher Victoria', 'victoria@gmail.com', '$2y$10$zTx5U7e0Lez4EzFfhUkPp5Qn1TSYcAhkqpkQl1EqK9SKOrwTboV0y', 'Teacher'),
('60625', 'Teacher Aiden', 'aiden@gmail.com', '$2y$10$YZlCBKTcWeHi4doCmW3K7kvroOQjoEqblHjmOLdbSb9AxMeZpkFVu', 'Teacher'),
('70726', 'Teacher Isabel', 'isabel@gmail.com', '$2y$10$0g2B8OjtVAw4DOuDXrklXl2HQExyGpMHiOdwrK7aSE4CwMpnSQhC2', 'Teacher'),
('80827', 'Teacher Ethan', 'ethan@gmail.com', '$2y$10$wQzxC1GZECuxn7vH/8kMbiAYj1c7ER5F6EuFDhPoOxw9pyTgbI9D2', 'Teacher'),
('90928', 'Teacher Zoe', 'zoe@gmail.com', '$2y$10$zy65bPLNTFPzoWQqaH9hEo2hzFpGv6rQ7TYk/AD7xONUMVJgoAtZC', 'Teacher'),
('10029', 'Teacher Ben', 'ben@gmail.com', '$2y$10$Zwh0R9PEy.k8Fk6E4HJqae7BMQB.HOVhbcr1BOtEwfFJvPybK3k/q', 'Teacher'),
('10130', 'Teacher Hannah', 'hannah@gmail.com', '$2y$10$H52pTdtUwB2.71aLkB9fd9PNTcRMwVbty/loGSgFFdxhztrzw0z.a', 'Teacher'),
('20231', 'Teacher Samuel', 'samuel@gmail.com', '$2y$10$nkIiDa8t8v4bG1XBmVdLHVzTTCtsV61yVJcmLGSxf2yX6UWeH1mwO', 'Teacher'),
('30332', 'Teacher Sophia', 'sophia2@gmail.com', '$2y$10$E0bFzFlGVFh97tJQy61yE4ZPMUSlVLBxUzAYWlxe7jzH.CURGeNK6', 'Teacher'),
('40433', 'Teacher Oliver', 'oliver@gmail.com', '$2y$10$5VQy4VjpFE1X3Y9X8XZ94Z9wwirZnsDbOpO7XZxy5PWTw9ObWqDRO', 'Teacher'),
('50534', 'Teacher Grace', 'grace2@gmail.com', '$2y$10$uDNHdwD19J8l71cTYO1USc1F6f1meAfugOLQ9ZyOXjzJ8sgUjfoE', 'Teacher'),
('60635', 'Teacher Lucas', 'lucas2@gmail.com', '$2y$10$OXMzyOh0vI7lNSlfxAGH1knYwv2f.lTt6mcZ8sbIEY8kvV9PHkdd6', 'Teacher'),
('70736', 'Teacher Julian', 'julian@gmail.com', '$2y$10$4Yj4zyjkp1Y7sKFFgf5XbFdWPHlQm0Fx9BF20BDK5yLV38K0vhHlq', 'Teacher'),
('80837', 'Teacher Mia', 'mia2@gmail.com', '$2y$10$3Mjk5T9p4S6pC5updrdmQI6GG0mR2izF6fK6V.3RM.e3sY8/giEkG', 'Teacher'),
('90938', 'Teacher Grace', 'grace3@gmail.com', '$2y$10$V.0tsIDk5lVXEw0qVGHs8gKY5eeR0zZ9rrB1XW1SDe8Z.p45ZZ3jy', 'Teacher'),
('10039', 'Teacher Charlotte', 'charlotte@gmail.com', '$2y$10$J85W0uLwTbi9SHKmX4yCxlGFQU5AnTmaNqu0BDOlgFFvDKt0gOpSi', 'Teacher'),
('10140', 'Teacher Elijah', 'elijah@gmail.com', '$2y$10$zM6RUBKDvI6nlXxD7LVpqNYFkb7QXfhGHOT2FgOSepejZT41v3G6C', 'Teacher'),
('20241', 'Teacher Victoria', 'victoria2@gmail.com', '$2y$10$Xjz1hQvbsro2Hjj2qtPxbMOZb2s4YyMlA5s7O3whHWt0yGmwmXNC2', 'Teacher'),
('30342', 'Teacher Noah', 'noah2@gmail.com', '$2y$10$M7O8u2NnlOM4oUJnz7oOqON8SReA.fKfS8IwyZJhGQwnMks.Rp6pa', 'Teacher');
    
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
