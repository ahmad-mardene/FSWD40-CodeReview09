-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 08:39 PM
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

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `brand`, `model`, `year`, `KM_stand`, `Capacity`) VALUES
(1, 'volvo', 'c70', 2010, 300000, 2),
(2, 'BMW', '318', 2008, 280000, 4),
(3, 'Opel', 'Zafira', 2012, 150, 5),
(4, 'Opel', 'Zafira', 2007, 175, 5);

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

--
-- Dumping data for table `car_services`
--

INSERT INTO `car_services` (`fk_car_id`, `situation`, `entering_date`, `ready_date`, `notes`) VALUES
(1, 'r', '2018-02-12 00:00:00', '2018-02-14 00:00:00', NULL),
(2, 'r', '2018-02-12 00:00:00', '2018-02-14 00:00:00', 'c'),
(3, 'r', '2018-06-11 00:00:00', '2018-06-24 00:00:00', 'b');

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

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_car_id`, `name`, `licence_number`, `date_of_birth`) VALUES
(1, 1, 'Norbert Payer', 202020, '1975-01-01'),
(2, 2, 'Pascal Ott', 101010, '0000-00-00');

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

--
-- Dumping data for table `fuel`
--

INSERT INTO `fuel` (`fk_car_id`, `fuel_type`, `filling_date`, `amount`, `KM_stand`, `cost`) VALUES
(2, 'Benzin', '2018-06-15 00:00:00', 25.8, 199, 30),
(1, 'Benzin', '2018-06-14 00:00:00', 50, 295, 65);

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

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `fk_car_id`, `insurance_company`, `start_date`, `expired_date`) VALUES
(1, 1, 'ÖMTC', '2018-01-01', '2019-01-01'),
(2, 2, 'ÖMTC', '2017-05-01', '2018-05-01'),
(3, 3, 'ÖMTC', '2018-06-03', '2019-06-06'),
(4, 4, 'DRIVE SAVE', '2017-07-01', '2019-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_n_costs` int(11) DEFAULT NULL,
  `fk_a_costs` int(11) DEFAULT NULL
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

--
-- Dumping data for table `km_read`
--

INSERT INTO `km_read` (`fk_car_id`, `KM_read`, `read_before`, `read_after`) VALUES
(1, 500, 300000, 300500),
(2, 300, 200000, 200300);

-- --------------------------------------------------------

--
-- Table structure for table `normal_costs`
--

