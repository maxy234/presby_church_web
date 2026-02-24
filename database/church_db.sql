-- phpMyAdmin SQL Dump
-- Database: `church_db`

CREATE DATABASE IF NOT EXISTS `church_db`;
USE `church_db`;

-- --------------------------------------------------------

-- Table structure for table `members`
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text,
  `join_date` date NOT NULL,
  `membership_status` enum('Active','Inactive','Visitor') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample data for `members`
INSERT INTO `members` (`id`, `full_name`, `email`, `phone`, `address`, `join_date`, `membership_status`) VALUES
(1, 'John Mensah', 'john.m@email.com', '+233 201 234 567', 'Accra, Ghana', '2024-01-15', 'Active'),
(2, 'Mary Asante', 'mary.a@email.com', '+233 242 345 678', 'Kumasi, Ghana', '2024-01-20', 'Active'),
(3, 'Peter Ofori', 'peter.o@email.com', '+233 277 456 789', 'Cape Coast, Ghana', '2024-02-01', 'Active');

-- --------------------------------------------------------

-- Table structure for table `events`
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `location` varchar(200) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample data for `events`
INSERT INTO `events` (`id`, `event_title`, `event_date`, `event_time`, `location`, `description`) VALUES
(1, 'Sunday Service', '2024-02-18', '08:00:00', 'Main Sanctuary', 'Morning worship service'),
(2, 'Bible Study', '2024-02-21', '18:30:00', 'Fellowship Hall', 'Weekly Bible study session'),
(3, 'Youth Meeting', '2024-02-23', '16:00:00', 'Youth Center', 'Monthly youth fellowship');

-- --------------------------------------------------------

-- Table structure for table `admin_users`
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('Super Admin','Admin','Editor') DEFAULT 'Admin',
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample admin user (password: church2024)
INSERT INTO `admin_users` (`id`, `username`, `password`, `full_name`, `role`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'Church Administrator', 'Super Admin');

-- --------------------------------------------------------

-- Table structure for table `donations`
CREATE TABLE IF NOT EXISTS `donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) NOT NULL,
  `donor_email` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `donation_date` date NOT NULL,
  `payment_method` enum('Cash','Mobile Money','Bank Transfer','Card') DEFAULT 'Cash',
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample data for `donations`
INSERT INTO `donations` (`id`, `donor_name`, `donor_email`, `amount`, `donation_date`, `payment_method`) VALUES
(1, 'Anonymous', NULL, 500.00, '2024-02-01', 'Cash'),
(2, 'Kwame Addo', 'kwame.a@email.com', 200.00, '2024-02-05', 'Mobile Money'),
(3, 'Efua Sutherland', 'efua.s@email.com', 350.00, '2024-02-10', 'Bank Transfer');