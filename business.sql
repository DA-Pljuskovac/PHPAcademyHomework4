-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 10, 2020 at 08:16 AM
-- Server version: 10.1.46-MariaDB-1~bionic
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `business`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`id`, `first_name`, `last_name`, `address`, `phone_number`) VALUES
(1, 'John', 'Braham', '1153 Haven Lane', '801-335-5811'),
(2, 'Liz', 'Stofus', '1207 August Lane', '801-301-7472'),
(3, 'Justin', 'Rosser', '2713 Glendale Avenue', '303-682-1230'),
(4, 'William', 'Sheard', '1800 Harley Vincent Drive', '641-861-1013'),
(5, 'Jonathon', 'Rogers', '2518 Hart Ridge Road', '734-462-6666'),
(6, 'Doris', 'Cannon', '4892 Corbin Branch Road', '734-748-2286'),
(7, 'Emily', 'Curcy', '2620 Walton Street', '617-905-4299');

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Orders`
--

CREATE TABLE `Customer_Orders` (
  `id` int(11) NOT NULL,
  `customers` int(11) DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Customer_Orders`
--

INSERT INTO `Customer_Orders` (`id`, `customers`, `products`, `quantity`) VALUES
(1, 1, 2, 3),
(2, 2, 4, 2),
(4, 2, 6, 2),
(5, 1, 3, 5),
(6, 1, 3, 6),
(7, 4, 3, 3),
(8, 3, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `num_of_orders` int(11) DEFAULT NULL,
  `products` int(11) NOT NULL,
  `date_of_production` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `stores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id`, `num_of_orders`, `products`, `date_of_production`, `expiration_date`, `stores`) VALUES
(1, 25, 1, '2020-07-15 15:36:30', '2020-10-22 16:30:22', 1),
(2, 55, 1, '2020-08-10 12:25:10', '2020-12-15 17:20:33', 2),
(3, 14, 7, '2020-08-10 12:25:10', '2021-01-15 14:11:25', 2),
(4, 22, 6, '2020-09-10 16:20:13', '2021-02-08 09:15:30', 5),
(5, 35, 3, '2020-06-10 12:25:10', '2021-01-12 15:20:30', 3),
(6, 50, 4, '2020-06-10 12:25:10', '2020-09-12 13:15:27', 3),
(7, 26, 5, '2020-05-07 14:28:12', '2020-10-15 16:08:14', 5),
(8, 15, 2, '2020-06-10 12:25:10', '2020-11-15 14:06:05', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`id`, `name`, `country_of_origin`) VALUES
(1, 'Havarti', 'Bosnia and Herzegovina'),
(2, 'Trappist', 'Denmark'),
(3, 'Cheddar', 'England'),
(4, 'Feta', 'Greece'),
(5, 'Grana', 'Italy'),
(6, 'Gorgonzola', 'Italy'),
(7, 'Parmigiano-Reggiano', 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` char(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`id`, `first_name`, `last_name`, `age`, `staff_id`) VALUES
(1, 'Ivko', 'Ivkić', '20', '555543890'),
(2, 'Stipo', 'Stipić', '23', '666643890'),
(3, 'Adrijan', 'Adrijanski', '21', '666643891'),
(4, 'Ana', 'Anić', '20', '555543891'),
(5, 'Ema', 'Emić', '23', '555543892'),
(6, 'Ivo', 'Ivković', '25', '555543895'),
(7, 'Darko', 'Darkić', '35', '555543899'),
(8, 'Leon', 'Lenić', '30', '555543995'),
(9, 'Janko', 'Jankic', '30', '555563995'),
(11, 'Kristijan', 'Lenić', '30', '555545999'),
(12, 'Dodo', 'Donić', '28', '555543898');

-- --------------------------------------------------------

--
-- Table structure for table `Stores`
--

CREATE TABLE `Stores` (
  `id` int(11) NOT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Stores`
--

INSERT INTO `Stores` (`id`, `store_name`, `phone_number`, `location`) VALUES
(1, 'Cheese Relish', '631-682-8709', '731 Charter Street'),
(2, 'Cheesebea', '516-954-4174', '4929 Elliot Avenue'),
(3, 'Cheeseistic', '509-663-3261', '4565 Boone Crockett Lane'),
(4, 'Cheese Stand', '509-669-0510', '1062 Court Street'),
(5, 'Cheese Roll', '606-301-6603', '3561 Snowbird Lane'),
(6, 'Cheese Crisp', '606-336-8075', '4159 Willow Greene Drive'),
(7, 'Cheesevio', '913-795-4409', '3642 Chicago Avenue');

-- --------------------------------------------------------

--
-- Table structure for table `Stores_Managers`
--

CREATE TABLE `Stores_Managers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stores` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Stores_Managers`
--

INSERT INTO `Stores_Managers` (`id`, `first_name`, `last_name`, `stores`) VALUES
(1, 'Mary', 'Lowery', 2),
(2, 'Velma', 'Weathers', 1),
(3, 'Francis', 'Reed', 3),
(4, 'Page', 'James', 5),
(5, 'Brian', 'Jackson', 6),
(6, 'Louisa', 'Naquin', 4),
(7, 'Timothy', 'Green', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Stores_staff`
--

CREATE TABLE `Stores_staff` (
  `id` int(11) NOT NULL,
  `stores` int(11) DEFAULT NULL,
  `staff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Stores_staff`
--

INSERT INTO `Stores_staff` (`id`, `stores`, `staff`) VALUES
(1, 1, 1),
(3, 3, 5),
(4, 4, 4),
(5, 5, 6),
(6, 6, 7),
(7, 6, 8),
(8, 7, 12),
(9, 7, 11),
(10, 6, 9),
(12, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `Customer_Orders`
--
ALTER TABLE `Customer_Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers` (`customers`),
  ADD KEY `products` (`products`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `Stores`
--
ALTER TABLE `Stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Stores_Managers`
--
ALTER TABLE `Stores_Managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stores` (`stores`);

--
-- Indexes for table `Stores_staff`
--
ALTER TABLE `Stores_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff` (`staff`),
  ADD KEY `stores` (`stores`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Customer_Orders`
--
ALTER TABLE `Customer_Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Stores`
--
ALTER TABLE `Stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Stores_Managers`
--
ALTER TABLE `Stores_Managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Stores_staff`
--
ALTER TABLE `Stores_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customer_Orders`
--
ALTER TABLE `Customer_Orders`
  ADD CONSTRAINT `Customer_Orders_ibfk_1` FOREIGN KEY (`customers`) REFERENCES `Customers` (`id`),
  ADD CONSTRAINT `Customer_Orders_ibfk_2` FOREIGN KEY (`products`) REFERENCES `Products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Stores_Managers`
--
ALTER TABLE `Stores_Managers`
  ADD CONSTRAINT `Stores_Managers_ibfk_1` FOREIGN KEY (`stores`) REFERENCES `Stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Stores_staff`
--
ALTER TABLE `Stores_staff`
  ADD CONSTRAINT `Stores_staff_ibfk_1` FOREIGN KEY (`stores`) REFERENCES `Stores` (`id`),
  ADD CONSTRAINT `Stores_staff_ibfk_2` FOREIGN KEY (`staff`) REFERENCES `Staff` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