CREATE TABLE `normal_costs` (
  `n_costs` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `normal_costs`
--

INSERT INTO `normal_costs` (`n_costs`, `fk_invoice_id`) VALUES
(100, 1),
(175, 75);

-- --------------------------------------------------------

--
-- Table structure for table `offices_and_locations`
--

CREATE TABLE `offices_and_locations` (
  `fk_car_id` int(11) DEFAULT NULL,
  `office_id` int(11) NOT NULL,
  `Location` varchar(55) DEFAULT NULL,
  `address` char(1) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offices_and_locations`
--

INSERT INTO `offices_and_locations` (`fk_car_id`, `office_id`, `Location`, `address`, `employee_id`, `employee_name`) VALUES
(1, 1, 'Vienna', 'K', 1, 'Ali Daie'),
(2, 2, 'Kärnten', 'a', 2, 'Osman Demble'),
(1, 3, 'salyburg', 'A', 3, 'Imad Ali'),
(4, 4, 'Vienna', 'L', 5, 'Adam Omar');

-- --------------------------------------------------------

--
-- Table structure for table `organizer_employee`
--

CREATE TABLE `organizer_employee` (
  `fk_employee_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `Ort` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organizer_employee`
--

INSERT INTO `organizer_employee` (`fk_employee_id`, `name`, `Ort`) VALUES
(2, 'ggg hhhhh', 'eeee'),
(3, 'uuuu 2tttttt', 'dfasdas'),
(5, 'yahia', 'city center');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `fk_invoice_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `payment_way` varchar(55) DEFAULT NULL
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

--
-- Dumping data for table `period_of_rent`
--

INSERT INTO `period_of_rent` (`rent_date`, `return_date`, `fk_car_id`, `fk_customer_id`) VALUES
('2018-06-24 03:06:08', '2018-06-27 03:18:00', 1, 1),
('2018-06-25 04:00:00', '2018-06-28 07:00:00', 2, 2);

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

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_customer_id`, `fk_car_id`, `fk_employee_id`, `the_date`) VALUES
(1, 1, 1, 1, '2018-06-16'),
(2, 2, 2, 2, '2018-06-17');

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
-- Dumping data for table `traffic_violation`
--

INSERT INTO `traffic_violation` (`fee_id`, `the_time`, `amount`, `fk_customer_id`, `fk_car_id`) VALUES
(1, '2018-05-16 02:20:37', 25.8, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_costs`
--
ALTER TABLE `additional_costs`
  ADD PRIMARY KEY (`a_costs`),
  ADD UNIQUE KEY `fk_invoice_id` (`fk_invoice_id`,`fk_n_costs`,`fk_fee_id`),
  ADD UNIQUE KEY `fk_invoice_id_2` (`fk_invoice_id`),
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
  ADD UNIQUE KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`KM_stand`),
  ADD UNIQUE KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`),
  ADD UNIQUE KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `fk_reservation_id` (`fk_reservation_id`,`fk_car_id`,`fk_customer_id`,`fk_n_costs`,`fk_a_costs`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_n_costs` (`fk_n_costs`),
  ADD KEY `fk_a_costs` (`fk_a_costs`);

--
-- Indexes for table `km_read`
--
ALTER TABLE `km_read`
  ADD PRIMARY KEY (`fk_car_id`),
  ADD UNIQUE KEY `KM_read` (`KM_read`);

--
-- Indexes for table `normal_costs`
--
ALTER TABLE `normal_costs`
  ADD PRIMARY KEY (`fk_invoice_id`),
  ADD UNIQUE KEY `n_costs` (`n_costs`);

--
-- Indexes for table `offices_and_locations`
--
ALTER TABLE `offices_and_locations`
  ADD PRIMARY KEY (`office_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `fk_car_id` (`fk_car_id`,`office_id`,`employee_id`);

--
-- Indexes for table `organizer_employee`
--
ALTER TABLE `organizer_employee`
  ADD PRIMARY KEY (`fk_employee_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`fk_invoice_id`),
  ADD UNIQUE KEY `fk_customer_id` (`fk_customer_id`,`fk_reservation_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `period_of_rent`
--
ALTER TABLE `period_of_rent`
  ADD PRIMARY KEY (`fk_customer_id`),
  ADD UNIQUE KEY `fk_car_id` (`fk_car_id`,`fk_customer_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD UNIQUE KEY `fk_customer_id` (`fk_customer_id`,`fk_car_id`,`fk_employee_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `traffic_violation`
--
ALTER TABLE `traffic_violation`
  ADD PRIMARY KEY (`fee_id`),
  ADD UNIQUE KEY `fee_id` (`fee_id`,`fk_customer_id`,`fk_car_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_costs`
--
ALTER TABLE `additional_costs`
  ADD CONSTRAINT `additional_costs_ibfk_1` FOREIGN KEY (`fk_fee_id`) REFERENCES `traffic_violation` (`fee_id`),
  ADD CONSTRAINT `additional_costs_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

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
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`fk_n_costs`) REFERENCES `normal_costs` (`n_costs`),
  ADD CONSTRAINT `invoice_ibfk_6` FOREIGN KEY (`fk_a_costs`) REFERENCES `additional_costs` (`a_costs`);

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
-- Constraints for table `organizer_employee`
--
ALTER TABLE `organizer_employee`
  ADD CONSTRAINT `organizer_employee_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `offices_and_locations` (`employee_id`);

--
-- Constraints for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `payment_method_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `payment_method_ibfk_3` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `payment_method_ibfk_4` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `payment_method_ibfk_5` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `period_of_rent`
--
ALTER TABLE `period_of_rent`
  ADD CONSTRAINT `period_of_rent_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `period_of_rent_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `period_of_rent_ibfk_3` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fk_employee_id`) REFERENCES `offices_and_locations` (`employee_id`);

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
