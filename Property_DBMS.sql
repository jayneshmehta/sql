-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Generation Time: May 22, 2023 at 02:07 PM
-- Server version: 10.6.12-MariaDB-1:10.6.12+maria~ubu2004-log
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Property_DBMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_id`, `Username`, `Password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `catagorie_id` int(11) NOT NULL,
  `catagorie_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`catagorie_id`, `catagorie_name`) VALUES
(1, 'Residiential'),
(2, 'Commericial'),
(3, 'Industrial'),
(4, 'Raw_land');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `state_id`, `city_name`) VALUES
(1, 1, 'mumbai'),
(2, 1, 'pune'),
(3, 6, 'Seattle'),
(4, 6, 'Spokane'),
(5, 5, 'Los Angeles'),
(6, 5, 'San Diego'),
(7, 2, 'Ahmedabad');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'india'),
(2, 'USA'),
(3, 'russia'),
(4, 'Australia'),
(5, 'Pakistan');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `property_name` varchar(70) NOT NULL,
  `sort_descreption` varchar(100) NOT NULL,
  `long_discription` text NOT NULL,
  `Rooms` int(11) NOT NULL,
  `Area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `catagories` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `local_address` varchar(255) NOT NULL,
  `postcode` int(6) NOT NULL,
  `type` enum('Rent','sale','lease') NOT NULL DEFAULT 'Rent',
  `status` enum('sold','unsold') NOT NULL,
  `Photos` varchar(255) NOT NULL,
  `Owner_Id` int(11) NOT NULL,
  `Rental_Id` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `visit’s` int(11) NOT NULL,
  `date_of_registration` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `property_name`, `sort_descreption`, `long_discription`, `Rooms`, `Area`, `price`, `catagories`, `country`, `state`, `city`, `local_address`, `postcode`, `type`, `status`, `Photos`, `Owner_Id`, `Rental_Id`, `Rating`, `visit’s`, `date_of_registration`) VALUES
(1, 'kailash villas', '623 Willow Rd, Dallas', 'Sprinklers,\r\nBasketball Court,\r\nPrivate Space,\r\nLawn,\r\nGym,\r\nFireplace,\r\nBalcony,\r\nLaundry,', 2, 1200, 17000, 3, 1, 2, 7, 'dhanori near airport', 355423, '', 'unsold', '', 14, 2, 3, 1, 20230519),
(4, 'kailash villasssss', '35 Pond St, New York', 'Sprinklers,\r\nBasketball Court,\r\nPrivate Space,\r\nLawn,\r\nGym,\r\nFireplace,\r\nBalcony,\r\nLaundry,', 4, 1800, 2434534, 1, 1, 2, 7, 'dhanori near airport', 34534, 'Rent', 'unsold', '', 1, 2, 0, 0, 2147483647),
(28, '401 Biscayne Blvd, Miami', 'Neque egestas ut a consequat mi ornare. Ac posuere lectus amet risus tellus. Pellentesque lobortis s', 'Sprinklers\r\nBasketball Court\r\nPrivate Space\r\nLawn\r\nGym\r\nFireplace\r\nBalcony\r\nLaundry', 3, 57657, 4564535, 1, 2, 5, 5, 'dhanori near airport', 46655, 'Rent', 'sold', '', 14, 2, 2, 0, 2147483647),
(22, '623 Willow Rd, Dallas23d', 'Neque egestas ut a consequat mi ornare. Ac posuere lectus amet risus tellus. Pellentesque lobortis s', 'Sprinklers\r\nBasketball Court\r\nPrivate Space\r\nLawn\r\nGym\r\nFireplace\r\nBalcony\r\nLaundry\r\n', 5, 57, 125612, 1, 1, 2, 7, 'tdh', 5489, 'Rent', 'unsold', '', 0, 11, 1, 0, 2147483647),
(34, 'radixweb', 'Neque egestas ut a consequat mi ornare. Ac posuere lectus amet risus tellus. Pellentesque lobortis s', 'Sprinklers\r\nBasketball Court\r\nPrivate Space\r\nLawn\r\nGym\r\nFireplace\r\nBalcony\r\nLaundry\r\n', 10, 78000, 150, 2, 1, 2, 7, 'dhanori near airport', 54895, 'Rent', 'unsold', 'profile', 0, 12, 3, 0, 2147483647),
(31, 'vijay villas', 'Neque egestas ut a consequat mi ornare. Ac posuere lectus amet risus tellus. Pellentesque lobortis s', 'Sprinklers\r\nBasketball Court\r\nPrivate Space\r\nLawn\r\nGym\r\nFireplace\r\nBalcony\r\nLaundry', 5, 78000, 679343, 1, 1, 2, 7, 'nahi batunga', 67546, 'Rent', 'unsold', 'profile', 0, 15, 4, 0, 180009);

