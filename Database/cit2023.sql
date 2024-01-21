-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 06:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cit2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_device`
--

CREATE TABLE `tb_device` (
  `imei_no` varchar(20) NOT NULL,
  `DeviceName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_device`
--

INSERT INTO `tb_device` (`imei_no`, `DeviceName`) VALUES
('', ''),
('23', 'df'),
('2323', 'erge'),
('234234', 'dddd');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_card` varchar(5) NOT NULL,
  `titlename` varchar(10) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `heart_value` float(5,2) NOT NULL,
  `pulse_value` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_card`, `titlename`, `firstname`, `lastname`, `date_of_birth`, `heart_value`, `pulse_value`) VALUES
('11111', 'Mr.', 'John', 'Doe', '1990-01-01', 90.50, 70.20),
('22222', 'Mrs.', 'Jane', 'Doe', '1995-05-05', 85.00, 75.50),
('33333', 'Mr.', 'Bob', 'Smith', '1985-12-10', 88.00, 78.00),
('44444', 'Miss', 'Apinya', 'Noochuay', '2001-04-05', 75.00, 120.00),
('55555', 'Mr.', 'Narongrit', 'Suaysom', '2003-02-19', 75.00, 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(5) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `password`, `phone`, `dob`) VALUES
('', 'AA', 'BB', 'admin', '123', '099999999', '2023-12-15'),
('00001', 'Narongrit', 'Suaysom', '641463014@crru.ac.th', 'save12345', '0621653986', '0000-00-00'),
('00002', '', '', '', '', '', '0000-00-00'),
('00003', 'AA', 'BB', 'admin', '123', '099999999', '0000-00-00'),
('00004', '', '', '', '', '', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_device`
--
ALTER TABLE `tb_device`
  ADD PRIMARY KEY (`imei_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_card`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
