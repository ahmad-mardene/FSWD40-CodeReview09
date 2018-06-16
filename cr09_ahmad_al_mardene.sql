-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 04:57 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_ahmad_al_mardene`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_costs`
--

CREATE TABLE `additional_costs` (
  `a_costs` int(11) NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_n_costs` int(11) DEFAULT NULL,
  `fk_fee_id` int(11) DEFAULT NULL,
  `damages` char(1) DEFAULT NULL,
  `notes` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `brand` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `KM_stand` float DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_services`
--

CREATE TABLE `car_services` (
  `fk_car_id` int(11) NOT NULL,
  `situation` char(1) DEFAULT NULL,
  `entering_date` datetime DEFAULT NULL,
  `ready_date` datetime DEFAULT NULL,
  `notes` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `licence_number` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fuel`
--

CREATE TABLE `fuel` (
  `fk_car_id` int(11) DEFAULT NULL,
  `fuel_type` varchar(55) DEFAULT NULL,
  `filling_date` datetime DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `KM_stand` float NOT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `insurance_company` varchar(55) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `km_read`
--

CREATE TABLE `km_read` (
  `fk_car_id` int(11) NOT NULL,
  `KM_read` float DEFAULT NULL,
  `read_before` float DEFAULT NULL,
  `read_after` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `normal_costs`
--

CREATE TABLE `normal_costs` (
  `n_costs` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offices_and_locations`
--

CREATE TABLE `offices_and_locations` (
  `fk_car_id` int(11) DEFAULT NULL,
  `office_id` int(11) NOT NULL,
  `Location` varchar(55) DEFAULT NULL,
  `address` char(1) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organizer_employee`
--

CREATE TABLE `organizer_employee` (
  `fk_employee_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `Ort` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `period_of_rent`
--

CREATE TABLE `period_of_rent` (
  `rent_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `the_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `traffic_violation`
--

CREATE TABLE `traffic_violation` (
  `fee_id` int(11) NOT NULL,
  `the_time` datetime DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_costs`
--
ALTER TABLE `additional_costs`
  ADD PRIMARY KEY (`a_costs`),
  ADD KEY `fk_fee_id` (`fk_fee_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_services`
--
ALTER TABLE `car_services`
  ADD PRIMARY KEY (`fk_car_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`KM_stand`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `km_read`
--
ALTER TABLE `km_read`
  ADD PRIMARY KEY (`fk_car_id`);

--
-- Indexes for table `normal_costs`
--
ALTER TABLE `normal_costs`
  ADD PRIMARY KEY (`fk_invoice_id`);

--
-- Indexes for table `offices_and_locations`
--
ALTER TABLE `offices_and_locations`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `organizer_employee`
--
ALTER TABLE `organizer_employee`
  ADD PRIMARY KEY (`fk_employee_id`);

--
-- Indexes for table `period_of_rent`
--
ALTER TABLE `period_of_rent`
  ADD PRIMARY KEY (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `traffic_violation`
--
ALTER TABLE `traffic_violation`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_costs`
--
ALTER TABLE `additional_costs`
  ADD CONSTRAINT `additional_costs_ibfk_1` FOREIGN KEY (`fk_fee_id`) REFERENCES `traffic_violation` (`fee_id`);

--
-- Constraints for table `car_services`
--
ALTER TABLE `car_services`
  ADD CONSTRAINT `car_services_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `fuel`
--
ALTER TABLE `fuel`
  ADD CONSTRAINT `fuel_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `km_read`
--
ALTER TABLE `km_read`
  ADD CONSTRAINT `km_read_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `offices_and_locations`
--
ALTER TABLE `offices_and_locations`
  ADD CONSTRAINT `offices_and_locations_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `period_of_rent`
--
ALTER TABLE `period_of_rent`
  ADD CONSTRAINT `period_of_rent_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `period_of_rent_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `traffic_violation`
--
ALTER TABLE `traffic_violation`
  ADD CONSTRAINT `traffic_violation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `traffic_violation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
