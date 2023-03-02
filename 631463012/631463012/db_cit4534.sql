-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2022 at 07:15 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cit4534`
--

-- --------------------------------------------------------

--
-- Table structure for table `serialnumber`
--

CREATE TABLE `serialnumber` (
  `idSerialNO` int(11) NOT NULL,
  `serialNO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serialnumber`
--

INSERT INTO `serialnumber` (`idSerialNO`, `serialNO`) VALUES
(1, 'admin-01'),
(3, 'admin-03'),
(8, 'admin-04'),
(9, 'admin-05'),
(11, 'admin-06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_close_crop`
--

CREATE TABLE `tb_close_crop` (
  `no` int(3) NOT NULL,
  `docdate` date NOT NULL,
  `crop_id` varchar(10) NOT NULL,
  `qty` float(10,2) NOT NULL,
  `income` float(10,2) NOT NULL,
  `cost` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_close_crop`
--

INSERT INTO `tb_close_crop` (`no`, `docdate`, `crop_id`, `qty`, `income`, `cost`) VALUES
(1, '2544-03-01', '061', 1616.00, 33.00, 61.00),
(4, '2544-03-22', '02', 50.00, 5000.00, 600.00),
(5, '2222-12-22', '22', 333333.00, 3333.00, 3333.00);

-- --------------------------------------------------------

--
-- Table structure for table `tb_crop`
--

CREATE TABLE `tb_crop` (
  `crop_id` varchar(10) NOT NULL,
  `crop_date` date NOT NULL,
  `plant_id` varchar(3) NOT NULL,
  `gh_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_crop`
--

INSERT INTO `tb_crop` (`crop_id`, `crop_date`, `plant_id`, `gh_id`) VALUES
('001', '2222-12-22', '13', '13'),
('002', '2656-03-03', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_farm`
--

CREATE TABLE `tb_farm` (
  `farm_id` varchar(3) NOT NULL,
  `farm_name` varchar(50) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_farm`
--

INSERT INTO `tb_farm` (`farm_id`, `farm_name`, `lat`, `lng`) VALUES
('11', 'hhhhhhhfff', '12', '1'),
('12', '13', '15@gmail.com', '14');

-- --------------------------------------------------------

--
-- Table structure for table `tb_greenhouse`
--

CREATE TABLE `tb_greenhouse` (
  `gh_id` varchar(3) NOT NULL,
  `gh_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_greenhouse`
--

INSERT INTO `tb_greenhouse` (`gh_id`, `gh_name`) VALUES
('002', 'kong'),
('003', 'gggg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_plant`
--

CREATE TABLE `tb_plant` (
  `plant_id` varchar(3) NOT NULL,
  `plant_name` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `ph` float(5,2) NOT NULL,
  `temp` float(5,2) NOT NULL,
  `humid` float(5,2) NOT NULL,
  `soild_moisture` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_plant`
--

INSERT INTO `tb_plant` (`plant_id`, `plant_name`, `age`, `ph`, `temp`, `humid`, `soild_moisture`) VALUES
('002', 'gggg', 2, 6.00, 9.00, 9.00, 9.00),
('003', 'มะเขือ', 45, 7.00, 24.20, 79.00, 70.22);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` varchar(10) NOT NULL,
  `nameandsurname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `date_of_birth` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `nameandsurname`, `email`, `password`, `phone_number`, `date_of_birth`) VALUES
('001', 'kong', 'admin', '12345', '0806242825', '16/05/2565'),
('002', 'gogo', 'admin1', '23456', '0960240921', '31/08/2565');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `serialnumber`
--
ALTER TABLE `serialnumber`
  ADD PRIMARY KEY (`idSerialNO`);

--
-- Indexes for table `tb_close_crop`
--
ALTER TABLE `tb_close_crop`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `tb_crop`
--
ALTER TABLE `tb_crop`
  ADD PRIMARY KEY (`crop_id`);

--
-- Indexes for table `tb_farm`
--
ALTER TABLE `tb_farm`
  ADD PRIMARY KEY (`farm_id`);

--
-- Indexes for table `tb_greenhouse`
--
ALTER TABLE `tb_greenhouse`
  ADD PRIMARY KEY (`gh_id`);

--
-- Indexes for table `tb_plant`
--
ALTER TABLE `tb_plant`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `serialnumber`
--
ALTER TABLE `serialnumber`
  MODIFY `idSerialNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_close_crop`
--
ALTER TABLE `tb_close_crop`
  MODIFY `no` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
