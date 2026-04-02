-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2026 at 05:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cheshamvansdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acct_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT '',
  `password` varchar(100) DEFAULT '',
  `type` varchar(100) DEFAULT '',
  `imagename` varchar(50) DEFAULT '',
  `status` text NOT NULL,
  `signupdate` text NOT NULL,
  `screenlock` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `contact_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acct_id`, `username`, `password`, `type`, `imagename`, `status`, `signupdate`, `screenlock`, `branch_id`, `fname`, `lname`, `mname`, `contact_no`) VALUES
(62, 'sky', '$2y$10$dBcJC21GQN..RjAYgaq1re1ntjw4LE4eRVh2WW6FMtSUtC8a/ZGxm', 'Administrator', '1757993221_profile_demo.jpeg', 'Offline', 'Sat Feb 18, 2017 10:07 pm', 'OFF', 1, 'sky', 'sky', '', 12345678),
(67, 'akash', '$2y$10$NnwB8YyDFNJYa2C6ExJzL.qOrEeVSeor0BVllRMm09Q89o67qRRyS', 'Non-Administrator', '1758219674_1.jpg', 'Offline', '', 'OFF', 2, 'akash', 'akash last name', '', 123456789),
(68, 'test1', '$2y$10$rn6wUK3vCXvRUcoyRAcgLOs78A736jg0DJiK6EqarIRHPawZIYMJ.', 'Non-Administrator', '1758220980_4.jpg', 'Offline', '2025-09-16 20:46:08', 'OFF', 1, 'test1', 'test1 Last name', 'm', 1234567890),
(69, 'Ivan', '$2y$10$/3Yt.YrHkutEhv0vMK9RB.inrRiWo4h7TldKLwxImdcr8bRufeUOu', 'Non-Administrator', 'default.jpg', 'Offline', '2025-12-01 11:57:53', 'OFF', 1, 'Ivan', 'Ivan', '', 2147483647),
(70, 'Keith', '$2y$10$TtmuvMSjnn7pUUClklvv6utouFlf43cphkVq6rnoklaP4B0AZLNxW', 'Non-Administrator', 'default.jpg', 'Offline', '2025-12-01 11:58:32', 'OFF', 1, 'Keith', 'Mwarie', '', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `branches_tbl`
--

CREATE TABLE `branches_tbl` (
  `id` int(11) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `year_established` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches_tbl`
--

INSERT INTO `branches_tbl` (`id`, `short_name`, `full_name`, `address`, `pincode`, `code`, `year_established`, `logo`, `created_at`) VALUES
(1, 'Great Missenden', 'Great Missenden', 'Deep Mill Service Station, Little Kings Hill\r\nGreat Missenden\r\nBuckinghamshire\r\nHP16 0DH', 'HP16 0DH', '123456', 2025, '../../uploads/branches/1763911677_Great Missenden.png', '2025-09-03 17:46:03'),
(2, 'Chesham', 'Chesham', '42 Townsend Rd, Chesham HP5 2AA, United Kingdom', 'HP5 2AA', '12345', 2025, '../../uploads/branches/1763911663_Chesham.png', '2025-09-03 18:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `date_created`) VALUES
(1, '2 Wheeler Vehicle', 1, '2021-09-30 09:42:40'),
(2, '3 Wheeler Vehicle', 1, '2021-09-30 09:43:00'),
(3, '4 Wheeler Vehicle', 1, '2021-09-30 09:43:48'),
(4, '6 Wheeler Vehicle', 1, '2021-09-30 09:44:05'),
(1, '2 Wheeler Vehicle', 1, '2021-09-30 09:42:40'),
(2, '3 Wheeler Vehicle', 1, '2021-09-30 09:43:00'),
(3, '4 Wheeler Vehicle', 1, '2021-09-30 09:43:48'),
(4, '6 Wheeler Vehicle', 1, '2021-09-30 09:44:05'),
(1, '2 Wheeler Vehicle', 1, '2021-09-30 09:42:40'),
(2, '3 Wheeler Vehicle', 1, '2021-09-30 09:43:00'),
(3, '4 Wheeler Vehicle', 1, '2021-09-30 09:43:48'),
(4, '6 Wheeler Vehicle', 1, '2021-09-30 09:44:05'),
(1, '2 Wheeler Vehicle', 1, '2021-09-30 09:42:40'),
(2, '3 Wheeler Vehicle', 1, '2021-09-30 09:43:00'),
(3, '4 Wheeler Vehicle', 1, '2021-09-30 09:43:48'),
(4, '6 Wheeler Vehicle', 1, '2021-09-30 09:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `ID` int(11) NOT NULL,
  `oic_id` int(11) NOT NULL,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`ID`, `oic_id`, `owner`) VALUES
(76, 28, 61),
(80, 64, 28),
(83, 64, 65);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(50) NOT NULL,
  `fname` text NOT NULL,
  `mname` text DEFAULT NULL,
  `lname` text NOT NULL,
  `address` text NOT NULL,
  `emp_position` text NOT NULL,
  `contact` text NOT NULL,
  `datehired` varchar(50) NOT NULL,
  `imagefile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `fname`, `mname`, `lname`, `address`, `emp_position`, `contact`, `datehired`, `imagefile`) VALUES
('0013454646', 'chris jim', 's', 'egot', 'brgy. kasambagan cebu city, 6000', 'Warehouse Supervisor', '00098567877', 'Sat Jun 03, 2017 1:51 am', 'blank-profile.jpg'),
('0013454674', 'Julbirth', 'k', 'dagle', 'lapu-lapu', 'Project Coordinator', '09231693691', 'Mon Jun 05, 2017 4:38 pm', 'gadgets.jpg'),
('0013454646', 'chris jim', 's', 'egot', 'brgy. kasambagan cebu city, 6000', 'Warehouse Supervisor', '00098567877', 'Sat Jun 03, 2017 1:51 am', 'blank-profile.jpg'),
('0013454674', 'Julbirth', 'k', 'dagle', 'lapu-lapu', 'Project Coordinator', '09231693691', 'Mon Jun 05, 2017 4:38 pm', 'gadgets.jpg'),
('0013454646', 'chris jim', 's', 'egot', 'brgy. kasambagan cebu city, 6000', 'Warehouse Supervisor', '00098567877', 'Sat Jun 03, 2017 1:51 am', 'blank-profile.jpg'),
('0013454674', 'Julbirth', 'k', 'dagle', 'lapu-lapu', 'Project Coordinator', '09231693691', 'Mon Jun 05, 2017 4:38 pm', 'gadgets.jpg'),
('0013454646', 'chris jim', 's', 'egot', 'brgy. kasambagan cebu city, 6000', 'Warehouse Supervisor', '00098567877', 'Sat Jun 03, 2017 1:51 am', 'blank-profile.jpg'),
('0013454674', 'Julbirth', 'k', 'dagle', 'lapu-lapu', 'Project Coordinator', '09231693691', 'Mon Jun 05, 2017 4:38 pm', 'gadgets.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oic`
--

CREATE TABLE `oic` (
  `oic_id` int(11) NOT NULL,
  `oic_lname` text NOT NULL,
  `oic_fname` text NOT NULL,
  `oic_mname` text DEFAULT NULL,
  `contact` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `oic`
--

INSERT INTO `oic` (`oic_id`, `oic_lname`, `oic_fname`, `oic_mname`, `contact`) VALUES
(28, 'sabosido', 'chris jim', '', '09355505624'),
(64, 'sky', 'sky', '', '1234567890'),
(66, 'x', 'x', 'x', 'm'),
(67, 'akash', 'akash', 'x', '999');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(11) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `date_created`) VALUES
(1, 'Change Oil', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel sapien lectus. Ut posuere, arcu eget bibendum venenatis, quam diam interdum diam, in viverra leo quam eu mi. Sed bibendum mauris nulla, vel vehicula libero elementum vel. Nam blandit justo justo, dapibus sodales risus consectetur nec. Suspendisse ornare in purus et mollis. Praesent placerat quis lectus at hendrerit. Morbi maximus dolor dolor, a maximus mi congue quis.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:11:21'),
(2, 'Overall Checkup', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Curabitur nec viverra tellus. Donec quis molestie arcu. Sed et blandit dui, vel vehicula tortor. Vivamus fringilla sit amet nibh fringilla ornare. Etiam iaculis ornare purus id feugiat. Etiam mattis erat ut congue tempor. Nam placerat faucibus libero ultrices posuere. Donec ac tempus nulla.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:11:38'),
(3, 'Engine Tune up', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Sed ultrices fermentum augue. Duis ultricies arcu vitae lorem accumsan porta. Donec fermentum risus ut tincidunt cursus. Sed varius id dolor et euismod. Vestibulum elit massa, varius nec arcu vel, viverra varius dolor. Etiam fermentum vel lorem vel tincidunt. Ut nec libero pulvinar, malesuada lacus et, tempor diam. Aliquam vitae nisl augue.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:12:03'),
(4, 'Tire Replacement', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Nullam pretium eu justo ac tincidunt. Vestibulum quis est non felis porttitor pretium. Vivamus nec augue ultrices, condimentum risus vitae, pellentesque turpis. Nullam ornare est sapien, sed semper neque imperdiet suscipit. Sed fermentum eros et felis mollis finibus. In condimentum eleifend magna, non consequat nibh viverra nec. Nulla vel sapien libero. Suspendisse varius nisl nec ornare imperdiet.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(11) NOT NULL,
  `owner_name` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `owner_name`, `category_id`, `service_type`, `mechanic_id`, `status`, `date_created`) VALUES
(1, 'Mike Williams', 3, 'Pick Up', 1, 2, '2021-09-30 14:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `sign`
--

CREATE TABLE `sign` (
  `sign_id` varchar(50) NOT NULL,
  `fname` text NOT NULL,
  `minitial` text NOT NULL,
  `lname` text NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `imagefile` varchar(50) NOT NULL,
  `fuploader` varchar(50) NOT NULL,
  `dateupload` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sign`
--

INSERT INTO `sign` (`sign_id`, `fname`, `minitial`, `lname`, `address`, `contact`, `imagefile`, `fuploader`, `dateupload`) VALUES
('11039', 'chris jim', 'm.', 'egot', 'brgy. kasambagan cebu city, 6000', '009', 'macfie.jpg', 'jim / Administrator', '2017-05-24'),
('7142', 'joana puala', 'c.', 'catayong', 'Tacloban city', '09434812762', 'IMG_20170529_152814.jpg', 'jim / Administrator', '2017-05-29'),
('11039', 'chris jim', 'm.', 'egot', 'brgy. kasambagan cebu city, 6000', '009', 'macfie.jpg', 'jim / Administrator', '2017-05-24'),
('7142', 'joana puala', 'c.', 'catayong', 'Tacloban city', '09434812762', 'IMG_20170529_152814.jpg', 'jim / Administrator', '2017-05-29'),
('11039', 'chris jim', 'm.', 'egot', 'brgy. kasambagan cebu city, 6000', '009', 'macfie.jpg', 'jim / Administrator', '2017-05-24'),
('7142', 'joana puala', 'c.', 'catayong', 'Tacloban city', '09434812762', 'IMG_20170529_152814.jpg', 'jim / Administrator', '2017-05-29'),
('11039', 'chris jim', 'm.', 'egot', 'brgy. kasambagan cebu city, 6000', '009', 'macfie.jpg', 'jim / Administrator', '2017-05-24'),
('7142', 'joana puala', 'c.', 'catayong', 'Tacloban city', '09434812762', 'IMG_20170529_152814.jpg', 'jim / Administrator', '2017-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `mname` varchar(10) DEFAULT NULL,
  `contact` varchar(15) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_type_tbl`
--

CREATE TABLE `user_type_tbl` (
  `u_id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details_tbl`
--

CREATE TABLE `vehicle_details_tbl` (
  `id` int(11) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `registrationNumber` varchar(50) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  `fuelType` varchar(30) DEFAULT NULL,
  `engineCapacity` varchar(20) DEFAULT NULL,
  `yearOfManufacture` varchar(10) DEFAULT NULL,
  `vehicleAge` varchar(20) DEFAULT NULL,
  `wheelplan` varchar(30) DEFAULT NULL,
  `dateOfLastV5CIssued` varchar(30) DEFAULT NULL,
  `typeApproval` varchar(50) DEFAULT NULL,
  `co2Emissions` varchar(20) DEFAULT NULL,
  `registrationPlace` varchar(50) DEFAULT NULL,
  `taxStatus` varchar(20) DEFAULT NULL,
  `taxDueDate` date DEFAULT NULL,
  `motStatus` varchar(20) DEFAULT NULL,
  `motDueDate` date DEFAULT NULL,
  `assigned_staff` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `days` varchar(100) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_details_tbl`
--

INSERT INTO `vehicle_details_tbl` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`, `is_deleted`) VALUES
(59, 'LF18VCG', '2', 'LF18VCG', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '7', '2 AXLE RIGID BODY', '2025-08-27', 'N1', '202', '2018-03', 'Taxed', '2026-08-01', 'Valid', '2026-03-19', '67', '2025-11-23 10:30:20', '116', 0, 0),
(60, 'AK70VJO', '2', 'AK70VJO', 'TOYOTA', '', 'BLACK', 'DIESEL', '2755', '2021', '4', '2 AXLE RIGID BODY', '2025-09-22', 'N1', '193', '2021-01', 'Taxed', '2026-07-01', 'Valid', '2026-06-19', '62', '2025-11-23 17:45:41', '208', 0, 0),
(61, 'BD19PYA', '1', 'BD19PYA', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2025-10-10', 'N1', '194', '2019-08', 'SORN', '0000-00-00', 'Valid', '2026-08-29', '68', '2025-11-26 16:50:02', '276', 0, 0),
(62, 'DN20OEG', '1', 'DN20OEG', 'VAUXHALL', '', 'WHITE', 'DIESEL', '1499', '2020', '5', '2 AXLE RIGID BODY', '2024-12-21', 'N1', '148', '2020-06', 'Taxed', '2026-01-01', 'Valid', '2025-12-19', '62', '2025-11-26 16:50:59', '23', 0, 0),
(63, 'DX16WDL', '1', 'DX16WDL', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1598', '2016', '9', '2 AXLE RIGID BODY', '2025-10-14', 'N1', '147', '2016-04', 'SORN', '0000-00-00', 'Valid', '2026-11-19', '69', '2025-12-01 12:07:09', '353', 0, 0),
(64, 'DE21VKU', '1', 'DE21VKU', 'MAN', 'TGE 3.140', 'WHITE', 'DIESEL', '1968', '2021', '4', '2 AXLE RIGID BODY', '2021-06-18', 'N1', '', '2021-06', 'Untaxed', '2025-07-01', 'Not valid', '2025-06-17', '70', '2025-12-01 12:37:03', '-167', 0, 0),
(65, 'WP21FYT', '1', 'WP21FYT', 'FORD', 'CUSTOM', 'WHITE', 'DIESEL', '1995', '2021', '4', '2 AXLE RIGID BODY', '2023-03-14', 'N1', '187', '2021-04', 'Untaxed', '2025-06-30', 'Not valid', '2025-09-08', '69', '2025-12-01 12:59:32', '-84', 0, 1),
(66, 'NX67XOR', '1', 'NX67XOR', 'PEUGEOT', 'Expert', 'WHITE', 'DIESEL', '1560', '2017', '8', '2 AXLE RIGID BODY', '2021-05-25', 'N1', '144', '2017-09', 'Untaxed', '2025-10-02', 'Valid', '2026-06-29', '70', '2025-12-01 13:03:10', '210', 0, 0),
(67, 'FH68EJN', '1', 'FH68EJN', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2024-11-04', 'N1', '194', '2019-01', 'Untaxed', '2025-08-21', 'Valid', '2026-01-28', '69', '2025-12-03 14:14:40', '56', 1, 0),
(68, 'DA16EGJ', '1', 'DA16EGJ', 'CITROEN', '', 'WHITE', 'DIESEL', '1997', '2016', '9', '2 AXLE RIGID BODY', '2023-04-08', 'N1', '185', '2016-06', 'Untaxed', '2025-10-09', 'Valid', '2026-01-29', '69', '2025-12-03 14:34:08', '57', 0, 0),
(69, 'EO66OVM', '1', 'EO66OVM', 'FORD', '', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '69', '2025-12-10 12:15:13', '-77', 0, 0),
(70, 'EO66OVM', '1', 'EO66OVM', 'FORD', '', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '69', '2025-12-10 12:24:28', '-77', 0, 0),
(71, 'EO66OVM', '1', 'EO66OVM', 'FORD', '', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '69', '2025-12-10 12:25:42', '-77', 0, 0),
(72, 'EO66OVN', '1', 'EO66OVN', 'FORD', '', 'BLACK', 'DIESEL', '1499', '2016', '9', '2 AXLE RIGID BODY', '2020-06-15', 'N1', '124', '2016-09', 'Taxed', '2026-09-01', 'Not valid', '2025-09-09', '69', '2025-12-10 12:32:46', '-92', 0, 0),
(73, 'EO66OVN', '1', 'EO66OVN', 'FORD', '', 'BLACK', 'DIESEL', '1499', '2016', '9', '2 AXLE RIGID BODY', '2020-06-15', 'N1', '124', '2016-09', 'Taxed', '2026-09-01', 'Not valid', '2025-09-09', '69', '2025-12-10 12:34:00', '-92', 0, 0),
(74, 'SF68RHJ', '1', 'SF68RHJ', 'FIAT', '', 'WHITE', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-04', 'N1', '135', '2018-09', 'Untaxed', '2025-09-10', 'Valid', '2026-04-08', '70', '2025-12-10 13:16:29', '119', 0, 0),
(75, 'DP69UDU', '1', 'DP69UDU', 'VAUXHALL', '', 'BLACK', 'DIESEL', '1499', '2019', '6', '2 AXLE RIGID BODY', '2025-09-25', 'N1', '135', '2019-12', 'Untaxed', '2025-10-13', 'Valid', '2026-02-05', '70', '2025-12-10 13:33:28', '57', 1, 0),
(76, 'LE16XCJ', '1', 'LE16XCJ', 'RENAULT', '', 'GREY', 'DIESEL', '1598', '2016', '9', '2 AXLE RIGID BODY', '2025-05-24', 'N1', '170', '2016-07', 'SORN', '0000-00-00', 'Valid', '2026-04-16', '70', '2025-12-10 13:42:07', '127', 0, 0),
(77, 'EO66OVM', '1', 'EO66OVM', 'FORD', 'Custom', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '70', '2025-12-10 14:20:41', '-77', 0, 0),
(78, 'BA19KAO', '1', 'BA19KAO', 'VOLKSWAGEN', 'Crafter', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2025-12-03', 'N1', '194', '2019-08', 'Untaxed', '2025-12-05', 'Valid', '2026-09-20', '70', '2025-12-10 14:28:42', '284', 0, 0),
(79, 'BD65WVH', '1', 'BD65WVH', 'FORD', 'Custom', 'WHITE', 'DIESEL', '2198', '2015', '10', '2 AXLE RIGID BODY', '2022-03-29', 'N1', '192', '2015-12', 'Untaxed', '2024-05-31', 'Not valid', '2024-11-20', '69', '2025-12-10 14:32:39', '-385', 0, 0),
(80, 'LB67XTR', '1', 'LB67XTR', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '7', '2 AXLE RIGID BODY', '2025-11-10', 'N1', '185', '2018-02', 'Untaxed', '2025-11-18', 'Valid', '2026-02-08', '69', '2025-12-11 11:56:13', '59', 0, 0),
(81, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:13:02', '314', 0, 1),
(82, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:13:24', '314', 1, 1),
(83, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:16:54', '314', 1, 1),
(84, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:17:36', '314', 0, 1),
(85, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:20:08', '314', 1, 0),
(86, 'BD65WVH', '1', 'BD65WVH', 'FORD', '', 'WHITE', 'DIESEL', '2198', '2015', '10', '2 AXLE RIGID BODY', '2022-03-29', 'N1', '192', '2015-12', 'Untaxed', '2024-05-31', 'Not valid', '2024-11-20', '70', '2025-12-11 12:25:28', '-386', 0, 0),
(87, 'VN19UEG', '1', 'VN19UEG', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2024-05-17', 'N1', '156', '2019-04', 'Untaxed', '2025-02-28', 'Not valid', '2025-04-29', '69', '2025-12-11 12:28:02', '-226', 0, 1),
(88, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '70', '2025-12-11 12:28:22', '314', 0, 0),
(89, 'YA19APC', '1', 'YA19APC', 'MERCEDES-BENZ', '', 'WHITE', 'DIESEL', '1598', '2019', '6', '2 AXLE RIGID BODY', '2019-08-27', 'N1', '164', '2019-08', 'Untaxed', '2025-09-10', 'Valid', '2026-08-29', '69', '2025-12-11 12:46:54', '261', 0, 1),
(90, 'DF05BYM', '1', 'DF05BYM', 'LAND ROVER', '', 'GREY', 'DIESEL', '2926', '2005', '20', '2 AXLE RIGID BODY', '2024-01-15', 'M1', '299', '2005-04', 'Taxed', '2026-11-01', 'Valid', '2026-11-03', '70', '2025-12-11 12:47:18', '327', 0, 0),
(91, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', 'test', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '67', '2025-12-12 17:45:05', '313', 0, 0),
(92, 'EN21VNU', '1', 'EN21VNU', 'VAUXHALL', '', 'BLACK', 'DIESEL', '1997', '2021', '4', '2 AXLE RIGID BODY', '2021-09-29', 'N1', '195', '2021-06', 'Taxed', '2026-04-01', 'Valid', '2026-07-09', '70', '2025-12-15 09:47:06', '206', 0, 0),
(93, 'LF18VCG', '1', 'LF18VCG', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-03-19', '67', '2025-12-16 17:30:11', '93', 0, 0),
(94, 'SM62FFT', '1', 'SM62FFT', 'TOYOTA', 'test', 'GREY', 'HYBRID ELECTRIC', '1798', '2013', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-10-16', '67', '2025-12-16 18:29:29', '304', 0, 1),
(95, 'BK17ARF', '1', 'BK17ARF', 'FORD', '', 'BLACK', 'DIESEL', '1995', '2017', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-12-05', '70', '2025-12-18 15:44:17', '352', 1, 0),
(96, 'PN70GJO', '1', 'PN70GJO', 'RENAULT', '', 'WHITE', 'DIESEL', '1997', '2020', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-09-14', '70', '2025-12-18 17:10:07', '270', 0, 0),
(97, 'DL17XDD', '1', 'DL17XDD', 'VAUXHALL', '', 'WHITE', 'DIESEL', '1598', '2017', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-01-12', '70', '2025-12-22 12:12:42', '21', 0, 0),
(98, 'LB67URG', '1', 'LB67URG', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '', '', '', '', '', '', '', '0000-00-00', 'Not valid', '2025-12-15', '70', '2025-12-22 12:15:50', '-7', 0, 0),
(99, 'YC19MZZ', '1', 'YC19MZZ', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2019', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-09-19', '70', '2025-12-24 11:11:13', '269', 0, 1),
(100, 'YB67URG', '1', 'YB67URG', 'MINI', '', 'WHITE', 'DIESEL', '1496', '2018', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-01-30', '70', '2025-12-24 11:22:38', '37', 0, 1),
(101, 'BK17ARF', '1', 'BK17ARF', 'FORD', 'Test ', 'BLACK', 'DIESEL', '1995', '2017', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-12-05', '67', '2025-12-27 09:25:37', '343', 0, 1),
(102, 'BK001ARF', '1', NULL, 'FORD', 'Model-1', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-02', NULL, '2025-12-01 04:31:00', '', 1, 0),
(103, 'BK002ARF', '1', NULL, 'TATA', 'Model-2', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03', NULL, '2025-12-01 04:32:00', '', 0, 0),
(104, 'BK003ARF', '1', NULL, 'MAHINDRA', 'Model-3', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-04', NULL, '2025-12-01 04:33:00', '', 1, 0),
(105, 'BK004ARF', '1', NULL, 'HYUNDAI', 'Model-4', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05', NULL, '2025-12-01 04:34:00', '', 0, 0),
(106, 'BK005ARF', '1', NULL, 'FORD', 'Model-5', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-06', NULL, '2025-12-01 04:35:00', '', 1, 0),
(107, 'BK006ARF', '1', NULL, 'TATA', 'Model-6', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-07', NULL, '2025-12-01 04:36:00', '', 0, 0),
(108, 'BK007ARF', '1', NULL, 'MAHINDRA', 'Model-7', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-08', NULL, '2025-12-01 04:37:00', '', 1, 0),
(109, 'BK008ARF', '1', NULL, 'HYUNDAI', 'Model-8', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-09', NULL, '2025-12-01 04:38:00', '', 0, 0),
(110, 'BK009ARF', '1', NULL, 'FORD', 'Model-9', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-10', NULL, '2025-12-01 04:39:00', '', 1, 0),
(111, 'BK010ARF', '1', NULL, 'TATA', 'Model-10', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-11', NULL, '2025-12-01 04:40:00', '', 0, 0),
(112, 'BK011ARF', '1', NULL, 'MAHINDRA', 'Model-11', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12', NULL, '2025-12-01 04:41:00', '', 1, 0),
(113, 'BK012ARF', '1', NULL, 'HYUNDAI', 'Model-12', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-13', NULL, '2025-12-01 04:42:00', '', 0, 0),
(114, 'BK013ARF', '1', NULL, 'FORD', 'Model-13', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-14', NULL, '2025-12-01 04:43:00', '', 1, 0),
(115, 'BK014ARF', '1', NULL, 'TATA', 'Model-14', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-15', NULL, '2025-12-01 04:44:00', '', 0, 0),
(116, 'BK015ARF', '1', NULL, 'MAHINDRA', 'Model-15', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-16', NULL, '2025-12-01 04:45:00', '', 1, 0),
(117, 'BK016ARF', '1', NULL, 'HYUNDAI', 'Model-16', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17', NULL, '2025-12-01 04:46:00', '', 0, 0),
(118, 'BK017ARF', '1', NULL, 'FORD', 'Model-17', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-18', NULL, '2025-12-01 04:47:00', '', 1, 0),
(119, 'BK018ARF', '1', NULL, 'TATA', 'Model-18', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-19', NULL, '2025-12-01 04:48:00', '', 0, 0),
(120, 'BK019ARF', '1', NULL, 'MAHINDRA', 'Model-19', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-20', NULL, '2025-12-01 04:49:00', '', 1, 0),
(121, 'BK020ARF', '1', NULL, 'HYUNDAI', 'Model-20', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21', NULL, '2025-12-01 04:50:00', '', 0, 0),
(122, 'BK021ARF', '1', NULL, 'FORD', 'Model-21', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22', NULL, '2025-12-01 04:51:00', '', 1, 0),
(123, 'BK022ARF', '1', NULL, 'TATA', 'Model-22', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-23', NULL, '2025-12-01 04:52:00', '', 0, 0),
(124, 'BK023ARF', '1', NULL, 'MAHINDRA', 'Model-23', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24', NULL, '2025-12-01 04:53:00', '', 1, 0),
(125, 'BK024ARF', '1', NULL, 'HYUNDAI', 'Model-24', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-25', NULL, '2025-12-01 04:54:00', '', 0, 0),
(126, 'BK025ARF', '1', NULL, 'FORD', 'Model-25', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26', NULL, '2025-12-01 04:55:00', '', 1, 0),
(127, 'BK026ARF', '1', NULL, 'TATA', 'Model-26', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27', NULL, '2025-12-01 04:56:00', '', 0, 0),
(128, 'BK027ARF', '1', NULL, 'MAHINDRA', 'Model-27', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28', NULL, '2025-12-01 04:57:00', '', 1, 0),
(129, 'BK028ARF', '1', NULL, 'HYUNDAI', 'Model-28', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29', NULL, '2025-12-01 04:58:00', '', 0, 0),
(130, 'BK029ARF', '1', NULL, 'FORD', 'Model-29', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30', NULL, '2025-12-01 04:59:00', '', 1, 0),
(131, 'BK030ARF', '1', NULL, 'TATA', 'Model-30', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-31', NULL, '2025-12-01 05:00:00', '', 0, 0),
(132, 'BK031ARF', '1', NULL, 'MAHINDRA', 'Model-31', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01', NULL, '2025-12-01 05:01:00', '', 1, 0),
(133, 'BK032ARF', '1', NULL, 'HYUNDAI', 'Model-32', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02', NULL, '2025-12-01 05:02:00', '', 0, 0),
(134, 'BK033ARF', '1', NULL, 'FORD', 'Model-33', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-03', NULL, '2025-12-01 05:03:00', '', 1, 0),
(135, 'BK034ARF', '1', NULL, 'TATA', 'Model-34', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-04', NULL, '2025-12-01 05:04:00', '', 0, 0),
(136, 'BK035ARF', '1', NULL, 'MAHINDRA', 'Model-35', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-05', NULL, '2025-12-01 05:05:00', '', 1, 0),
(137, 'BK036ARF', '1', NULL, 'HYUNDAI', 'Model-36', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-06', NULL, '2025-12-01 05:06:00', '', 0, 0),
(138, 'BK037ARF', '1', NULL, 'FORD', 'Model-37', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-07', NULL, '2025-12-01 05:07:00', '', 1, 0),
(139, 'BK038ARF', '1', NULL, 'TATA', 'Model-38', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-08', NULL, '2025-12-01 05:08:00', '', 0, 0),
(140, 'BK039ARF', '1', NULL, 'MAHINDRA', 'Model-39', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09', NULL, '2025-12-01 05:09:00', '', 1, 0),
(141, 'BK040ARF', '1', NULL, 'HYUNDAI', 'Model-40', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-10', NULL, '2025-12-01 05:10:00', '', 0, 0),
(142, 'BK041ARF', '1', NULL, 'FORD', 'Model-41', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11', NULL, '2025-12-01 05:11:00', '', 1, 0),
(143, 'BK042ARF', '1', NULL, 'TATA', 'Model-42', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-12', NULL, '2025-12-01 05:12:00', '', 0, 0),
(144, 'BK043ARF', '1', NULL, 'MAHINDRA', 'Model-43', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13', NULL, '2025-12-01 05:13:00', '', 1, 0),
(145, 'BK044ARF', '1', NULL, 'HYUNDAI', 'Model-44', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-14', NULL, '2025-12-01 05:14:00', '', 0, 0),
(146, 'BK045ARF', '1', NULL, 'FORD', 'Model-45', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-15', NULL, '2025-12-01 05:15:00', '', 1, 0),
(147, 'BK046ARF', '1', NULL, 'TATA', 'Model-46', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16', NULL, '2025-12-01 05:16:00', '', 0, 0),
(148, 'BK047ARF', '1', NULL, 'MAHINDRA', 'Model-47', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17', NULL, '2025-12-01 05:17:00', '', 1, 0),
(149, 'BK048ARF', '1', NULL, 'HYUNDAI', 'Model-48', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18', NULL, '2025-12-01 05:18:00', '', 0, 0),
(150, 'BK049ARF', '1', NULL, 'FORD', 'Model-49', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-19', NULL, '2025-12-01 05:19:00', '', 1, 0),
(151, 'BK050ARF', '1', NULL, 'TATA', 'Model-50', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-20', NULL, '2025-12-01 05:20:00', '', 0, 0),
(152, 'BK051ARF', '1', NULL, 'MAHINDRA', 'Model-51', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', NULL, '2025-12-01 05:21:00', '', 1, 0),
(153, 'BK052ARF', '1', NULL, 'HYUNDAI', 'Model-52', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-22', NULL, '2025-12-01 05:22:00', '', 0, 0),
(154, 'BK053ARF', '1', NULL, 'FORD', 'Model-53', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-23', NULL, '2025-12-01 05:23:00', '', 1, 0),
(155, 'BK054ARF', '1', NULL, 'TATA', 'Model-54', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24', NULL, '2025-12-01 05:24:00', '', 0, 0),
(156, 'BK055ARF', '1', NULL, 'MAHINDRA', 'Model-55', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25', NULL, '2025-12-01 05:25:00', '', 1, 0),
(157, 'BK056ARF', '1', NULL, 'HYUNDAI', 'Model-56', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-26', NULL, '2025-12-01 05:26:00', '', 0, 0),
(158, 'BK057ARF', '1', NULL, 'FORD', 'Model-57', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-27', NULL, '2025-12-01 05:27:00', '', 1, 0),
(159, 'BK058ARF', '1', NULL, 'TATA', 'Model-58', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-28', NULL, '2025-12-01 05:28:00', '', 0, 0),
(160, 'BK059ARF', '1', NULL, 'MAHINDRA', 'Model-59', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-01', NULL, '2025-12-01 05:29:00', '', 1, 0),
(161, 'BK060ARF', '1', NULL, 'HYUNDAI', 'Model-60', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-02', NULL, '2025-12-01 05:30:00', '', 0, 0),
(162, 'BK061ARF', '1', NULL, 'FORD', 'Model-61', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-03', NULL, '2025-12-01 05:31:00', '', 1, 0),
(163, 'BK062ARF', '1', NULL, 'TATA', 'Model-62', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-04', NULL, '2025-12-01 05:32:00', '', 0, 0),
(164, 'BK063ARF', '1', NULL, 'MAHINDRA', 'Model-63', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05', NULL, '2025-12-01 05:33:00', '', 1, 0),
(165, 'BK064ARF', '1', NULL, 'HYUNDAI', 'Model-64', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-06', NULL, '2025-12-01 05:34:00', '', 0, 0),
(166, 'BK065ARF', '1', NULL, 'FORD', 'Model-65', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07', NULL, '2025-12-01 05:35:00', '', 1, 0),
(167, 'BK066ARF', '1', NULL, 'TATA', 'Model-66', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-08', NULL, '2025-12-01 05:36:00', '', 0, 0),
(168, 'BK067ARF', '1', NULL, 'MAHINDRA', 'Model-67', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09', NULL, '2025-12-01 05:37:00', '', 1, 0),
(169, 'BK068ARF', '1', NULL, 'HYUNDAI', 'Model-68', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10', NULL, '2025-12-01 05:38:00', '', 0, 0),
(170, 'BK069ARF', '1', NULL, 'FORD', 'Model-69', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-11', NULL, '2025-12-01 05:39:00', '', 1, 0),
(171, 'BK070ARF', '1', NULL, 'TATA', 'Model-70', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12', NULL, '2025-12-01 05:40:00', '', 0, 0),
(172, 'BK071ARF', '1', NULL, 'MAHINDRA', 'Model-71', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-13', NULL, '2025-12-01 05:41:00', '', 1, 0),
(173, 'BK072ARF', '1', NULL, 'HYUNDAI', 'Model-72', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14', NULL, '2025-12-01 05:42:00', '', 0, 0),
(174, 'BK073ARF', '1', NULL, 'FORD', 'Model-73', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15', NULL, '2025-12-01 05:43:00', '', 1, 0),
(175, 'BK074ARF', '1', NULL, 'TATA', 'Model-74', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-16', NULL, '2025-12-01 05:44:00', '', 0, 0),
(176, 'BK075ARF', '1', NULL, 'MAHINDRA', 'Model-75', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17', NULL, '2025-12-01 05:45:00', '', 1, 0),
(177, 'BK076ARF', '1', NULL, 'HYUNDAI', 'Model-76', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18', NULL, '2025-12-01 05:46:00', '', 0, 0),
(178, 'BK077ARF', '1', NULL, 'FORD', 'Model-77', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19', NULL, '2025-12-01 05:47:00', '', 1, 0),
(179, 'BK078ARF', '1', NULL, 'TATA', 'Model-78', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-20', NULL, '2025-12-01 05:48:00', '', 0, 0),
(180, 'BK079ARF', '1', NULL, 'MAHINDRA', 'Model-79', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-21', NULL, '2025-12-01 05:49:00', '', 1, 0),
(181, 'BK080ARF', '1', NULL, 'HYUNDAI', 'Model-80', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22', NULL, '2025-12-01 05:50:00', '', 0, 0),
(182, 'BK081ARF', '1', NULL, 'FORD', 'Model-81', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-23', NULL, '2025-12-01 05:51:00', '', 1, 0),
(183, 'BK082ARF', '1', NULL, 'TATA', 'Model-82', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24', NULL, '2025-12-01 05:52:00', '', 0, 0),
(184, 'BK083ARF', '1', NULL, 'MAHINDRA', 'Model-83', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-25', NULL, '2025-12-01 05:53:00', '', 1, 0),
(185, 'BK084ARF', '1', NULL, 'HYUNDAI', 'Model-84', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-26', NULL, '2025-12-01 05:54:00', '', 0, 0),
(186, 'BK085ARF', '1', NULL, 'FORD', 'Model-85', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27', NULL, '2025-12-01 05:55:00', '', 1, 0),
(187, 'BK086ARF', '1', NULL, 'TATA', 'Model-86', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-28', NULL, '2025-12-01 05:56:00', '', 0, 0),
(188, 'BK087ARF', '1', NULL, 'MAHINDRA', 'Model-87', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29', NULL, '2025-12-01 05:57:00', '', 1, 0),
(189, 'BK088ARF', '1', NULL, 'HYUNDAI', 'Model-88', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30', NULL, '2025-12-01 05:58:00', '', 0, 0),
(190, 'BK089ARF', '1', NULL, 'FORD', 'Model-89', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31', NULL, '2025-12-01 05:59:00', '', 1, 0),
(191, 'BK090ARF', '1', NULL, 'TATA', 'Model-90', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, '2025-12-01 06:00:00', '', 0, 0),
(192, 'BK091ARF', '1', NULL, 'MAHINDRA', 'Model-91', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-02', NULL, '2025-12-01 06:01:00', '', 1, 0),
(193, 'BK092ARF', '1', NULL, 'HYUNDAI', 'Model-92', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-03', NULL, '2025-12-01 06:02:00', '', 0, 0),
(194, 'BK093ARF', '1', NULL, 'FORD', 'Model-93', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-04', NULL, '2025-12-01 06:03:00', '', 1, 0),
(195, 'BK094ARF', '1', NULL, 'TATA', 'Model-94', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-05', NULL, '2025-12-01 06:04:00', '', 0, 0),
(196, 'BK095ARF', '1', NULL, 'MAHINDRA', 'Model-95', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-06', NULL, '2025-12-01 06:05:00', '', 1, 0),
(197, 'BK096ARF', '1', NULL, 'HYUNDAI', 'Model-96', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-07', NULL, '2025-12-01 06:06:00', '', 0, 0),
(198, 'BK097ARF', '1', NULL, 'FORD', 'Model-97', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-08', NULL, '2025-12-01 06:07:00', '', 1, 0),
(199, 'BK098ARF', '1', NULL, 'TATA', 'Model-98', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-09', NULL, '2025-12-01 06:08:00', '', 0, 0),
(200, 'BK099ARF', '1', NULL, 'MAHINDRA', 'Model-99', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-10', NULL, '2025-12-01 06:09:00', '', 1, 0),
(201, 'BK100ARF', '1', NULL, 'HYUNDAI', 'Model-100', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11', NULL, '2025-12-01 06:10:00', '', 0, 0),
(202, 'BK101ARF', '1', NULL, 'FORD', 'Model-101', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12', NULL, '2025-12-01 06:11:00', '', 1, 0),
(203, 'BK102ARF', '1', NULL, 'TATA', 'Model-102', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-13', NULL, '2025-12-01 06:12:00', '', 0, 0),
(204, 'BK103ARF', '1', NULL, 'MAHINDRA', 'Model-103', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14', NULL, '2025-12-01 06:13:00', '', 1, 0),
(205, 'BK104ARF', '1', NULL, 'HYUNDAI', 'Model-104', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-15', NULL, '2025-12-01 06:14:00', '', 0, 0),
(206, 'BK105ARF', '1', NULL, 'FORD', 'Model-105', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-16', NULL, '2025-12-01 06:15:00', '', 1, 0),
(207, 'BK106ARF', '1', NULL, 'TATA', 'Model-106', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-17', NULL, '2025-12-01 06:16:00', '', 0, 0),
(208, 'BK107ARF', '1', NULL, 'MAHINDRA', 'Model-107', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-18', NULL, '2025-12-01 06:17:00', '', 1, 0),
(209, 'BK108ARF', '1', NULL, 'HYUNDAI', 'Model-108', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-19', NULL, '2025-12-01 06:18:00', '', 0, 0),
(210, 'BK109ARF', '1', NULL, 'FORD', 'Model-109', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20', NULL, '2025-12-01 06:19:00', '', 1, 0),
(211, 'BK110ARF', '1', NULL, 'TATA', 'Model-110', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21', NULL, '2025-12-01 06:20:00', '', 0, 0),
(212, 'BK111ARF', '1', NULL, 'MAHINDRA', 'Model-111', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22', NULL, '2025-12-01 06:21:00', '', 1, 0),
(213, 'BK112ARF', '1', NULL, 'HYUNDAI', 'Model-112', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-23', NULL, '2025-12-01 06:22:00', '', 0, 0),
(214, 'BK113ARF', '1', NULL, 'FORD', 'Model-113', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-24', NULL, '2025-12-01 06:23:00', '', 1, 0),
(215, 'BK114ARF', '1', NULL, 'TATA', 'Model-114', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-25', NULL, '2025-12-01 06:24:00', '', 0, 0),
(216, 'BK115ARF', '1', NULL, 'MAHINDRA', 'Model-115', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-26', NULL, '2025-12-01 06:25:00', '', 1, 0),
(217, 'BK116ARF', '1', NULL, 'HYUNDAI', 'Model-116', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-27', NULL, '2025-12-01 06:26:00', '', 0, 0),
(218, 'BK117ARF', '1', NULL, 'FORD', 'Model-117', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-28', NULL, '2025-12-01 06:27:00', '', 1, 0),
(219, 'BK118ARF', '1', NULL, 'TATA', 'Model-118', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29', NULL, '2025-12-01 06:28:00', '', 0, 0),
(220, 'BK119ARF', '1', NULL, 'MAHINDRA', 'Model-119', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30', NULL, '2025-12-01 06:29:00', '', 1, 0),
(221, 'BK120ARF', '1', NULL, 'HYUNDAI', 'Model-120', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-01', NULL, '2025-12-01 06:30:00', '', 0, 0),
(222, 'BK121ARF', '1', NULL, 'FORD', 'Model-121', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-02', NULL, '2025-12-01 06:31:00', '', 1, 0),
(223, 'BK122ARF', '1', NULL, 'TATA', 'Model-122', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-03', NULL, '2025-12-01 06:32:00', '', 0, 0),
(224, 'BK123ARF', '1', NULL, 'MAHINDRA', 'Model-123', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04', NULL, '2025-12-01 06:33:00', '', 1, 0),
(225, 'BK124ARF', '1', NULL, 'HYUNDAI', 'Model-124', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05', NULL, '2025-12-01 06:34:00', '', 0, 0),
(226, 'BK125ARF', '1', NULL, 'FORD', 'Model-125', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06', NULL, '2025-12-01 06:35:00', '', 1, 0),
(227, 'BK126ARF', '1', NULL, 'TATA', 'Model-126', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-07', NULL, '2025-12-01 06:36:00', '', 0, 0),
(228, 'BK127ARF', '1', NULL, 'MAHINDRA', 'Model-127', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-08', NULL, '2025-12-01 06:37:00', '', 1, 0),
(229, 'BK128ARF', '1', NULL, 'HYUNDAI', 'Model-128', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-09', NULL, '2025-12-01 06:38:00', '', 0, 0),
(230, 'BK129ARF', '1', NULL, 'FORD', 'Model-129', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10', NULL, '2025-12-01 06:39:00', '', 1, 0),
(231, 'BK130ARF', '1', NULL, 'TATA', 'Model-130', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-11', NULL, '2025-12-01 06:40:00', '', 0, 0),
(232, 'BK131ARF', '1', NULL, 'MAHINDRA', 'Model-131', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-12', NULL, '2025-12-01 06:41:00', '', 1, 0),
(233, 'BK132ARF', '1', NULL, 'HYUNDAI', 'Model-132', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-13', NULL, '2025-12-01 06:42:00', '', 0, 0),
(234, 'BK133ARF', '1', NULL, 'FORD', 'Model-133', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-14', NULL, '2025-12-01 06:43:00', '', 1, 0),
(235, 'BK134ARF', '1', NULL, 'TATA', 'Model-134', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15', NULL, '2025-12-01 06:44:00', '', 0, 0),
(236, 'BK135ARF', '1', NULL, 'MAHINDRA', 'Model-135', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-16', NULL, '2025-12-01 06:45:00', '', 1, 0),
(237, 'BK136ARF', '1', NULL, 'HYUNDAI', 'Model-136', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17', NULL, '2025-12-01 06:46:00', '', 0, 0),
(238, 'BK137ARF', '1', NULL, 'FORD', 'Model-137', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-18', NULL, '2025-12-01 06:47:00', '', 1, 0),
(239, 'BK138ARF', '1', NULL, 'TATA', 'Model-138', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-19', NULL, '2025-12-01 06:48:00', '', 0, 0),
(240, 'BK139ARF', '1', NULL, 'MAHINDRA', 'Model-139', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-20', NULL, '2025-12-01 06:49:00', '', 1, 0),
(241, 'BK140ARF', '1', NULL, 'HYUNDAI', 'Model-140', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-21', NULL, '2025-12-01 06:50:00', '', 0, 0),
(242, 'BK141ARF', '1', NULL, 'FORD', 'Model-141', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-22', NULL, '2025-12-01 06:51:00', '', 1, 0),
(243, 'BK142ARF', '1', NULL, 'TATA', 'Model-142', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-23', NULL, '2025-12-01 06:52:00', '', 0, 0),
(244, 'BK143ARF', '1', NULL, 'MAHINDRA', 'Model-143', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-24', NULL, '2025-12-01 06:53:00', '', 1, 0),
(245, 'BK144ARF', '1', NULL, 'HYUNDAI', 'Model-144', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-25', NULL, '2025-12-01 06:54:00', '', 0, 0),
(246, 'BK145ARF', '1', NULL, 'FORD', 'Model-145', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-26', NULL, '2025-12-01 06:55:00', '', 1, 0),
(247, 'BK146ARF', '1', NULL, 'TATA', 'Model-146', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27', NULL, '2025-12-01 06:56:00', '', 1, 0),
(248, 'BK147ARF', '1', NULL, 'MAHINDRA', 'Model-147', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-28', NULL, '2025-12-01 06:57:00', '', 0, 0),
(249, 'BK148ARF', '1', NULL, 'HYUNDAI', 'Model-148', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29', NULL, '2025-12-01 06:58:00', '', 0, 0),
(250, 'BK149ARF', '1', NULL, 'FORD', 'Model-149', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-30', NULL, '2025-12-01 06:59:00', '', 1, 0),
(251, 'BK150ARF', '1', NULL, 'TATA', 'Model-150', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-31', NULL, '2025-12-01 07:00:00', '', 0, 0),
(252, 'BK151ARF', '1', NULL, 'MAHINDRA', 'Model-151', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-01', NULL, '2025-12-01 07:01:00', '', 1, 0),
(253, 'BK152ARF', '1', NULL, 'HYUNDAI', 'Model-152', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02', NULL, '2025-12-01 07:02:00', '', 0, 0),
(254, 'BK153ARF', '1', NULL, 'FORD', 'Model-153', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-03', NULL, '2025-12-01 07:03:00', '', 1, 0),
(255, 'BK154ARF', '1', NULL, 'TATA', 'Model-154', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-04', NULL, '2025-12-01 07:04:00', '', 0, 0),
(256, 'BK155ARF', '1', NULL, 'MAHINDRA', 'Model-155', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-05', NULL, '2025-12-01 07:05:00', '', 1, 0),
(257, 'BK156ARF', '1', NULL, 'HYUNDAI', 'Model-156', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06', NULL, '2025-12-01 07:06:00', '', 0, 0),
(258, 'BK157ARF', '1', NULL, 'FORD', 'Model-157', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-07', NULL, '2025-12-01 07:07:00', '', 1, 0),
(259, 'BK158ARF', '1', NULL, 'TATA', 'Model-158', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08', NULL, '2025-12-01 07:08:00', '', 0, 0),
(260, 'BK159ARF', '1', NULL, 'MAHINDRA', 'Model-159', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-09', NULL, '2025-12-01 07:09:00', '', 1, 0),
(261, 'BK160ARF', '1', NULL, 'HYUNDAI', 'Model-160', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10', NULL, '2025-12-01 07:10:00', '', 0, 0),
(262, 'BK161ARF', '1', NULL, 'FORD', 'Model-161', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-11', NULL, '2025-12-01 07:11:00', '', 1, 0),
(263, 'BK162ARF', '1', NULL, 'TATA', 'Model-162', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-12', NULL, '2025-12-01 07:12:00', '', 0, 0),
(264, 'BK163ARF', '1', NULL, 'MAHINDRA', 'Model-163', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-13', NULL, '2025-12-01 07:13:00', '', 1, 0),
(265, 'BK164ARF', '1', NULL, 'HYUNDAI', 'Model-164', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14', NULL, '2025-12-01 07:14:00', '', 0, 0),
(266, 'BK165ARF', '1', NULL, 'FORD', 'Model-165', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15', NULL, '2025-12-01 07:15:00', '', 1, 0),
(267, 'BK166ARF', '1', NULL, 'TATA', 'Model-166', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16', NULL, '2025-12-01 07:16:00', '', 0, 0),
(268, 'BK167ARF', '1', NULL, 'MAHINDRA', 'Model-167', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, '2025-12-01 07:17:00', '', 1, 0),
(269, 'BK168ARF', '1', NULL, 'HYUNDAI', 'Model-168', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18', NULL, '2025-12-01 07:18:00', '', 0, 0),
(270, 'BK169ARF', '1', NULL, 'FORD', 'Model-169', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-19', NULL, '2025-12-01 07:19:00', '', 1, 0),
(271, 'BK170ARF', '1', NULL, 'TATA', 'Model-170', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-20', NULL, '2025-12-01 07:20:00', '', 0, 0),
(272, 'BK171ARF', '1', NULL, 'MAHINDRA', 'Model-171', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-21', NULL, '2025-12-01 07:21:00', '', 1, 0),
(273, 'BK172ARF', '1', NULL, 'HYUNDAI', 'Model-172', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22', NULL, '2025-12-01 07:22:00', '', 0, 0),
(274, 'BK173ARF', '1', NULL, 'FORD', 'Model-173', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23', NULL, '2025-12-01 07:23:00', '', 1, 0),
(275, 'BK174ARF', '1', NULL, 'TATA', 'Model-174', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24', NULL, '2025-12-01 07:24:00', '', 0, 0),
(276, 'BK175ARF', '1', NULL, 'MAHINDRA', 'Model-175', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25', NULL, '2025-12-01 07:25:00', '', 1, 0),
(277, 'BK176ARF', '1', NULL, 'HYUNDAI', 'Model-176', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-26', NULL, '2025-12-01 07:26:00', '', 0, 0),
(278, 'BK177ARF', '1', NULL, 'FORD', 'Model-177', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-27', NULL, '2025-12-01 07:27:00', '', 1, 0),
(279, 'BK178ARF', '1', NULL, 'TATA', 'Model-178', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-28', NULL, '2025-12-01 07:28:00', '', 0, 0),
(280, 'BK179ARF', '1', NULL, 'MAHINDRA', 'Model-179', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29', NULL, '2025-12-01 07:29:00', '', 1, 0),
(281, 'BK180ARF', '1', NULL, 'HYUNDAI', 'Model-180', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-30', NULL, '2025-12-01 07:30:00', '', 0, 0),
(282, 'BK181ARF', '1', NULL, 'FORD', 'Model-181', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01', NULL, '2025-12-01 07:31:00', '', 1, 0),
(283, 'BK182ARF', '1', NULL, 'TATA', 'Model-182', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02', NULL, '2025-12-01 07:32:00', '', 0, 0),
(284, 'BK183ARF', '1', NULL, 'MAHINDRA', 'Model-183', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-03', NULL, '2025-12-01 07:33:00', '', 1, 0),
(285, 'BK184ARF', '1', NULL, 'HYUNDAI', 'Model-184', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-04', NULL, '2025-12-01 07:34:00', '', 0, 0),
(286, 'BK185ARF', '1', NULL, 'FORD', 'Model-185', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-05', NULL, '2025-12-01 07:35:00', '', 1, 0),
(287, 'BK186ARF', '1', NULL, 'TATA', 'Model-186', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06', NULL, '2025-12-01 07:36:00', '', 0, 0),
(288, 'BK187ARF', '1', NULL, 'MAHINDRA', 'Model-187', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07', NULL, '2025-12-01 07:37:00', '', 1, 0),
(289, 'BK188ARF', '1', NULL, 'HYUNDAI', 'Model-188', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-08', NULL, '2025-12-01 07:38:00', '', 0, 0),
(290, 'BK189ARF', '1', NULL, 'FORD', 'Model-189', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-09', NULL, '2025-12-01 07:39:00', '', 1, 0),
(291, 'BK190ARF', '1', NULL, 'TATA', 'Model-190', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10', NULL, '2025-12-01 07:40:00', '', 0, 0),
(292, 'BK191ARF', '1', NULL, 'MAHINDRA', 'Model-191', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-11', NULL, '2025-12-01 07:41:00', '', 1, 0),
(293, 'BK192ARF', '1', NULL, 'HYUNDAI', 'Model-192', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12', NULL, '2025-12-01 07:42:00', '', 0, 0),
(294, 'BK193ARF', '1', NULL, 'FORD', 'Model-193', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', NULL, '2025-12-01 07:43:00', '', 1, 0),
(295, 'BK194ARF', '1', NULL, 'TATA', 'Model-194', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', NULL, '2025-12-01 07:44:00', '', 0, 0),
(296, 'BK195ARF', '1', NULL, 'MAHINDRA', 'Model-195', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15', NULL, '2025-12-01 07:45:00', '', 1, 0),
(297, 'BK196ARF', '1', NULL, 'HYUNDAI', 'Model-196', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-16', NULL, '2025-12-01 07:46:00', '', 0, 0),
(298, 'BK197ARF', '1', NULL, 'FORD', 'Model-197', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-17', NULL, '2025-12-01 07:47:00', '', 1, 0),
(299, 'BK198ARF', '1', NULL, 'TATA', 'Model-198', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-18', NULL, '2025-12-01 07:48:00', '', 0, 0),
(300, 'BK199ARF', '1', NULL, 'MAHINDRA', 'Model-199', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-19', NULL, '2025-12-01 07:49:00', '', 1, 0),
(301, 'BK200ARF', '1', NULL, 'HYUNDAI', 'Model-200', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-20', NULL, '2025-12-01 07:50:00', '', 0, 0),
(302, 'BK201ARF', '1', NULL, 'FORD', 'Model-201', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-21', NULL, '2025-12-01 07:51:00', '', 1, 0),
(303, 'BK202ARF', '1', NULL, 'TATA', 'Model-202', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-22', NULL, '2025-12-01 07:52:00', '', 0, 0),
(304, 'BK203ARF', '1', NULL, 'MAHINDRA', 'Model-203', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-23', NULL, '2025-12-01 07:53:00', '', 1, 0),
(305, 'BK204ARF', '1', NULL, 'HYUNDAI', 'Model-204', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-24', NULL, '2025-12-01 07:54:00', '', 0, 0),
(306, 'BK205ARF', '1', NULL, 'FORD', 'Model-205', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-25', NULL, '2025-12-01 07:55:00', '', 1, 0),
(307, 'BK206ARF', '1', NULL, 'TATA', 'Model-206', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-26', NULL, '2025-12-01 07:56:00', '', 0, 0),
(308, 'BK207ARF', '1', NULL, 'MAHINDRA', 'Model-207', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27', NULL, '2025-12-01 07:57:00', '', 1, 0),
(309, 'BK208ARF', '1', NULL, 'HYUNDAI', 'Model-208', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-28', NULL, '2025-12-01 07:58:00', '', 0, 0),
(310, 'BK209ARF', '1', NULL, 'FORD', 'Model-209', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29', NULL, '2025-12-01 07:59:00', '', 1, 0),
(311, 'BK210ARF', '1', NULL, 'TATA', 'Model-210', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-30', NULL, '2025-12-01 08:00:00', '', 0, 0),
(312, 'BK211ARF', '1', NULL, 'MAHINDRA', 'Model-211', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-31', NULL, '2025-12-01 08:01:00', '', 1, 0),
(313, 'BK212ARF', '1', NULL, 'HYUNDAI', 'Model-212', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-01', NULL, '2025-12-01 08:02:00', '', 0, 0),
(314, 'BK213ARF', '1', NULL, 'FORD', 'Model-213', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-02', NULL, '2025-12-01 08:03:00', '', 1, 0),
(315, 'BK214ARF', '1', NULL, 'TATA', 'Model-214', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-03', NULL, '2025-12-01 08:04:00', '', 0, 0),
(316, 'BK215ARF', '1', NULL, 'MAHINDRA', 'Model-215', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-04', NULL, '2025-12-01 08:05:00', '', 1, 0),
(317, 'BK216ARF', '1', NULL, 'HYUNDAI', 'Model-216', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-05', NULL, '2025-12-01 08:06:00', '', 0, 0);
INSERT INTO `vehicle_details_tbl` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`, `is_deleted`) VALUES
(318, 'BK217ARF', '1', NULL, 'FORD', 'Model-217', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-06', NULL, '2025-12-01 08:07:00', '', 1, 0),
(319, 'BK218ARF', '1', NULL, 'TATA', 'Model-218', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-07', NULL, '2025-12-01 08:08:00', '', 0, 0),
(320, 'BK219ARF', '1', NULL, 'MAHINDRA', 'Model-219', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-08', NULL, '2025-12-01 08:09:00', '', 1, 0),
(321, 'BK220ARF', '1', NULL, 'HYUNDAI', 'Model-220', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-09', NULL, '2025-12-01 08:10:00', '', 0, 0),
(322, 'BK221ARF', '1', NULL, 'FORD', 'Model-221', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-10', NULL, '2025-12-01 08:11:00', '', 1, 0),
(323, 'BK222ARF', '1', NULL, 'TATA', 'Model-222', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11', NULL, '2025-12-01 08:12:00', '', 0, 0),
(324, 'BK223ARF', '1', NULL, 'MAHINDRA', 'Model-223', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-12', NULL, '2025-12-01 08:13:00', '', 1, 0),
(325, 'BK224ARF', '1', NULL, 'HYUNDAI', 'Model-224', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-13', NULL, '2025-12-01 08:14:00', '', 0, 0),
(326, 'BK225ARF', '1', NULL, 'FORD', 'Model-225', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-14', NULL, '2025-12-01 08:15:00', '', 1, 0),
(327, 'BK226ARF', '1', NULL, 'TATA', 'Model-226', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-15', NULL, '2025-12-01 08:16:00', '', 0, 0),
(328, 'BK227ARF', '1', NULL, 'MAHINDRA', 'Model-227', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, '2025-12-01 08:17:00', '', 1, 0),
(329, 'BK228ARF', '1', NULL, 'HYUNDAI', 'Model-228', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17', NULL, '2025-12-01 08:18:00', '', 0, 0),
(330, 'BK229ARF', '1', NULL, 'FORD', 'Model-229', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-18', NULL, '2025-12-01 08:19:00', '', 1, 0),
(331, 'BK230ARF', '1', NULL, 'TATA', 'Model-230', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19', NULL, '2025-12-01 08:20:00', '', 0, 0),
(332, 'BK231ARF', '1', NULL, 'MAHINDRA', 'Model-231', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20', NULL, '2025-12-01 08:21:00', '', 1, 0),
(333, 'BK232ARF', '1', NULL, 'HYUNDAI', 'Model-232', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-21', NULL, '2025-12-01 08:22:00', '', 0, 0),
(334, 'BK233ARF', '1', NULL, 'FORD', 'Model-233', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-22', NULL, '2025-12-01 08:23:00', '', 1, 0),
(335, 'BK234ARF', '1', NULL, 'TATA', 'Model-234', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-23', NULL, '2025-12-01 08:24:00', '', 0, 0),
(336, 'BK235ARF', '1', NULL, 'MAHINDRA', 'Model-235', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-24', NULL, '2025-12-01 08:25:00', '', 1, 0),
(337, 'BK236ARF', '1', NULL, 'HYUNDAI', 'Model-236', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-25', NULL, '2025-12-01 08:26:00', '', 0, 0),
(338, 'BK237ARF', '1', NULL, 'FORD', 'Model-237', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26', NULL, '2025-12-01 08:27:00', '', 1, 0),
(339, 'BK238ARF', '1', NULL, 'TATA', 'Model-238', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27', NULL, '2025-12-01 08:28:00', '', 0, 0),
(340, 'BK239ARF', '1', NULL, 'MAHINDRA', 'Model-239', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-28', NULL, '2025-12-01 08:29:00', '', 1, 0),
(341, 'BK240ARF', '1', NULL, 'HYUNDAI', 'Model-240', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-29', NULL, '2025-12-01 08:30:00', '', 0, 0),
(342, 'BK241ARF', '1', NULL, 'FORD', 'Model-241', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-30', NULL, '2025-12-01 08:31:00', '', 1, 0),
(357, 'BK001ARF', '1', NULL, 'FORD', 'Model-1', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-02', NULL, '2025-12-01 04:31:00', '', 1, 0),
(358, 'BK002ARF', '1', NULL, 'TATA', 'Model-2', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03', NULL, '2025-12-01 04:32:00', '', 0, 0),
(359, 'BK003ARF', '1', NULL, 'MAHINDRA', 'Model-3', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-04', NULL, '2025-12-01 04:33:00', '', 1, 0),
(360, 'BK004ARF', '1', NULL, 'HYUNDAI', 'Model-4', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05', NULL, '2025-12-01 04:34:00', '', 0, 0),
(361, 'BK005ARF', '1', NULL, 'FORD', 'Model-5', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-06', NULL, '2025-12-01 04:35:00', '', 1, 0),
(362, 'BK006ARF', '1', NULL, 'TATA', 'Model-6', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-07', NULL, '2025-12-01 04:36:00', '', 0, 0),
(363, 'BK007ARF', '1', NULL, 'MAHINDRA', 'Model-7', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-08', NULL, '2025-12-01 04:37:00', '', 1, 0),
(364, 'BK008ARF', '1', NULL, 'HYUNDAI', 'Model-8', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-09', NULL, '2025-12-01 04:38:00', '', 0, 0),
(365, 'BK009ARF', '1', NULL, 'FORD', 'Model-9', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-10', NULL, '2025-12-01 04:39:00', '', 1, 0),
(366, 'BK010ARF', '1', NULL, 'TATA', 'Model-10', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-11', NULL, '2025-12-01 04:40:00', '', 0, 0),
(367, 'BK011ARF', '1', NULL, 'MAHINDRA', 'Model-11', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12', NULL, '2025-12-01 04:41:00', '', 1, 0),
(368, 'BK012ARF', '1', NULL, 'HYUNDAI', 'Model-12', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-13', NULL, '2025-12-01 04:42:00', '', 0, 0),
(369, 'BK013ARF', '1', NULL, 'FORD', 'Model-13', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-14', NULL, '2025-12-01 04:43:00', '', 1, 0),
(370, 'BK014ARF', '1', NULL, 'TATA', 'Model-14', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-15', NULL, '2025-12-01 04:44:00', '', 0, 0),
(371, 'BK015ARF', '1', NULL, 'MAHINDRA', 'Model-15', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-16', NULL, '2025-12-01 04:45:00', '', 1, 0),
(372, 'BK016ARF', '1', NULL, 'HYUNDAI', 'Model-16', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17', NULL, '2025-12-01 04:46:00', '', 0, 0),
(373, 'BK017ARF', '1', NULL, 'FORD', 'Model-17', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-18', NULL, '2025-12-01 04:47:00', '', 1, 0),
(374, 'BK018ARF', '1', NULL, 'TATA', 'Model-18', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-19', NULL, '2025-12-01 04:48:00', '', 0, 0),
(375, 'BK019ARF', '1', NULL, 'MAHINDRA', 'Model-19', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-20', NULL, '2025-12-01 04:49:00', '', 1, 0),
(376, 'BK020ARF', '1', NULL, 'HYUNDAI', 'Model-20', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21', NULL, '2025-12-01 04:50:00', '', 0, 0),
(377, 'BK021ARF', '1', NULL, 'FORD', 'Model-21', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22', NULL, '2025-12-01 04:51:00', '', 1, 0),
(378, 'BK022ARF', '1', NULL, 'TATA', 'Model-22', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-23', NULL, '2025-12-01 04:52:00', '', 0, 0),
(379, 'BK023ARF', '1', NULL, 'MAHINDRA', 'Model-23', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24', NULL, '2025-12-01 04:53:00', '', 1, 0),
(380, 'BK024ARF', '1', NULL, 'HYUNDAI', 'Model-24', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-25', NULL, '2025-12-01 04:54:00', '', 0, 0),
(381, 'BK025ARF', '1', NULL, 'FORD', 'Model-25', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26', NULL, '2025-12-01 04:55:00', '', 1, 0),
(382, 'BK026ARF', '1', NULL, 'TATA', 'Model-26', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27', NULL, '2025-12-01 04:56:00', '', 0, 0),
(383, 'BK027ARF', '1', NULL, 'MAHINDRA', 'Model-27', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28', NULL, '2025-12-01 04:57:00', '', 1, 0),
(384, 'BK028ARF', '1', NULL, 'HYUNDAI', 'Model-28', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29', NULL, '2025-12-01 04:58:00', '', 0, 0),
(385, 'BK029ARF', '1', NULL, 'FORD', 'Model-29', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30', NULL, '2025-12-01 04:59:00', '', 1, 0),
(386, 'BK030ARF', '1', NULL, 'TATA', 'Model-30', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-31', NULL, '2025-12-01 05:00:00', '', 0, 0),
(387, 'BK031ARF', '1', NULL, 'MAHINDRA', 'Model-31', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01', NULL, '2025-12-01 05:01:00', '', 1, 0),
(388, 'BK032ARF', '1', NULL, 'HYUNDAI', 'Model-32', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02', NULL, '2025-12-01 05:02:00', '', 0, 0),
(389, 'BK033ARF', '1', NULL, 'FORD', 'Model-33', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-03', NULL, '2025-12-01 05:03:00', '', 1, 0),
(390, 'BK034ARF', '1', NULL, 'TATA', 'Model-34', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-04', NULL, '2025-12-01 05:04:00', '', 0, 0),
(391, 'BK035ARF', '1', NULL, 'MAHINDRA', 'Model-35', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-05', NULL, '2025-12-01 05:05:00', '', 1, 0),
(392, 'BK036ARF', '1', NULL, 'HYUNDAI', 'Model-36', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-06', NULL, '2025-12-01 05:06:00', '', 0, 0),
(393, 'BK037ARF', '1', NULL, 'FORD', 'Model-37', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-07', NULL, '2025-12-01 05:07:00', '', 1, 0),
(394, 'BK038ARF', '1', NULL, 'TATA', 'Model-38', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-08', NULL, '2025-12-01 05:08:00', '', 0, 0),
(395, 'BK039ARF', '1', NULL, 'MAHINDRA', 'Model-39', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09', NULL, '2025-12-01 05:09:00', '', 1, 0),
(396, 'BK040ARF', '1', NULL, 'HYUNDAI', 'Model-40', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-10', NULL, '2025-12-01 05:10:00', '', 0, 0),
(397, 'BK041ARF', '1', NULL, 'FORD', 'Model-41', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11', NULL, '2025-12-01 05:11:00', '', 1, 0),
(398, 'BK042ARF', '1', NULL, 'TATA', 'Model-42', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-12', NULL, '2025-12-01 05:12:00', '', 0, 0),
(399, 'BK043ARF', '1', NULL, 'MAHINDRA', 'Model-43', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13', NULL, '2025-12-01 05:13:00', '', 1, 0),
(400, 'BK044ARF', '1', NULL, 'HYUNDAI', 'Model-44', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-14', NULL, '2025-12-01 05:14:00', '', 0, 0),
(401, 'BK045ARF', '1', NULL, 'FORD', 'Model-45', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-15', NULL, '2025-12-01 05:15:00', '', 1, 0),
(402, 'BK046ARF', '1', NULL, 'TATA', 'Model-46', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16', NULL, '2025-12-01 05:16:00', '', 0, 0),
(403, 'BK047ARF', '1', NULL, 'MAHINDRA', 'Model-47', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17', NULL, '2025-12-01 05:17:00', '', 1, 0),
(404, 'BK048ARF', '1', NULL, 'HYUNDAI', 'Model-48', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18', NULL, '2025-12-01 05:18:00', '', 0, 0),
(405, 'BK049ARF', '1', NULL, 'FORD', 'Model-49', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-19', NULL, '2025-12-01 05:19:00', '', 1, 0),
(406, 'BK050ARF', '1', NULL, 'TATA', 'Model-50', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-20', NULL, '2025-12-01 05:20:00', '', 0, 0),
(407, 'BK051ARF', '1', NULL, 'MAHINDRA', 'Model-51', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', NULL, '2025-12-01 05:21:00', '', 1, 0),
(408, 'BK052ARF', '1', NULL, 'HYUNDAI', 'Model-52', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-22', NULL, '2025-12-01 05:22:00', '', 0, 0),
(409, 'BK053ARF', '1', NULL, 'FORD', 'Model-53', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-23', NULL, '2025-12-01 05:23:00', '', 1, 0),
(410, 'BK054ARF', '1', NULL, 'TATA', 'Model-54', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24', NULL, '2025-12-01 05:24:00', '', 0, 0),
(411, 'BK055ARF', '1', NULL, 'MAHINDRA', 'Model-55', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25', NULL, '2025-12-01 05:25:00', '', 1, 0),
(412, 'BK056ARF', '1', NULL, 'HYUNDAI', 'Model-56', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-26', NULL, '2025-12-01 05:26:00', '', 0, 0),
(413, 'BK057ARF', '1', NULL, 'FORD', 'Model-57', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-27', NULL, '2025-12-01 05:27:00', '', 1, 0),
(414, 'BK058ARF', '1', NULL, 'TATA', 'Model-58', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-28', NULL, '2025-12-01 05:28:00', '', 0, 0),
(415, 'BK059ARF', '1', NULL, 'MAHINDRA', 'Model-59', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-01', NULL, '2025-12-01 05:29:00', '', 1, 0),
(416, 'BK060ARF', '1', NULL, 'HYUNDAI', 'Model-60', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-02', NULL, '2025-12-01 05:30:00', '', 0, 0),
(417, 'BK061ARF', '1', NULL, 'FORD', 'Model-61', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-03', NULL, '2025-12-01 05:31:00', '', 1, 0),
(418, 'BK062ARF', '1', NULL, 'TATA', 'Model-62', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-04', NULL, '2025-12-01 05:32:00', '', 0, 0),
(419, 'BK063ARF', '1', NULL, 'MAHINDRA', 'Model-63', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05', NULL, '2025-12-01 05:33:00', '', 1, 0),
(420, 'BK064ARF', '1', NULL, 'HYUNDAI', 'Model-64', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-06', NULL, '2025-12-01 05:34:00', '', 0, 0),
(421, 'BK065ARF', '1', NULL, 'FORD', 'Model-65', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07', NULL, '2025-12-01 05:35:00', '', 1, 0),
(422, 'BK066ARF', '1', NULL, 'TATA', 'Model-66', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-08', NULL, '2025-12-01 05:36:00', '', 0, 0),
(423, 'BK067ARF', '1', NULL, 'MAHINDRA', 'Model-67', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09', NULL, '2025-12-01 05:37:00', '', 1, 0),
(424, 'BK068ARF', '1', NULL, 'HYUNDAI', 'Model-68', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10', NULL, '2025-12-01 05:38:00', '', 0, 0),
(425, 'BK069ARF', '1', NULL, 'FORD', 'Model-69', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-11', NULL, '2025-12-01 05:39:00', '', 1, 0),
(426, 'BK070ARF', '1', NULL, 'TATA', 'Model-70', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12', NULL, '2025-12-01 05:40:00', '', 0, 0),
(427, 'BK071ARF', '1', NULL, 'MAHINDRA', 'Model-71', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-13', NULL, '2025-12-01 05:41:00', '', 1, 0),
(428, 'BK072ARF', '1', NULL, 'HYUNDAI', 'Model-72', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14', NULL, '2025-12-01 05:42:00', '', 0, 0),
(429, 'BK073ARF', '1', NULL, 'FORD', 'Model-73', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15', NULL, '2025-12-01 05:43:00', '', 1, 0),
(430, 'BK074ARF', '1', NULL, 'TATA', 'Model-74', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-16', NULL, '2025-12-01 05:44:00', '', 0, 0),
(431, 'BK075ARF', '1', NULL, 'MAHINDRA', 'Model-75', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17', NULL, '2025-12-01 05:45:00', '', 1, 0),
(432, 'BK076ARF', '1', NULL, 'HYUNDAI', 'Model-76', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18', NULL, '2025-12-01 05:46:00', '', 0, 0),
(433, 'BK077ARF', '1', NULL, 'FORD', 'Model-77', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19', NULL, '2025-12-01 05:47:00', '', 1, 0),
(434, 'BK078ARF', '1', NULL, 'TATA', 'Model-78', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-20', NULL, '2025-12-01 05:48:00', '', 0, 0),
(435, 'BK079ARF', '1', NULL, 'MAHINDRA', 'Model-79', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-21', NULL, '2025-12-01 05:49:00', '', 1, 0),
(436, 'BK080ARF', '1', NULL, 'HYUNDAI', 'Model-80', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22', NULL, '2025-12-01 05:50:00', '', 0, 0),
(437, 'BK081ARF', '1', NULL, 'FORD', 'Model-81', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-23', NULL, '2025-12-01 05:51:00', '', 1, 0),
(438, 'BK082ARF', '1', NULL, 'TATA', 'Model-82', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24', NULL, '2025-12-01 05:52:00', '', 0, 0),
(439, 'BK083ARF', '1', NULL, 'MAHINDRA', 'Model-83', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-25', NULL, '2025-12-01 05:53:00', '', 1, 0),
(440, 'BK084ARF', '1', NULL, 'HYUNDAI', 'Model-84', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-26', NULL, '2025-12-01 05:54:00', '', 0, 0),
(441, 'BK085ARF', '1', NULL, 'FORD', 'Model-85', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27', NULL, '2025-12-01 05:55:00', '', 1, 0),
(442, 'BK086ARF', '1', NULL, 'TATA', 'Model-86', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-28', NULL, '2025-12-01 05:56:00', '', 0, 0),
(443, 'BK087ARF', '1', NULL, 'MAHINDRA', 'Model-87', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29', NULL, '2025-12-01 05:57:00', '', 1, 0),
(444, 'BK088ARF', '1', NULL, 'HYUNDAI', 'Model-88', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30', NULL, '2025-12-01 05:58:00', '', 0, 0),
(445, 'BK089ARF', '1', NULL, 'FORD', 'Model-89', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31', NULL, '2025-12-01 05:59:00', '', 1, 0),
(446, 'BK090ARF', '1', NULL, 'TATA', 'Model-90', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, '2025-12-01 06:00:00', '', 0, 0),
(447, 'BK091ARF', '1', NULL, 'MAHINDRA', 'Model-91', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-02', NULL, '2025-12-01 06:01:00', '', 1, 0),
(448, 'BK092ARF', '1', NULL, 'HYUNDAI', 'Model-92', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-03', NULL, '2025-12-01 06:02:00', '', 0, 0),
(449, 'BK093ARF', '1', NULL, 'FORD', 'Model-93', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-04', NULL, '2025-12-01 06:03:00', '', 1, 0),
(450, 'BK094ARF', '1', NULL, 'TATA', 'Model-94', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-05', NULL, '2025-12-01 06:04:00', '', 0, 0),
(451, 'BK095ARF', '1', NULL, 'MAHINDRA', 'Model-95', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-06', NULL, '2025-12-01 06:05:00', '', 1, 0),
(452, 'BK096ARF', '1', NULL, 'HYUNDAI', 'Model-96', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-07', NULL, '2025-12-01 06:06:00', '', 0, 0),
(453, 'BK097ARF', '1', NULL, 'FORD', 'Model-97', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-08', NULL, '2025-12-01 06:07:00', '', 1, 0),
(454, 'BK098ARF', '1', NULL, 'TATA', 'Model-98', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-09', NULL, '2025-12-01 06:08:00', '', 0, 0),
(455, 'BK099ARF', '1', NULL, 'MAHINDRA', 'Model-99', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-10', NULL, '2025-12-01 06:09:00', '', 1, 0),
(456, 'BK100ARF', '1', NULL, 'HYUNDAI', 'Model-100', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11', NULL, '2025-12-01 06:10:00', '', 0, 0),
(457, 'BK101ARF', '1', NULL, 'FORD', 'Model-101', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12', NULL, '2025-12-01 06:11:00', '', 1, 0),
(458, 'BK102ARF', '1', NULL, 'TATA', 'Model-102', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-13', NULL, '2025-12-01 06:12:00', '', 0, 0),
(459, 'BK103ARF', '1', NULL, 'MAHINDRA', 'Model-103', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14', NULL, '2025-12-01 06:13:00', '', 1, 0),
(460, 'BK104ARF', '1', NULL, 'HYUNDAI', 'Model-104', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-15', NULL, '2025-12-01 06:14:00', '', 0, 0),
(461, 'BK105ARF', '1', NULL, 'FORD', 'Model-105', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-16', NULL, '2025-12-01 06:15:00', '', 1, 0),
(462, 'BK106ARF', '1', NULL, 'TATA', 'Model-106', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-17', NULL, '2025-12-01 06:16:00', '', 0, 0),
(463, 'BK107ARF', '1', NULL, 'MAHINDRA', 'Model-107', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-18', NULL, '2025-12-01 06:17:00', '', 1, 0),
(464, 'BK108ARF', '1', NULL, 'HYUNDAI', 'Model-108', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-19', NULL, '2025-12-01 06:18:00', '', 0, 0),
(465, 'BK109ARF', '1', NULL, 'FORD', 'Model-109', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20', NULL, '2025-12-01 06:19:00', '', 1, 0),
(466, 'BK110ARF', '1', NULL, 'TATA', 'Model-110', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21', NULL, '2025-12-01 06:20:00', '', 0, 0),
(467, 'BK111ARF', '1', NULL, 'MAHINDRA', 'Model-111', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22', NULL, '2025-12-01 06:21:00', '', 1, 0),
(468, 'BK112ARF', '1', NULL, 'HYUNDAI', 'Model-112', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-23', NULL, '2025-12-01 06:22:00', '', 0, 0),
(469, 'BK113ARF', '1', NULL, 'FORD', 'Model-113', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-24', NULL, '2025-12-01 06:23:00', '', 1, 0),
(470, 'BK114ARF', '1', NULL, 'TATA', 'Model-114', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-25', NULL, '2025-12-01 06:24:00', '', 0, 0),
(471, 'BK115ARF', '1', NULL, 'MAHINDRA', 'Model-115', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-26', NULL, '2025-12-01 06:25:00', '', 1, 0),
(472, 'BK116ARF', '1', NULL, 'HYUNDAI', 'Model-116', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-27', NULL, '2025-12-01 06:26:00', '', 0, 0),
(473, 'BK117ARF', '1', NULL, 'FORD', 'Model-117', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-28', NULL, '2025-12-01 06:27:00', '', 1, 0),
(474, 'BK118ARF', '1', NULL, 'TATA', 'Model-118', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29', NULL, '2025-12-01 06:28:00', '', 0, 0),
(475, 'BK119ARF', '1', NULL, 'MAHINDRA', 'Model-119', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30', NULL, '2025-12-01 06:29:00', '', 1, 0),
(476, 'BK120ARF', '1', NULL, 'HYUNDAI', 'Model-120', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-01', NULL, '2025-12-01 06:30:00', '', 0, 0),
(477, 'BK121ARF', '1', NULL, 'FORD', 'Model-121', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-02', NULL, '2025-12-01 06:31:00', '', 1, 0),
(478, 'BK122ARF', '1', NULL, 'TATA', 'Model-122', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-03', NULL, '2025-12-01 06:32:00', '', 0, 0),
(479, 'BK123ARF', '1', NULL, 'MAHINDRA', 'Model-123', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04', NULL, '2025-12-01 06:33:00', '', 1, 0),
(480, 'BK124ARF', '1', NULL, 'HYUNDAI', 'Model-124', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05', NULL, '2025-12-01 06:34:00', '', 0, 0),
(481, 'BK125ARF', '1', NULL, 'FORD', 'Model-125', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06', NULL, '2025-12-01 06:35:00', '', 1, 0),
(482, 'BK126ARF', '1', NULL, 'TATA', 'Model-126', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-07', NULL, '2025-12-01 06:36:00', '', 0, 0),
(483, 'BK127ARF', '1', NULL, 'MAHINDRA', 'Model-127', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-08', NULL, '2025-12-01 06:37:00', '', 1, 0),
(484, 'BK128ARF', '1', NULL, 'HYUNDAI', 'Model-128', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-09', NULL, '2025-12-01 06:38:00', '', 0, 0),
(485, 'BK129ARF', '1', NULL, 'FORD', 'Model-129', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10', NULL, '2025-12-01 06:39:00', '', 1, 0),
(486, 'BK130ARF', '1', NULL, 'TATA', 'Model-130', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-11', NULL, '2025-12-01 06:40:00', '', 0, 0),
(487, 'BK131ARF', '1', NULL, 'MAHINDRA', 'Model-131', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-12', NULL, '2025-12-01 06:41:00', '', 1, 0),
(488, 'BK132ARF', '1', NULL, 'HYUNDAI', 'Model-132', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-13', NULL, '2025-12-01 06:42:00', '', 0, 0),
(489, 'BK133ARF', '1', NULL, 'FORD', 'Model-133', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-14', NULL, '2025-12-01 06:43:00', '', 1, 0),
(490, 'BK134ARF', '1', NULL, 'TATA', 'Model-134', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15', NULL, '2025-12-01 06:44:00', '', 0, 0),
(491, 'BK135ARF', '1', NULL, 'MAHINDRA', 'Model-135', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-16', NULL, '2025-12-01 06:45:00', '', 1, 0),
(492, 'BK136ARF', '1', NULL, 'HYUNDAI', 'Model-136', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17', NULL, '2025-12-01 06:46:00', '', 0, 0),
(493, 'BK137ARF', '1', NULL, 'FORD', 'Model-137', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-18', NULL, '2025-12-01 06:47:00', '', 1, 0),
(494, 'BK138ARF', '1', NULL, 'TATA', 'Model-138', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-19', NULL, '2025-12-01 06:48:00', '', 0, 0),
(495, 'BK139ARF', '1', NULL, 'MAHINDRA', 'Model-139', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-20', NULL, '2025-12-01 06:49:00', '', 1, 0),
(496, 'BK140ARF', '1', NULL, 'HYUNDAI', 'Model-140', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-21', NULL, '2025-12-01 06:50:00', '', 0, 0),
(497, 'BK141ARF', '1', NULL, 'FORD', 'Model-141', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-22', NULL, '2025-12-01 06:51:00', '', 1, 0),
(498, 'BK142ARF', '1', NULL, 'TATA', 'Model-142', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-23', NULL, '2025-12-01 06:52:00', '', 0, 0),
(499, 'BK143ARF', '1', NULL, 'MAHINDRA', 'Model-143', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-24', NULL, '2025-12-01 06:53:00', '', 1, 0),
(500, 'BK144ARF', '1', NULL, 'HYUNDAI', 'Model-144', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-25', NULL, '2025-12-01 06:54:00', '', 0, 0),
(501, 'BK145ARF', '1', NULL, 'FORD', 'Model-145', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-26', NULL, '2025-12-01 06:55:00', '', 1, 0),
(502, 'BK146ARF', '1', NULL, 'TATA', 'Model-146', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27', NULL, '2025-12-01 06:56:00', '', 0, 0),
(503, 'BK147ARF', '1', NULL, 'MAHINDRA', 'Model-147', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-28', NULL, '2025-12-01 06:57:00', '', 1, 0),
(504, 'BK148ARF', '1', NULL, 'HYUNDAI', 'Model-148', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29', NULL, '2025-12-01 06:58:00', '', 0, 0),
(505, 'BK149ARF', '1', NULL, 'FORD', 'Model-149', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-30', NULL, '2025-12-01 06:59:00', '', 1, 0),
(506, 'BK150ARF', '1', NULL, 'TATA', 'Model-150', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-31', NULL, '2025-12-01 07:00:00', '', 0, 0),
(507, 'BK151ARF', '1', NULL, 'MAHINDRA', 'Model-151', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-01', NULL, '2025-12-01 07:01:00', '', 1, 0),
(508, 'BK152ARF', '1', NULL, 'HYUNDAI', 'Model-152', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02', NULL, '2025-12-01 07:02:00', '', 0, 0),
(509, 'BK153ARF', '1', NULL, 'FORD', 'Model-153', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-03', NULL, '2025-12-01 07:03:00', '', 1, 0),
(510, 'BK154ARF', '1', NULL, 'TATA', 'Model-154', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-04', NULL, '2025-12-01 07:04:00', '', 0, 0),
(511, 'BK155ARF', '1', NULL, 'MAHINDRA', 'Model-155', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-05', NULL, '2025-12-01 07:05:00', '', 1, 0),
(512, 'BK156ARF', '1', NULL, 'HYUNDAI', 'Model-156', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06', NULL, '2025-12-01 07:06:00', '', 0, 0),
(513, 'BK157ARF', '1', NULL, 'FORD', 'Model-157', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-07', NULL, '2025-12-01 07:07:00', '', 1, 0),
(514, 'BK158ARF', '1', NULL, 'TATA', 'Model-158', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08', NULL, '2025-12-01 07:08:00', '', 0, 0),
(515, 'BK159ARF', '1', NULL, 'MAHINDRA', 'Model-159', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-09', NULL, '2025-12-01 07:09:00', '', 1, 0),
(516, 'BK160ARF', '1', NULL, 'HYUNDAI', 'Model-160', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10', NULL, '2025-12-01 07:10:00', '', 0, 0),
(517, 'BK161ARF', '1', NULL, 'FORD', 'Model-161', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-11', NULL, '2025-12-01 07:11:00', '', 1, 0),
(518, 'BK162ARF', '1', NULL, 'TATA', 'Model-162', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-12', NULL, '2025-12-01 07:12:00', '', 0, 0),
(519, 'BK163ARF', '1', NULL, 'MAHINDRA', 'Model-163', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-13', NULL, '2025-12-01 07:13:00', '', 1, 0),
(520, 'BK164ARF', '1', NULL, 'HYUNDAI', 'Model-164', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14', NULL, '2025-12-01 07:14:00', '', 0, 0),
(521, 'BK165ARF', '1', NULL, 'FORD', 'Model-165', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15', NULL, '2025-12-01 07:15:00', '', 1, 0),
(522, 'BK166ARF', '1', NULL, 'TATA', 'Model-166', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16', NULL, '2025-12-01 07:16:00', '', 0, 0),
(523, 'BK167ARF', '1', NULL, 'MAHINDRA', 'Model-167', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, '2025-12-01 07:17:00', '', 1, 0),
(524, 'BK168ARF', '1', NULL, 'HYUNDAI', 'Model-168', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18', NULL, '2025-12-01 07:18:00', '', 0, 0),
(525, 'BK169ARF', '1', NULL, 'FORD', 'Model-169', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-19', NULL, '2025-12-01 07:19:00', '', 1, 0),
(526, 'BK170ARF', '1', NULL, 'TATA', 'Model-170', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-20', NULL, '2025-12-01 07:20:00', '', 0, 0),
(527, 'BK171ARF', '1', NULL, 'MAHINDRA', 'Model-171', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-21', NULL, '2025-12-01 07:21:00', '', 1, 0),
(528, 'BK172ARF', '1', NULL, 'HYUNDAI', 'Model-172', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22', NULL, '2025-12-01 07:22:00', '', 0, 0),
(529, 'BK173ARF', '1', NULL, 'FORD', 'Model-173', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23', NULL, '2025-12-01 07:23:00', '', 1, 0),
(530, 'BK174ARF', '1', NULL, 'TATA', 'Model-174', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24', NULL, '2025-12-01 07:24:00', '', 0, 0),
(531, 'BK175ARF', '1', NULL, 'MAHINDRA', 'Model-175', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25', NULL, '2025-12-01 07:25:00', '', 1, 0),
(532, 'BK176ARF', '1', NULL, 'HYUNDAI', 'Model-176', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-26', NULL, '2025-12-01 07:26:00', '', 0, 0),
(533, 'BK177ARF', '1', NULL, 'FORD', 'Model-177', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-27', NULL, '2025-12-01 07:27:00', '', 1, 0),
(534, 'BK178ARF', '1', NULL, 'TATA', 'Model-178', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-28', NULL, '2025-12-01 07:28:00', '', 0, 0),
(535, 'BK179ARF', '1', NULL, 'MAHINDRA', 'Model-179', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29', NULL, '2025-12-01 07:29:00', '', 1, 0),
(536, 'BK180ARF', '1', NULL, 'HYUNDAI', 'Model-180', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-30', NULL, '2025-12-01 07:30:00', '', 0, 0),
(537, 'BK181ARF', '1', NULL, 'FORD', 'Model-181', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01', NULL, '2025-12-01 07:31:00', '', 1, 0),
(538, 'BK182ARF', '1', NULL, 'TATA', 'Model-182', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02', NULL, '2025-12-01 07:32:00', '', 0, 0),
(539, 'BK183ARF', '1', NULL, 'MAHINDRA', 'Model-183', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-03', NULL, '2025-12-01 07:33:00', '', 1, 0),
(540, 'BK184ARF', '1', NULL, 'HYUNDAI', 'Model-184', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-04', NULL, '2025-12-01 07:34:00', '', 0, 0),
(541, 'BK185ARF', '1', NULL, 'FORD', 'Model-185', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-05', NULL, '2025-12-01 07:35:00', '', 1, 0),
(542, 'BK186ARF', '1', NULL, 'TATA', 'Model-186', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06', NULL, '2025-12-01 07:36:00', '', 0, 0),
(543, 'BK187ARF', '1', NULL, 'MAHINDRA', 'Model-187', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07', NULL, '2025-12-01 07:37:00', '', 1, 0),
(544, 'BK188ARF', '1', NULL, 'HYUNDAI', 'Model-188', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-08', NULL, '2025-12-01 07:38:00', '', 0, 0),
(545, 'BK189ARF', '1', NULL, 'FORD', 'Model-189', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-09', NULL, '2025-12-01 07:39:00', '', 1, 0),
(546, 'BK190ARF', '1', NULL, 'TATA', 'Model-190', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10', NULL, '2025-12-01 07:40:00', '', 0, 0),
(547, 'BK191ARF', '1', NULL, 'MAHINDRA', 'Model-191', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-11', NULL, '2025-12-01 07:41:00', '', 1, 0),
(548, 'BK192ARF', '1', NULL, 'HYUNDAI', 'Model-192', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12', NULL, '2025-12-01 07:42:00', '', 0, 0),
(549, 'BK193ARF', '1', NULL, 'FORD', 'Model-193', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', NULL, '2025-12-01 07:43:00', '', 1, 0),
(550, 'BK194ARF', '1', NULL, 'TATA', 'Model-194', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', NULL, '2025-12-01 07:44:00', '', 0, 0),
(551, 'BK195ARF', '1', NULL, 'MAHINDRA', 'Model-195', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15', NULL, '2025-12-01 07:45:00', '', 1, 0),
(552, 'BK196ARF', '1', NULL, 'HYUNDAI', 'Model-196', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-16', NULL, '2025-12-01 07:46:00', '', 0, 0),
(553, 'BK197ARF', '1', NULL, 'FORD', 'Model-197', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-17', NULL, '2025-12-01 07:47:00', '', 1, 0),
(554, 'BK198ARF', '1', NULL, 'TATA', 'Model-198', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-18', NULL, '2025-12-01 07:48:00', '', 0, 0),
(555, 'BK199ARF', '1', NULL, 'MAHINDRA', 'Model-199', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-19', NULL, '2025-12-01 07:49:00', '', 1, 0),
(556, 'BK200ARF', '1', NULL, 'HYUNDAI', 'Model-200', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-20', NULL, '2025-12-01 07:50:00', '', 0, 0),
(557, 'BK201ARF', '1', NULL, 'FORD', 'Model-201', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-21', NULL, '2025-12-01 07:51:00', '', 1, 0),
(558, 'BK202ARF', '1', NULL, 'TATA', 'Model-202', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-22', NULL, '2025-12-01 07:52:00', '', 0, 0),
(559, 'BK203ARF', '1', NULL, 'MAHINDRA', 'Model-203', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-23', NULL, '2025-12-01 07:53:00', '', 1, 0),
(560, 'BK204ARF', '1', NULL, 'HYUNDAI', 'Model-204', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-24', NULL, '2025-12-01 07:54:00', '', 0, 0),
(561, 'BK205ARF', '1', NULL, 'FORD', 'Model-205', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-25', NULL, '2025-12-01 07:55:00', '', 1, 0),
(562, 'BK206ARF', '1', NULL, 'TATA', 'Model-206', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-26', NULL, '2025-12-01 07:56:00', '', 0, 0),
(563, 'BK207ARF', '1', NULL, 'MAHINDRA', 'Model-207', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27', NULL, '2025-12-01 07:57:00', '', 1, 0),
(564, 'BK208ARF', '1', NULL, 'HYUNDAI', 'Model-208', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-28', NULL, '2025-12-01 07:58:00', '', 0, 0),
(565, 'BK209ARF', '1', NULL, 'FORD', 'Model-209', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29', NULL, '2025-12-01 07:59:00', '', 1, 0),
(566, 'BK210ARF', '1', NULL, 'TATA', 'Model-210', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-30', NULL, '2025-12-01 08:00:00', '', 0, 0),
(567, 'BK211ARF', '1', NULL, 'MAHINDRA', 'Model-211', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-31', NULL, '2025-12-01 08:01:00', '', 1, 0),
(568, 'BK212ARF', '1', NULL, 'HYUNDAI', 'Model-212', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-01', NULL, '2025-12-01 08:02:00', '', 0, 0),
(569, 'BK213ARF', '1', NULL, 'FORD', 'Model-213', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-02', NULL, '2025-12-01 08:03:00', '', 1, 0),
(570, 'BK214ARF', '1', NULL, 'TATA', 'Model-214', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-03', NULL, '2025-12-01 08:04:00', '', 0, 0),
(571, 'BK215ARF', '1', NULL, 'MAHINDRA', 'Model-215', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-04', NULL, '2025-12-01 08:05:00', '', 1, 0),
(572, 'BK216ARF', '1', NULL, 'HYUNDAI', 'Model-216', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-05', NULL, '2025-12-01 08:06:00', '', 0, 0),
(573, 'BK217ARF', '1', NULL, 'FORD', 'Model-217', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-06', NULL, '2025-12-01 08:07:00', '', 1, 0),
(574, 'BK218ARF', '1', NULL, 'TATA', 'Model-218', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-07', NULL, '2025-12-01 08:08:00', '', 0, 0),
(575, 'BK219ARF', '1', NULL, 'MAHINDRA', 'Model-219', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-08', NULL, '2025-12-01 08:09:00', '', 1, 0),
(576, 'BK220ARF', '1', NULL, 'HYUNDAI', 'Model-220', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-09', NULL, '2025-12-01 08:10:00', '', 0, 0),
(577, 'BK221ARF', '1', NULL, 'FORD', 'Model-221', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-10', NULL, '2025-12-01 08:11:00', '', 1, 0),
(578, 'BK222ARF', '1', NULL, 'TATA', 'Model-222', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11', NULL, '2025-12-01 08:12:00', '', 0, 0),
(579, 'BK223ARF', '1', NULL, 'MAHINDRA', 'Model-223', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-12', NULL, '2025-12-01 08:13:00', '', 1, 0),
(580, 'BK224ARF', '1', NULL, 'HYUNDAI', 'Model-224', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-13', NULL, '2025-12-01 08:14:00', '', 0, 0),
(581, 'BK225ARF', '1', NULL, 'FORD', 'Model-225', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-14', NULL, '2025-12-01 08:15:00', '', 1, 0),
(582, 'BK226ARF', '1', NULL, 'TATA', 'Model-226', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-15', NULL, '2025-12-01 08:16:00', '', 0, 0),
(583, 'BK227ARF', '1', NULL, 'MAHINDRA', 'Model-227', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, '2025-12-01 08:17:00', '', 1, 0),
(584, 'BK228ARF', '1', NULL, 'HYUNDAI', 'Model-228', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17', NULL, '2025-12-01 08:18:00', '', 0, 0),
(585, 'BK229ARF', '1', NULL, 'FORD', 'Model-229', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-18', NULL, '2025-12-01 08:19:00', '', 1, 0),
(586, 'BK230ARF', '1', NULL, 'TATA', 'Model-230', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19', NULL, '2025-12-01 08:20:00', '', 0, 0),
(587, 'BK231ARF', '1', NULL, 'MAHINDRA', 'Model-231', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20', NULL, '2025-12-01 08:21:00', '', 1, 0),
(588, 'BK232ARF', '1', NULL, 'HYUNDAI', 'Model-232', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-21', NULL, '2025-12-01 08:22:00', '', 0, 0),
(589, 'BK233ARF', '1', NULL, 'FORD', 'Model-233', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-22', NULL, '2025-12-01 08:23:00', '', 1, 0),
(590, 'BK234ARF', '1', NULL, 'TATA', 'Model-234', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-23', NULL, '2025-12-01 08:24:00', '', 0, 0),
(591, 'BK235ARF', '1', NULL, 'MAHINDRA', 'Model-235', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-24', NULL, '2025-12-01 08:25:00', '', 1, 0),
(592, 'BK236ARF', '1', NULL, 'HYUNDAI', 'Model-236', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-25', NULL, '2025-12-01 08:26:00', '', 0, 0),
(593, 'BK237ARF', '1', NULL, 'FORD', 'Model-237', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26', NULL, '2025-12-01 08:27:00', '', 1, 0),
(594, 'BK238ARF', '1', NULL, 'TATA', 'Model-238', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27', NULL, '2025-12-01 08:28:00', '', 0, 0),
(595, 'BK239ARF', '1', NULL, 'MAHINDRA', 'Model-239', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-28', NULL, '2025-12-01 08:29:00', '', 1, 0),
(596, 'BK240ARF', '1', NULL, 'HYUNDAI', 'Model-240', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-29', NULL, '2025-12-01 08:30:00', '', 0, 0),
(597, 'BK241ARF', '1', NULL, 'FORD', 'Model-241', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-30', NULL, '2025-12-01 08:31:00', '', 1, 0),
(612, 'BK001ARF', '1', NULL, 'FORD', 'Model-1', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-02', NULL, '2025-12-01 04:31:00', '', 1, 0),
(613, 'BK002ARF', '1', NULL, 'TATA', 'Model-2', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03', NULL, '2025-12-01 04:32:00', '', 0, 0),
(614, 'BK003ARF', '1', NULL, 'MAHINDRA', 'Model-3', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-04', NULL, '2025-12-01 04:33:00', '', 1, 0);
INSERT INTO `vehicle_details_tbl` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`, `is_deleted`) VALUES
(615, 'BK004ARF', '1', NULL, 'HYUNDAI', 'Model-4', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05', NULL, '2025-12-01 04:34:00', '', 0, 0),
(616, 'BK005ARF', '1', NULL, 'FORD', 'Model-5', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-06', NULL, '2025-12-01 04:35:00', '', 1, 0),
(617, 'BK006ARF', '1', NULL, 'TATA', 'Model-6', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-07', NULL, '2025-12-01 04:36:00', '', 0, 0),
(618, 'BK007ARF', '1', NULL, 'MAHINDRA', 'Model-7', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-08', NULL, '2025-12-01 04:37:00', '', 1, 0),
(619, 'BK008ARF', '1', NULL, 'HYUNDAI', 'Model-8', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-09', NULL, '2025-12-01 04:38:00', '', 0, 0),
(620, 'BK009ARF', '1', NULL, 'FORD', 'Model-9', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-10', NULL, '2025-12-01 04:39:00', '', 1, 0),
(621, 'BK010ARF', '1', NULL, 'TATA', 'Model-10', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-11', NULL, '2025-12-01 04:40:00', '', 0, 0),
(622, 'BK011ARF', '1', NULL, 'MAHINDRA', 'Model-11', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12', NULL, '2025-12-01 04:41:00', '', 1, 0),
(623, 'BK012ARF', '1', NULL, 'HYUNDAI', 'Model-12', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-13', NULL, '2025-12-01 04:42:00', '', 0, 0),
(624, 'BK013ARF', '1', NULL, 'FORD', 'Model-13', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-14', NULL, '2025-12-01 04:43:00', '', 1, 0),
(625, 'BK014ARF', '1', NULL, 'TATA', 'Model-14', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-15', NULL, '2025-12-01 04:44:00', '', 0, 0),
(626, 'BK015ARF', '1', NULL, 'MAHINDRA', 'Model-15', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-16', NULL, '2025-12-01 04:45:00', '', 1, 0),
(627, 'BK016ARF', '1', NULL, 'HYUNDAI', 'Model-16', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17', NULL, '2025-12-01 04:46:00', '', 0, 0),
(628, 'BK017ARF', '1', NULL, 'FORD', 'Model-17', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-18', NULL, '2025-12-01 04:47:00', '', 1, 0),
(629, 'BK018ARF', '1', NULL, 'TATA', 'Model-18', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-19', NULL, '2025-12-01 04:48:00', '', 0, 0),
(630, 'BK019ARF', '1', NULL, 'MAHINDRA', 'Model-19', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-20', NULL, '2025-12-01 04:49:00', '', 1, 0),
(631, 'BK020ARF', '1', NULL, 'HYUNDAI', 'Model-20', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21', NULL, '2025-12-01 04:50:00', '', 0, 0),
(632, 'BK021ARF', '1', NULL, 'FORD', 'Model-21', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22', NULL, '2025-12-01 04:51:00', '', 1, 0),
(633, 'BK022ARF', '1', NULL, 'TATA', 'Model-22', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-23', NULL, '2025-12-01 04:52:00', '', 0, 0),
(634, 'BK023ARF', '1', NULL, 'MAHINDRA', 'Model-23', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24', NULL, '2025-12-01 04:53:00', '', 1, 0),
(635, 'BK024ARF', '1', NULL, 'HYUNDAI', 'Model-24', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-25', NULL, '2025-12-01 04:54:00', '', 0, 0),
(636, 'BK025ARF', '1', NULL, 'FORD', 'Model-25', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26', NULL, '2025-12-01 04:55:00', '', 1, 0),
(637, 'BK026ARF', '1', NULL, 'TATA', 'Model-26', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27', NULL, '2025-12-01 04:56:00', '', 0, 0),
(638, 'BK027ARF', '1', NULL, 'MAHINDRA', 'Model-27', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28', NULL, '2025-12-01 04:57:00', '', 1, 0),
(639, 'BK028ARF', '1', NULL, 'HYUNDAI', 'Model-28', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29', NULL, '2025-12-01 04:58:00', '', 0, 0),
(640, 'BK029ARF', '1', NULL, 'FORD', 'Model-29', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30', NULL, '2025-12-01 04:59:00', '', 1, 0),
(641, 'BK030ARF', '1', NULL, 'TATA', 'Model-30', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-31', NULL, '2025-12-01 05:00:00', '', 0, 0),
(642, 'BK031ARF', '1', NULL, 'MAHINDRA', 'Model-31', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01', NULL, '2025-12-01 05:01:00', '', 1, 0),
(643, 'BK032ARF', '1', NULL, 'HYUNDAI', 'Model-32', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02', NULL, '2025-12-01 05:02:00', '', 0, 0),
(644, 'BK033ARF', '1', NULL, 'FORD', 'Model-33', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-03', NULL, '2025-12-01 05:03:00', '', 1, 0),
(645, 'BK034ARF', '1', NULL, 'TATA', 'Model-34', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-04', NULL, '2025-12-01 05:04:00', '', 0, 0),
(646, 'BK035ARF', '1', NULL, 'MAHINDRA', 'Model-35', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-05', NULL, '2025-12-01 05:05:00', '', 1, 0),
(647, 'BK036ARF', '1', NULL, 'HYUNDAI', 'Model-36', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-06', NULL, '2025-12-01 05:06:00', '', 0, 0),
(648, 'BK037ARF', '1', NULL, 'FORD', 'Model-37', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-07', NULL, '2025-12-01 05:07:00', '', 1, 0),
(649, 'BK038ARF', '1', NULL, 'TATA', 'Model-38', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-08', NULL, '2025-12-01 05:08:00', '', 0, 0),
(650, 'BK039ARF', '1', NULL, 'MAHINDRA', 'Model-39', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09', NULL, '2025-12-01 05:09:00', '', 1, 0),
(651, 'BK040ARF', '1', NULL, 'HYUNDAI', 'Model-40', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-10', NULL, '2025-12-01 05:10:00', '', 0, 0),
(652, 'BK041ARF', '1', NULL, 'FORD', 'Model-41', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11', NULL, '2025-12-01 05:11:00', '', 1, 0),
(653, 'BK042ARF', '1', NULL, 'TATA', 'Model-42', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-12', NULL, '2025-12-01 05:12:00', '', 0, 0),
(654, 'BK043ARF', '1', NULL, 'MAHINDRA', 'Model-43', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13', NULL, '2025-12-01 05:13:00', '', 1, 0),
(655, 'BK044ARF', '1', NULL, 'HYUNDAI', 'Model-44', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-14', NULL, '2025-12-01 05:14:00', '', 0, 0),
(656, 'BK045ARF', '1', NULL, 'FORD', 'Model-45', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-15', NULL, '2025-12-01 05:15:00', '', 1, 0),
(657, 'BK046ARF', '1', NULL, 'TATA', 'Model-46', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16', NULL, '2025-12-01 05:16:00', '', 0, 0),
(658, 'BK047ARF', '1', NULL, 'MAHINDRA', 'Model-47', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17', NULL, '2025-12-01 05:17:00', '', 1, 0),
(659, 'BK048ARF', '1', NULL, 'HYUNDAI', 'Model-48', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18', NULL, '2025-12-01 05:18:00', '', 0, 0),
(660, 'BK049ARF', '1', NULL, 'FORD', 'Model-49', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-19', NULL, '2025-12-01 05:19:00', '', 1, 0),
(661, 'BK050ARF', '1', NULL, 'TATA', 'Model-50', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-20', NULL, '2025-12-01 05:20:00', '', 0, 0),
(662, 'BK051ARF', '1', NULL, 'MAHINDRA', 'Model-51', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', NULL, '2025-12-01 05:21:00', '', 1, 0),
(663, 'BK052ARF', '1', NULL, 'HYUNDAI', 'Model-52', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-22', NULL, '2025-12-01 05:22:00', '', 0, 0),
(664, 'BK053ARF', '1', NULL, 'FORD', 'Model-53', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-23', NULL, '2025-12-01 05:23:00', '', 1, 0),
(665, 'BK054ARF', '1', NULL, 'TATA', 'Model-54', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24', NULL, '2025-12-01 05:24:00', '', 0, 0),
(666, 'BK055ARF', '1', NULL, 'MAHINDRA', 'Model-55', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25', NULL, '2025-12-01 05:25:00', '', 1, 0),
(667, 'BK056ARF', '1', NULL, 'HYUNDAI', 'Model-56', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-26', NULL, '2025-12-01 05:26:00', '', 0, 0),
(668, 'BK057ARF', '1', NULL, 'FORD', 'Model-57', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-27', NULL, '2025-12-01 05:27:00', '', 1, 0),
(669, 'BK058ARF', '1', NULL, 'TATA', 'Model-58', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-28', NULL, '2025-12-01 05:28:00', '', 0, 0),
(670, 'BK059ARF', '1', NULL, 'MAHINDRA', 'Model-59', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-01', NULL, '2025-12-01 05:29:00', '', 1, 0),
(671, 'BK060ARF', '1', NULL, 'HYUNDAI', 'Model-60', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-02', NULL, '2025-12-01 05:30:00', '', 0, 0),
(672, 'BK061ARF', '1', NULL, 'FORD', 'Model-61', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-03', NULL, '2025-12-01 05:31:00', '', 1, 0),
(673, 'BK062ARF', '1', NULL, 'TATA', 'Model-62', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-04', NULL, '2025-12-01 05:32:00', '', 0, 0),
(674, 'BK063ARF', '1', NULL, 'MAHINDRA', 'Model-63', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05', NULL, '2025-12-01 05:33:00', '', 1, 0),
(675, 'BK064ARF', '1', NULL, 'HYUNDAI', 'Model-64', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-06', NULL, '2025-12-01 05:34:00', '', 0, 0),
(676, 'BK065ARF', '1', NULL, 'FORD', 'Model-65', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07', NULL, '2025-12-01 05:35:00', '', 1, 0),
(677, 'BK066ARF', '1', NULL, 'TATA', 'Model-66', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-08', NULL, '2025-12-01 05:36:00', '', 0, 0),
(678, 'BK067ARF', '1', NULL, 'MAHINDRA', 'Model-67', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09', NULL, '2025-12-01 05:37:00', '', 1, 0),
(679, 'BK068ARF', '1', NULL, 'HYUNDAI', 'Model-68', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10', NULL, '2025-12-01 05:38:00', '', 0, 0),
(680, 'BK069ARF', '1', NULL, 'FORD', 'Model-69', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-11', NULL, '2025-12-01 05:39:00', '', 1, 0),
(681, 'BK070ARF', '1', NULL, 'TATA', 'Model-70', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12', NULL, '2025-12-01 05:40:00', '', 0, 0),
(682, 'BK071ARF', '1', NULL, 'MAHINDRA', 'Model-71', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-13', NULL, '2025-12-01 05:41:00', '', 1, 0),
(683, 'BK072ARF', '1', NULL, 'HYUNDAI', 'Model-72', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14', NULL, '2025-12-01 05:42:00', '', 0, 0),
(684, 'BK073ARF', '1', NULL, 'FORD', 'Model-73', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15', NULL, '2025-12-01 05:43:00', '', 1, 0),
(685, 'BK074ARF', '1', NULL, 'TATA', 'Model-74', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-16', NULL, '2025-12-01 05:44:00', '', 0, 0),
(686, 'BK075ARF', '1', NULL, 'MAHINDRA', 'Model-75', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17', NULL, '2025-12-01 05:45:00', '', 1, 0),
(687, 'BK076ARF', '1', NULL, 'HYUNDAI', 'Model-76', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18', NULL, '2025-12-01 05:46:00', '', 0, 0),
(688, 'BK077ARF', '1', NULL, 'FORD', 'Model-77', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19', NULL, '2025-12-01 05:47:00', '', 1, 0),
(689, 'BK078ARF', '1', NULL, 'TATA', 'Model-78', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-20', NULL, '2025-12-01 05:48:00', '', 0, 0),
(690, 'BK079ARF', '1', NULL, 'MAHINDRA', 'Model-79', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-21', NULL, '2025-12-01 05:49:00', '', 1, 0),
(691, 'BK080ARF', '1', NULL, 'HYUNDAI', 'Model-80', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22', NULL, '2025-12-01 05:50:00', '', 0, 0),
(692, 'BK081ARF', '1', NULL, 'FORD', 'Model-81', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-23', NULL, '2025-12-01 05:51:00', '', 1, 0),
(693, 'BK082ARF', '1', NULL, 'TATA', 'Model-82', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24', NULL, '2025-12-01 05:52:00', '', 0, 0),
(694, 'BK083ARF', '1', NULL, 'MAHINDRA', 'Model-83', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-25', NULL, '2025-12-01 05:53:00', '', 1, 0),
(695, 'BK084ARF', '1', NULL, 'HYUNDAI', 'Model-84', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-26', NULL, '2025-12-01 05:54:00', '', 0, 0),
(696, 'BK085ARF', '1', NULL, 'FORD', 'Model-85', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27', NULL, '2025-12-01 05:55:00', '', 1, 0),
(697, 'BK086ARF', '1', NULL, 'TATA', 'Model-86', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-28', NULL, '2025-12-01 05:56:00', '', 0, 0),
(698, 'BK087ARF', '1', NULL, 'MAHINDRA', 'Model-87', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29', NULL, '2025-12-01 05:57:00', '', 1, 0),
(699, 'BK088ARF', '1', NULL, 'HYUNDAI', 'Model-88', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30', NULL, '2025-12-01 05:58:00', '', 0, 0),
(700, 'BK089ARF', '1', NULL, 'FORD', 'Model-89', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31', NULL, '2025-12-01 05:59:00', '', 1, 0),
(701, 'BK090ARF', '1', NULL, 'TATA', 'Model-90', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, '2025-12-01 06:00:00', '', 0, 0),
(702, 'BK091ARF', '1', NULL, 'MAHINDRA', 'Model-91', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-02', NULL, '2025-12-01 06:01:00', '', 1, 0),
(703, 'BK092ARF', '1', NULL, 'HYUNDAI', 'Model-92', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-03', NULL, '2025-12-01 06:02:00', '', 0, 0),
(704, 'BK093ARF', '1', NULL, 'FORD', 'Model-93', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-04', NULL, '2025-12-01 06:03:00', '', 1, 0),
(705, 'BK094ARF', '1', NULL, 'TATA', 'Model-94', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-05', NULL, '2025-12-01 06:04:00', '', 0, 0),
(706, 'BK095ARF', '1', NULL, 'MAHINDRA', 'Model-95', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-06', NULL, '2025-12-01 06:05:00', '', 1, 0),
(707, 'BK096ARF', '1', NULL, 'HYUNDAI', 'Model-96', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-07', NULL, '2025-12-01 06:06:00', '', 0, 0),
(708, 'BK097ARF', '1', NULL, 'FORD', 'Model-97', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-08', NULL, '2025-12-01 06:07:00', '', 1, 0),
(709, 'BK098ARF', '1', NULL, 'TATA', 'Model-98', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-09', NULL, '2025-12-01 06:08:00', '', 0, 0),
(710, 'BK099ARF', '1', NULL, 'MAHINDRA', 'Model-99', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-10', NULL, '2025-12-01 06:09:00', '', 1, 0),
(711, 'BK100ARF', '1', NULL, 'HYUNDAI', 'Model-100', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11', NULL, '2025-12-01 06:10:00', '', 0, 0),
(712, 'BK101ARF', '1', NULL, 'FORD', 'Model-101', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12', NULL, '2025-12-01 06:11:00', '', 1, 0),
(713, 'BK102ARF', '1', NULL, 'TATA', 'Model-102', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-13', NULL, '2025-12-01 06:12:00', '', 0, 0),
(714, 'BK103ARF', '1', NULL, 'MAHINDRA', 'Model-103', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14', NULL, '2025-12-01 06:13:00', '', 1, 0),
(715, 'BK104ARF', '1', NULL, 'HYUNDAI', 'Model-104', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-15', NULL, '2025-12-01 06:14:00', '', 0, 0),
(716, 'BK105ARF', '1', NULL, 'FORD', 'Model-105', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-16', NULL, '2025-12-01 06:15:00', '', 1, 0),
(717, 'BK106ARF', '1', NULL, 'TATA', 'Model-106', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-17', NULL, '2025-12-01 06:16:00', '', 0, 0),
(718, 'BK107ARF', '1', NULL, 'MAHINDRA', 'Model-107', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-18', NULL, '2025-12-01 06:17:00', '', 1, 0),
(719, 'BK108ARF', '1', NULL, 'HYUNDAI', 'Model-108', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-19', NULL, '2025-12-01 06:18:00', '', 0, 0),
(720, 'BK109ARF', '1', NULL, 'FORD', 'Model-109', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20', NULL, '2025-12-01 06:19:00', '', 1, 0),
(721, 'BK110ARF', '1', NULL, 'TATA', 'Model-110', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21', NULL, '2025-12-01 06:20:00', '', 0, 0),
(722, 'BK111ARF', '1', NULL, 'MAHINDRA', 'Model-111', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22', NULL, '2025-12-01 06:21:00', '', 1, 0),
(723, 'BK112ARF', '1', NULL, 'HYUNDAI', 'Model-112', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-23', NULL, '2025-12-01 06:22:00', '', 0, 0),
(724, 'BK113ARF', '1', NULL, 'FORD', 'Model-113', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-24', NULL, '2025-12-01 06:23:00', '', 1, 0),
(725, 'BK114ARF', '1', NULL, 'TATA', 'Model-114', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-25', NULL, '2025-12-01 06:24:00', '', 0, 0),
(726, 'BK115ARF', '1', NULL, 'MAHINDRA', 'Model-115', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-26', NULL, '2025-12-01 06:25:00', '', 1, 0),
(727, 'BK116ARF', '1', NULL, 'HYUNDAI', 'Model-116', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-27', NULL, '2025-12-01 06:26:00', '', 0, 0),
(728, 'BK117ARF', '1', NULL, 'FORD', 'Model-117', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-28', NULL, '2025-12-01 06:27:00', '', 1, 0),
(729, 'BK118ARF', '1', NULL, 'TATA', 'Model-118', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29', NULL, '2025-12-01 06:28:00', '', 0, 0),
(730, 'BK119ARF', '1', NULL, 'MAHINDRA', 'Model-119', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30', NULL, '2025-12-01 06:29:00', '', 1, 0),
(731, 'BK120ARF', '1', NULL, 'HYUNDAI', 'Model-120', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-01', NULL, '2025-12-01 06:30:00', '', 0, 0),
(732, 'BK121ARF', '1', NULL, 'FORD', 'Model-121', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-02', NULL, '2025-12-01 06:31:00', '', 1, 0),
(733, 'BK122ARF', '1', NULL, 'TATA', 'Model-122', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-03', NULL, '2025-12-01 06:32:00', '', 0, 0),
(734, 'BK123ARF', '1', NULL, 'MAHINDRA', 'Model-123', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04', NULL, '2025-12-01 06:33:00', '', 1, 0),
(735, 'BK124ARF', '1', NULL, 'HYUNDAI', 'Model-124', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05', NULL, '2025-12-01 06:34:00', '', 0, 0),
(736, 'BK125ARF', '1', NULL, 'FORD', 'Model-125', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06', NULL, '2025-12-01 06:35:00', '', 1, 0),
(737, 'BK126ARF', '1', NULL, 'TATA', 'Model-126', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-07', NULL, '2025-12-01 06:36:00', '', 0, 0),
(738, 'BK127ARF', '1', NULL, 'MAHINDRA', 'Model-127', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-08', NULL, '2025-12-01 06:37:00', '', 1, 0),
(739, 'BK128ARF', '1', NULL, 'HYUNDAI', 'Model-128', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-09', NULL, '2025-12-01 06:38:00', '', 0, 0),
(740, 'BK129ARF', '1', NULL, 'FORD', 'Model-129', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10', NULL, '2025-12-01 06:39:00', '', 1, 0),
(741, 'BK130ARF', '1', NULL, 'TATA', 'Model-130', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-11', NULL, '2025-12-01 06:40:00', '', 0, 0),
(742, 'BK131ARF', '1', NULL, 'MAHINDRA', 'Model-131', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-12', NULL, '2025-12-01 06:41:00', '', 1, 0),
(743, 'BK132ARF', '1', NULL, 'HYUNDAI', 'Model-132', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-13', NULL, '2025-12-01 06:42:00', '', 0, 0),
(744, 'BK133ARF', '1', NULL, 'FORD', 'Model-133', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-14', NULL, '2025-12-01 06:43:00', '', 1, 0),
(745, 'BK134ARF', '1', NULL, 'TATA', 'Model-134', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15', NULL, '2025-12-01 06:44:00', '', 0, 0),
(746, 'BK135ARF', '1', NULL, 'MAHINDRA', 'Model-135', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-16', NULL, '2025-12-01 06:45:00', '', 1, 0),
(747, 'BK136ARF', '1', NULL, 'HYUNDAI', 'Model-136', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17', NULL, '2025-12-01 06:46:00', '', 0, 0),
(748, 'BK137ARF', '1', NULL, 'FORD', 'Model-137', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-18', NULL, '2025-12-01 06:47:00', '', 1, 0),
(749, 'BK138ARF', '1', NULL, 'TATA', 'Model-138', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-19', NULL, '2025-12-01 06:48:00', '', 0, 0),
(750, 'BK139ARF', '1', NULL, 'MAHINDRA', 'Model-139', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-20', NULL, '2025-12-01 06:49:00', '', 1, 0),
(751, 'BK140ARF', '1', NULL, 'HYUNDAI', 'Model-140', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-21', NULL, '2025-12-01 06:50:00', '', 0, 0),
(752, 'BK141ARF', '1', NULL, 'FORD', 'Model-141', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-22', NULL, '2025-12-01 06:51:00', '', 1, 0),
(753, 'BK142ARF', '1', NULL, 'TATA', 'Model-142', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-23', NULL, '2025-12-01 06:52:00', '', 0, 0),
(754, 'BK143ARF', '1', NULL, 'MAHINDRA', 'Model-143', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-24', NULL, '2025-12-01 06:53:00', '', 1, 0),
(755, 'BK144ARF', '1', NULL, 'HYUNDAI', 'Model-144', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-25', NULL, '2025-12-01 06:54:00', '', 0, 0),
(756, 'BK145ARF', '1', NULL, 'FORD', 'Model-145', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-26', NULL, '2025-12-01 06:55:00', '', 1, 0),
(757, 'BK146ARF', '1', NULL, 'TATA', 'Model-146', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27', NULL, '2025-12-01 06:56:00', '', 0, 0),
(758, 'BK147ARF', '1', NULL, 'MAHINDRA', 'Model-147', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-28', NULL, '2025-12-01 06:57:00', '', 1, 0),
(759, 'BK148ARF', '1', NULL, 'HYUNDAI', 'Model-148', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29', NULL, '2025-12-01 06:58:00', '', 0, 0),
(760, 'BK149ARF', '1', NULL, 'FORD', 'Model-149', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-30', NULL, '2025-12-01 06:59:00', '', 1, 0),
(761, 'BK150ARF', '1', NULL, 'TATA', 'Model-150', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-31', NULL, '2025-12-01 07:00:00', '', 0, 0),
(762, 'BK151ARF', '1', NULL, 'MAHINDRA', 'Model-151', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-01', NULL, '2025-12-01 07:01:00', '', 1, 0),
(763, 'BK152ARF', '1', NULL, 'HYUNDAI', 'Model-152', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02', NULL, '2025-12-01 07:02:00', '', 0, 0),
(764, 'BK153ARF', '1', NULL, 'FORD', 'Model-153', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-03', NULL, '2025-12-01 07:03:00', '', 1, 0),
(765, 'BK154ARF', '1', NULL, 'TATA', 'Model-154', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-04', NULL, '2025-12-01 07:04:00', '', 0, 0),
(766, 'BK155ARF', '1', NULL, 'MAHINDRA', 'Model-155', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-05', NULL, '2025-12-01 07:05:00', '', 1, 0),
(767, 'BK156ARF', '1', NULL, 'HYUNDAI', 'Model-156', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06', NULL, '2025-12-01 07:06:00', '', 0, 0),
(768, 'BK157ARF', '1', NULL, 'FORD', 'Model-157', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-07', NULL, '2025-12-01 07:07:00', '', 1, 0),
(769, 'BK158ARF', '1', NULL, 'TATA', 'Model-158', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08', NULL, '2025-12-01 07:08:00', '', 0, 0),
(770, 'BK159ARF', '1', NULL, 'MAHINDRA', 'Model-159', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-09', NULL, '2025-12-01 07:09:00', '', 1, 0),
(771, 'BK160ARF', '1', NULL, 'HYUNDAI', 'Model-160', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10', NULL, '2025-12-01 07:10:00', '', 0, 0),
(772, 'BK161ARF', '1', NULL, 'FORD', 'Model-161', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-11', NULL, '2025-12-01 07:11:00', '', 1, 0),
(773, 'BK162ARF', '1', NULL, 'TATA', 'Model-162', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-12', NULL, '2025-12-01 07:12:00', '', 0, 0),
(774, 'BK163ARF', '1', NULL, 'MAHINDRA', 'Model-163', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-13', NULL, '2025-12-01 07:13:00', '', 1, 0),
(775, 'BK164ARF', '1', NULL, 'HYUNDAI', 'Model-164', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14', NULL, '2025-12-01 07:14:00', '', 0, 0),
(776, 'BK165ARF', '1', NULL, 'FORD', 'Model-165', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15', NULL, '2025-12-01 07:15:00', '', 1, 0),
(777, 'BK166ARF', '1', NULL, 'TATA', 'Model-166', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16', NULL, '2025-12-01 07:16:00', '', 0, 0),
(778, 'BK167ARF', '1', NULL, 'MAHINDRA', 'Model-167', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, '2025-12-01 07:17:00', '', 1, 0),
(779, 'BK168ARF', '1', NULL, 'HYUNDAI', 'Model-168', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18', NULL, '2025-12-01 07:18:00', '', 0, 0),
(780, 'BK169ARF', '1', NULL, 'FORD', 'Model-169', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-19', NULL, '2025-12-01 07:19:00', '', 1, 0),
(781, 'BK170ARF', '1', NULL, 'TATA', 'Model-170', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-20', NULL, '2025-12-01 07:20:00', '', 0, 0),
(782, 'BK171ARF', '1', NULL, 'MAHINDRA', 'Model-171', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-21', NULL, '2025-12-01 07:21:00', '', 1, 0),
(783, 'BK172ARF', '1', NULL, 'HYUNDAI', 'Model-172', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22', NULL, '2025-12-01 07:22:00', '', 0, 0),
(784, 'BK173ARF', '1', NULL, 'FORD', 'Model-173', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23', NULL, '2025-12-01 07:23:00', '', 1, 0),
(785, 'BK174ARF', '1', NULL, 'TATA', 'Model-174', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24', NULL, '2025-12-01 07:24:00', '', 0, 0),
(786, 'BK175ARF', '1', NULL, 'MAHINDRA', 'Model-175', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25', NULL, '2025-12-01 07:25:00', '', 1, 0),
(787, 'BK176ARF', '1', NULL, 'HYUNDAI', 'Model-176', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-26', NULL, '2025-12-01 07:26:00', '', 0, 0),
(788, 'BK177ARF', '1', NULL, 'FORD', 'Model-177', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-27', NULL, '2025-12-01 07:27:00', '', 1, 0),
(789, 'BK178ARF', '1', NULL, 'TATA', 'Model-178', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-28', NULL, '2025-12-01 07:28:00', '', 0, 0),
(790, 'BK179ARF', '1', NULL, 'MAHINDRA', 'Model-179', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29', NULL, '2025-12-01 07:29:00', '', 1, 0),
(791, 'BK180ARF', '1', NULL, 'HYUNDAI', 'Model-180', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-30', NULL, '2025-12-01 07:30:00', '', 0, 0),
(792, 'BK181ARF', '1', NULL, 'FORD', 'Model-181', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01', NULL, '2025-12-01 07:31:00', '', 1, 0),
(793, 'BK182ARF', '1', NULL, 'TATA', 'Model-182', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02', NULL, '2025-12-01 07:32:00', '', 0, 0),
(794, 'BK183ARF', '1', NULL, 'MAHINDRA', 'Model-183', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-03', NULL, '2025-12-01 07:33:00', '', 1, 0),
(795, 'BK184ARF', '1', NULL, 'HYUNDAI', 'Model-184', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-04', NULL, '2025-12-01 07:34:00', '', 0, 0),
(796, 'BK185ARF', '1', NULL, 'FORD', 'Model-185', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-05', NULL, '2025-12-01 07:35:00', '', 1, 0),
(797, 'BK186ARF', '1', NULL, 'TATA', 'Model-186', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06', NULL, '2025-12-01 07:36:00', '', 0, 0),
(798, 'BK187ARF', '1', NULL, 'MAHINDRA', 'Model-187', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07', NULL, '2025-12-01 07:37:00', '', 1, 0),
(799, 'BK188ARF', '1', NULL, 'HYUNDAI', 'Model-188', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-08', NULL, '2025-12-01 07:38:00', '', 0, 0),
(800, 'BK189ARF', '1', NULL, 'FORD', 'Model-189', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-09', NULL, '2025-12-01 07:39:00', '', 1, 0),
(801, 'BK190ARF', '1', NULL, 'TATA', 'Model-190', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10', NULL, '2025-12-01 07:40:00', '', 0, 0),
(802, 'BK191ARF', '1', NULL, 'MAHINDRA', 'Model-191', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-11', NULL, '2025-12-01 07:41:00', '', 1, 0),
(803, 'BK192ARF', '1', NULL, 'HYUNDAI', 'Model-192', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12', NULL, '2025-12-01 07:42:00', '', 0, 0),
(804, 'BK193ARF', '1', NULL, 'FORD', 'Model-193', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', NULL, '2025-12-01 07:43:00', '', 1, 0),
(805, 'BK194ARF', '1', NULL, 'TATA', 'Model-194', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', NULL, '2025-12-01 07:44:00', '', 0, 0),
(806, 'BK195ARF', '1', NULL, 'MAHINDRA', 'Model-195', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15', NULL, '2025-12-01 07:45:00', '', 1, 0),
(807, 'BK196ARF', '1', NULL, 'HYUNDAI', 'Model-196', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-16', NULL, '2025-12-01 07:46:00', '', 0, 0),
(808, 'BK197ARF', '1', NULL, 'FORD', 'Model-197', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-17', NULL, '2025-12-01 07:47:00', '', 1, 0),
(809, 'BK198ARF', '1', NULL, 'TATA', 'Model-198', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-18', NULL, '2025-12-01 07:48:00', '', 0, 0),
(810, 'BK199ARF', '1', NULL, 'MAHINDRA', 'Model-199', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-19', NULL, '2025-12-01 07:49:00', '', 1, 0),
(811, 'BK200ARF', '1', NULL, 'HYUNDAI', 'Model-200', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-20', NULL, '2025-12-01 07:50:00', '', 0, 0),
(812, 'BK201ARF', '1', NULL, 'FORD', 'Model-201', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-21', NULL, '2025-12-01 07:51:00', '', 1, 0),
(813, 'BK202ARF', '1', NULL, 'TATA', 'Model-202', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-22', NULL, '2025-12-01 07:52:00', '', 0, 0),
(814, 'BK203ARF', '1', NULL, 'MAHINDRA', 'Model-203', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-23', NULL, '2025-12-01 07:53:00', '', 1, 0),
(815, 'BK204ARF', '1', NULL, 'HYUNDAI', 'Model-204', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-24', NULL, '2025-12-01 07:54:00', '', 0, 0),
(816, 'BK205ARF', '1', NULL, 'FORD', 'Model-205', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-25', NULL, '2025-12-01 07:55:00', '', 1, 0),
(817, 'BK206ARF', '1', NULL, 'TATA', 'Model-206', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-26', NULL, '2025-12-01 07:56:00', '', 0, 0),
(818, 'BK207ARF', '1', NULL, 'MAHINDRA', 'Model-207', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27', NULL, '2025-12-01 07:57:00', '', 1, 0),
(819, 'BK208ARF', '1', NULL, 'HYUNDAI', 'Model-208', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-28', NULL, '2025-12-01 07:58:00', '', 0, 0),
(820, 'BK209ARF', '1', NULL, 'FORD', 'Model-209', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29', NULL, '2025-12-01 07:59:00', '', 1, 0),
(821, 'BK210ARF', '1', NULL, 'TATA', 'Model-210', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-30', NULL, '2025-12-01 08:00:00', '', 0, 0),
(822, 'BK211ARF', '1', NULL, 'MAHINDRA', 'Model-211', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-31', NULL, '2025-12-01 08:01:00', '', 1, 0),
(823, 'BK212ARF', '1', NULL, 'HYUNDAI', 'Model-212', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-01', NULL, '2025-12-01 08:02:00', '', 0, 0),
(824, 'BK213ARF', '1', NULL, 'FORD', 'Model-213', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-02', NULL, '2025-12-01 08:03:00', '', 1, 0),
(825, 'BK214ARF', '1', NULL, 'TATA', 'Model-214', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-03', NULL, '2025-12-01 08:04:00', '', 0, 0),
(826, 'BK215ARF', '1', NULL, 'MAHINDRA', 'Model-215', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-04', NULL, '2025-12-01 08:05:00', '', 1, 0),
(827, 'BK216ARF', '1', NULL, 'HYUNDAI', 'Model-216', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-05', NULL, '2025-12-01 08:06:00', '', 0, 0),
(828, 'BK217ARF', '1', NULL, 'FORD', 'Model-217', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-06', NULL, '2025-12-01 08:07:00', '', 1, 0),
(829, 'BK218ARF', '1', NULL, 'TATA', 'Model-218', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-07', NULL, '2025-12-01 08:08:00', '', 0, 0),
(830, 'BK219ARF', '1', NULL, 'MAHINDRA', 'Model-219', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-08', NULL, '2025-12-01 08:09:00', '', 1, 0),
(831, 'BK220ARF', '1', NULL, 'HYUNDAI', 'Model-220', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-09', NULL, '2025-12-01 08:10:00', '', 0, 0),
(832, 'BK221ARF', '1', NULL, 'FORD', 'Model-221', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-10', NULL, '2025-12-01 08:11:00', '', 1, 0),
(833, 'BK222ARF', '1', NULL, 'TATA', 'Model-222', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11', NULL, '2025-12-01 08:12:00', '', 0, 0),
(834, 'BK223ARF', '1', NULL, 'MAHINDRA', 'Model-223', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-12', NULL, '2025-12-01 08:13:00', '', 1, 0),
(835, 'BK224ARF', '1', NULL, 'HYUNDAI', 'Model-224', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-13', NULL, '2025-12-01 08:14:00', '', 0, 0),
(836, 'BK225ARF', '1', NULL, 'FORD', 'Model-225', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-14', NULL, '2025-12-01 08:15:00', '', 1, 0),
(837, 'BK226ARF', '1', NULL, 'TATA', 'Model-226', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-15', NULL, '2025-12-01 08:16:00', '', 0, 0),
(838, 'BK227ARF', '1', NULL, 'MAHINDRA', 'Model-227', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, '2025-12-01 08:17:00', '', 1, 0),
(839, 'BK228ARF', '1', NULL, 'HYUNDAI', 'Model-228', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17', NULL, '2025-12-01 08:18:00', '', 0, 0),
(840, 'BK229ARF', '1', NULL, 'FORD', 'Model-229', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-18', NULL, '2025-12-01 08:19:00', '', 1, 0),
(841, 'BK230ARF', '1', NULL, 'TATA', 'Model-230', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19', NULL, '2025-12-01 08:20:00', '', 0, 0),
(842, 'BK231ARF', '1', NULL, 'MAHINDRA', 'Model-231', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20', NULL, '2025-12-01 08:21:00', '', 1, 0),
(843, 'BK232ARF', '1', NULL, 'HYUNDAI', 'Model-232', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-21', NULL, '2025-12-01 08:22:00', '', 0, 0),
(844, 'BK233ARF', '1', NULL, 'FORD', 'Model-233', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-22', NULL, '2025-12-01 08:23:00', '', 1, 0),
(845, 'BK234ARF', '1', NULL, 'TATA', 'Model-234', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-23', NULL, '2025-12-01 08:24:00', '', 0, 0),
(846, 'BK235ARF', '1', NULL, 'MAHINDRA', 'Model-235', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-24', NULL, '2025-12-01 08:25:00', '', 1, 0),
(847, 'BK236ARF', '1', NULL, 'HYUNDAI', 'Model-236', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-25', NULL, '2025-12-01 08:26:00', '', 0, 0),
(848, 'BK237ARF', '1', NULL, 'FORD', 'Model-237', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26', NULL, '2025-12-01 08:27:00', '', 1, 0),
(849, 'BK238ARF', '1', NULL, 'TATA', 'Model-238', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27', NULL, '2025-12-01 08:28:00', '', 0, 0),
(850, 'BK239ARF', '1', NULL, 'MAHINDRA', 'Model-239', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-28', NULL, '2025-12-01 08:29:00', '', 1, 0),
(851, 'BK240ARF', '1', NULL, 'HYUNDAI', 'Model-240', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-29', NULL, '2025-12-01 08:30:00', '', 0, 0),
(852, 'BK241ARF', '1', NULL, 'FORD', 'Model-241', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-30', NULL, '2025-12-01 08:31:00', '', 1, 0),
(867, 'BK001ARF', '1', NULL, 'FORD', 'Model-1', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-02', NULL, '2025-12-01 04:31:00', '', 1, 0),
(868, 'BK002ARF', '1', NULL, 'TATA', 'Model-2', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03', NULL, '2025-12-01 04:32:00', '', 0, 0),
(869, 'BK003ARF', '1', NULL, 'MAHINDRA', 'Model-3', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-04', NULL, '2025-12-01 04:33:00', '', 1, 0),
(870, 'BK004ARF', '1', NULL, 'HYUNDAI', 'Model-4', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05', NULL, '2025-12-01 04:34:00', '', 0, 0),
(871, 'BK005ARF', '1', NULL, 'FORD', 'Model-5', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-06', NULL, '2025-12-01 04:35:00', '', 1, 0),
(872, 'BK006ARF', '1', NULL, 'TATA', 'Model-6', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-07', NULL, '2025-12-01 04:36:00', '', 0, 0),
(873, 'BK007ARF', '1', NULL, 'MAHINDRA', 'Model-7', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-08', NULL, '2025-12-01 04:37:00', '', 1, 0),
(874, 'BK008ARF', '1', NULL, 'HYUNDAI', 'Model-8', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-09', NULL, '2025-12-01 04:38:00', '', 0, 0),
(875, 'BK009ARF', '1', NULL, 'FORD', 'Model-9', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-10', NULL, '2025-12-01 04:39:00', '', 1, 0),
(876, 'BK010ARF', '1', NULL, 'TATA', 'Model-10', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-11', NULL, '2025-12-01 04:40:00', '', 0, 0),
(877, 'BK011ARF', '1', NULL, 'MAHINDRA', 'Model-11', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12', NULL, '2025-12-01 04:41:00', '', 1, 0),
(878, 'BK012ARF', '1', NULL, 'HYUNDAI', 'Model-12', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-13', NULL, '2025-12-01 04:42:00', '', 0, 0),
(879, 'BK013ARF', '1', NULL, 'FORD', 'Model-13', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-14', NULL, '2025-12-01 04:43:00', '', 1, 0),
(880, 'BK014ARF', '1', NULL, 'TATA', 'Model-14', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-15', NULL, '2025-12-01 04:44:00', '', 0, 0),
(881, 'BK015ARF', '1', NULL, 'MAHINDRA', 'Model-15', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-16', NULL, '2025-12-01 04:45:00', '', 1, 0),
(882, 'BK016ARF', '1', NULL, 'HYUNDAI', 'Model-16', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17', NULL, '2025-12-01 04:46:00', '', 0, 0),
(883, 'BK017ARF', '1', NULL, 'FORD', 'Model-17', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-18', NULL, '2025-12-01 04:47:00', '', 1, 0),
(884, 'BK018ARF', '1', NULL, 'TATA', 'Model-18', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-19', NULL, '2025-12-01 04:48:00', '', 0, 0),
(885, 'BK019ARF', '1', NULL, 'MAHINDRA', 'Model-19', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-20', NULL, '2025-12-01 04:49:00', '', 1, 0),
(886, 'BK020ARF', '1', NULL, 'HYUNDAI', 'Model-20', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21', NULL, '2025-12-01 04:50:00', '', 0, 0),
(887, 'BK021ARF', '1', NULL, 'FORD', 'Model-21', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22', NULL, '2025-12-01 04:51:00', '', 1, 0),
(888, 'BK022ARF', '1', NULL, 'TATA', 'Model-22', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-23', NULL, '2025-12-01 04:52:00', '', 0, 0),
(889, 'BK023ARF', '1', NULL, 'MAHINDRA', 'Model-23', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24', NULL, '2025-12-01 04:53:00', '', 1, 0),
(890, 'BK024ARF', '1', NULL, 'HYUNDAI', 'Model-24', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-25', NULL, '2025-12-01 04:54:00', '', 0, 0),
(891, 'BK025ARF', '1', NULL, 'FORD', 'Model-25', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26', NULL, '2025-12-01 04:55:00', '', 1, 0),
(892, 'BK026ARF', '1', NULL, 'TATA', 'Model-26', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27', NULL, '2025-12-01 04:56:00', '', 0, 0),
(893, 'BK027ARF', '1', NULL, 'MAHINDRA', 'Model-27', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28', NULL, '2025-12-01 04:57:00', '', 1, 0),
(894, 'BK028ARF', '1', NULL, 'HYUNDAI', 'Model-28', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29', NULL, '2025-12-01 04:58:00', '', 0, 0),
(895, 'BK029ARF', '1', NULL, 'FORD', 'Model-29', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30', NULL, '2025-12-01 04:59:00', '', 1, 0),
(896, 'BK030ARF', '1', NULL, 'TATA', 'Model-30', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-31', NULL, '2025-12-01 05:00:00', '', 0, 0),
(897, 'BK031ARF', '1', NULL, 'MAHINDRA', 'Model-31', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01', NULL, '2025-12-01 05:01:00', '', 1, 0);
INSERT INTO `vehicle_details_tbl` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`, `is_deleted`) VALUES
(898, 'BK032ARF', '1', NULL, 'HYUNDAI', 'Model-32', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02', NULL, '2025-12-01 05:02:00', '', 0, 0),
(899, 'BK033ARF', '1', NULL, 'FORD', 'Model-33', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-03', NULL, '2025-12-01 05:03:00', '', 1, 0),
(900, 'BK034ARF', '1', NULL, 'TATA', 'Model-34', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-04', NULL, '2025-12-01 05:04:00', '', 0, 0),
(901, 'BK035ARF', '1', NULL, 'MAHINDRA', 'Model-35', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-05', NULL, '2025-12-01 05:05:00', '', 1, 0),
(902, 'BK036ARF', '1', NULL, 'HYUNDAI', 'Model-36', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-06', NULL, '2025-12-01 05:06:00', '', 0, 0),
(903, 'BK037ARF', '1', NULL, 'FORD', 'Model-37', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-07', NULL, '2025-12-01 05:07:00', '', 1, 0),
(904, 'BK038ARF', '1', NULL, 'TATA', 'Model-38', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-08', NULL, '2025-12-01 05:08:00', '', 0, 0),
(905, 'BK039ARF', '1', NULL, 'MAHINDRA', 'Model-39', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09', NULL, '2025-12-01 05:09:00', '', 1, 0),
(906, 'BK040ARF', '1', NULL, 'HYUNDAI', 'Model-40', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-10', NULL, '2025-12-01 05:10:00', '', 0, 0),
(907, 'BK041ARF', '1', NULL, 'FORD', 'Model-41', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11', NULL, '2025-12-01 05:11:00', '', 1, 0),
(908, 'BK042ARF', '1', NULL, 'TATA', 'Model-42', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-12', NULL, '2025-12-01 05:12:00', '', 0, 0),
(909, 'BK043ARF', '1', NULL, 'MAHINDRA', 'Model-43', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13', NULL, '2025-12-01 05:13:00', '', 1, 0),
(910, 'BK044ARF', '1', NULL, 'HYUNDAI', 'Model-44', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-14', NULL, '2025-12-01 05:14:00', '', 0, 0),
(911, 'BK045ARF', '1', NULL, 'FORD', 'Model-45', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-15', NULL, '2025-12-01 05:15:00', '', 1, 0),
(912, 'BK046ARF', '1', NULL, 'TATA', 'Model-46', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16', NULL, '2025-12-01 05:16:00', '', 0, 0),
(913, 'BK047ARF', '1', NULL, 'MAHINDRA', 'Model-47', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17', NULL, '2025-12-01 05:17:00', '', 1, 0),
(914, 'BK048ARF', '1', NULL, 'HYUNDAI', 'Model-48', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18', NULL, '2025-12-01 05:18:00', '', 0, 0),
(915, 'BK049ARF', '1', NULL, 'FORD', 'Model-49', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-19', NULL, '2025-12-01 05:19:00', '', 1, 0),
(916, 'BK050ARF', '1', NULL, 'TATA', 'Model-50', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-20', NULL, '2025-12-01 05:20:00', '', 0, 0),
(917, 'BK051ARF', '1', NULL, 'MAHINDRA', 'Model-51', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', NULL, '2025-12-01 05:21:00', '', 1, 0),
(918, 'BK052ARF', '1', NULL, 'HYUNDAI', 'Model-52', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-22', NULL, '2025-12-01 05:22:00', '', 0, 0),
(919, 'BK053ARF', '1', NULL, 'FORD', 'Model-53', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-23', NULL, '2025-12-01 05:23:00', '', 1, 0),
(920, 'BK054ARF', '1', NULL, 'TATA', 'Model-54', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24', NULL, '2025-12-01 05:24:00', '', 0, 0),
(921, 'BK055ARF', '1', NULL, 'MAHINDRA', 'Model-55', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25', NULL, '2025-12-01 05:25:00', '', 1, 0),
(922, 'BK056ARF', '1', NULL, 'HYUNDAI', 'Model-56', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-26', NULL, '2025-12-01 05:26:00', '', 0, 0),
(923, 'BK057ARF', '1', NULL, 'FORD', 'Model-57', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-27', NULL, '2025-12-01 05:27:00', '', 1, 0),
(924, 'BK058ARF', '1', NULL, 'TATA', 'Model-58', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-28', NULL, '2025-12-01 05:28:00', '', 0, 0),
(925, 'BK059ARF', '1', NULL, 'MAHINDRA', 'Model-59', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-01', NULL, '2025-12-01 05:29:00', '', 1, 0),
(926, 'BK060ARF', '1', NULL, 'HYUNDAI', 'Model-60', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-02', NULL, '2025-12-01 05:30:00', '', 0, 0),
(927, 'BK061ARF', '1', NULL, 'FORD', 'Model-61', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-03', NULL, '2025-12-01 05:31:00', '', 1, 0),
(928, 'BK062ARF', '1', NULL, 'TATA', 'Model-62', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-04', NULL, '2025-12-01 05:32:00', '', 0, 0),
(929, 'BK063ARF', '1', NULL, 'MAHINDRA', 'Model-63', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05', NULL, '2025-12-01 05:33:00', '', 1, 0),
(930, 'BK064ARF', '1', NULL, 'HYUNDAI', 'Model-64', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-06', NULL, '2025-12-01 05:34:00', '', 0, 0),
(931, 'BK065ARF', '1', NULL, 'FORD', 'Model-65', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07', NULL, '2025-12-01 05:35:00', '', 1, 0),
(932, 'BK066ARF', '1', NULL, 'TATA', 'Model-66', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-08', NULL, '2025-12-01 05:36:00', '', 0, 0),
(933, 'BK067ARF', '1', NULL, 'MAHINDRA', 'Model-67', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09', NULL, '2025-12-01 05:37:00', '', 1, 0),
(934, 'BK068ARF', '1', NULL, 'HYUNDAI', 'Model-68', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10', NULL, '2025-12-01 05:38:00', '', 0, 0),
(935, 'BK069ARF', '1', NULL, 'FORD', 'Model-69', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-11', NULL, '2025-12-01 05:39:00', '', 1, 0),
(936, 'BK070ARF', '1', NULL, 'TATA', 'Model-70', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12', NULL, '2025-12-01 05:40:00', '', 0, 0),
(937, 'BK071ARF', '1', NULL, 'MAHINDRA', 'Model-71', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-13', NULL, '2025-12-01 05:41:00', '', 1, 0),
(938, 'BK072ARF', '1', NULL, 'HYUNDAI', 'Model-72', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14', NULL, '2025-12-01 05:42:00', '', 0, 0),
(939, 'BK073ARF', '1', NULL, 'FORD', 'Model-73', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15', NULL, '2025-12-01 05:43:00', '', 1, 0),
(940, 'BK074ARF', '1', NULL, 'TATA', 'Model-74', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-16', NULL, '2025-12-01 05:44:00', '', 0, 0),
(941, 'BK075ARF', '1', NULL, 'MAHINDRA', 'Model-75', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17', NULL, '2025-12-01 05:45:00', '', 1, 0),
(942, 'BK076ARF', '1', NULL, 'HYUNDAI', 'Model-76', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18', NULL, '2025-12-01 05:46:00', '', 0, 0),
(943, 'BK077ARF', '1', NULL, 'FORD', 'Model-77', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19', NULL, '2025-12-01 05:47:00', '', 1, 0),
(944, 'BK078ARF', '1', NULL, 'TATA', 'Model-78', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-20', NULL, '2025-12-01 05:48:00', '', 0, 0),
(945, 'BK079ARF', '1', NULL, 'MAHINDRA', 'Model-79', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-21', NULL, '2025-12-01 05:49:00', '', 1, 0),
(946, 'BK080ARF', '1', NULL, 'HYUNDAI', 'Model-80', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22', NULL, '2025-12-01 05:50:00', '', 0, 0),
(947, 'BK081ARF', '1', NULL, 'FORD', 'Model-81', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-23', NULL, '2025-12-01 05:51:00', '', 1, 0),
(948, 'BK082ARF', '1', NULL, 'TATA', 'Model-82', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24', NULL, '2025-12-01 05:52:00', '', 0, 0),
(949, 'BK083ARF', '1', NULL, 'MAHINDRA', 'Model-83', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-25', NULL, '2025-12-01 05:53:00', '', 1, 0),
(950, 'BK084ARF', '1', NULL, 'HYUNDAI', 'Model-84', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-26', NULL, '2025-12-01 05:54:00', '', 0, 0),
(951, 'BK085ARF', '1', NULL, 'FORD', 'Model-85', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27', NULL, '2025-12-01 05:55:00', '', 1, 0),
(952, 'BK086ARF', '1', NULL, 'TATA', 'Model-86', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-28', NULL, '2025-12-01 05:56:00', '', 0, 0),
(953, 'BK087ARF', '1', NULL, 'MAHINDRA', 'Model-87', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29', NULL, '2025-12-01 05:57:00', '', 1, 0),
(954, 'BK088ARF', '1', NULL, 'HYUNDAI', 'Model-88', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30', NULL, '2025-12-01 05:58:00', '', 0, 0),
(955, 'BK089ARF', '1', NULL, 'FORD', 'Model-89', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31', NULL, '2025-12-01 05:59:00', '', 1, 0),
(956, 'BK090ARF', '1', NULL, 'TATA', 'Model-90', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, '2025-12-01 06:00:00', '', 0, 0),
(957, 'BK091ARF', '1', NULL, 'MAHINDRA', 'Model-91', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-02', NULL, '2025-12-01 06:01:00', '', 1, 0),
(958, 'BK092ARF', '1', NULL, 'HYUNDAI', 'Model-92', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-03', NULL, '2025-12-01 06:02:00', '', 0, 0),
(959, 'BK093ARF', '1', NULL, 'FORD', 'Model-93', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-04', NULL, '2025-12-01 06:03:00', '', 1, 0),
(960, 'BK094ARF', '1', NULL, 'TATA', 'Model-94', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-05', NULL, '2025-12-01 06:04:00', '', 0, 0),
(961, 'BK095ARF', '1', NULL, 'MAHINDRA', 'Model-95', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-06', NULL, '2025-12-01 06:05:00', '', 1, 0),
(962, 'BK096ARF', '1', NULL, 'HYUNDAI', 'Model-96', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-07', NULL, '2025-12-01 06:06:00', '', 0, 0),
(963, 'BK097ARF', '1', NULL, 'FORD', 'Model-97', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-08', NULL, '2025-12-01 06:07:00', '', 1, 0),
(964, 'BK098ARF', '1', NULL, 'TATA', 'Model-98', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-09', NULL, '2025-12-01 06:08:00', '', 0, 0),
(965, 'BK099ARF', '1', NULL, 'MAHINDRA', 'Model-99', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-10', NULL, '2025-12-01 06:09:00', '', 1, 0),
(966, 'BK100ARF', '1', NULL, 'HYUNDAI', 'Model-100', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11', NULL, '2025-12-01 06:10:00', '', 0, 0),
(967, 'BK101ARF', '1', NULL, 'FORD', 'Model-101', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12', NULL, '2025-12-01 06:11:00', '', 1, 0),
(968, 'BK102ARF', '1', NULL, 'TATA', 'Model-102', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-13', NULL, '2025-12-01 06:12:00', '', 0, 0),
(969, 'BK103ARF', '1', NULL, 'MAHINDRA', 'Model-103', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14', NULL, '2025-12-01 06:13:00', '', 1, 0),
(970, 'BK104ARF', '1', NULL, 'HYUNDAI', 'Model-104', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-15', NULL, '2025-12-01 06:14:00', '', 0, 0),
(971, 'BK105ARF', '1', NULL, 'FORD', 'Model-105', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-16', NULL, '2025-12-01 06:15:00', '', 1, 0),
(972, 'BK106ARF', '1', NULL, 'TATA', 'Model-106', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-17', NULL, '2025-12-01 06:16:00', '', 0, 0),
(973, 'BK107ARF', '1', NULL, 'MAHINDRA', 'Model-107', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-18', NULL, '2025-12-01 06:17:00', '', 1, 0),
(974, 'BK108ARF', '1', NULL, 'HYUNDAI', 'Model-108', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-19', NULL, '2025-12-01 06:18:00', '', 0, 0),
(975, 'BK109ARF', '1', NULL, 'FORD', 'Model-109', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20', NULL, '2025-12-01 06:19:00', '', 1, 0),
(976, 'BK110ARF', '1', NULL, 'TATA', 'Model-110', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21', NULL, '2025-12-01 06:20:00', '', 0, 0),
(977, 'BK111ARF', '1', NULL, 'MAHINDRA', 'Model-111', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22', NULL, '2025-12-01 06:21:00', '', 1, 0),
(978, 'BK112ARF', '1', NULL, 'HYUNDAI', 'Model-112', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-23', NULL, '2025-12-01 06:22:00', '', 0, 0),
(979, 'BK113ARF', '1', NULL, 'FORD', 'Model-113', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-24', NULL, '2025-12-01 06:23:00', '', 1, 0),
(980, 'BK114ARF', '1', NULL, 'TATA', 'Model-114', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-25', NULL, '2025-12-01 06:24:00', '', 0, 0),
(981, 'BK115ARF', '1', NULL, 'MAHINDRA', 'Model-115', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-26', NULL, '2025-12-01 06:25:00', '', 1, 0),
(982, 'BK116ARF', '1', NULL, 'HYUNDAI', 'Model-116', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-27', NULL, '2025-12-01 06:26:00', '', 0, 0),
(983, 'BK117ARF', '1', NULL, 'FORD', 'Model-117', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-28', NULL, '2025-12-01 06:27:00', '', 1, 0),
(984, 'BK118ARF', '1', NULL, 'TATA', 'Model-118', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29', NULL, '2025-12-01 06:28:00', '', 0, 0),
(985, 'BK119ARF', '1', NULL, 'MAHINDRA', 'Model-119', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30', NULL, '2025-12-01 06:29:00', '', 1, 0),
(986, 'BK120ARF', '1', NULL, 'HYUNDAI', 'Model-120', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-01', NULL, '2025-12-01 06:30:00', '', 0, 0),
(987, 'BK121ARF', '1', NULL, 'FORD', 'Model-121', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-02', NULL, '2025-12-01 06:31:00', '', 1, 0),
(988, 'BK122ARF', '1', NULL, 'TATA', 'Model-122', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-03', NULL, '2025-12-01 06:32:00', '', 0, 0),
(989, 'BK123ARF', '1', NULL, 'MAHINDRA', 'Model-123', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04', NULL, '2025-12-01 06:33:00', '', 1, 0),
(990, 'BK124ARF', '1', NULL, 'HYUNDAI', 'Model-124', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05', NULL, '2025-12-01 06:34:00', '', 0, 0),
(991, 'BK125ARF', '1', NULL, 'FORD', 'Model-125', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06', NULL, '2025-12-01 06:35:00', '', 1, 0),
(992, 'BK126ARF', '1', NULL, 'TATA', 'Model-126', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-07', NULL, '2025-12-01 06:36:00', '', 0, 0),
(993, 'BK127ARF', '1', NULL, 'MAHINDRA', 'Model-127', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-08', NULL, '2025-12-01 06:37:00', '', 1, 0),
(994, 'BK128ARF', '1', NULL, 'HYUNDAI', 'Model-128', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-09', NULL, '2025-12-01 06:38:00', '', 0, 0),
(995, 'BK129ARF', '1', NULL, 'FORD', 'Model-129', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10', NULL, '2025-12-01 06:39:00', '', 1, 0),
(996, 'BK130ARF', '1', NULL, 'TATA', 'Model-130', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-11', NULL, '2025-12-01 06:40:00', '', 0, 0),
(997, 'BK131ARF', '1', NULL, 'MAHINDRA', 'Model-131', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-12', NULL, '2025-12-01 06:41:00', '', 1, 0),
(998, 'BK132ARF', '1', NULL, 'HYUNDAI', 'Model-132', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-13', NULL, '2025-12-01 06:42:00', '', 0, 0),
(999, 'BK133ARF', '1', NULL, 'FORD', 'Model-133', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-14', NULL, '2025-12-01 06:43:00', '', 1, 0),
(1000, 'BK134ARF', '1', NULL, 'TATA', 'Model-134', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15', NULL, '2025-12-01 06:44:00', '', 0, 0),
(1001, 'BK135ARF', '1', NULL, 'MAHINDRA', 'Model-135', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-16', NULL, '2025-12-01 06:45:00', '', 1, 0),
(1002, 'BK136ARF', '1', NULL, 'HYUNDAI', 'Model-136', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17', NULL, '2025-12-01 06:46:00', '', 0, 0),
(1003, 'BK137ARF', '1', NULL, 'FORD', 'Model-137', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-18', NULL, '2025-12-01 06:47:00', '', 1, 0),
(1004, 'BK138ARF', '1', NULL, 'TATA', 'Model-138', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-19', NULL, '2025-12-01 06:48:00', '', 0, 0),
(1005, 'BK139ARF', '1', NULL, 'MAHINDRA', 'Model-139', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-20', NULL, '2025-12-01 06:49:00', '', 1, 0),
(1006, 'BK140ARF', '1', NULL, 'HYUNDAI', 'Model-140', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-21', NULL, '2025-12-01 06:50:00', '', 0, 0),
(1007, 'BK141ARF', '1', NULL, 'FORD', 'Model-141', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-22', NULL, '2025-12-01 06:51:00', '', 1, 0),
(1008, 'BK142ARF', '1', NULL, 'TATA', 'Model-142', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-23', NULL, '2025-12-01 06:52:00', '', 0, 0),
(1009, 'BK143ARF', '1', NULL, 'MAHINDRA', 'Model-143', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-24', NULL, '2025-12-01 06:53:00', '', 1, 0),
(1010, 'BK144ARF', '1', NULL, 'HYUNDAI', 'Model-144', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-25', NULL, '2025-12-01 06:54:00', '', 0, 0),
(1011, 'BK145ARF', '1', NULL, 'FORD', 'Model-145', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-26', NULL, '2025-12-01 06:55:00', '', 1, 0),
(1012, 'BK146ARF', '1', NULL, 'TATA', 'Model-146', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27', NULL, '2025-12-01 06:56:00', '', 0, 0),
(1013, 'BK147ARF', '1', NULL, 'MAHINDRA', 'Model-147', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-28', NULL, '2025-12-01 06:57:00', '', 1, 0),
(1014, 'BK148ARF', '1', NULL, 'HYUNDAI', 'Model-148', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29', NULL, '2025-12-01 06:58:00', '', 0, 0),
(1015, 'BK149ARF', '1', NULL, 'FORD', 'Model-149', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-30', NULL, '2025-12-01 06:59:00', '', 1, 0),
(1016, 'BK150ARF', '1', NULL, 'TATA', 'Model-150', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-31', NULL, '2025-12-01 07:00:00', '', 0, 0),
(1017, 'BK151ARF', '1', NULL, 'MAHINDRA', 'Model-151', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-01', NULL, '2025-12-01 07:01:00', '', 1, 0),
(1018, 'BK152ARF', '1', NULL, 'HYUNDAI', 'Model-152', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02', NULL, '2025-12-01 07:02:00', '', 0, 0),
(1019, 'BK153ARF', '1', NULL, 'FORD', 'Model-153', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-03', NULL, '2025-12-01 07:03:00', '', 1, 0),
(1020, 'BK154ARF', '1', NULL, 'TATA', 'Model-154', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-04', NULL, '2025-12-01 07:04:00', '', 0, 0),
(1021, 'BK155ARF', '1', NULL, 'MAHINDRA', 'Model-155', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-05', NULL, '2025-12-01 07:05:00', '', 1, 0),
(1022, 'BK156ARF', '1', NULL, 'HYUNDAI', 'Model-156', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06', NULL, '2025-12-01 07:06:00', '', 0, 0),
(1023, 'BK157ARF', '1', NULL, 'FORD', 'Model-157', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-07', NULL, '2025-12-01 07:07:00', '', 1, 0),
(1024, 'BK158ARF', '1', NULL, 'TATA', 'Model-158', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08', NULL, '2025-12-01 07:08:00', '', 0, 0),
(1025, 'BK159ARF', '1', NULL, 'MAHINDRA', 'Model-159', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-09', NULL, '2025-12-01 07:09:00', '', 1, 0),
(1026, 'BK160ARF', '1', NULL, 'HYUNDAI', 'Model-160', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10', NULL, '2025-12-01 07:10:00', '', 0, 0),
(1027, 'BK161ARF', '1', NULL, 'FORD', 'Model-161', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-11', NULL, '2025-12-01 07:11:00', '', 1, 0),
(1028, 'BK162ARF', '1', NULL, 'TATA', 'Model-162', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-12', NULL, '2025-12-01 07:12:00', '', 0, 0),
(1029, 'BK163ARF', '1', NULL, 'MAHINDRA', 'Model-163', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-13', NULL, '2025-12-01 07:13:00', '', 1, 0),
(1030, 'BK164ARF', '1', NULL, 'HYUNDAI', 'Model-164', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14', NULL, '2025-12-01 07:14:00', '', 0, 0),
(1031, 'BK165ARF', '1', NULL, 'FORD', 'Model-165', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15', NULL, '2025-12-01 07:15:00', '', 1, 0),
(1032, 'BK166ARF', '1', NULL, 'TATA', 'Model-166', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16', NULL, '2025-12-01 07:16:00', '', 0, 0),
(1033, 'BK167ARF', '1', NULL, 'MAHINDRA', 'Model-167', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, '2025-12-01 07:17:00', '', 1, 0),
(1034, 'BK168ARF', '1', NULL, 'HYUNDAI', 'Model-168', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18', NULL, '2025-12-01 07:18:00', '', 0, 0),
(1035, 'BK169ARF', '1', NULL, 'FORD', 'Model-169', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-19', NULL, '2025-12-01 07:19:00', '', 1, 0),
(1036, 'BK170ARF', '1', NULL, 'TATA', 'Model-170', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-20', NULL, '2025-12-01 07:20:00', '', 0, 0),
(1037, 'BK171ARF', '1', NULL, 'MAHINDRA', 'Model-171', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-21', NULL, '2025-12-01 07:21:00', '', 1, 0),
(1038, 'BK172ARF', '1', NULL, 'HYUNDAI', 'Model-172', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22', NULL, '2025-12-01 07:22:00', '', 0, 0),
(1039, 'BK173ARF', '1', NULL, 'FORD', 'Model-173', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23', NULL, '2025-12-01 07:23:00', '', 1, 0),
(1040, 'BK174ARF', '1', NULL, 'TATA', 'Model-174', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24', NULL, '2025-12-01 07:24:00', '', 0, 0),
(1041, 'BK175ARF', '1', NULL, 'MAHINDRA', 'Model-175', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25', NULL, '2025-12-01 07:25:00', '', 1, 0),
(1042, 'BK176ARF', '1', NULL, 'HYUNDAI', 'Model-176', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-26', NULL, '2025-12-01 07:26:00', '', 0, 0),
(1043, 'BK177ARF', '1', NULL, 'FORD', 'Model-177', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-27', NULL, '2025-12-01 07:27:00', '', 1, 0),
(1044, 'BK178ARF', '1', NULL, 'TATA', 'Model-178', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-28', NULL, '2025-12-01 07:28:00', '', 0, 0),
(1045, 'BK179ARF', '1', NULL, 'MAHINDRA', 'Model-179', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29', NULL, '2025-12-01 07:29:00', '', 1, 0),
(1046, 'BK180ARF', '1', NULL, 'HYUNDAI', 'Model-180', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-30', NULL, '2025-12-01 07:30:00', '', 0, 0),
(1047, 'BK181ARF', '1', NULL, 'FORD', 'Model-181', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01', NULL, '2025-12-01 07:31:00', '', 1, 0),
(1048, 'BK182ARF', '1', NULL, 'TATA', 'Model-182', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02', NULL, '2025-12-01 07:32:00', '', 0, 0),
(1049, 'BK183ARF', '1', NULL, 'MAHINDRA', 'Model-183', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-03', NULL, '2025-12-01 07:33:00', '', 1, 0),
(1050, 'BK184ARF', '1', NULL, 'HYUNDAI', 'Model-184', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-04', NULL, '2025-12-01 07:34:00', '', 0, 0),
(1051, 'BK185ARF', '1', NULL, 'FORD', 'Model-185', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-05', NULL, '2025-12-01 07:35:00', '', 1, 0),
(1052, 'BK186ARF', '1', NULL, 'TATA', 'Model-186', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06', NULL, '2025-12-01 07:36:00', '', 0, 0),
(1053, 'BK187ARF', '1', NULL, 'MAHINDRA', 'Model-187', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07', NULL, '2025-12-01 07:37:00', '', 1, 0),
(1054, 'BK188ARF', '1', NULL, 'HYUNDAI', 'Model-188', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-08', NULL, '2025-12-01 07:38:00', '', 0, 0),
(1055, 'BK189ARF', '1', NULL, 'FORD', 'Model-189', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-09', NULL, '2025-12-01 07:39:00', '', 1, 0),
(1056, 'BK190ARF', '1', NULL, 'TATA', 'Model-190', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10', NULL, '2025-12-01 07:40:00', '', 0, 0),
(1057, 'BK191ARF', '1', NULL, 'MAHINDRA', 'Model-191', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-11', NULL, '2025-12-01 07:41:00', '', 1, 0),
(1058, 'BK192ARF', '1', NULL, 'HYUNDAI', 'Model-192', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12', NULL, '2025-12-01 07:42:00', '', 0, 0),
(1059, 'BK193ARF', '1', NULL, 'FORD', 'Model-193', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', NULL, '2025-12-01 07:43:00', '', 1, 0),
(1060, 'BK194ARF', '1', NULL, 'TATA', 'Model-194', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', NULL, '2025-12-01 07:44:00', '', 0, 0),
(1061, 'BK195ARF', '1', NULL, 'MAHINDRA', 'Model-195', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15', NULL, '2025-12-01 07:45:00', '', 1, 0),
(1062, 'BK196ARF', '1', NULL, 'HYUNDAI', 'Model-196', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-16', NULL, '2025-12-01 07:46:00', '', 0, 0),
(1063, 'BK197ARF', '1', NULL, 'FORD', 'Model-197', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-17', NULL, '2025-12-01 07:47:00', '', 1, 0),
(1064, 'BK198ARF', '1', NULL, 'TATA', 'Model-198', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-18', NULL, '2025-12-01 07:48:00', '', 0, 0),
(1065, 'BK199ARF', '1', NULL, 'MAHINDRA', 'Model-199', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-19', NULL, '2025-12-01 07:49:00', '', 1, 0),
(1066, 'BK200ARF', '1', NULL, 'HYUNDAI', 'Model-200', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-20', NULL, '2025-12-01 07:50:00', '', 0, 0),
(1067, 'BK201ARF', '1', NULL, 'FORD', 'Model-201', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-21', NULL, '2025-12-01 07:51:00', '', 1, 0),
(1068, 'BK202ARF', '1', NULL, 'TATA', 'Model-202', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-22', NULL, '2025-12-01 07:52:00', '', 0, 0),
(1069, 'BK203ARF', '1', NULL, 'MAHINDRA', 'Model-203', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-23', NULL, '2025-12-01 07:53:00', '', 1, 0),
(1070, 'BK204ARF', '1', NULL, 'HYUNDAI', 'Model-204', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-24', NULL, '2025-12-01 07:54:00', '', 0, 0),
(1071, 'BK205ARF', '1', NULL, 'FORD', 'Model-205', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-25', NULL, '2025-12-01 07:55:00', '', 1, 0),
(1072, 'BK206ARF', '1', NULL, 'TATA', 'Model-206', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-26', NULL, '2025-12-01 07:56:00', '', 0, 0),
(1073, 'BK207ARF', '1', NULL, 'MAHINDRA', 'Model-207', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27', NULL, '2025-12-01 07:57:00', '', 1, 0),
(1074, 'BK208ARF', '1', NULL, 'HYUNDAI', 'Model-208', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-28', NULL, '2025-12-01 07:58:00', '', 0, 0),
(1075, 'BK209ARF', '1', NULL, 'FORD', 'Model-209', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29', NULL, '2025-12-01 07:59:00', '', 1, 0),
(1076, 'BK210ARF', '1', NULL, 'TATA', 'Model-210', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-30', NULL, '2025-12-01 08:00:00', '', 0, 0),
(1077, 'BK211ARF', '1', NULL, 'MAHINDRA', 'Model-211', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-31', NULL, '2025-12-01 08:01:00', '', 1, 0),
(1078, 'BK212ARF', '1', NULL, 'HYUNDAI', 'Model-212', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-01', NULL, '2025-12-01 08:02:00', '', 0, 0),
(1079, 'BK213ARF', '1', NULL, 'FORD', 'Model-213', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-02', NULL, '2025-12-01 08:03:00', '', 1, 0),
(1080, 'BK214ARF', '1', NULL, 'TATA', 'Model-214', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-03', NULL, '2025-12-01 08:04:00', '', 0, 0),
(1081, 'BK215ARF', '1', NULL, 'MAHINDRA', 'Model-215', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-04', NULL, '2025-12-01 08:05:00', '', 1, 0),
(1082, 'BK216ARF', '1', NULL, 'HYUNDAI', 'Model-216', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-05', NULL, '2025-12-01 08:06:00', '', 0, 0),
(1083, 'BK217ARF', '1', NULL, 'FORD', 'Model-217', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-06', NULL, '2025-12-01 08:07:00', '', 1, 0),
(1084, 'BK218ARF', '1', NULL, 'TATA', 'Model-218', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-07', NULL, '2025-12-01 08:08:00', '', 0, 0),
(1085, 'BK219ARF', '1', NULL, 'MAHINDRA', 'Model-219', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-08', NULL, '2025-12-01 08:09:00', '', 1, 0),
(1086, 'BK220ARF', '1', NULL, 'HYUNDAI', 'Model-220', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-09', NULL, '2025-12-01 08:10:00', '', 0, 0),
(1087, 'BK221ARF', '1', NULL, 'FORD', 'Model-221', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-10', NULL, '2025-12-01 08:11:00', '', 1, 0),
(1088, 'BK222ARF', '1', NULL, 'TATA', 'Model-222', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11', NULL, '2025-12-01 08:12:00', '', 0, 0),
(1089, 'BK223ARF', '1', NULL, 'MAHINDRA', 'Model-223', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-12', NULL, '2025-12-01 08:13:00', '', 1, 0),
(1090, 'BK224ARF', '1', NULL, 'HYUNDAI', 'Model-224', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-13', NULL, '2025-12-01 08:14:00', '', 0, 0),
(1091, 'BK225ARF', '1', NULL, 'FORD', 'Model-225', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-14', NULL, '2025-12-01 08:15:00', '', 1, 0),
(1092, 'BK226ARF', '1', NULL, 'TATA', 'Model-226', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-15', NULL, '2025-12-01 08:16:00', '', 0, 0),
(1093, 'BK227ARF', '1', NULL, 'MAHINDRA', 'Model-227', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, '2025-12-01 08:17:00', '', 1, 0),
(1094, 'BK228ARF', '1', NULL, 'HYUNDAI', 'Model-228', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17', NULL, '2025-12-01 08:18:00', '', 0, 0),
(1095, 'BK229ARF', '1', NULL, 'FORD', 'Model-229', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-18', NULL, '2025-12-01 08:19:00', '', 1, 0),
(1096, 'BK230ARF', '1', NULL, 'TATA', 'Model-230', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19', NULL, '2025-12-01 08:20:00', '', 0, 0),
(1097, 'BK231ARF', '1', NULL, 'MAHINDRA', 'Model-231', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20', NULL, '2025-12-01 08:21:00', '', 1, 0),
(1098, 'BK232ARF', '1', NULL, 'HYUNDAI', 'Model-232', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-21', NULL, '2025-12-01 08:22:00', '', 0, 0),
(1099, 'BK233ARF', '1', NULL, 'FORD', 'Model-233', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-22', NULL, '2025-12-01 08:23:00', '', 1, 0),
(1100, 'BK234ARF', '1', NULL, 'TATA', 'Model-234', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-23', NULL, '2025-12-01 08:24:00', '', 0, 0),
(1101, 'BK235ARF', '1', NULL, 'MAHINDRA', 'Model-235', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-24', NULL, '2025-12-01 08:25:00', '', 1, 0),
(1102, 'BK236ARF', '1', NULL, 'HYUNDAI', 'Model-236', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-25', NULL, '2025-12-01 08:26:00', '', 0, 0),
(1103, 'BK237ARF', '1', NULL, 'FORD', 'Model-237', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26', NULL, '2025-12-01 08:27:00', '', 1, 0),
(1104, 'BK238ARF', '1', NULL, 'TATA', 'Model-238', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27', NULL, '2025-12-01 08:28:00', '', 0, 0),
(1105, 'BK239ARF', '1', NULL, 'MAHINDRA', 'Model-239', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-28', NULL, '2025-12-01 08:29:00', '', 1, 0),
(1106, 'BK240ARF', '1', NULL, 'HYUNDAI', 'Model-240', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-29', NULL, '2025-12-01 08:30:00', '', 0, 0),
(1107, 'BK241ARF', '1', NULL, 'FORD', 'Model-241', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-30', NULL, '2025-12-01 08:31:00', '', 1, 0),
(1122, 'BK001ARF', '1', NULL, 'FORD', 'Model-1', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-02', NULL, '2025-12-01 04:31:00', '', 1, 0),
(1123, 'BK002ARF', '1', NULL, 'TATA', 'Model-2', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03', NULL, '2025-12-01 04:32:00', '', 0, 0),
(1124, 'BK003ARF', '1', NULL, 'MAHINDRA', 'Model-3', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-04', NULL, '2025-12-01 04:33:00', '', 1, 0),
(1125, 'BK004ARF', '1', NULL, 'HYUNDAI', 'Model-4', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05', NULL, '2025-12-01 04:34:00', '', 0, 0),
(1126, 'BK005ARF', '1', NULL, 'FORD', 'Model-5', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-06', NULL, '2025-12-01 04:35:00', '', 1, 0),
(1127, 'BK006ARF', '1', NULL, 'TATA', 'Model-6', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-07', NULL, '2025-12-01 04:36:00', '', 0, 0),
(1128, 'BK007ARF', '1', NULL, 'MAHINDRA', 'Model-7', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-08', NULL, '2025-12-01 04:37:00', '', 1, 0),
(1129, 'BK008ARF', '1', NULL, 'HYUNDAI', 'Model-8', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-09', NULL, '2025-12-01 04:38:00', '', 0, 0),
(1130, 'BK009ARF', '1', NULL, 'FORD', 'Model-9', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-10', NULL, '2025-12-01 04:39:00', '', 1, 0),
(1131, 'BK010ARF', '1', NULL, 'TATA', 'Model-10', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-11', NULL, '2025-12-01 04:40:00', '', 0, 0),
(1132, 'BK011ARF', '1', NULL, 'MAHINDRA', 'Model-11', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12', NULL, '2025-12-01 04:41:00', '', 1, 0),
(1133, 'BK012ARF', '1', NULL, 'HYUNDAI', 'Model-12', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-13', NULL, '2025-12-01 04:42:00', '', 0, 0),
(1134, 'BK013ARF', '1', NULL, 'FORD', 'Model-13', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-14', NULL, '2025-12-01 04:43:00', '', 1, 0),
(1135, 'BK014ARF', '1', NULL, 'TATA', 'Model-14', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-15', NULL, '2025-12-01 04:44:00', '', 0, 0),
(1136, 'BK015ARF', '1', NULL, 'MAHINDRA', 'Model-15', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-16', NULL, '2025-12-01 04:45:00', '', 1, 0),
(1137, 'BK016ARF', '1', NULL, 'HYUNDAI', 'Model-16', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17', NULL, '2025-12-01 04:46:00', '', 0, 0),
(1138, 'BK017ARF', '1', NULL, 'FORD', 'Model-17', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-18', NULL, '2025-12-01 04:47:00', '', 1, 0),
(1139, 'BK018ARF', '1', NULL, 'TATA', 'Model-18', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-19', NULL, '2025-12-01 04:48:00', '', 0, 0),
(1140, 'BK019ARF', '1', NULL, 'MAHINDRA', 'Model-19', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-20', NULL, '2025-12-01 04:49:00', '', 1, 0),
(1141, 'BK020ARF', '1', NULL, 'HYUNDAI', 'Model-20', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21', NULL, '2025-12-01 04:50:00', '', 0, 0),
(1142, 'BK021ARF', '1', NULL, 'FORD', 'Model-21', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22', NULL, '2025-12-01 04:51:00', '', 1, 0),
(1143, 'BK022ARF', '1', NULL, 'TATA', 'Model-22', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-23', NULL, '2025-12-01 04:52:00', '', 0, 0),
(1144, 'BK023ARF', '1', NULL, 'MAHINDRA', 'Model-23', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24', NULL, '2025-12-01 04:53:00', '', 1, 0),
(1145, 'BK024ARF', '1', NULL, 'HYUNDAI', 'Model-24', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-25', NULL, '2025-12-01 04:54:00', '', 0, 0),
(1146, 'BK025ARF', '1', NULL, 'FORD', 'Model-25', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26', NULL, '2025-12-01 04:55:00', '', 1, 0),
(1147, 'BK026ARF', '1', NULL, 'TATA', 'Model-26', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27', NULL, '2025-12-01 04:56:00', '', 0, 0),
(1148, 'BK027ARF', '1', NULL, 'MAHINDRA', 'Model-27', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28', NULL, '2025-12-01 04:57:00', '', 1, 0),
(1149, 'BK028ARF', '1', NULL, 'HYUNDAI', 'Model-28', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29', NULL, '2025-12-01 04:58:00', '', 0, 0),
(1150, 'BK029ARF', '1', NULL, 'FORD', 'Model-29', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30', NULL, '2025-12-01 04:59:00', '', 1, 0),
(1151, 'BK030ARF', '1', NULL, 'TATA', 'Model-30', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-31', NULL, '2025-12-01 05:00:00', '', 0, 0),
(1152, 'BK031ARF', '1', NULL, 'MAHINDRA', 'Model-31', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01', NULL, '2025-12-01 05:01:00', '', 1, 0),
(1153, 'BK032ARF', '1', NULL, 'HYUNDAI', 'Model-32', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02', NULL, '2025-12-01 05:02:00', '', 0, 0),
(1154, 'BK033ARF', '1', NULL, 'FORD', 'Model-33', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-03', NULL, '2025-12-01 05:03:00', '', 1, 0),
(1155, 'BK034ARF', '1', NULL, 'TATA', 'Model-34', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-04', NULL, '2025-12-01 05:04:00', '', 0, 0),
(1156, 'BK035ARF', '1', NULL, 'MAHINDRA', 'Model-35', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-05', NULL, '2025-12-01 05:05:00', '', 1, 0),
(1157, 'BK036ARF', '1', NULL, 'HYUNDAI', 'Model-36', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-06', NULL, '2025-12-01 05:06:00', '', 0, 0),
(1158, 'BK037ARF', '1', NULL, 'FORD', 'Model-37', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-07', NULL, '2025-12-01 05:07:00', '', 1, 0),
(1159, 'BK038ARF', '1', NULL, 'TATA', 'Model-38', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-08', NULL, '2025-12-01 05:08:00', '', 0, 0),
(1160, 'BK039ARF', '1', NULL, 'MAHINDRA', 'Model-39', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09', NULL, '2025-12-01 05:09:00', '', 1, 0),
(1161, 'BK040ARF', '1', NULL, 'HYUNDAI', 'Model-40', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-10', NULL, '2025-12-01 05:10:00', '', 0, 0),
(1162, 'BK041ARF', '1', NULL, 'FORD', 'Model-41', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11', NULL, '2025-12-01 05:11:00', '', 1, 0),
(1163, 'BK042ARF', '1', NULL, 'TATA', 'Model-42', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-12', NULL, '2025-12-01 05:12:00', '', 0, 0),
(1164, 'BK043ARF', '1', NULL, 'MAHINDRA', 'Model-43', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13', NULL, '2025-12-01 05:13:00', '', 1, 0),
(1165, 'BK044ARF', '1', NULL, 'HYUNDAI', 'Model-44', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-14', NULL, '2025-12-01 05:14:00', '', 0, 0),
(1166, 'BK045ARF', '1', NULL, 'FORD', 'Model-45', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-15', NULL, '2025-12-01 05:15:00', '', 1, 0),
(1167, 'BK046ARF', '1', NULL, 'TATA', 'Model-46', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16', NULL, '2025-12-01 05:16:00', '', 0, 0),
(1168, 'BK047ARF', '1', NULL, 'MAHINDRA', 'Model-47', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17', NULL, '2025-12-01 05:17:00', '', 1, 0),
(1169, 'BK048ARF', '1', NULL, 'HYUNDAI', 'Model-48', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18', NULL, '2025-12-01 05:18:00', '', 0, 0),
(1170, 'BK049ARF', '1', NULL, 'FORD', 'Model-49', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-19', NULL, '2025-12-01 05:19:00', '', 1, 0),
(1171, 'BK050ARF', '1', NULL, 'TATA', 'Model-50', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-20', NULL, '2025-12-01 05:20:00', '', 0, 0),
(1172, 'BK051ARF', '1', NULL, 'MAHINDRA', 'Model-51', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', NULL, '2025-12-01 05:21:00', '', 1, 0),
(1173, 'BK052ARF', '1', NULL, 'HYUNDAI', 'Model-52', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-22', NULL, '2025-12-01 05:22:00', '', 0, 0),
(1174, 'BK053ARF', '1', NULL, 'FORD', 'Model-53', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-23', NULL, '2025-12-01 05:23:00', '', 1, 0),
(1175, 'BK054ARF', '1', NULL, 'TATA', 'Model-54', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24', NULL, '2025-12-01 05:24:00', '', 0, 0),
(1176, 'BK055ARF', '1', NULL, 'MAHINDRA', 'Model-55', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25', NULL, '2025-12-01 05:25:00', '', 1, 0),
(1177, 'BK056ARF', '1', NULL, 'HYUNDAI', 'Model-56', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-26', NULL, '2025-12-01 05:26:00', '', 0, 0),
(1178, 'BK057ARF', '1', NULL, 'FORD', 'Model-57', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-27', NULL, '2025-12-01 05:27:00', '', 1, 0),
(1179, 'BK058ARF', '1', NULL, 'TATA', 'Model-58', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-28', NULL, '2025-12-01 05:28:00', '', 0, 0);
INSERT INTO `vehicle_details_tbl` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`, `is_deleted`) VALUES
(1180, 'BK059ARF', '1', NULL, 'MAHINDRA', 'Model-59', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-01', NULL, '2025-12-01 05:29:00', '', 1, 0),
(1181, 'BK060ARF', '1', NULL, 'HYUNDAI', 'Model-60', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-02', NULL, '2025-12-01 05:30:00', '', 0, 0),
(1182, 'BK061ARF', '1', NULL, 'FORD', 'Model-61', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-03', NULL, '2025-12-01 05:31:00', '', 1, 0),
(1183, 'BK062ARF', '1', NULL, 'TATA', 'Model-62', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-04', NULL, '2025-12-01 05:32:00', '', 0, 0),
(1184, 'BK063ARF', '1', NULL, 'MAHINDRA', 'Model-63', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05', NULL, '2025-12-01 05:33:00', '', 1, 0),
(1185, 'BK064ARF', '1', NULL, 'HYUNDAI', 'Model-64', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-06', NULL, '2025-12-01 05:34:00', '', 0, 0),
(1186, 'BK065ARF', '1', NULL, 'FORD', 'Model-65', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07', NULL, '2025-12-01 05:35:00', '', 1, 0),
(1187, 'BK066ARF', '1', NULL, 'TATA', 'Model-66', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-08', NULL, '2025-12-01 05:36:00', '', 0, 0),
(1188, 'BK067ARF', '1', NULL, 'MAHINDRA', 'Model-67', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09', NULL, '2025-12-01 05:37:00', '', 1, 0),
(1189, 'BK068ARF', '1', NULL, 'HYUNDAI', 'Model-68', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10', NULL, '2025-12-01 05:38:00', '', 0, 0),
(1190, 'BK069ARF', '1', NULL, 'FORD', 'Model-69', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-11', NULL, '2025-12-01 05:39:00', '', 1, 0),
(1191, 'BK070ARF', '1', NULL, 'TATA', 'Model-70', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12', NULL, '2025-12-01 05:40:00', '', 0, 0),
(1192, 'BK071ARF', '1', NULL, 'MAHINDRA', 'Model-71', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-13', NULL, '2025-12-01 05:41:00', '', 1, 0),
(1193, 'BK072ARF', '1', NULL, 'HYUNDAI', 'Model-72', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14', NULL, '2025-12-01 05:42:00', '', 0, 0),
(1194, 'BK073ARF', '1', NULL, 'FORD', 'Model-73', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15', NULL, '2025-12-01 05:43:00', '', 1, 0),
(1195, 'BK074ARF', '1', NULL, 'TATA', 'Model-74', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-16', NULL, '2025-12-01 05:44:00', '', 0, 0),
(1196, 'BK075ARF', '1', NULL, 'MAHINDRA', 'Model-75', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17', NULL, '2025-12-01 05:45:00', '', 1, 0),
(1197, 'BK076ARF', '1', NULL, 'HYUNDAI', 'Model-76', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18', NULL, '2025-12-01 05:46:00', '', 0, 0),
(1198, 'BK077ARF', '1', NULL, 'FORD', 'Model-77', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19', NULL, '2025-12-01 05:47:00', '', 1, 0),
(1199, 'BK078ARF', '1', NULL, 'TATA', 'Model-78', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-20', NULL, '2025-12-01 05:48:00', '', 0, 0),
(1200, 'BK079ARF', '1', NULL, 'MAHINDRA', 'Model-79', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-21', NULL, '2025-12-01 05:49:00', '', 1, 0),
(1201, 'BK080ARF', '1', NULL, 'HYUNDAI', 'Model-80', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22', NULL, '2025-12-01 05:50:00', '', 0, 0),
(1202, 'BK081ARF', '1', NULL, 'FORD', 'Model-81', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-23', NULL, '2025-12-01 05:51:00', '', 1, 0),
(1203, 'BK082ARF', '1', NULL, 'TATA', 'Model-82', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24', NULL, '2025-12-01 05:52:00', '', 0, 0),
(1204, 'BK083ARF', '1', NULL, 'MAHINDRA', 'Model-83', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-25', NULL, '2025-12-01 05:53:00', '', 1, 0),
(1205, 'BK084ARF', '1', NULL, 'HYUNDAI', 'Model-84', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-26', NULL, '2025-12-01 05:54:00', '', 0, 0),
(1206, 'BK085ARF', '1', NULL, 'FORD', 'Model-85', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27', NULL, '2025-12-01 05:55:00', '', 1, 0),
(1207, 'BK086ARF', '1', NULL, 'TATA', 'Model-86', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-28', NULL, '2025-12-01 05:56:00', '', 0, 0),
(1208, 'BK087ARF', '1', NULL, 'MAHINDRA', 'Model-87', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29', NULL, '2025-12-01 05:57:00', '', 1, 0),
(1209, 'BK088ARF', '1', NULL, 'HYUNDAI', 'Model-88', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30', NULL, '2025-12-01 05:58:00', '', 0, 0),
(1210, 'BK089ARF', '1', NULL, 'FORD', 'Model-89', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31', NULL, '2025-12-01 05:59:00', '', 1, 0),
(1211, 'BK090ARF', '1', NULL, 'TATA', 'Model-90', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, '2025-12-01 06:00:00', '', 0, 0),
(1212, 'BK091ARF', '1', NULL, 'MAHINDRA', 'Model-91', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-02', NULL, '2025-12-01 06:01:00', '', 1, 0),
(1213, 'BK092ARF', '1', NULL, 'HYUNDAI', 'Model-92', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-03', NULL, '2025-12-01 06:02:00', '', 0, 0),
(1214, 'BK093ARF', '1', NULL, 'FORD', 'Model-93', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-04', NULL, '2025-12-01 06:03:00', '', 1, 0),
(1215, 'BK094ARF', '1', NULL, 'TATA', 'Model-94', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-05', NULL, '2025-12-01 06:04:00', '', 0, 0),
(1216, 'BK095ARF', '1', NULL, 'MAHINDRA', 'Model-95', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-06', NULL, '2025-12-01 06:05:00', '', 1, 0),
(1217, 'BK096ARF', '1', NULL, 'HYUNDAI', 'Model-96', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-07', NULL, '2025-12-01 06:06:00', '', 0, 0),
(1218, 'BK097ARF', '1', NULL, 'FORD', 'Model-97', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-08', NULL, '2025-12-01 06:07:00', '', 1, 0),
(1219, 'BK098ARF', '1', NULL, 'TATA', 'Model-98', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-09', NULL, '2025-12-01 06:08:00', '', 0, 0),
(1220, 'BK099ARF', '1', NULL, 'MAHINDRA', 'Model-99', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-10', NULL, '2025-12-01 06:09:00', '', 1, 0),
(1221, 'BK100ARF', '1', NULL, 'HYUNDAI', 'Model-100', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11', NULL, '2025-12-01 06:10:00', '', 0, 0),
(1222, 'BK101ARF', '1', NULL, 'FORD', 'Model-101', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12', NULL, '2025-12-01 06:11:00', '', 1, 0),
(1223, 'BK102ARF', '1', NULL, 'TATA', 'Model-102', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-13', NULL, '2025-12-01 06:12:00', '', 0, 0),
(1224, 'BK103ARF', '1', NULL, 'MAHINDRA', 'Model-103', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14', NULL, '2025-12-01 06:13:00', '', 1, 0),
(1225, 'BK104ARF', '1', NULL, 'HYUNDAI', 'Model-104', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-15', NULL, '2025-12-01 06:14:00', '', 0, 0),
(1226, 'BK105ARF', '1', NULL, 'FORD', 'Model-105', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-16', NULL, '2025-12-01 06:15:00', '', 1, 0),
(1227, 'BK106ARF', '1', NULL, 'TATA', 'Model-106', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-17', NULL, '2025-12-01 06:16:00', '', 0, 0),
(1228, 'BK107ARF', '1', NULL, 'MAHINDRA', 'Model-107', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-18', NULL, '2025-12-01 06:17:00', '', 1, 0),
(1229, 'BK108ARF', '1', NULL, 'HYUNDAI', 'Model-108', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-19', NULL, '2025-12-01 06:18:00', '', 0, 0),
(1230, 'BK109ARF', '1', NULL, 'FORD', 'Model-109', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20', NULL, '2025-12-01 06:19:00', '', 1, 0),
(1231, 'BK110ARF', '1', NULL, 'TATA', 'Model-110', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21', NULL, '2025-12-01 06:20:00', '', 0, 0),
(1232, 'BK111ARF', '1', NULL, 'MAHINDRA', 'Model-111', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22', NULL, '2025-12-01 06:21:00', '', 1, 0),
(1233, 'BK112ARF', '1', NULL, 'HYUNDAI', 'Model-112', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-23', NULL, '2025-12-01 06:22:00', '', 0, 0),
(1234, 'BK113ARF', '1', NULL, 'FORD', 'Model-113', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-24', NULL, '2025-12-01 06:23:00', '', 1, 0),
(1235, 'BK114ARF', '1', NULL, 'TATA', 'Model-114', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-25', NULL, '2025-12-01 06:24:00', '', 0, 0),
(1236, 'BK115ARF', '1', NULL, 'MAHINDRA', 'Model-115', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-26', NULL, '2025-12-01 06:25:00', '', 1, 0),
(1237, 'BK116ARF', '1', NULL, 'HYUNDAI', 'Model-116', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-27', NULL, '2025-12-01 06:26:00', '', 0, 0),
(1238, 'BK117ARF', '1', NULL, 'FORD', 'Model-117', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-28', NULL, '2025-12-01 06:27:00', '', 1, 0),
(1239, 'BK118ARF', '1', NULL, 'TATA', 'Model-118', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29', NULL, '2025-12-01 06:28:00', '', 0, 0),
(1240, 'BK119ARF', '1', NULL, 'MAHINDRA', 'Model-119', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30', NULL, '2025-12-01 06:29:00', '', 1, 0),
(1241, 'BK120ARF', '1', NULL, 'HYUNDAI', 'Model-120', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-01', NULL, '2025-12-01 06:30:00', '', 0, 0),
(1242, 'BK121ARF', '1', NULL, 'FORD', 'Model-121', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-02', NULL, '2025-12-01 06:31:00', '', 1, 0),
(1243, 'BK122ARF', '1', NULL, 'TATA', 'Model-122', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-03', NULL, '2025-12-01 06:32:00', '', 0, 0),
(1244, 'BK123ARF', '1', NULL, 'MAHINDRA', 'Model-123', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04', NULL, '2025-12-01 06:33:00', '', 1, 0),
(1245, 'BK124ARF', '1', NULL, 'HYUNDAI', 'Model-124', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05', NULL, '2025-12-01 06:34:00', '', 0, 0),
(1246, 'BK125ARF', '1', NULL, 'FORD', 'Model-125', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06', NULL, '2025-12-01 06:35:00', '', 1, 0),
(1247, 'BK126ARF', '1', NULL, 'TATA', 'Model-126', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-07', NULL, '2025-12-01 06:36:00', '', 0, 0),
(1248, 'BK127ARF', '1', NULL, 'MAHINDRA', 'Model-127', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-08', NULL, '2025-12-01 06:37:00', '', 1, 0),
(1249, 'BK128ARF', '1', NULL, 'HYUNDAI', 'Model-128', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-09', NULL, '2025-12-01 06:38:00', '', 0, 0),
(1250, 'BK129ARF', '1', NULL, 'FORD', 'Model-129', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10', NULL, '2025-12-01 06:39:00', '', 1, 0),
(1251, 'BK130ARF', '1', NULL, 'TATA', 'Model-130', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-11', NULL, '2025-12-01 06:40:00', '', 0, 0),
(1252, 'BK131ARF', '1', NULL, 'MAHINDRA', 'Model-131', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-12', NULL, '2025-12-01 06:41:00', '', 1, 0),
(1253, 'BK132ARF', '1', NULL, 'HYUNDAI', 'Model-132', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-13', NULL, '2025-12-01 06:42:00', '', 0, 0),
(1254, 'BK133ARF', '1', NULL, 'FORD', 'Model-133', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-14', NULL, '2025-12-01 06:43:00', '', 1, 0),
(1255, 'BK134ARF', '1', NULL, 'TATA', 'Model-134', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15', NULL, '2025-12-01 06:44:00', '', 0, 0),
(1256, 'BK135ARF', '1', NULL, 'MAHINDRA', 'Model-135', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-16', NULL, '2025-12-01 06:45:00', '', 1, 0),
(1257, 'BK136ARF', '1', NULL, 'HYUNDAI', 'Model-136', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17', NULL, '2025-12-01 06:46:00', '', 0, 0),
(1258, 'BK137ARF', '1', NULL, 'FORD', 'Model-137', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-18', NULL, '2025-12-01 06:47:00', '', 1, 0),
(1259, 'BK138ARF', '1', NULL, 'TATA', 'Model-138', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-19', NULL, '2025-12-01 06:48:00', '', 0, 0),
(1260, 'BK139ARF', '1', NULL, 'MAHINDRA', 'Model-139', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-20', NULL, '2025-12-01 06:49:00', '', 1, 0),
(1261, 'BK140ARF', '1', NULL, 'HYUNDAI', 'Model-140', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-21', NULL, '2025-12-01 06:50:00', '', 0, 0),
(1262, 'BK141ARF', '1', NULL, 'FORD', 'Model-141', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-22', NULL, '2025-12-01 06:51:00', '', 1, 0),
(1263, 'BK142ARF', '1', NULL, 'TATA', 'Model-142', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-23', NULL, '2025-12-01 06:52:00', '', 0, 0),
(1264, 'BK143ARF', '1', NULL, 'MAHINDRA', 'Model-143', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-24', NULL, '2025-12-01 06:53:00', '', 1, 0),
(1265, 'BK144ARF', '1', NULL, 'HYUNDAI', 'Model-144', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-25', NULL, '2025-12-01 06:54:00', '', 0, 0),
(1266, 'BK145ARF', '1', NULL, 'FORD', 'Model-145', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-26', NULL, '2025-12-01 06:55:00', '', 1, 0),
(1267, 'BK146ARF', '1', NULL, 'TATA', 'Model-146', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27', NULL, '2025-12-01 06:56:00', '', 0, 0),
(1268, 'BK147ARF', '1', NULL, 'MAHINDRA', 'Model-147', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-28', NULL, '2025-12-01 06:57:00', '', 1, 0),
(1269, 'BK148ARF', '1', NULL, 'HYUNDAI', 'Model-148', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29', NULL, '2025-12-01 06:58:00', '', 0, 0),
(1270, 'BK149ARF', '1', NULL, 'FORD', 'Model-149', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-30', NULL, '2025-12-01 06:59:00', '', 1, 0),
(1271, 'BK150ARF', '1', NULL, 'TATA', 'Model-150', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-31', NULL, '2025-12-01 07:00:00', '', 0, 0),
(1272, 'BK151ARF', '1', NULL, 'MAHINDRA', 'Model-151', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-01', NULL, '2025-12-01 07:01:00', '', 1, 0),
(1273, 'BK152ARF', '1', NULL, 'HYUNDAI', 'Model-152', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02', NULL, '2025-12-01 07:02:00', '', 0, 0),
(1274, 'BK153ARF', '1', NULL, 'FORD', 'Model-153', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-03', NULL, '2025-12-01 07:03:00', '', 1, 0),
(1275, 'BK154ARF', '1', NULL, 'TATA', 'Model-154', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-04', NULL, '2025-12-01 07:04:00', '', 0, 0),
(1276, 'BK155ARF', '1', NULL, 'MAHINDRA', 'Model-155', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-05', NULL, '2025-12-01 07:05:00', '', 1, 0),
(1277, 'BK156ARF', '1', NULL, 'HYUNDAI', 'Model-156', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06', NULL, '2025-12-01 07:06:00', '', 0, 0),
(1278, 'BK157ARF', '1', NULL, 'FORD', 'Model-157', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-07', NULL, '2025-12-01 07:07:00', '', 1, 0),
(1279, 'BK158ARF', '1', NULL, 'TATA', 'Model-158', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08', NULL, '2025-12-01 07:08:00', '', 0, 0),
(1280, 'BK159ARF', '1', NULL, 'MAHINDRA', 'Model-159', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-09', NULL, '2025-12-01 07:09:00', '', 1, 0),
(1281, 'BK160ARF', '1', NULL, 'HYUNDAI', 'Model-160', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10', NULL, '2025-12-01 07:10:00', '', 0, 0),
(1282, 'BK161ARF', '1', NULL, 'FORD', 'Model-161', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-11', NULL, '2025-12-01 07:11:00', '', 1, 0),
(1283, 'BK162ARF', '1', NULL, 'TATA', 'Model-162', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-12', NULL, '2025-12-01 07:12:00', '', 0, 0),
(1284, 'BK163ARF', '1', NULL, 'MAHINDRA', 'Model-163', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-13', NULL, '2025-12-01 07:13:00', '', 1, 0),
(1285, 'BK164ARF', '1', NULL, 'HYUNDAI', 'Model-164', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14', NULL, '2025-12-01 07:14:00', '', 0, 0),
(1286, 'BK165ARF', '1', NULL, 'FORD', 'Model-165', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15', NULL, '2025-12-01 07:15:00', '', 1, 0),
(1287, 'BK166ARF', '1', NULL, 'TATA', 'Model-166', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16', NULL, '2025-12-01 07:16:00', '', 0, 0),
(1288, 'BK167ARF', '1', NULL, 'MAHINDRA', 'Model-167', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, '2025-12-01 07:17:00', '', 1, 0),
(1289, 'BK168ARF', '1', NULL, 'HYUNDAI', 'Model-168', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18', NULL, '2025-12-01 07:18:00', '', 0, 0),
(1290, 'BK169ARF', '1', NULL, 'FORD', 'Model-169', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-19', NULL, '2025-12-01 07:19:00', '', 1, 0),
(1291, 'BK170ARF', '1', NULL, 'TATA', 'Model-170', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-20', NULL, '2025-12-01 07:20:00', '', 0, 0),
(1292, 'BK171ARF', '1', NULL, 'MAHINDRA', 'Model-171', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-21', NULL, '2025-12-01 07:21:00', '', 1, 0),
(1293, 'BK172ARF', '1', NULL, 'HYUNDAI', 'Model-172', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22', NULL, '2025-12-01 07:22:00', '', 0, 0),
(1294, 'BK173ARF', '1', NULL, 'FORD', 'Model-173', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23', NULL, '2025-12-01 07:23:00', '', 0, 0),
(1295, 'BK174ARF', '1', NULL, 'TATA', 'Model-174', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24', NULL, '2025-12-01 07:24:00', '', 0, 0),
(1296, 'BK175ARF', '1', NULL, 'MAHINDRA', 'Model-175', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25', NULL, '2025-12-01 07:25:00', '', 1, 0),
(1297, 'BK176ARF', '1', NULL, 'HYUNDAI', 'Model-176', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-26', NULL, '2025-12-01 07:26:00', '', 0, 0),
(1298, 'BK177ARF', '1', NULL, 'FORD', 'Model-177', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-27', NULL, '2025-12-01 07:27:00', '', 1, 0),
(1299, 'BK178ARF', '1', NULL, 'TATA', 'Model-178', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-28', NULL, '2025-12-01 07:28:00', '', 0, 0),
(1300, 'BK179ARF', '1', NULL, 'MAHINDRA', 'Model-179', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29', NULL, '2025-12-01 07:29:00', '', 1, 0),
(1301, 'BK180ARF', '1', NULL, 'HYUNDAI', 'Model-180', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-30', NULL, '2025-12-01 07:30:00', '', 0, 0),
(1302, 'BK181ARF', '1', NULL, 'FORD', 'Model-181', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01', NULL, '2025-12-01 07:31:00', '', 1, 0),
(1303, 'BK182ARF', '1', NULL, 'TATA', 'Model-182', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02', NULL, '2025-12-01 07:32:00', '', 0, 0),
(1304, 'BK183ARF', '1', NULL, 'MAHINDRA', 'Model-183', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-03', NULL, '2025-12-01 07:33:00', '', 1, 0),
(1305, 'BK184ARF', '1', NULL, 'HYUNDAI', 'Model-184', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-04', NULL, '2025-12-01 07:34:00', '', 0, 0),
(1306, 'BK185ARF', '1', NULL, 'FORD', 'Model-185', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-05', NULL, '2025-12-01 07:35:00', '', 1, 0),
(1307, 'BK186ARF', '1', NULL, 'TATA', 'Model-186', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06', NULL, '2025-12-01 07:36:00', '', 0, 0),
(1308, 'BK187ARF', '1', NULL, 'MAHINDRA', 'Model-187', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07', NULL, '2025-12-01 07:37:00', '', 1, 0),
(1309, 'BK188ARF', '1', NULL, 'HYUNDAI', 'Model-188', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-08', NULL, '2025-12-01 07:38:00', '', 0, 0),
(1310, 'BK189ARF', '1', NULL, 'FORD', 'Model-189', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-09', NULL, '2025-12-01 07:39:00', '', 1, 0),
(1311, 'BK190ARF', '1', NULL, 'TATA', 'Model-190', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10', NULL, '2025-12-01 07:40:00', '', 0, 0),
(1312, 'BK191ARF', '1', NULL, 'MAHINDRA', 'Model-191', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-11', NULL, '2025-12-01 07:41:00', '', 1, 0),
(1313, 'BK192ARF', '1', NULL, 'HYUNDAI', 'Model-192', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12', NULL, '2025-12-01 07:42:00', '', 0, 0),
(1314, 'BK193ARF', '1', NULL, 'FORD', 'Model-193', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', NULL, '2025-12-01 07:43:00', '', 1, 0),
(1315, 'BK194ARF', '1', NULL, 'TATA', 'Model-194', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', NULL, '2025-12-01 07:44:00', '', 0, 0),
(1316, 'BK195ARF', '1', NULL, 'MAHINDRA', 'Model-195', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15', NULL, '2025-12-01 07:45:00', '', 1, 0),
(1317, 'BK196ARF', '1', NULL, 'HYUNDAI', 'Model-196', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-16', NULL, '2025-12-01 07:46:00', '', 0, 0),
(1318, 'BK197ARF', '1', NULL, 'FORD', 'Model-197', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-17', NULL, '2025-12-01 07:47:00', '', 1, 0),
(1319, 'BK198ARF', '1', NULL, 'TATA', 'Model-198', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-18', NULL, '2025-12-01 07:48:00', '', 0, 0),
(1320, 'BK199ARF', '1', NULL, 'MAHINDRA', 'Model-199', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-19', NULL, '2025-12-01 07:49:00', '', 1, 0),
(1321, 'BK200ARF', '1', NULL, 'HYUNDAI', 'Model-200', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-20', NULL, '2025-12-01 07:50:00', '', 0, 0),
(1322, 'BK201ARF', '1', NULL, 'FORD', 'Model-201', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-21', NULL, '2025-12-01 07:51:00', '', 1, 0),
(1323, 'BK202ARF', '1', NULL, 'TATA', 'Model-202', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-22', NULL, '2025-12-01 07:52:00', '', 0, 0),
(1324, 'BK203ARF', '1', NULL, 'MAHINDRA', 'Model-203', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-23', NULL, '2025-12-01 07:53:00', '', 1, 0),
(1325, 'BK204ARF', '1', NULL, 'HYUNDAI', 'Model-204', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-24', NULL, '2025-12-01 07:54:00', '', 0, 0),
(1326, 'BK205ARF', '1', NULL, 'FORD', 'Model-205', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-25', NULL, '2025-12-01 07:55:00', '', 1, 0),
(1327, 'BK206ARF', '1', NULL, 'TATA', 'Model-206', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-26', NULL, '2025-12-01 07:56:00', '', 0, 0),
(1328, 'BK207ARF', '1', NULL, 'MAHINDRA', 'Model-207', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27', NULL, '2025-12-01 07:57:00', '', 1, 0),
(1329, 'BK208ARF', '1', NULL, 'HYUNDAI', 'Model-208', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-28', NULL, '2025-12-01 07:58:00', '', 0, 0),
(1330, 'BK209ARF', '1', NULL, 'FORD', 'Model-209', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29', NULL, '2025-12-01 07:59:00', '', 1, 0),
(1331, 'BK210ARF', '1', NULL, 'TATA', 'Model-210', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-30', NULL, '2025-12-01 08:00:00', '', 0, 0),
(1332, 'BK211ARF', '1', NULL, 'MAHINDRA', 'Model-211', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-31', NULL, '2025-12-01 08:01:00', '', 1, 0),
(1333, 'BK212ARF', '1', NULL, 'HYUNDAI', 'Model-212', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-01', NULL, '2025-12-01 08:02:00', '', 0, 0),
(1334, 'BK213ARF', '1', NULL, 'FORD', 'Model-213', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-02', NULL, '2025-12-01 08:03:00', '', 1, 0),
(1335, 'BK214ARF', '1', NULL, 'TATA', 'Model-214', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-03', NULL, '2025-12-01 08:04:00', '', 0, 0),
(1336, 'BK215ARF', '1', NULL, 'MAHINDRA', 'Model-215', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-04', NULL, '2025-12-01 08:05:00', '', 1, 0),
(1337, 'BK216ARF', '1', NULL, 'HYUNDAI', 'Model-216', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-05', NULL, '2025-12-01 08:06:00', '', 0, 0),
(1338, 'BK217ARF', '1', NULL, 'FORD', 'Model-217', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-06', NULL, '2025-12-01 08:07:00', '', 1, 0),
(1339, 'BK218ARF', '1', NULL, 'TATA', 'Model-218', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-07', NULL, '2025-12-01 08:08:00', '', 0, 0),
(1340, 'BK219ARF', '1', NULL, 'MAHINDRA', 'Model-219', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-08', NULL, '2025-12-01 08:09:00', '', 1, 0),
(1341, 'BK220ARF', '1', NULL, 'HYUNDAI', 'Model-220', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-09', NULL, '2025-12-01 08:10:00', '', 0, 0),
(1342, 'BK221ARF', '1', NULL, 'FORD', 'Model-221', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-10', NULL, '2025-12-01 08:11:00', '', 1, 0),
(1343, 'BK222ARF', '1', NULL, 'TATA', 'Model-222', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11', NULL, '2025-12-01 08:12:00', '', 0, 0),
(1344, 'BK223ARF', '1', NULL, 'MAHINDRA', 'Model-223', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-12', NULL, '2025-12-01 08:13:00', '', 1, 0),
(1345, 'BK224ARF', '1', NULL, 'HYUNDAI', 'Model-224', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-13', NULL, '2025-12-01 08:14:00', '', 0, 0),
(1346, 'BK225ARF', '1', NULL, 'FORD', 'Model-225', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-14', NULL, '2025-12-01 08:15:00', '', 1, 0),
(1347, 'BK226ARF', '1', NULL, 'TATA', 'Model-226', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-15', NULL, '2025-12-01 08:16:00', '', 0, 0),
(1348, 'BK227ARF', '1', NULL, 'MAHINDRA', 'Model-227', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, '2025-12-01 08:17:00', '', 1, 0),
(1349, 'BK228ARF', '1', NULL, 'HYUNDAI', 'Model-228', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17', NULL, '2025-12-01 08:18:00', '', 0, 0),
(1350, 'BK229ARF', '1', NULL, 'FORD', 'Model-229', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-18', NULL, '2025-12-01 08:19:00', '', 1, 0),
(1351, 'BK230ARF', '1', NULL, 'TATA', 'Model-230', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19', NULL, '2025-12-01 08:20:00', '', 0, 0),
(1352, 'BK231ARF', '1', NULL, 'MAHINDRA', 'Model-231', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20', NULL, '2025-12-01 08:21:00', '', 1, 0),
(1353, 'BK232ARF', '1', NULL, 'HYUNDAI', 'Model-232', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-21', NULL, '2025-12-01 08:22:00', '', 0, 0),
(1354, 'BK233ARF', '1', NULL, 'FORD', 'Model-233', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-22', NULL, '2025-12-01 08:23:00', '', 1, 0),
(1355, 'BK234ARF', '1', NULL, 'TATA', 'Model-234', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-23', NULL, '2025-12-01 08:24:00', '', 0, 0),
(1356, 'BK235ARF', '1', NULL, 'MAHINDRA', 'Model-235', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-24', NULL, '2025-12-01 08:25:00', '', 1, 0),
(1357, 'BK236ARF', '1', NULL, 'HYUNDAI', 'Model-236', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-25', NULL, '2025-12-01 08:26:00', '', 0, 0),
(1358, 'BK237ARF', '1', NULL, 'FORD', 'Model-237', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26', NULL, '2025-12-01 08:27:00', '', 1, 0),
(1359, 'BK238ARF', '1', NULL, 'TATA', 'Model-238', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27', NULL, '2025-12-01 08:28:00', '', 0, 0),
(1360, 'BK239ARF', '1', NULL, 'MAHINDRA', 'Model-239', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-28', NULL, '2025-12-01 08:29:00', '', 1, 0),
(1361, 'BK240ARF', '1', NULL, 'HYUNDAI', 'Model-240', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-29', NULL, '2025-12-01 08:30:00', '', 0, 0),
(1362, 'BK241ARF', '1', NULL, 'FORD', 'Model-241', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-30', NULL, '2025-12-01 08:31:00', '', 1, 0),
(1377, 'BK001ARF', '1', NULL, 'FORD', 'Model-1', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-02', NULL, '2025-12-01 04:31:00', '', 1, 0),
(1378, 'BK002ARF', '1', NULL, 'TATA', 'Model-2', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03', NULL, '2025-12-01 04:32:00', '', 0, 0),
(1379, 'BK003ARF', '1', NULL, 'MAHINDRA', 'Model-3', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-04', NULL, '2025-12-01 04:33:00', '', 1, 0),
(1380, 'BK004ARF', '1', NULL, 'HYUNDAI', 'Model-4', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05', NULL, '2025-12-01 04:34:00', '', 0, 0),
(1381, 'BK005ARF', '1', NULL, 'FORD', 'Model-5', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-06', NULL, '2025-12-01 04:35:00', '', 1, 0),
(1382, 'BK006ARF', '1', NULL, 'TATA', 'Model-6', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-07', NULL, '2025-12-01 04:36:00', '', 0, 0),
(1383, 'BK007ARF', '1', NULL, 'MAHINDRA', 'Model-7', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-08', NULL, '2025-12-01 04:37:00', '', 1, 0),
(1384, 'BK008ARF', '1', NULL, 'HYUNDAI', 'Model-8', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-09', NULL, '2025-12-01 04:38:00', '', 0, 0),
(1385, 'BK009ARF', '1', NULL, 'FORD', 'Model-9', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-10', NULL, '2025-12-01 04:39:00', '', 1, 0),
(1386, 'BK010ARF', '1', NULL, 'TATA', 'Model-10', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-11', NULL, '2025-12-01 04:40:00', '', 0, 0),
(1387, 'BK011ARF', '1', NULL, 'MAHINDRA', 'Model-11', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12', NULL, '2025-12-01 04:41:00', '', 1, 0),
(1388, 'BK012ARF', '1', NULL, 'HYUNDAI', 'Model-12', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-13', NULL, '2025-12-01 04:42:00', '', 0, 0),
(1389, 'BK013ARF', '1', NULL, 'FORD', 'Model-13', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-14', NULL, '2025-12-01 04:43:00', '', 1, 0),
(1390, 'BK014ARF', '1', NULL, 'TATA', 'Model-14', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-15', NULL, '2025-12-01 04:44:00', '', 0, 0),
(1391, 'BK015ARF', '1', NULL, 'MAHINDRA', 'Model-15', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-16', NULL, '2025-12-01 04:45:00', '', 1, 0),
(1392, 'BK016ARF', '1', NULL, 'HYUNDAI', 'Model-16', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17', NULL, '2025-12-01 04:46:00', '', 0, 0),
(1393, 'BK017ARF', '1', NULL, 'FORD', 'Model-17', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-18', NULL, '2025-12-01 04:47:00', '', 1, 0),
(1394, 'BK018ARF', '1', NULL, 'TATA', 'Model-18', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-19', NULL, '2025-12-01 04:48:00', '', 0, 0),
(1395, 'BK019ARF', '1', NULL, 'MAHINDRA', 'Model-19', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-20', NULL, '2025-12-01 04:49:00', '', 1, 0),
(1396, 'BK020ARF', '1', NULL, 'HYUNDAI', 'Model-20', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21', NULL, '2025-12-01 04:50:00', '', 0, 0),
(1397, 'BK021ARF', '1', NULL, 'FORD', 'Model-21', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22', NULL, '2025-12-01 04:51:00', '', 1, 0),
(1398, 'BK022ARF', '1', NULL, 'TATA', 'Model-22', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-23', NULL, '2025-12-01 04:52:00', '', 0, 0),
(1399, 'BK023ARF', '1', NULL, 'MAHINDRA', 'Model-23', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24', NULL, '2025-12-01 04:53:00', '', 1, 0),
(1400, 'BK024ARF', '1', NULL, 'HYUNDAI', 'Model-24', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-25', NULL, '2025-12-01 04:54:00', '', 0, 0),
(1401, 'BK025ARF', '1', NULL, 'FORD', 'Model-25', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-26', NULL, '2025-12-01 04:55:00', '', 1, 0),
(1402, 'BK026ARF', '1', NULL, 'TATA', 'Model-26', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-27', NULL, '2025-12-01 04:56:00', '', 0, 0),
(1403, 'BK027ARF', '1', NULL, 'MAHINDRA', 'Model-27', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-28', NULL, '2025-12-01 04:57:00', '', 1, 0),
(1404, 'BK028ARF', '1', NULL, 'HYUNDAI', 'Model-28', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-29', NULL, '2025-12-01 04:58:00', '', 0, 0),
(1405, 'BK029ARF', '1', NULL, 'FORD', 'Model-29', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30', NULL, '2025-12-01 04:59:00', '', 1, 0),
(1406, 'BK030ARF', '1', NULL, 'TATA', 'Model-30', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-31', NULL, '2025-12-01 05:00:00', '', 0, 0),
(1407, 'BK031ARF', '1', NULL, 'MAHINDRA', 'Model-31', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01', NULL, '2025-12-01 05:01:00', '', 1, 0),
(1408, 'BK032ARF', '1', NULL, 'HYUNDAI', 'Model-32', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02', NULL, '2025-12-01 05:02:00', '', 0, 0),
(1409, 'BK033ARF', '1', NULL, 'FORD', 'Model-33', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-03', NULL, '2025-12-01 05:03:00', '', 1, 0),
(1410, 'BK034ARF', '1', NULL, 'TATA', 'Model-34', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-04', NULL, '2025-12-01 05:04:00', '', 0, 0),
(1411, 'BK035ARF', '1', NULL, 'MAHINDRA', 'Model-35', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-05', NULL, '2025-12-01 05:05:00', '', 1, 0),
(1412, 'BK036ARF', '1', NULL, 'HYUNDAI', 'Model-36', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-06', NULL, '2025-12-01 05:06:00', '', 0, 0),
(1413, 'BK037ARF', '1', NULL, 'FORD', 'Model-37', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-07', NULL, '2025-12-01 05:07:00', '', 1, 0),
(1414, 'BK038ARF', '1', NULL, 'TATA', 'Model-38', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-08', NULL, '2025-12-01 05:08:00', '', 0, 0),
(1415, 'BK039ARF', '1', NULL, 'MAHINDRA', 'Model-39', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09', NULL, '2025-12-01 05:09:00', '', 1, 0),
(1416, 'BK040ARF', '1', NULL, 'HYUNDAI', 'Model-40', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-10', NULL, '2025-12-01 05:10:00', '', 0, 0),
(1417, 'BK041ARF', '1', NULL, 'FORD', 'Model-41', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11', NULL, '2025-12-01 05:11:00', '', 1, 0),
(1418, 'BK042ARF', '1', NULL, 'TATA', 'Model-42', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-12', NULL, '2025-12-01 05:12:00', '', 0, 0),
(1419, 'BK043ARF', '1', NULL, 'MAHINDRA', 'Model-43', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-13', NULL, '2025-12-01 05:13:00', '', 1, 0),
(1420, 'BK044ARF', '1', NULL, 'HYUNDAI', 'Model-44', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-14', NULL, '2025-12-01 05:14:00', '', 0, 0),
(1421, 'BK045ARF', '1', NULL, 'FORD', 'Model-45', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-15', NULL, '2025-12-01 05:15:00', '', 1, 0),
(1422, 'BK046ARF', '1', NULL, 'TATA', 'Model-46', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16', NULL, '2025-12-01 05:16:00', '', 0, 0),
(1423, 'BK047ARF', '1', NULL, 'MAHINDRA', 'Model-47', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17', NULL, '2025-12-01 05:17:00', '', 1, 0),
(1424, 'BK048ARF', '1', NULL, 'HYUNDAI', 'Model-48', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18', NULL, '2025-12-01 05:18:00', '', 0, 0),
(1425, 'BK049ARF', '1', NULL, 'FORD', 'Model-49', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-19', NULL, '2025-12-01 05:19:00', '', 1, 0),
(1426, 'BK050ARF', '1', NULL, 'TATA', 'Model-50', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-20', NULL, '2025-12-01 05:20:00', '', 0, 0),
(1427, 'BK051ARF', '1', NULL, 'MAHINDRA', 'Model-51', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', NULL, '2025-12-01 05:21:00', '', 1, 0),
(1428, 'BK052ARF', '1', NULL, 'HYUNDAI', 'Model-52', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-22', NULL, '2025-12-01 05:22:00', '', 0, 0),
(1429, 'BK053ARF', '1', NULL, 'FORD', 'Model-53', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-23', NULL, '2025-12-01 05:23:00', '', 1, 0),
(1430, 'BK054ARF', '1', NULL, 'TATA', 'Model-54', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24', NULL, '2025-12-01 05:24:00', '', 0, 0),
(1431, 'BK055ARF', '1', NULL, 'MAHINDRA', 'Model-55', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-25', NULL, '2025-12-01 05:25:00', '', 1, 0),
(1432, 'BK056ARF', '1', NULL, 'HYUNDAI', 'Model-56', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-26', NULL, '2025-12-01 05:26:00', '', 0, 0),
(1433, 'BK057ARF', '1', NULL, 'FORD', 'Model-57', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-27', NULL, '2025-12-01 05:27:00', '', 1, 0),
(1434, 'BK058ARF', '1', NULL, 'TATA', 'Model-58', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-28', NULL, '2025-12-01 05:28:00', '', 0, 0),
(1435, 'BK059ARF', '1', NULL, 'MAHINDRA', 'Model-59', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-01', NULL, '2025-12-01 05:29:00', '', 1, 0),
(1436, 'BK060ARF', '1', NULL, 'HYUNDAI', 'Model-60', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-02', NULL, '2025-12-01 05:30:00', '', 0, 0),
(1437, 'BK061ARF', '1', NULL, 'FORD', 'Model-61', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-03', NULL, '2025-12-01 05:31:00', '', 1, 0),
(1438, 'BK062ARF', '1', NULL, 'TATA', 'Model-62', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-04', NULL, '2025-12-01 05:32:00', '', 0, 0),
(1439, 'BK063ARF', '1', NULL, 'MAHINDRA', 'Model-63', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-05', NULL, '2025-12-01 05:33:00', '', 1, 0),
(1440, 'BK064ARF', '1', NULL, 'HYUNDAI', 'Model-64', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-06', NULL, '2025-12-01 05:34:00', '', 0, 0),
(1441, 'BK065ARF', '1', NULL, 'FORD', 'Model-65', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07', NULL, '2025-12-01 05:35:00', '', 1, 0),
(1442, 'BK066ARF', '1', NULL, 'TATA', 'Model-66', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-08', NULL, '2025-12-01 05:36:00', '', 0, 0),
(1443, 'BK067ARF', '1', NULL, 'MAHINDRA', 'Model-67', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09', NULL, '2025-12-01 05:37:00', '', 1, 0),
(1444, 'BK068ARF', '1', NULL, 'HYUNDAI', 'Model-68', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10', NULL, '2025-12-01 05:38:00', '', 0, 0),
(1445, 'BK069ARF', '1', NULL, 'FORD', 'Model-69', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-11', NULL, '2025-12-01 05:39:00', '', 1, 0),
(1446, 'BK070ARF', '1', NULL, 'TATA', 'Model-70', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12', NULL, '2025-12-01 05:40:00', '', 0, 0),
(1447, 'BK071ARF', '1', NULL, 'MAHINDRA', 'Model-71', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-13', NULL, '2025-12-01 05:41:00', '', 1, 0),
(1448, 'BK072ARF', '1', NULL, 'HYUNDAI', 'Model-72', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14', NULL, '2025-12-01 05:42:00', '', 0, 0),
(1449, 'BK073ARF', '1', NULL, 'FORD', 'Model-73', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15', NULL, '2025-12-01 05:43:00', '', 1, 0),
(1450, 'BK074ARF', '1', NULL, 'TATA', 'Model-74', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-16', NULL, '2025-12-01 05:44:00', '', 0, 0),
(1451, 'BK075ARF', '1', NULL, 'MAHINDRA', 'Model-75', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17', NULL, '2025-12-01 05:45:00', '', 1, 0),
(1452, 'BK076ARF', '1', NULL, 'HYUNDAI', 'Model-76', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18', NULL, '2025-12-01 05:46:00', '', 0, 0),
(1453, 'BK077ARF', '1', NULL, 'FORD', 'Model-77', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19', NULL, '2025-12-01 05:47:00', '', 1, 0),
(1454, 'BK078ARF', '1', NULL, 'TATA', 'Model-78', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-20', NULL, '2025-12-01 05:48:00', '', 0, 0),
(1455, 'BK079ARF', '1', NULL, 'MAHINDRA', 'Model-79', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-21', NULL, '2025-12-01 05:49:00', '', 1, 0),
(1456, 'BK080ARF', '1', NULL, 'HYUNDAI', 'Model-80', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22', NULL, '2025-12-01 05:50:00', '', 0, 0),
(1457, 'BK081ARF', '1', NULL, 'FORD', 'Model-81', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-23', NULL, '2025-12-01 05:51:00', '', 1, 0),
(1458, 'BK082ARF', '1', NULL, 'TATA', 'Model-82', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24', NULL, '2025-12-01 05:52:00', '', 0, 0),
(1459, 'BK083ARF', '1', NULL, 'MAHINDRA', 'Model-83', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-25', NULL, '2025-12-01 05:53:00', '', 1, 0),
(1460, 'BK084ARF', '1', NULL, 'HYUNDAI', 'Model-84', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-26', NULL, '2025-12-01 05:54:00', '', 0, 0);
INSERT INTO `vehicle_details_tbl` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`, `is_deleted`) VALUES
(1461, 'BK085ARF', '1', NULL, 'FORD', 'Model-85', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27', NULL, '2025-12-01 05:55:00', '', 1, 0),
(1462, 'BK086ARF', '1', NULL, 'TATA', 'Model-86', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-28', NULL, '2025-12-01 05:56:00', '', 0, 0),
(1463, 'BK087ARF', '1', NULL, 'MAHINDRA', 'Model-87', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29', NULL, '2025-12-01 05:57:00', '', 1, 0),
(1464, 'BK088ARF', '1', NULL, 'HYUNDAI', 'Model-88', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30', NULL, '2025-12-01 05:58:00', '', 0, 0),
(1465, 'BK089ARF', '1', NULL, 'FORD', 'Model-89', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31', NULL, '2025-12-01 05:59:00', '', 1, 0),
(1466, 'BK090ARF', '1', NULL, 'TATA', 'Model-90', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, '2025-12-01 06:00:00', '', 0, 0),
(1467, 'BK091ARF', '1', NULL, 'MAHINDRA', 'Model-91', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-02', NULL, '2025-12-01 06:01:00', '', 1, 0),
(1468, 'BK092ARF', '1', NULL, 'HYUNDAI', 'Model-92', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-03', NULL, '2025-12-01 06:02:00', '', 0, 0),
(1469, 'BK093ARF', '1', NULL, 'FORD', 'Model-93', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-04', NULL, '2025-12-01 06:03:00', '', 1, 0),
(1470, 'BK094ARF', '1', NULL, 'TATA', 'Model-94', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-05', NULL, '2025-12-01 06:04:00', '', 0, 0),
(1471, 'BK095ARF', '1', NULL, 'MAHINDRA', 'Model-95', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-06', NULL, '2025-12-01 06:05:00', '', 1, 0),
(1472, 'BK096ARF', '1', NULL, 'HYUNDAI', 'Model-96', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-07', NULL, '2025-12-01 06:06:00', '', 0, 0),
(1473, 'BK097ARF', '1', NULL, 'FORD', 'Model-97', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-08', NULL, '2025-12-01 06:07:00', '', 1, 0),
(1474, 'BK098ARF', '1', NULL, 'TATA', 'Model-98', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-09', NULL, '2025-12-01 06:08:00', '', 0, 0),
(1475, 'BK099ARF', '1', NULL, 'MAHINDRA', 'Model-99', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-10', NULL, '2025-12-01 06:09:00', '', 1, 0),
(1476, 'BK100ARF', '1', NULL, 'HYUNDAI', 'Model-100', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11', NULL, '2025-12-01 06:10:00', '', 0, 0),
(1477, 'BK101ARF', '1', NULL, 'FORD', 'Model-101', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12', NULL, '2025-12-01 06:11:00', '', 1, 0),
(1478, 'BK102ARF', '1', NULL, 'TATA', 'Model-102', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-13', NULL, '2025-12-01 06:12:00', '', 0, 0),
(1479, 'BK103ARF', '1', NULL, 'MAHINDRA', 'Model-103', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14', NULL, '2025-12-01 06:13:00', '', 1, 0),
(1480, 'BK104ARF', '1', NULL, 'HYUNDAI', 'Model-104', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-15', NULL, '2025-12-01 06:14:00', '', 0, 0),
(1481, 'BK105ARF', '1', NULL, 'FORD', 'Model-105', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-16', NULL, '2025-12-01 06:15:00', '', 1, 0),
(1482, 'BK106ARF', '1', NULL, 'TATA', 'Model-106', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-17', NULL, '2025-12-01 06:16:00', '', 0, 0),
(1483, 'BK107ARF', '1', NULL, 'MAHINDRA', 'Model-107', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-18', NULL, '2025-12-01 06:17:00', '', 1, 0),
(1484, 'BK108ARF', '1', NULL, 'HYUNDAI', 'Model-108', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-19', NULL, '2025-12-01 06:18:00', '', 0, 0),
(1485, 'BK109ARF', '1', NULL, 'FORD', 'Model-109', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20', NULL, '2025-12-01 06:19:00', '', 1, 0),
(1486, 'BK110ARF', '1', NULL, 'TATA', 'Model-110', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21', NULL, '2025-12-01 06:20:00', '', 0, 0),
(1487, 'BK111ARF', '1', NULL, 'MAHINDRA', 'Model-111', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22', NULL, '2025-12-01 06:21:00', '', 1, 0),
(1488, 'BK112ARF', '1', NULL, 'HYUNDAI', 'Model-112', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-23', NULL, '2025-12-01 06:22:00', '', 0, 0),
(1489, 'BK113ARF', '1', NULL, 'FORD', 'Model-113', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-24', NULL, '2025-12-01 06:23:00', '', 1, 0),
(1490, 'BK114ARF', '1', NULL, 'TATA', 'Model-114', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-25', NULL, '2025-12-01 06:24:00', '', 0, 0),
(1491, 'BK115ARF', '1', NULL, 'MAHINDRA', 'Model-115', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-26', NULL, '2025-12-01 06:25:00', '', 1, 0),
(1492, 'BK116ARF', '1', NULL, 'HYUNDAI', 'Model-116', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-27', NULL, '2025-12-01 06:26:00', '', 0, 0),
(1493, 'BK117ARF', '1', NULL, 'FORD', 'Model-117', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-28', NULL, '2025-12-01 06:27:00', '', 1, 0),
(1494, 'BK118ARF', '1', NULL, 'TATA', 'Model-118', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29', NULL, '2025-12-01 06:28:00', '', 0, 0),
(1495, 'BK119ARF', '1', NULL, 'MAHINDRA', 'Model-119', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30', NULL, '2025-12-01 06:29:00', '', 1, 0),
(1496, 'BK120ARF', '1', NULL, 'HYUNDAI', 'Model-120', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-01', NULL, '2025-12-01 06:30:00', '', 0, 0),
(1497, 'BK121ARF', '1', NULL, 'FORD', 'Model-121', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-02', NULL, '2025-12-01 06:31:00', '', 1, 0),
(1498, 'BK122ARF', '1', NULL, 'TATA', 'Model-122', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-03', NULL, '2025-12-01 06:32:00', '', 0, 0),
(1499, 'BK123ARF', '1', NULL, 'MAHINDRA', 'Model-123', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-04', NULL, '2025-12-01 06:33:00', '', 1, 0),
(1500, 'BK124ARF', '1', NULL, 'HYUNDAI', 'Model-124', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-05', NULL, '2025-12-01 06:34:00', '', 0, 0),
(1501, 'BK125ARF', '1', NULL, 'FORD', 'Model-125', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06', NULL, '2025-12-01 06:35:00', '', 1, 0),
(1502, 'BK126ARF', '1', NULL, 'TATA', 'Model-126', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-07', NULL, '2025-12-01 06:36:00', '', 0, 0),
(1503, 'BK127ARF', '1', NULL, 'MAHINDRA', 'Model-127', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-08', NULL, '2025-12-01 06:37:00', '', 1, 0),
(1504, 'BK128ARF', '1', NULL, 'HYUNDAI', 'Model-128', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-09', NULL, '2025-12-01 06:38:00', '', 0, 0),
(1505, 'BK129ARF', '1', NULL, 'FORD', 'Model-129', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-10', NULL, '2025-12-01 06:39:00', '', 1, 0),
(1506, 'BK130ARF', '1', NULL, 'TATA', 'Model-130', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-11', NULL, '2025-12-01 06:40:00', '', 0, 0),
(1507, 'BK131ARF', '1', NULL, 'MAHINDRA', 'Model-131', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-12', NULL, '2025-12-01 06:41:00', '', 1, 0),
(1508, 'BK132ARF', '1', NULL, 'HYUNDAI', 'Model-132', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-13', NULL, '2025-12-01 06:42:00', '', 0, 0),
(1509, 'BK133ARF', '1', NULL, 'FORD', 'Model-133', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-14', NULL, '2025-12-01 06:43:00', '', 1, 0),
(1510, 'BK134ARF', '1', NULL, 'TATA', 'Model-134', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15', NULL, '2025-12-01 06:44:00', '', 0, 0),
(1511, 'BK135ARF', '1', NULL, 'MAHINDRA', 'Model-135', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-16', NULL, '2025-12-01 06:45:00', '', 1, 0),
(1512, 'BK136ARF', '1', NULL, 'HYUNDAI', 'Model-136', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-17', NULL, '2025-12-01 06:46:00', '', 0, 0),
(1513, 'BK137ARF', '1', NULL, 'FORD', 'Model-137', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-18', NULL, '2025-12-01 06:47:00', '', 1, 0),
(1514, 'BK138ARF', '1', NULL, 'TATA', 'Model-138', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-19', NULL, '2025-12-01 06:48:00', '', 0, 0),
(1515, 'BK139ARF', '1', NULL, 'MAHINDRA', 'Model-139', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-20', NULL, '2025-12-01 06:49:00', '', 1, 0),
(1516, 'BK140ARF', '1', NULL, 'HYUNDAI', 'Model-140', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-21', NULL, '2025-12-01 06:50:00', '', 0, 0),
(1517, 'BK141ARF', '1', NULL, 'FORD', 'Model-141', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-22', NULL, '2025-12-01 06:51:00', '', 1, 0),
(1518, 'BK142ARF', '1', NULL, 'TATA', 'Model-142', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-23', NULL, '2025-12-01 06:52:00', '', 0, 0),
(1519, 'BK143ARF', '1', NULL, 'MAHINDRA', 'Model-143', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-24', NULL, '2025-12-01 06:53:00', '', 1, 0),
(1520, 'BK144ARF', '1', NULL, 'HYUNDAI', 'Model-144', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-25', NULL, '2025-12-01 06:54:00', '', 0, 0),
(1521, 'BK145ARF', '1', NULL, 'FORD', 'Model-145', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-26', NULL, '2025-12-01 06:55:00', '', 1, 0),
(1522, 'BK146ARF', '1', NULL, 'TATA', 'Model-146', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27', NULL, '2025-12-01 06:56:00', '', 0, 0),
(1523, 'BK147ARF', '1', NULL, 'MAHINDRA', 'Model-147', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-28', NULL, '2025-12-01 06:57:00', '', 1, 0),
(1524, 'BK148ARF', '1', NULL, 'HYUNDAI', 'Model-148', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-29', NULL, '2025-12-01 06:58:00', '', 0, 0),
(1525, 'BK149ARF', '1', NULL, 'FORD', 'Model-149', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-30', NULL, '2025-12-01 06:59:00', '', 1, 0),
(1526, 'BK150ARF', '1', NULL, 'TATA', 'Model-150', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-31', NULL, '2025-12-01 07:00:00', '', 0, 0),
(1527, 'BK151ARF', '1', NULL, 'MAHINDRA', 'Model-151', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-01', NULL, '2025-12-01 07:01:00', '', 1, 0),
(1528, 'BK152ARF', '1', NULL, 'HYUNDAI', 'Model-152', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02', NULL, '2025-12-01 07:02:00', '', 0, 0),
(1529, 'BK153ARF', '1', NULL, 'FORD', 'Model-153', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-03', NULL, '2025-12-01 07:03:00', '', 1, 0),
(1530, 'BK154ARF', '1', NULL, 'TATA', 'Model-154', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-04', NULL, '2025-12-01 07:04:00', '', 0, 0),
(1531, 'BK155ARF', '1', NULL, 'MAHINDRA', 'Model-155', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-05', NULL, '2025-12-01 07:05:00', '', 1, 0),
(1532, 'BK156ARF', '1', NULL, 'HYUNDAI', 'Model-156', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06', NULL, '2025-12-01 07:06:00', '', 0, 0),
(1533, 'BK157ARF', '1', NULL, 'FORD', 'Model-157', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-07', NULL, '2025-12-01 07:07:00', '', 1, 0),
(1534, 'BK158ARF', '1', NULL, 'TATA', 'Model-158', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08', NULL, '2025-12-01 07:08:00', '', 0, 0),
(1535, 'BK159ARF', '1', NULL, 'MAHINDRA', 'Model-159', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-09', NULL, '2025-12-01 07:09:00', '', 1, 0),
(1536, 'BK160ARF', '1', NULL, 'HYUNDAI', 'Model-160', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10', NULL, '2025-12-01 07:10:00', '', 0, 0),
(1537, 'BK161ARF', '1', NULL, 'FORD', 'Model-161', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-11', NULL, '2025-12-01 07:11:00', '', 1, 0),
(1538, 'BK162ARF', '1', NULL, 'TATA', 'Model-162', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-12', NULL, '2025-12-01 07:12:00', '', 0, 0),
(1539, 'BK163ARF', '1', NULL, 'MAHINDRA', 'Model-163', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-13', NULL, '2025-12-01 07:13:00', '', 1, 0),
(1540, 'BK164ARF', '1', NULL, 'HYUNDAI', 'Model-164', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-14', NULL, '2025-12-01 07:14:00', '', 0, 0),
(1541, 'BK165ARF', '1', NULL, 'FORD', 'Model-165', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15', NULL, '2025-12-01 07:15:00', '', 1, 0),
(1542, 'BK166ARF', '1', NULL, 'TATA', 'Model-166', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16', NULL, '2025-12-01 07:16:00', '', 0, 0),
(1543, 'BK167ARF', '1', NULL, 'MAHINDRA', 'Model-167', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, '2025-12-01 07:17:00', '', 1, 0),
(1544, 'BK168ARF', '1', NULL, 'HYUNDAI', 'Model-168', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18', NULL, '2025-12-01 07:18:00', '', 0, 0),
(1545, 'BK169ARF', '1', NULL, 'FORD', 'Model-169', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-19', NULL, '2025-12-01 07:19:00', '', 1, 0),
(1546, 'BK170ARF', '1', NULL, 'TATA', 'Model-170', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-20', NULL, '2025-12-01 07:20:00', '', 0, 0),
(1547, 'BK171ARF', '1', NULL, 'MAHINDRA', 'Model-171', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-21', NULL, '2025-12-01 07:21:00', '', 1, 0),
(1548, 'BK172ARF', '1', NULL, 'HYUNDAI', 'Model-172', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22', NULL, '2025-12-01 07:22:00', '', 0, 0),
(1549, 'BK173ARF', '1', NULL, 'FORD', 'Model-173', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23', NULL, '2025-12-01 07:23:00', '', 1, 0),
(1550, 'BK174ARF', '1', NULL, 'TATA', 'Model-174', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24', NULL, '2025-12-01 07:24:00', '', 0, 0),
(1551, 'BK175ARF', '1', NULL, 'MAHINDRA', 'Model-175', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25', NULL, '2025-12-01 07:25:00', '', 1, 0),
(1552, 'BK176ARF', '1', NULL, 'HYUNDAI', 'Model-176', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-26', NULL, '2025-12-01 07:26:00', '', 0, 0),
(1553, 'BK177ARF', '1', NULL, 'FORD', 'Model-177', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-27', NULL, '2025-12-01 07:27:00', '', 1, 0),
(1554, 'BK178ARF', '1', NULL, 'TATA', 'Model-178', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-28', NULL, '2025-12-01 07:28:00', '', 0, 0),
(1555, 'BK179ARF', '1', NULL, 'MAHINDRA', 'Model-179', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29', NULL, '2025-12-01 07:29:00', '', 1, 0),
(1556, 'BK180ARF', '1', NULL, 'HYUNDAI', 'Model-180', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-30', NULL, '2025-12-01 07:30:00', '', 0, 0),
(1557, 'BK181ARF', '1', NULL, 'FORD', 'Model-181', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01', NULL, '2025-12-01 07:31:00', '', 1, 0),
(1558, 'BK182ARF', '1', NULL, 'TATA', 'Model-182', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02', NULL, '2025-12-01 07:32:00', '', 0, 0),
(1559, 'BK183ARF', '1', NULL, 'MAHINDRA', 'Model-183', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-03', NULL, '2025-12-01 07:33:00', '', 1, 0),
(1560, 'BK184ARF', '1', NULL, 'HYUNDAI', 'Model-184', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-04', NULL, '2025-12-01 07:34:00', '', 0, 0),
(1561, 'BK185ARF', '1', NULL, 'FORD', 'Model-185', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-05', NULL, '2025-12-01 07:35:00', '', 1, 0),
(1562, 'BK186ARF', '1', NULL, 'TATA', 'Model-186', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06', NULL, '2025-12-01 07:36:00', '', 0, 0),
(1563, 'BK187ARF', '1', NULL, 'MAHINDRA', 'Model-187', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07', NULL, '2025-12-01 07:37:00', '', 1, 0),
(1564, 'BK188ARF', '1', NULL, 'HYUNDAI', 'Model-188', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-08', NULL, '2025-12-01 07:38:00', '', 0, 0),
(1565, 'BK189ARF', '1', NULL, 'FORD', 'Model-189', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-09', NULL, '2025-12-01 07:39:00', '', 1, 0),
(1566, 'BK190ARF', '1', NULL, 'TATA', 'Model-190', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10', NULL, '2025-12-01 07:40:00', '', 0, 0),
(1567, 'BK191ARF', '1', NULL, 'MAHINDRA', 'Model-191', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-11', NULL, '2025-12-01 07:41:00', '', 1, 0),
(1568, 'BK192ARF', '1', NULL, 'HYUNDAI', 'Model-192', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12', NULL, '2025-12-01 07:42:00', '', 0, 0),
(1569, 'BK193ARF', '1', NULL, 'FORD', 'Model-193', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', NULL, '2025-12-01 07:43:00', '', 1, 0),
(1570, 'BK194ARF', '1', NULL, 'TATA', 'Model-194', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14', NULL, '2025-12-01 07:44:00', '', 0, 0),
(1571, 'BK195ARF', '1', NULL, 'MAHINDRA', 'Model-195', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15', NULL, '2025-12-01 07:45:00', '', 1, 0),
(1572, 'BK196ARF', '1', NULL, 'HYUNDAI', 'Model-196', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-16', NULL, '2025-12-01 07:46:00', '', 0, 0),
(1573, 'BK197ARF', '1', NULL, 'FORD', 'Model-197', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-17', NULL, '2025-12-01 07:47:00', '', 1, 0),
(1574, 'BK198ARF', '1', NULL, 'TATA', 'Model-198', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-18', NULL, '2025-12-01 07:48:00', '', 0, 0),
(1575, 'BK199ARF', '1', NULL, 'MAHINDRA', 'Model-199', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-19', NULL, '2025-12-01 07:49:00', '', 1, 0),
(1576, 'BK200ARF', '1', NULL, 'HYUNDAI', 'Model-200', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-20', NULL, '2025-12-01 07:50:00', '', 0, 0),
(1577, 'BK201ARF', '1', NULL, 'FORD', 'Model-201', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-21', NULL, '2025-12-01 07:51:00', '', 1, 0),
(1578, 'BK202ARF', '1', NULL, 'TATA', 'Model-202', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-22', NULL, '2025-12-01 07:52:00', '', 0, 0),
(1579, 'BK203ARF', '1', NULL, 'MAHINDRA', 'Model-203', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-23', NULL, '2025-12-01 07:53:00', '', 1, 0),
(1580, 'BK204ARF', '1', NULL, 'HYUNDAI', 'Model-204', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-24', NULL, '2025-12-01 07:54:00', '', 0, 0),
(1581, 'BK205ARF', '1', NULL, 'FORD', 'Model-205', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-25', NULL, '2025-12-01 07:55:00', '', 1, 0),
(1582, 'BK206ARF', '1', NULL, 'TATA', 'Model-206', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-26', NULL, '2025-12-01 07:56:00', '', 0, 0),
(1583, 'BK207ARF', '1', NULL, 'MAHINDRA', 'Model-207', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27', NULL, '2025-12-01 07:57:00', '', 1, 0),
(1584, 'BK208ARF', '1', NULL, 'HYUNDAI', 'Model-208', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-28', NULL, '2025-12-01 07:58:00', '', 0, 0),
(1585, 'BK209ARF', '1', NULL, 'FORD', 'Model-209', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29', NULL, '2025-12-01 07:59:00', '', 1, 0),
(1586, 'BK210ARF', '1', NULL, 'TATA', 'Model-210', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-30', NULL, '2025-12-01 08:00:00', '', 0, 0),
(1587, 'BK211ARF', '1', NULL, 'MAHINDRA', 'Model-211', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-31', NULL, '2025-12-01 08:01:00', '', 1, 0),
(1588, 'BK212ARF', '1', NULL, 'HYUNDAI', 'Model-212', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-01', NULL, '2025-12-01 08:02:00', '', 0, 0),
(1589, 'BK213ARF', '1', NULL, 'FORD', 'Model-213', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-02', NULL, '2025-12-01 08:03:00', '', 1, 0),
(1590, 'BK214ARF', '1', NULL, 'TATA', 'Model-214', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-03', NULL, '2025-12-01 08:04:00', '', 0, 0),
(1591, 'BK215ARF', '1', NULL, 'MAHINDRA', 'Model-215', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-04', NULL, '2025-12-01 08:05:00', '', 1, 0),
(1592, 'BK216ARF', '1', NULL, 'HYUNDAI', 'Model-216', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-05', NULL, '2025-12-01 08:06:00', '', 0, 0),
(1593, 'BK217ARF', '1', NULL, 'FORD', 'Model-217', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-06', NULL, '2025-12-01 08:07:00', '', 1, 0),
(1594, 'BK218ARF', '1', NULL, 'TATA', 'Model-218', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-07', NULL, '2025-12-01 08:08:00', '', 0, 0),
(1595, 'BK219ARF', '1', NULL, 'MAHINDRA', 'Model-219', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-08', NULL, '2025-12-01 08:09:00', '', 1, 0),
(1596, 'BK220ARF', '1', NULL, 'HYUNDAI', 'Model-220', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-09', NULL, '2025-12-01 08:10:00', '', 0, 0),
(1597, 'BK221ARF', '1', NULL, 'FORD', 'Model-221', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-10', NULL, '2025-12-01 08:11:00', '', 1, 0),
(1598, 'BK222ARF', '1', NULL, 'TATA', 'Model-222', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11', NULL, '2025-12-01 08:12:00', '', 0, 0),
(1599, 'BK223ARF', '1', NULL, 'MAHINDRA', 'Model-223', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-12', NULL, '2025-12-01 08:13:00', '', 1, 0),
(1600, 'BK224ARF', '1', NULL, 'HYUNDAI', 'Model-224', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-13', NULL, '2025-12-01 08:14:00', '', 0, 0),
(1601, 'BK225ARF', '1', NULL, 'FORD', 'Model-225', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-14', NULL, '2025-12-01 08:15:00', '', 1, 0),
(1602, 'BK226ARF', '1', NULL, 'TATA', 'Model-226', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-15', NULL, '2025-12-01 08:16:00', '', 0, 0),
(1603, 'BK227ARF', '1', NULL, 'MAHINDRA', 'Model-227', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, '2025-12-01 08:17:00', '', 1, 0),
(1604, 'BK228ARF', '1', NULL, 'HYUNDAI', 'Model-228', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17', NULL, '2025-12-01 08:18:00', '', 0, 0),
(1605, 'BK229ARF', '1', NULL, 'FORD', 'Model-229', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-18', NULL, '2025-12-01 08:19:00', '', 1, 0),
(1606, 'BK230ARF', '1', NULL, 'TATA', 'Model-230', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19', NULL, '2025-12-01 08:20:00', '', 0, 0),
(1607, 'BK231ARF', '1', NULL, 'MAHINDRA', 'Model-231', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20', NULL, '2025-12-01 08:21:00', '', 1, 0),
(1608, 'BK232ARF', '1', NULL, 'HYUNDAI', 'Model-232', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-21', NULL, '2025-12-01 08:22:00', '', 0, 0),
(1609, 'BK233ARF', '1', NULL, 'FORD', 'Model-233', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-22', NULL, '2025-12-01 08:23:00', '', 1, 0),
(1610, 'BK234ARF', '1', NULL, 'TATA', 'Model-234', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-23', NULL, '2025-12-01 08:24:00', '', 0, 0),
(1611, 'BK235ARF', '1', NULL, 'MAHINDRA', 'Model-235', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-24', NULL, '2025-12-01 08:25:00', '', 1, 0),
(1612, 'BK236ARF', '1', NULL, 'HYUNDAI', 'Model-236', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-25', NULL, '2025-12-01 08:26:00', '', 1, 1),
(1613, 'BK237ARF', '1', NULL, 'FORD', 'Model-237', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26', NULL, '2025-12-01 08:27:00', '', 1, 1),
(1614, 'BK238ARF', '1', NULL, 'TATA', 'Model-238', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27', NULL, '2025-12-01 08:28:00', '', 0, 1),
(1615, 'BK239ARF', '1', NULL, 'MAHINDRA', 'Model-239', NULL, 'CNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-28', NULL, '2025-12-01 08:29:00', '', 0, 1),
(1616, 'BK240ARF', '1', NULL, 'HYUNDAI', 'Model-240', NULL, 'DIESEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-29', NULL, '2025-12-01 08:30:00', '', 0, 1),
(1617, 'BK241ARF', '1', NULL, 'FORD', 'Model-241', NULL, 'PETROL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-30', '62', '2025-12-01 08:31:00', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details_tb_old`
--

CREATE TABLE `vehicle_details_tb_old` (
  `id` int(11) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `registrationNumber` varchar(50) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  `fuelType` varchar(30) DEFAULT NULL,
  `engineCapacity` varchar(20) DEFAULT NULL,
  `yearOfManufacture` varchar(10) DEFAULT NULL,
  `vehicleAge` varchar(20) DEFAULT NULL,
  `wheelplan` varchar(30) DEFAULT NULL,
  `dateOfLastV5CIssued` varchar(30) DEFAULT NULL,
  `typeApproval` varchar(50) DEFAULT NULL,
  `co2Emissions` varchar(20) DEFAULT NULL,
  `registrationPlace` varchar(50) DEFAULT NULL,
  `taxStatus` varchar(20) DEFAULT NULL,
  `taxDueDate` date DEFAULT NULL,
  `motStatus` varchar(20) DEFAULT NULL,
  `motDueDate` date DEFAULT NULL,
  `assigned_staff` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `days` varchar(100) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_details_tb_old`
--

INSERT INTO `vehicle_details_tb_old` (`id`, `vehicle_no`, `branch_id`, `registrationNumber`, `make`, `model`, `colour`, `fuelType`, `engineCapacity`, `yearOfManufacture`, `vehicleAge`, `wheelplan`, `dateOfLastV5CIssued`, `typeApproval`, `co2Emissions`, `registrationPlace`, `taxStatus`, `taxDueDate`, `motStatus`, `motDueDate`, `assigned_staff`, `created_at`, `days`, `flagged`) VALUES
(59, 'LF18VCG', '2', 'LF18VCG', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '7', '2 AXLE RIGID BODY', '2025-08-27', 'N1', '202', '2018-03', 'Taxed', '2026-08-01', 'Valid', '2026-03-19', '67', '2025-11-23 10:30:20', '116', 0),
(60, 'AK70VJO', '2', 'AK70VJO', 'TOYOTA', '', 'BLACK', 'DIESEL', '2755', '2021', '4', '2 AXLE RIGID BODY', '2025-09-22', 'N1', '193', '2021-01', 'Taxed', '2026-07-01', 'Valid', '2026-06-19', '67', '2025-11-23 17:45:41', '208', 0),
(61, 'BD19PYA', '1', 'BD19PYA', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2025-10-10', 'N1', '194', '2019-08', 'SORN', '0000-00-00', 'Valid', '2026-08-29', '68', '2025-11-26 16:50:02', '276', 0),
(62, 'DN20OEG', '1', 'DN20OEG', 'VAUXHALL', '', 'WHITE', 'DIESEL', '1499', '2020', '5', '2 AXLE RIGID BODY', '2024-12-21', 'N1', '148', '2020-06', 'Taxed', '2026-01-01', 'Valid', '2025-12-19', '62', '2025-11-26 16:50:59', '23', 0),
(63, 'DX16WDL', '1', 'DX16WDL', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1598', '2016', '9', '2 AXLE RIGID BODY', '2025-10-14', 'N1', '147', '2016-04', 'SORN', '0000-00-00', 'Valid', '2026-11-19', '69', '2025-12-01 12:07:09', '353', 0),
(64, 'DE21VKU', '1', 'DE21VKU', 'MAN', 'TGE 3.140', 'WHITE', 'DIESEL', '1968', '2021', '4', '2 AXLE RIGID BODY', '2021-06-18', 'N1', '', '2021-06', 'Untaxed', '2025-07-01', 'Not valid', '2025-06-17', '70', '2025-12-01 12:37:03', '-167', 0),
(65, 'WP21FYT', '1', 'WP21FYT', 'FORD', 'CUSTOM', 'WHITE', 'DIESEL', '1995', '2021', '4', '2 AXLE RIGID BODY', '2023-03-14', 'N1', '187', '2021-04', 'Untaxed', '2025-06-30', 'Not valid', '2025-09-08', '69', '2025-12-01 12:59:32', '-84', 0),
(66, 'NX67XOR', '1', 'NX67XOR', 'PEUGEOT', 'Expert', 'WHITE', 'DIESEL', '1560', '2017', '8', '2 AXLE RIGID BODY', '2021-05-25', 'N1', '144', '2017-09', 'Untaxed', '2025-10-02', 'Valid', '2026-06-29', '70', '2025-12-01 13:03:10', '210', 0),
(67, 'FH68EJN', '1', 'FH68EJN', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2024-11-04', 'N1', '194', '2019-01', 'Untaxed', '2025-08-21', 'Valid', '2026-01-28', '69', '2025-12-03 14:14:40', '56', 1),
(68, 'DA16EGJ', '1', 'DA16EGJ', 'CITROEN', '', 'WHITE', 'DIESEL', '1997', '2016', '9', '2 AXLE RIGID BODY', '2023-04-08', 'N1', '185', '2016-06', 'Untaxed', '2025-10-09', 'Valid', '2026-01-29', '69', '2025-12-03 14:34:08', '57', 0),
(69, 'EO66OVM', '1', 'EO66OVM', 'FORD', '', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '69', '2025-12-10 12:15:13', '-77', 0),
(70, 'EO66OVM', '1', 'EO66OVM', 'FORD', '', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '69', '2025-12-10 12:24:28', '-77', 0),
(71, 'EO66OVM', '1', 'EO66OVM', 'FORD', '', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '69', '2025-12-10 12:25:42', '-77', 0),
(72, 'EO66OVN', '1', 'EO66OVN', 'FORD', '', 'BLACK', 'DIESEL', '1499', '2016', '9', '2 AXLE RIGID BODY', '2020-06-15', 'N1', '124', '2016-09', 'Taxed', '2026-09-01', 'Not valid', '2025-09-09', '69', '2025-12-10 12:32:46', '-92', 0),
(73, 'EO66OVN', '1', 'EO66OVN', 'FORD', '', 'BLACK', 'DIESEL', '1499', '2016', '9', '2 AXLE RIGID BODY', '2020-06-15', 'N1', '124', '2016-09', 'Taxed', '2026-09-01', 'Not valid', '2025-09-09', '69', '2025-12-10 12:34:00', '-92', 0),
(74, 'SF68RHJ', '1', 'SF68RHJ', 'FIAT', '', 'WHITE', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-04', 'N1', '135', '2018-09', 'Untaxed', '2025-09-10', 'Valid', '2026-04-08', '70', '2025-12-10 13:16:29', '119', 0),
(75, 'DP69UDU', '1', 'DP69UDU', 'VAUXHALL', '', 'BLACK', 'DIESEL', '1499', '2019', '6', '2 AXLE RIGID BODY', '2025-09-25', 'N1', '135', '2019-12', 'Untaxed', '2025-10-13', 'Valid', '2026-02-05', '70', '2025-12-10 13:33:28', '57', 1),
(76, 'LE16XCJ', '1', 'LE16XCJ', 'RENAULT', '', 'GREY', 'DIESEL', '1598', '2016', '9', '2 AXLE RIGID BODY', '2025-05-24', 'N1', '170', '2016-07', 'SORN', '0000-00-00', 'Valid', '2026-04-16', '70', '2025-12-10 13:42:07', '127', 0),
(77, 'EO66OVM', '1', 'EO66OVM', 'FORD', 'Custom', 'SILVER', 'DIESEL', '1995', '2016', '9', '2 AXLE RIGID BODY', '2021-06-03', 'N1', '167', '2016-09', 'Taxed', '2026-06-01', 'Not valid', '2025-09-24', '70', '2025-12-10 14:20:41', '-77', 0),
(78, 'BA19KAO', '1', 'BA19KAO', 'VOLKSWAGEN', 'Crafter', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2025-12-03', 'N1', '194', '2019-08', 'Untaxed', '2025-12-05', 'Valid', '2026-09-20', '70', '2025-12-10 14:28:42', '284', 0),
(79, 'BD65WVH', '1', 'BD65WVH', 'FORD', 'Custom', 'WHITE', 'DIESEL', '2198', '2015', '10', '2 AXLE RIGID BODY', '2022-03-29', 'N1', '192', '2015-12', 'Untaxed', '2024-05-31', 'Not valid', '2024-11-20', '69', '2025-12-10 14:32:39', '-385', 0),
(80, 'LB67XTR', '1', 'LB67XTR', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '7', '2 AXLE RIGID BODY', '2025-11-10', 'N1', '185', '2018-02', 'Untaxed', '2025-11-18', 'Valid', '2026-02-08', '69', '2025-12-11 11:56:13', '59', 0),
(81, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:13:02', '314', 0),
(82, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:13:24', '314', 0),
(83, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:16:54', '314', 0),
(84, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:17:36', '314', 0),
(85, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '69', '2025-12-11 12:20:08', '314', 0),
(86, 'BD65WVH', '1', 'BD65WVH', 'FORD', '', 'WHITE', 'DIESEL', '2198', '2015', '10', '2 AXLE RIGID BODY', '2022-03-29', 'N1', '192', '2015-12', 'Untaxed', '2024-05-31', 'Not valid', '2024-11-20', '70', '2025-12-11 12:25:28', '-386', 0),
(87, 'VN19UEG', '1', 'VN19UEG', 'VOLKSWAGEN', '', 'WHITE', 'DIESEL', '1968', '2019', '6', '2 AXLE RIGID BODY', '2024-05-17', 'N1', '156', '2019-04', 'Untaxed', '2025-02-28', 'Not valid', '2025-04-29', '69', '2025-12-11 12:28:02', '-226', 0),
(88, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', '', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '70', '2025-12-11 12:28:22', '314', 0),
(89, 'YA19APC', '1', 'YA19APC', 'MERCEDES-BENZ', '', 'WHITE', 'DIESEL', '1598', '2019', '6', '2 AXLE RIGID BODY', '2019-08-27', 'N1', '164', '2019-08', 'Untaxed', '2025-09-10', 'Valid', '2026-08-29', '69', '2025-12-11 12:46:54', '261', 0),
(90, 'DF05BYM', '1', 'DF05BYM', 'LAND ROVER', '', 'GREY', 'DIESEL', '2926', '2005', '20', '2 AXLE RIGID BODY', '2024-01-15', 'M1', '299', '2005-04', 'Taxed', '2026-11-01', 'Valid', '2026-11-03', '70', '2025-12-11 12:47:18', '327', 0),
(91, 'SM18JYD', '1', 'SM18JYD', 'RENAULT', 'test', 'SILVER', 'DIESEL', '1598', '2018', '7', '2 AXLE RIGID BODY', '2025-09-30', 'N1', '170', '2018-05', 'Untaxed', '2025-10-28', 'Valid', '2026-10-21', '67', '2025-12-12 17:45:05', '313', 0),
(92, 'EN21VNU', '1', 'EN21VNU', 'VAUXHALL', '', 'BLACK', 'DIESEL', '1997', '2021', '4', '2 AXLE RIGID BODY', '2021-09-29', 'N1', '195', '2021-06', 'Taxed', '2026-04-01', 'Valid', '2026-07-09', '70', '2025-12-15 09:47:06', '206', 0),
(93, 'LF18VCG', '1', 'LF18VCG', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-03-19', '67', '2025-12-16 17:30:11', '93', 0),
(94, 'SM62FFT', '1', 'SM62FFT', 'TOYOTA', 'test', 'GREY', 'HYBRID ELECTRIC', '1798', '2013', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-10-16', '67', '2025-12-16 18:29:29', '304', 0),
(95, 'BK17ARF', '1', 'BK17ARF', 'FORD', '', 'BLACK', 'DIESEL', '1995', '2017', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-12-05', '70', '2025-12-18 15:44:17', '352', 1),
(96, 'PN70GJO', '1', 'PN70GJO', 'RENAULT', '', 'WHITE', 'DIESEL', '1997', '2020', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-09-14', '70', '2025-12-18 17:10:07', '270', 0),
(97, 'DL17XDD', '1', 'DL17XDD', 'VAUXHALL', '', 'WHITE', 'DIESEL', '1598', '2017', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-01-12', '70', '2025-12-22 12:12:42', '21', 0),
(98, 'LB67URG', '1', 'LB67URG', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2018', '', '', '', '', '', '', '', '0000-00-00', 'Not valid', '2025-12-15', '70', '2025-12-22 12:15:50', '-7', 0),
(99, 'YC19MZZ', '1', 'YC19MZZ', 'FORD', '', 'WHITE', 'DIESEL', '1995', '2019', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-09-19', '70', '2025-12-24 11:11:13', '269', 0),
(100, 'YB67URG', '1', 'YB67URG', 'MINI', '', 'WHITE', 'DIESEL', '1496', '2018', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-01-30', '70', '2025-12-24 11:22:38', '37', 0),
(101, 'BK17ARF', '1', 'BK17ARF', 'FORD', 'Test ', 'BLACK', 'DIESEL', '1995', '2017', '', '', '', '', '', '', '', '0000-00-00', 'Valid', '2026-12-05', '67', '2025-12-27 09:25:37', '343', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_images_tbl`
--

CREATE TABLE `vehicle_images_tbl` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_label` varchar(50) NOT NULL,
  `image_description` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_images_tbl`
--

INSERT INTO `vehicle_images_tbl` (`id`, `vehicle_id`, `image_path`, `image_label`, `image_description`, `uploaded_at`) VALUES
(9, 59, 'veh_59_6922e43848730.jpg', '', 'Front View', '2025-11-23 10:38:48'),
(10, 59, 'veh_59_6922e4384b7f1.jpg', '', 'Back View', '2025-11-23 10:38:48'),
(11, 59, 'veh_59_6922e4384ce21.jpg', '', 'Left Side View', '2025-11-23 10:38:48'),
(12, 59, 'veh_59_6922e4384f482.jpg', '', 'Right Side View', '2025-11-23 10:38:48'),
(13, 59, 'veh_59_6922e43850c08.jpg', '', 'Interior', '2025-11-23 10:38:48'),
(14, 59, 'veh_59_6922e43854641.jpg', '', 'Loading Area', '2025-11-23 10:38:48'),
(15, 59, 'veh_59_6922e43857360.jpg', '', 'Insurance', '2025-11-23 10:38:48'),
(16, 59, 'veh_59_6922e4385b0ff.jpg', '', 'Meter', '2025-11-23 10:38:48'),
(17, 59, 'veh_59_6922e4385cd2b.jpg', '', 'Cabin', '2025-11-23 10:38:48'),
(18, 59, 'veh_59_6922e4385f63b.jpg', '', 'Back Side View', '2025-11-23 10:38:48'),
(19, 62, 'veh_62_6927301ca31a9.jpeg', 'Front View', '', '2025-11-26 16:51:40'),
(20, 63, 'veh_63_692d85880d99d.jpg', 'Front View', '', '2025-12-01 12:09:44'),
(21, 63, 'veh_63_692d85881115a.jpg', 'interior', '', '2025-12-01 12:09:44'),
(22, 63, 'veh_63_692d858815e71.jpg', 'rc', '', '2025-12-01 12:09:44'),
(23, 64, 'veh_64_692d8f6940202.jpg', 'back', '', '2025-12-01 12:51:53'),
(24, 66, 'veh_66_69315756e4031.jpeg', 'Interior', '', '2025-12-01 14:05:11'),
(25, 67, 'veh_67_693048fe6c84b.jpg', 'Front View', 'Front View', '2025-12-03 14:28:14'),
(26, 67, 'veh_67_693048fe72173.jpg', 'Front View', '', '2025-12-03 14:28:14'),
(27, 68, 'veh_68_69304a9aa5f6b.jpg', 'Front View', '', '2025-12-03 14:35:06'),
(28, 66, 'veh_66_69315787d952e.jpeg', 'front', '', '2025-12-04 09:42:31'),
(29, 74, 'veh_74_6939730cd760e.jpg', 'Front View', '', '2025-12-10 13:18:04'),
(30, 74, 'veh_74_6939730cdb692.jpg', 'interior', '', '2025-12-10 13:18:04'),
(31, 74, 'veh_74_6939730cddf46.jpg', 'Loading area', '', '2025-12-10 13:18:04'),
(32, 75, 'veh_75_693977264452c.jpg', 'Front View', '', '2025-12-10 13:35:34'),
(33, 75, 'veh_75_6939772648c8e.jpg', 'Loading area', '', '2025-12-10 13:35:34'),
(34, 75, 'veh_75_693977264bf58.jpg', 'interior', '', '2025-12-10 13:35:34'),
(35, 77, 'veh_77_6939822db7b3f.jpg', 'Front View', 'Good', '2025-12-10 14:22:37'),
(36, 78, 'veh_78_693983c002c41.jpg', 'Front View', 'Good', '2025-12-10 14:29:19'),
(37, 79, 'veh_79_693984ccdaab1.jpg', 'Front View', 'Good ', '2025-12-10 14:33:48'),
(38, 80, 'veh_80_693ab1e6408b1.jpg', 'Front View', '', '2025-12-11 11:58:30'),
(39, 80, 'veh_80_693ab1e6439f4.jpg', '', '', '2025-12-11 11:58:30'),
(40, 80, 'veh_80_693ab1e6457b0.jpg', '', '', '2025-12-11 11:58:30'),
(41, 85, 'veh_85_693ab73ea7a53.jpg', 'Front View', '', '2025-12-11 12:21:18'),
(42, 85, 'veh_85_693ab73eaaff9.jpg', '', '', '2025-12-11 12:21:18'),
(43, 86, 'veh_86_693ab86445d09.jpg', 'Front View', '', '2025-12-11 12:26:12'),
(44, 88, 'veh_88_693ab8fec2c85.jpg', 'Front View', '', '2025-12-11 12:28:46'),
(45, 87, 'veh_87_693abb4aa797f.jpg', 'Front View', '', '2025-12-11 12:38:34'),
(46, 87, 'veh_87_693abb4aaaaf6.jpg', '', '', '2025-12-11 12:38:34'),
(47, 87, 'veh_87_693abb4aad09b.jpg', '', '', '2025-12-11 12:38:34'),
(48, 87, 'veh_87_693abb4ab08f4.jpg', '', '', '2025-12-11 12:38:34'),
(49, 87, 'veh_87_693abb4ab45d4.jpg', '', '', '2025-12-11 12:38:34'),
(50, 87, 'veh_87_693abb4ab7617.jpg', '', '', '2025-12-11 12:38:34'),
(51, 87, 'veh_87_693abb4abb112.jpg', '', '', '2025-12-11 12:38:34'),
(52, 90, 'veh_90_693abda708af2.jpg', 'Front View', '', '2025-12-11 12:48:39'),
(53, 89, 'veh_89_693abebd49692.jpg', 'Back View', '', '2025-12-11 12:53:17'),
(54, 89, 'veh_89_693abebd4cf67.jpg', '', '', '2025-12-11 12:53:17'),
(55, 89, 'veh_89_693abebd52f46.jpg', '', '', '2025-12-11 12:53:17'),
(56, 89, 'veh_89_693abebd56281.jpg', '', '', '2025-12-11 12:53:17'),
(57, 89, 'veh_89_693abebd6a8f7.jpg', '', '', '2025-12-11 12:53:17'),
(58, 93, 'veh_93_69419764e9914.jpg', '', '', '2025-12-16 17:31:16'),
(59, 94, 'veh_94_6941a5161771f.jpg', '', '', '2025-12-16 18:29:42'),
(60, 94, 'veh_94_6941b9a17dbe3.jpg', '', '', '2025-12-16 19:50:45'),
(61, 95, 'veh_95_694421691b12b.jpg', 'Front View', '', '2025-12-18 15:44:42'),
(62, 96, 'veh_96_694435b7d8f22.jpg', '', '', '2025-12-18 17:11:21'),
(63, 96, 'veh_96_694435b9455cb.jpg', '', '', '2025-12-18 17:11:22'),
(64, 96, 'veh_96_694435ba9aec3.jpg', '', '', '2025-12-18 17:11:23'),
(65, 97, 'veh_97_694935cc2e06b.jpg', 'Front View', '', '2025-12-22 12:13:02'),
(66, 98, 'veh_98_69493686ed230.jpg', 'Front View', '', '2025-12-22 12:16:08'),
(67, 99, 'veh_99_694bca6068d62.jpg', 'Front View', '', '2025-12-24 11:11:30'),
(68, 101, 'veh_101_694fa62e97645.jpg', '', '', '2025-12-27 09:26:07'),
(69, 1611, 'veh_1611_20260129_173325_5b255650ec.jpg', '', '', '2026-01-29 16:33:26'),
(70, 1611, 'veh_1611_20260129_173610_3b56f00c35.jpg', '', '', '2026-01-29 16:36:11'),
(71, 1611, 'veh_1611_20260129_173710_290824cc25.jpg', '', '', '2026-01-29 16:37:11'),
(72, 1611, 'veh_1611_20260221_090901_48f41df206.png', '', '', '2026-02-21 08:09:02'),
(73, 1611, 'veh_1611_20260221_091300_61ba519b21.png', '', '', '2026-02-21 08:13:01'),
(74, 1611, 'veh_1611_20260221_092928_3e9c93bc4d.png', '', '', '2026-02-21 08:29:28'),
(75, 1611, 'veh_1611_20260222_160438_ab14dfdf4b.jpg', '', '', '2026-02-22 15:04:39'),
(76, 1610, 'veh_1610_20260222_160806_88834737cd.png', '', '', '2026-02-22 15:08:09'),
(77, 1609, 'veh_1609_20260222_160849_def4fd7b36.jpg', '', '', '2026-02-22 15:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_inspection_tbl`
--

CREATE TABLE `vehicle_inspection_tbl` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `tyres` varchar(50) DEFAULT NULL,
  `drivers_cabin` varchar(50) DEFAULT NULL,
  `loading_area` varchar(50) DEFAULT NULL,
  `exterior` varchar(100) DEFAULT NULL,
  `mechanical` varchar(50) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `test_driven` varchar(10) DEFAULT NULL,
  `test_drive_comments` text DEFAULT NULL,
  `photo_drivers_cabin` varchar(255) DEFAULT NULL,
  `photo_loading_area` varchar(255) DEFAULT NULL,
  `photo_exterior` varchar(255) DEFAULT NULL,
  `engine_compartment` varchar(255) DEFAULT NULL,
  `photo_engine_compartment` varchar(255) DEFAULT NULL,
  `inspection_by` varchar(100) DEFAULT NULL,
  `inspection_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_inspection_tbl`
--

INSERT INTO `vehicle_inspection_tbl` (`id`, `vehicle_id`, `tyres`, `drivers_cabin`, `loading_area`, `exterior`, `mechanical`, `comments`, `test_driven`, `test_drive_comments`, `photo_drivers_cabin`, `photo_loading_area`, `photo_exterior`, `engine_compartment`, `photo_engine_compartment`, `inspection_by`, `inspection_date`) VALUES
(3, 59, 'Illegal', 'Clean', 'Clean', 'Missing body parts', 'Ready to sell', 'All Condition And Ready To Test!', 'Yes', 'Test Drive Taken, all good.', '1763894427_3.jpg', '1763894427_15.jpg', '1763894427_12.jpg', 'Clean', '1765913471_istockphoto-941592938-2048x2048.jpg', NULL, '2026-02-09 23:01:17'),
(4, 63, 'Good', 'Clean', 'Very Clean', 'Missing body parts', 'Warning lights', 'Wnginw ', 'Yes', 'Noisy gear box ', NULL, NULL, '1764591083_image.jpg', NULL, NULL, '0', '2025-12-01 12:11:23'),
(5, 64, 'Close', 'Clean', 'Dirty', 'Body shop', 'Workshop', 'Test 234', 'Yes', 'test234', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-01 16:52:12'),
(6, 66, 'Good', 'Clean', 'Clean', 'Ready to sell', 'Ready to sell', 'test comments', 'No', 'Not tested yet', '1764841222_PeugotExpert.jpeg', NULL, '1764841425_PeugotExpert.jpeg', NULL, NULL, NULL, '2025-12-04 18:08:04'),
(7, 67, 'Good', 'Clean', 'Very Clean', 'Missing body parts', 'Ready to sell', 'Drives good', 'Yes', 'Good ', '1764772159_image.jpg', '1764772159_image.jpg', '1764772159_image.jpg', NULL, NULL, NULL, '2025-12-06 08:02:25'),
(8, 68, 'Close', 'Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', 'Ok test update', 'Yes', 'test update', NULL, '1764772545_image.jpg', NULL, NULL, NULL, NULL, '2025-12-06 13:30:03'),
(9, 61, 'Good', 'Clean', 'Clean', 'Body shop', 'Warning lights', '', 'No', '', NULL, NULL, NULL, NULL, NULL, '0', '2025-12-03 17:17:49'),
(10, 60, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', 'test', 'Yes', 'test', NULL, NULL, NULL, NULL, NULL, '0', '2025-12-03 18:13:55'),
(11, 74, 'Good', 'Clean', 'Very Clean', 'Body shop', 'Ready to sell', '', 'Yes', '', NULL, NULL, '1765372729_image.jpg', NULL, NULL, '0', '2025-12-10 13:18:49'),
(12, 75, 'Good', 'Clean', 'Clean', 'Body shop', 'Ready to sell', '', 'Yes', '', '1765373798_image.jpg', '1765373798_image.jpg', '1765373798_image.jpg', NULL, NULL, NULL, '2025-12-12 19:09:57'),
(13, 77, 'Good', 'Soiled/Dirty', 'Dirty', 'Polish', 'Ready to sell', 'Drives good', 'Yes', 'Steering veering off right slightly', '1765376680_17653765701585095173097104894076.jpg', '1765376680_17653765994303166179515411270634.jpg', '1765376680_17653766169375002399161184030714.jpg', NULL, NULL, '0', '2025-12-10 14:24:40'),
(14, 78, 'Good', 'Soiled/Dirty', 'Dirty', 'Missing body parts', 'Ready to sell', 'Drives good', 'Yes', 'Driven by Irvine recommended good drive', '1765377127_17653769686496609825096750434305.jpg', '1765377127_17653769960218456117836539209200.jpg', '1765377127_17653770584704878366055804824808.jpg', NULL, NULL, '0', '2025-12-10 14:32:07'),
(15, 79, 'Good', 'Clean', 'Clean', 'Missing body parts', 'Workshop', 'Immobiezer issues', 'Yes', 'Ok', '1765377630_image.jpg', '1765377630_image.jpg', '1765377630_image.jpg', NULL, NULL, '0', '2025-12-10 14:40:30'),
(16, 80, 'Good', 'Clean', 'Clean', 'Body shop', 'Ready to sell', 'Drive ok', 'Yes', 'Slight pull to left ', '1765454399_image.jpg', '1765454399_image.jpg', '1765454399_image.jpg', NULL, NULL, '0', '2025-12-11 11:59:59'),
(17, 85, 'Good', 'Clean', 'Clean', 'Ready to sell', 'Ready to sell', 'Test drive done', 'Yes', '', '1765455869_image.jpg', '1765455869_image.jpg', NULL, NULL, NULL, '0', '2025-12-11 12:24:29'),
(18, 86, 'Close', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', 'Drives ok', 'Yes', 'Pulls towards left ', '1765456049_image.jpg', '1765456049_image.jpg', NULL, NULL, NULL, '0', '2025-12-11 12:27:29'),
(19, 88, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', '', 'Yes', '', '1765456190_image.jpg', '1765456190_image.jpg', NULL, NULL, NULL, '0', '2025-12-11 12:29:50'),
(20, 87, 'Good', 'Very Clean', 'Clean', 'Missing body parts', 'Warning lights', 'Damage to drivrr seat', 'Yes', 'ABS LIGHT', '1765456992_image.jpg', '1765456992_image.jpg', '1765456992_image.jpg', NULL, NULL, '0', '2025-12-11 12:43:12'),
(21, 89, 'Good', 'Clean', 'Clean', 'Ready to sell', 'Warning lights', 'Tyre pressure warning light on.', 'Yes', '', NULL, '1765457904_image.jpg', '1765457904_image.jpg', NULL, NULL, '0', '2025-12-11 12:58:24'),
(22, 93, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', 'test', 'Yes', 'test', '1765913521_4c1b07c4923442618a71f5069062c92e.jpg', '1765913521_018a74c52a034df1816ae44e5c1bbc12.jpg', '1765913521_b86605655cd44b6c9a43298cc0e78989.jpg', 'Very Clean', '1765908372_deba7b9ac56544e2992d9945991bcea7.jpg', NULL, '2025-12-16 19:32:01'),
(23, 94, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', '', 'Yes', '', NULL, NULL, '1765940150_176594013919087526033249494946.jpg', 'Clean', '1765910608_e950b9aaaf404e0ca48ab85dcfdb8df8.jpg', NULL, '2025-12-17 02:55:50'),
(24, 95, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Warning lights', 'All good ', 'Yes', '', '1766804211_17668040221124068720221265999502.jpg', '1766804211_17668040311845426377293475227989.jpg', NULL, 'Very Clean', '1766072736_image.jpg', NULL, '2025-12-27 02:56:51'),
(25, 96, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', '', 'Yes', '', '1766077919_image.jpg', NULL, '1766077919_image.jpg', 'Very Clean', NULL, '0', '2025-12-18 17:11:59'),
(26, 97, 'Good', 'Very Clean', 'Dirty', 'Body shop', 'Warning lights', 'EML ', 'No', '', '1766405663_image.jpg', '1766405663_image.jpg', '1766405663_image.jpg', 'Clean', '1766405663_image.jpg', '0', '2025-12-22 12:14:23'),
(27, 98, 'Good', 'Very Clean', 'Very Clean', 'Body shop', 'Ready to sell', '', 'Yes', '', '1766405833_image.jpg', '1766405833_image.jpg', '1766405833_image.jpg', 'Clean', '1766405833_image.jpg', '0', '2025-12-22 12:17:13'),
(28, 99, 'Good', 'Very Clean', 'Very Clean', 'Polish', 'Workshop', '', 'Yes', '', '1766574779_image.jpg', '1766574780_image.jpg', '1766574780_image.jpg', 'Very Clean', '1766574780_image.jpg', '0', '2025-12-24 11:13:00'),
(29, 101, 'Good', 'Very Clean', 'Clean', 'Ready to sell', 'Ready to sell', 'Test ', 'Yes', 'Test comments ', '1766828051_17668275728853666605694391247616.jpg', '1766828051_17668275822148877836280224857493.jpg', '1766828051_17668275885505200729443812572172.jpg', 'Very Clean', '1766828051_17668275965245918453571779313062.jpg', '0', '2025-12-27 09:34:11'),
(30, 1600, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', 'test ', 'Yes', 'test', 'insp_1600_20260222_161723_86a0cf0837.png', NULL, NULL, 'Very Clean', NULL, '0', '2026-02-22 20:47:24'),
(31, 1608, 'Good', 'Very Clean', 'Very Clean', 'Ready to sell', 'Ready to sell', 'Test', 'Yes', 'Ter', 'insp_1608_20260222_161826_4cd838d0f2.jpg', NULL, 'insp_1608_20260222_161906_2303332ab4.jpg', 'Very Clean', NULL, NULL, '2026-02-22 20:49:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`acct_id`);

--
-- Indexes for table `branches_tbl`
--
ALTER TABLE `branches_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oic`
--
ALTER TABLE `oic`
  ADD PRIMARY KEY (`oic_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type_tbl`
--
ALTER TABLE `user_type_tbl`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `vehicle_details_tbl`
--
ALTER TABLE `vehicle_details_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vehicle_no` (`vehicle_no`),
  ADD KEY `idx_make` (`make`),
  ADD KEY `idx_model` (`model`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_branch_id` (`branch_id`),
  ADD KEY `idx_fuelType` (`fuelType`),
  ADD KEY `idx_flagged` (`flagged`),
  ADD KEY `idx_vehicle_branch` (`vehicle_no`,`branch_id`),
  ADD KEY `idx_make_model` (`make`,`model`),
  ADD KEY `idx_assigned_staff` (`assigned_staff`);

--
-- Indexes for table `vehicle_details_tb_old`
--
ALTER TABLE `vehicle_details_tb_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_images_tbl`
--
ALTER TABLE `vehicle_images_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `vehicle_inspection_tbl`
--
ALTER TABLE `vehicle_inspection_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `acct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `branches_tbl`
--
ALTER TABLE `branches_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oic`
--
ALTER TABLE `oic`
  MODIFY `oic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type_tbl`
--
ALTER TABLE `user_type_tbl`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_details_tbl`
--
ALTER TABLE `vehicle_details_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1618;

--
-- AUTO_INCREMENT for table `vehicle_details_tb_old`
--
ALTER TABLE `vehicle_details_tb_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `vehicle_images_tbl`
--
ALTER TABLE `vehicle_images_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `vehicle_inspection_tbl`
--
ALTER TABLE `vehicle_inspection_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vehicle_images_tbl`
--
ALTER TABLE `vehicle_images_tbl`
  ADD CONSTRAINT `vehicle_images_tbl_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_details_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_inspection_tbl`
--
ALTER TABLE `vehicle_inspection_tbl`
  ADD CONSTRAINT `vehicle_inspection_tbl_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_details_tbl` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
