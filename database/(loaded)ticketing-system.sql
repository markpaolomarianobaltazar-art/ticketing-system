-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2026 at 04:55 PM
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
-- Database: `ticketing-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('P1','P2','P3','P4','P5') DEFAULT 'P3',
  `status` enum('open','in_progress','resolved','closed') DEFAULT 'open',
  `created_by` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `title`, `description`, `priority`, `status`, `created_by`, `assigned_to`, `created_at`, `updated_at`) VALUES
(1, 'Cannot access email', 'Please check my MS outlook. I can\'t access my emails', 'P3', 'open', 4, 3, '2026-06-04 14:42:20', '2026-06-04 14:49:57'),
(2, 'Laptop running slow', 'I really need my laptop to continue operation. Please fix urgently', 'P1', 'open', 5, 2, '2026-06-04 14:43:44', '2026-06-04 14:48:16'),
(3, 'VPN connection failed', 'My VPN app is not running correctly', 'P4', 'open', 6, NULL, '2026-06-04 14:44:48', '2026-06-04 14:44:48'),
(4, 'Printer issue', 'Please check printer, not working properly', 'P5', 'closed', 6, 2, '2026-06-04 14:47:46', '2026-06-04 14:53:03'),
(5, 'Network Issue', 'I\'ve found a router issue. I am also looking into this and will keep you posted', 'P1', 'open', 3, 3, '2026-06-04 14:51:50', '2026-06-04 14:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `comment_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`comment_id`, `ticket_id`, `user_id`, `comment`, `created_at`) VALUES
(1, 1, 4, 'Please check my MS outlook. I can\'t access my emails', '2026-06-04 14:42:20'),
(2, 2, 5, 'I really need my laptop to continue operation. Please fix urgently', '2026-06-04 14:43:44'),
(3, 3, 6, 'My VPN app is not running correctly', '2026-06-04 14:44:48'),
(4, 4, 6, 'Please check printer, not working properly', '2026-06-04 14:47:46'),
(5, 2, 2, 'Ticket assigned to Sarah Reyes by Sarah Reyes (technician)', '2026-06-04 14:48:16'),
(6, 2, 2, 'I am looking into this.', '2026-06-04 14:48:39'),
(7, 1, 3, 'Ticket assigned to Kevin Cruz by Kevin Cruz (technician)', '2026-06-04 14:49:57'),
(8, 1, 3, 'Can you try to restart MS outlook?, if that didn\'t work try to restart your device', '2026-06-04 14:50:46'),
(9, 5, 3, 'I\'ve found a router issue. I am also looking into this and will keep you posted', '2026-06-04 14:51:51'),
(10, 4, 2, 'Ticket assigned to Sarah Reyes by Sarah Reyes (technician)', '2026-06-04 14:52:54'),
(11, 4, 2, 'This ticket was closed by Sarah Reyes (technician)', '2026-06-04 14:53:03'),
(12, 5, 1, 'Any update on this issue?', '2026-06-04 14:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `role` enum('admin','technician','customer') NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `contact`, `role`, `position`, `created_at`, `status`) VALUES
(1, 'michael.santos@mbitsolutions.com', '$2b$10$1/1uDB83wG7LPvYk.z13j.oL9am1LglowL6xY4cpIjOm1afEp.4by', 'Michael Santos', NULL, 'admin', NULL, '2026-06-04 14:20:08', 'active'),
(2, 'sarah.reyes@mbitsolutions.com', '$2b$10$rhd7ZgSLL6bg75jqhqs76uuChmUcA3bHHUoGscazj9/Jji3YcutW.', 'Sarah Reyes', '09159874521', 'technician', NULL, '2026-06-04 14:21:40', 'active'),
(3, 'kevin.cruz@mbitsolutions.com', '$2b$10$fYLYTDk3Et/516NKP2FyRu/PM8L3qVuI2AF1azRvugnv4b9OvVuvm', 'Kevin Cruz', '09237519876', 'technician', NULL, '2026-06-04 14:30:06', 'active'),
(4, 'anna.villanueva@acmecorp.com', '$2b$10$J34YrAPnI4BBTTu0dj3gnOorOeNFlGU0MpqIP0JnuYucIeGOOoK9u', 'Anna Villanueva', '09453587964', 'customer', NULL, '2026-06-04 14:31:21', 'active'),
(5, 'mark.garcia@acmecorp.com', '$2b$10$FaBiGB3X.SSif7N8Nw3Rv..2P/cp0AFpihW6pqc1G3plbBqXWGHbS', 'Mark Garcia', '09876341256', 'customer', NULL, '2026-06-04 14:36:25', 'active'),
(6, 'patricia.mendoza@acmecorp.com', '$2b$10$ArkGQ9ZYB.JvFlaWP99oy.PnfRL6lrDFmfxzURIwL/tjmmgAgVpR6', 'Patricia Mendoza', '09163785428', 'customer', NULL, '2026-06-04 14:37:13', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
