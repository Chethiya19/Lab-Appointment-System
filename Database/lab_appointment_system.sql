-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 02:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab_appointment_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Aid` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `test_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Aid`, `p_name`, `date`, `time`, `test_type`) VALUES
(1, 'Chethiya', '2024-03-18', '11:50', 'Blood Test'),
(2, 'Chethiya', '2024-03-18', '16:30', 'Blood Test'),
(3, 'Chethiya', '2024-03-22', '14:15', 'Microbiological Tests'),
(4, 'Chethiya', '2024-03-22', '19:35', 'Dengue Antigen'),
(5, 'Tamasha', '2024-03-30', '19:37', 'Dengue Antigen'),
(6, 'Chethiya', '2024-03-22', '06:38', 'Thyroid Function Tests'),
(7, 'Yasara', '2024-03-25', '02:10', 'Microbiological Tests'),
(8, 'Chamalka', '2024-03-25', '12:44', 'Thyroid Function Tests'),
(9, 'Chethiya', '2024-03-25', '13:48', 'Genetic Test'),
(10, 'Chethiya', '2024-03-25', '13:48', 'Genetic Test'),
(11, 'Chethiya', '2024-03-25', '01:51', 'Dengue Antigen'),
(12, 'Chethiya', '2024-03-25', '01:51', 'Dengue Antigen'),
(13, 'Chethiya', '2024-03-26', '12:53', 'Dengue Antigen'),
(14, 'Tamasha', '2024-03-27', '13:55', 'Microbiological Tests'),
(15, 'Chethiya', '2024-03-27', '12:58', 'Cancer Marker Tests'),
(16, 'Chethiya', '2024-03-25', '06:00', 'BMP & CMP Tests'),
(17, 'Chethiya', '2024-03-25', '02:45', 'Genetic Test'),
(18, 'Chethiya', '2024-03-25', '05:57', 'Dengue Antigen'),
(19, 'Chamalka', '2024-03-25', '05:05', 'Thyroid Function Tests'),
(20, 'Induwara', '2024-03-25', '06:08', 'Thyroid Function Tests'),
(21, 'Madusanka', '2024-03-25', '06:10', 'Dengue Antigen'),
(22, 'Chethiya', '2024-03-26', '20:28', 'Thyroid Function Tests');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateOfBirth` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `email`, `password`, `dateOfBirth`, `contact`) VALUES
(1, 'Chethiya', 'chethiyanimesha19@gmail.com', '123', '2001-03-09', '076220099'),
(2, 'Tamasha', 'tamashakavindi6774@gmail.com', '123', '2001-05-02', '0764243674'),
(11, 'wanshika', 'ch@gmail.com', '1234', '2024-03-18', '0762240099'),
(15, 'Malin', 'kasun@gmail.com', '1232', '2024-02-27', '0762240099'),
(20, 'Senadheera', 'chethiyasenadheera123@gmail.com', '123', '2000-03-18', '0771313990'),
(21, 'Tamasha Kavindi', 'tamashakavindi674@gmail.com', '999', '2001-02-05', '0764243674');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `expiry_date` varchar(7) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `person_name`, `amount`, `card_number`, `expiry_date`, `cvv`, `payment_date`) VALUES
(1, 'Chethiya Senadheera', '1500.00', '1234567812345678', '02/27', '567', '2024-03-25 09:56:41'),
(2, 'Tamasha Kavindi', '2100.00', '12345678', '12/26', '123', '2024-03-25 10:21:53'),
(3, 'Chethiya', '2900.00', '1234567812345678', '02/2026', '999', '2024-03-25 11:08:50'),
(4, 'Chethiya', '1500.00', '123456781234567', '12/25', '345', '2024-03-25 11:13:10'),
(5, 'Chethiya', '2900.00', '1234567812345678', '02/25', '345', '2024-03-25 11:28:20'),
(6, 'Chethiya', '1700.00', '123 5678 1234 5678', '02/27', '123', '2024-03-25 11:40:55'),
(7, 'Chethiya', '1700.00', '123 5678 1234 5678', '02/27', '123', '2024-03-25 11:40:58'),
(8, 'Chethiya Senadheera', '2100.00', '1234 5678 1234 5678', '02/27', '567', '2024-03-25 12:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `rid` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `pdf_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`rid`, `patient_name`, `pdf_file`) VALUES
(390, 'Chethiya', 'C:fakepathMedical Report.pdf'),
(490, 'Yasara', 'C:fakepathMedical Report.pdf'),
(900, 'Chethiya', 'C:fakepathMedical Report.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `file_name`, `file_path`) VALUES
(1, '', 'reports/ABC lab Report.pdf'),
(2, '', 'reports/Medi lab Report.pdf'),
(3, '', 'reports/Sample Bio Lab Report.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `dateOfBirth` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `technician`
--

INSERT INTO `technician` (`id`, `name`, `email`, `password`, `dateOfBirth`, `contact`) VALUES
(1, 'Perera', 'perera123@gmail.com', '123', '2001-01-01', '077123567'),
(2, 'Chethiya', 'chethiyanimesha19@gmail.com', '123', '2001-01-01', '077123567');

-- --------------------------------------------------------

--
-- Table structure for table `test_details`
--

CREATE TABLE `test_details` (
  `testId` int(11) NOT NULL,
  `patientName` varchar(255) DEFAULT NULL,
  `testType` varchar(255) DEFAULT NULL,
  `testResult` varchar(255) DEFAULT NULL,
  `technician` varchar(255) DEFAULT NULL,
  `doctor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_details`
--

INSERT INTO `test_details` (`testId`, `patientName`, `testType`, `testResult`, `technician`, `doctor`) VALUES
(1, 'Chethiya', 'Blood Test', 'Pass', 'Perera', 'Senanayaka'),
(2, 'Tamasha', 'Microbiological Tests', 'Pass', 'Mendis', 'Liyanage'),
(3, 'Moneesha', 'Dengue Antigen', 'Positive', 'Rathnayake', 'Karunarthne'),
(4, 'Yasintha', 'BMP & CMP Tests', 'Pass', 'Rajapaksha', 'Wijesooriya'),
(5, 'Sheron', 'Genetic Test', 'Pass', 'Rajapaksha', 'Karunarthne'),
(6, 'Chethiya', 'Lipid Panel', 'Pass', 'Rathnayake', 'Liyanage');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Aid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `technician`
--
ALTER TABLE `technician`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_details`
--
ALTER TABLE `test_details`
  ADD PRIMARY KEY (`testId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `technician`
--
ALTER TABLE `technician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
