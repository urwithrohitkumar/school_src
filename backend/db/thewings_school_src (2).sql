-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2022 at 11:30 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thewings_school_src`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_refund`
--

CREATE TABLE `student_fees_refund` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `receipt_number` varchar(50) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `remark` text NOT NULL,
  `refund_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_refund`
--

INSERT INTO `student_fees_refund` (`id`, `student_id`, `receipt_number`, `student_fees_master_id`, `fee_groups_feetype_id`, `amount_detail`, `is_active`, `created_at`, `remark`, `refund_by`) VALUES
(1, 1, 'R2209171663412785', 426, 26, '{\"4\":{\"amount\":\"298\",\"date\":\"2022-09-16\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":4}}', 'yes', '2022-09-19 08:31:43', 'Test', 1),
(2, 1, 'R22091716634128401', 426, 25, '{\"1\":{\"amount\":\"600.00\",\"date\":\"2022-09-01\",\"description\":\" Collected By: Super Admin\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-09-19 08:31:45', 'Test', 1),
(3, 1, 'R22091716634128492', 426, 24, '{\"1\":{\"amount\":\"1500.00\",\"date\":\"2022-09-01\",\"description\":\" Collected By: Super Admin\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-09-19 08:31:48', 'Test', 1),
(4, 1, 'R22091916635756463', 426, 16, '{\"1\":{\"amount\":\"1500.00\",\"date\":\"2022-09-01\",\"description\":\" Collected By: Super Admin\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-09-19 08:31:50', 'Teste', 1),
(5, 1, 'R22091916635756734', 426, 28, '{\"1\":{\"amount\":\"1500.00\",\"date\":\"2022-09-01\",\"description\":\" Collected By: Super Admin\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-09-19 08:31:53', 'Teste', 1),
(6, 1, 'R22091916635913215', 426, 23, '{\"1\":{\"amount\":\"1500.00\",\"date\":\"2022-09-01\",\"description\":\" Collected By: Super Admin\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-09-19 12:42:01', 'ddddddddddddddddddddddddddddddddddddddddddddd', 1),
(7, 2, 'R22092016636547976', 427, 15, '{\"1\":{\"amount\":\"1500.00\",\"date\":\"2022-09-16\",\"description\":\" Collected By: Super Admin\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-09-20 06:19:57', 'TEsteeeeee', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_fees_refund`
--
ALTER TABLE `student_fees_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_fees_refund`
--
ALTER TABLE `student_fees_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