-- --------------------------------------------------------

--
-- Table structure for table `State`
--

CREATE TABLE `State` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `State`
--

INSERT INTO `State` (`state_id`, `country_id`, `state_name`) VALUES
(1, 1, 'Maharastra'),
(2, 1, 'Gujarat'),
(3, 1, 'UP'),
(4, 1, 'kerela'),
(5, 2, 'California'),
(6, 2, 'Washington');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `user_type` enum('owner','rentel','both') NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `country` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `current_address` varchar(255) NOT NULL,
  `postcode` int(6) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `contact_no` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_type`, `name`, `email`, `password`, `gender`, `country`, `state`, `city`, `current_address`, `postcode`, `profile_pic`, `contact_no`) VALUES
(1, 'owner', 'jaynesh mehta', 'mehtajaynesh1@gmail.com', 'jaynehs@123', 'M', 1, 1, 1, 'lokhandwala complex near maratha minder', 456546, 'mens3.jpg', 2147483647),
(2, 'rentel', 'jaynesh mehta', 'jayneshmehta134@gmail.com', 'jaynesh@123', 'M', 2, 5, 5, 'nahi pata', 378442, 'mens2.webp', 2147483647),
(3, 'owner', 'khushal mistry', 'mistryKhushal@gmail.com', 'khusghal@123', 'M', 2, 6, 4, '24ewrde', 345546, 'mens3.jpg', 867879567),
(14, 'owner', 'parthbhai nikum', 'nakumparth@gmail.com', 'nakum@1234', 'M', 2, 5, 5, 'uske pass', 654345, 'mens3.jpg', 2147483647),
(11, 'rentel', 'JayneshMehta', 'jayneshmehta1@gmail.com', '354dsfdf', 'F', 2, 5, 5, '23qesa', 543455, 'mens2.webp', 2147483647),
(15, 'owner', 'Aaftab shaikh', 'shaikhaaftab2@gmail.com', 'aaftab123', 'M', 1, 1, 1, 'nahi pata', 345634, 'mens3.jpg', 2147483647),
(16, 'rentel', 'kailash rathod', 'rathodkailash@gmail.com', 'rathod1234', 'M', 2, 5, 5, 'nahi pata', 378442, 'mens2.webp', 756453232),
(18, 'owner', 'nisita raval', 'ravalnishita@gmail.com', 'raval123', 'F', 1, 2, 7, 'nahi pata', 645632, 'girlprofile2.jpeg', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`catagorie_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`) USING BTREE,
  ADD KEY `FK_Propcountry` (`country`),
  ADD KEY `FK_Propstate` (`state`),
  ADD KEY `FK_Propcity` (`city`),
  ADD KEY `FK_Propuser` (`Owner_Id`),
  ADD KEY `FK_Propuser2` (`Rental_Id`);

--
-- Indexes for table `State`
--
ALTER TABLE `State`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `FK_stateCountry` (`country_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `catagorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `State`
--
ALTER TABLE `State`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
