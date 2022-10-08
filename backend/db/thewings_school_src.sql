-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2022 at 01:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
-- Table structure for table `aadhar_card`
--

CREATE TABLE `aadhar_card` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `house_no` varchar(250) DEFAULT NULL,
  `street` varchar(250) DEFAULT NULL,
  `landmark` varchar(250) DEFAULT NULL,
  `area` varchar(250) DEFAULT NULL,
  `post_office` varchar(250) DEFAULT NULL,
  `district` varchar(250) DEFAULT NULL,
  `thumb_image` varchar(500) DEFAULT NULL,
  `certifier_name` varchar(250) DEFAULT NULL,
  `certifier_designation` varchar(250) DEFAULT NULL,
  `certifier_office_add` varchar(250) DEFAULT NULL,
  `cerifier_contact` varchar(250) DEFAULT NULL,
  `gajet_officer_group_A` varchar(11) DEFAULT NULL,
  `village_panchayat` varchar(11) DEFAULT NULL,
  `gajet_officer_group_B` varchar(11) DEFAULT NULL,
  `councilor` varchar(11) DEFAULT NULL,
  `tehsildar` varchar(11) DEFAULT NULL,
  `hrei` varchar(11) DEFAULT NULL,
  `swmho` varchar(11) DEFAULT NULL,
  `epfo` varchar(11) DEFAULT NULL,
  `overwriting` varchar(11) DEFAULT NULL,
  `issue_date` varchar(11) DEFAULT NULL,
  `resident_sign` varchar(11) DEFAULT NULL,
  `certifier_details` varchar(11) DEFAULT NULL,
  `cross_stamp` varchar(11) DEFAULT NULL,
  `stamp_img` varchar(500) DEFAULT NULL,
  `student_img` varchar(500) DEFAULT NULL,
  `resident` varchar(11) DEFAULT NULL,
  `nri` varchar(11) DEFAULT NULL,
  `newenrolmment` varchar(10) DEFAULT NULL,
  `updaterequest` varchar(10) DEFAULT NULL,
  `enterdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_events`
--

CREATE TABLE `alumni_events` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `event_notification_message` text NOT NULL,
  `show_onwebsite` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_students`
--

CREATE TABLE `alumni_students` (
  `id` int(11) NOT NULL,
  `current_email` varchar(255) NOT NULL,
  `current_phone` varchar(255) NOT NULL,
  `occupation` text NOT NULL,
  `address` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendence_type`
--

CREATE TABLE `attendence_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `key_value` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendence_type`
--

INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2016-06-23 18:11:37', '0000-00-00'),
(2, 'Late With Excuse', '<b class=\"text text-warning\">E</b>', 'no', '2018-05-29 08:19:48', '0000-00-00'),
(3, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2016-06-23 18:12:28', '0000-00-00'),
(4, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2016-10-11 11:35:40', '0000-00-00'),
(5, 'Holiday', 'H', 'yes', '2016-10-11 11:35:01', '0000-00-00'),
(6, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2016-06-23 18:12:28', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `isbn_no` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rack_no` varchar(100) NOT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `perunitcost` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `branch_id`, `book_title`, `book_no`, `isbn_no`, `subject`, `rack_no`, `publish`, `author`, `qty`, `perunitcost`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES
(2, NULL, 'Marigold', '1', 'ISBN 81-7450-478-8', 'English', '18', 'NCERT', 'NCERT', 27, 65.00, '2021-07-01', '', 'yes', 'no', '2021-07-01 09:14:27', NULL),
(3, NULL, 'Official Knowledge: Democratic Education in a Conservative Age (1993)', 'EIS21001', '978-3-16-148410-0', 'Philosophical', '1', 'Academic Press', 'Michael W. Apple', 2, 2527.02, '2021-01-01', 'Official Knowledge: Democratic Education in a Conservative Age (1993)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(4, NULL, 'Between Past and Future (1961)', 'EIS21002', '978-3-16-148410-1', 'Philosophical', '2', 'Allen Press', 'Hannah Arendt', 4, 799.00, '2021-01-02', 'Between Past and Future (1961)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(5, NULL, 'Culture and Anarchy', 'EIS21003', '978-3-16-148410-2', 'Philosophical', '3', 'Begell House', 'Matthew Arnold', 2, 1549.00, '2021-01-03', 'Culture and Anarchy', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(6, NULL, 'Giving Teaching Back to the Teachers (1984)', 'EIS21004', '978-3-16-148410-3', 'Philosophical', '4', 'Bentham Science', 'Robin Barrow', 1, 3783.00, '2021-01-04', 'Giving Teaching Back to the Teachers (1984)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(7, NULL, 'Learning Beyond The Classroom: Education for a Changing World (1998)', 'EIS21005', '978-3-16-148410-4', 'Philosophical', '5', 'Cambridge University Press', 'Tom Bentley', 1, 2230.94, '2021-01-05', 'Learning Beyond The Classroom: Education for a Changing World (1998)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(8, NULL, 'The Closing of the American Mind: How Higher Education Has Failed Democracy and Impoverished the Sou', 'EIS21006', '978-3-16-148410-5', 'Philosophical', '6', 'Elsevier', 'Allan Bloom', 4, 498.00, '2021-01-06', 'The Closing of the American Mind: How Higher Education Has Failed Democracy and Impoverished the Souls of Today’s Students (1987)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(9, NULL, 'Schooling in Capitalist America: Educational Reform and the Contradictions of Economic Life (1976)', 'EIS21008', '978-3-16-148410-7', 'Philosophical', '8', 'Academic Press', 'Samuel Bowles and Herbert Gintis', 1, 2513.00, '2021-01-08', 'Schooling in Capitalist America: Educational Reform and the Contradictions of Economic Life (1976)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(10, NULL, 'The Process of Education (1960)', 'EIS21009', '978-3-16-148410-8', 'Philosophical', '9', 'Allen Press', 'Jerome Bruner', 1, 2041.00, '2021-01-09', 'The Process of Education (1960)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(11, NULL, 'Democracy and Education (1916)', 'EIS21010', '978-3-16-148410-9', 'Philosophical', '10', 'Begell House', 'John Dewey', 5, 975.00, '2021-01-10', 'Democracy and Education (1916)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(12, NULL, 'Children’s Minds (1978)', 'EIS21011', '978-3-16-148410-10', 'Philosophical', '11', 'Bentham Science', 'Margaret Donaldson', 4, 781.00, '2021-01-11', 'Children’s Minds (1978)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(13, NULL, 'The Home and the School (1964)', 'EIS21012', '978-3-16-148410-11', 'Philosophical', '12', 'Cambridge University Press', 'JWB Douglas', 5, 344.53, '2021-01-12', 'The Home and the School (1964)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(14, NULL, 'The Dangerous Rise of Therapeutic Education (2008)', 'EIS21013', '978-3-16-148410-12', 'Philosophical', '13', 'Elsevier', 'Kathryn Ecclestone and Dennis Hayes', 1, 7558.99, '2021-01-13', 'The Dangerous Rise of Therapeutic Education (2008)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(15, NULL, 'Antonio Gramsci: Conservative Schooling for Radical Politics (1979)', 'EIS21014', '978-3-16-148410-13', 'Philosophical', '14', 'Emerald Group Publishing', 'Harold Entwistle', 1, 3277.59, '2021-01-14', 'Antonio Gramsci: Conservative Schooling for Radical Politics (1979)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(16, NULL, 'Pedagogy of the Oppressed (1968/1970)', 'EIS21015', '978-3-16-148410-14', 'Philosophical', '15', 'Academic Press', 'Paulo Freire', 1, 5692.12, '2021-01-15', 'Pedagogy of the Oppressed (1968/1970)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(17, NULL, 'Wasted: Why Education Isn’t Educating (2009)', 'EIS21016', '978-3-16-148410-15', 'Philosophical', '16', 'Allen Press', 'Frank Furedi', 1, 1646.97, '2021-01-16', 'Wasted: Why Education Isn’t Educating (2009)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(18, NULL, 'Reclaiming Childhood (2009)', 'EIS21017', '978-3-16-148410-16', 'Philosophical', '17', 'Begell House', 'Helene Guldberg', 1, 2548.00, '2021-01-17', 'Reclaiming Childhood (2009)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(19, NULL, 'The Schools We Need And Why We Don’t Have Them (1999)', 'EIS21018', '978-3-16-148410-17', 'Philosophical', '18', 'Bentham Science', 'ED Hirsch Jnr.', 1, 1223.00, '2021-01-18', 'The Schools We Need And Why We Don’t Have Them (1999)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(20, NULL, 'Knowledge and the Curriculum(1974)', 'EIS21019', '978-3-16-148410-18', 'Philosophical', '19', 'Cambridge University Press', 'Paul H Hirst', 1, 13229.55, '2021-01-19', 'Knowledge and the Curriculum(1974)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(21, NULL, 'How Children Fail (1964)', 'EIS21020', '978-3-16-148410-19', 'Philosophical', '20', 'Elsevier', 'John Holt', 4, 899.00, '2021-01-20', 'How Children Fail (1964)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(22, NULL, 'The Role of the Teacher (1969)', 'EIS21021', '978-3-16-148410-20', 'Philosophical', '21', 'Emerald Group Publishing', 'Eric Hoyle', 6, 400.00, '2021-01-21', 'The Role of the Teacher (1969)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(23, NULL, 'The Death of Character: Moral Education in an Age without Good or Evil (2000)', 'EIS21022', '978-3-16-148410-21', 'Philosophical', '22', 'Academic Press', 'James Davison Hunter', 1, 2208.00, '2021-01-22', 'The Death of Character: Moral Education in an Age without Good or Evil (2000)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(24, NULL, 'Deschooling Society (1971)', 'EIS21023', '978-3-16-148410-22', 'Philosophical', '23', 'Allen Press', 'Ivan Illich', 2, 1302.22, '2021-01-23', 'Deschooling Society (1971)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(25, NULL, 'Some Thoughts Concerning Education (1692)', 'EIS21025', '978-3-16-148410-24', 'Philosophical', '25', 'Bentham Science', 'John Locke', 1, 6492.00, '2021-01-25', 'Some Thoughts Concerning Education (1692)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(26, NULL, 'Autobiography (1873)', 'EIS21026', '978-3-16-148410-25', 'Philosophical', '26', 'Cambridge University Press', 'John Stuart Mill', 6, 404.00, '2021-01-26', 'Autobiography (1873)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(27, NULL, 'An Experiment in Education (1963)', 'EIS21027', '978-3-16-148410-26', 'Philosophical', '27', 'Elsevier', 'Sybil Marshall', 2, 1655.04, '2021-01-27', 'An Experiment in Education (1963)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(28, NULL, 'Summerhill: A Radical Approach to Child Rearing (1960)', 'EIS21028', '978-3-16-148410-27', 'Philosophical', '28', 'Emerald Group Publishing', 'Alexander Sutherland Neil', 1, 21438.00, '2021-01-28', 'Summerhill: A Radical Approach to Child Rearing (1960)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(29, NULL, 'The Idea of a University (1873)', 'EIS21029', '978-3-16-148410-28', 'Philosophical', '29', 'Academic Press', 'John Henry Newman', 2, 1517.00, '2021-01-29', 'The Idea of a University (1873)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(30, NULL, 'The Voice of Liberal Learning (1989)', 'EIS21030', '978-3-16-148410-29', 'Philosophical', '30', 'Allen Press', 'Michael Oakeshott', 1, 3467.98, '2021-01-30', 'The Voice of Liberal Learning (1989)', 'Yes', 'no', '2021-09-04 08:25:48', NULL),
(31, NULL, 'psychology', '1', '123', '', '1', '', 'any', 0, 120.00, '2022-04-08', '', 'yes', 'no', '2022-04-08 04:55:26', NULL),
(32, 1, 'Check branch 1 book', '', '', '', '', '', '', 0, 0.00, '2022-09-28', '', 'yes', 'no', '2022-09-28 12:25:01', NULL),
(33, 2, 'Check branch 2 book', '', '', '', '', '', '', 0, 0.00, '2022-09-28', '', 'yes', 'no', '2022-09-28 12:25:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) UNSIGNED NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `duereturn_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT 0,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `captcha`
--

INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'userlogin', 0, '2021-07-28 07:42:44'),
(2, 'login', 0, '2021-01-19 08:10:31'),
(3, 'admission', 1, '2021-07-01 08:07:14'),
(4, 'complain', 1, '2021-07-01 08:07:17'),
(5, 'contact_us', 1, '2021-07-01 08:07:21');

-- --------------------------------------------------------

--
-- Table structure for table `caste`
--

CREATE TABLE `caste` (
  `id` int(11) NOT NULL,
  `caste` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `caste`
--

INSERT INTO `caste` (`id`, `caste`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'General', 'no', '2022-09-15 10:02:05', NULL),
(2, 'SC', 'no', '2022-09-15 10:02:09', NULL),
(3, 'ST', 'no', '2022-09-15 10:02:14', NULL),
(4, 'OBC', 'no', '2022-09-15 10:02:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'General', 'no', '2022-09-15 12:33:55', NULL),
(2, 'SC', 'no', '2022-09-15 12:34:00', NULL),
(3, 'ST', 'no', '2022-09-15 12:34:06', NULL),
(4, 'OBC', 'no', '2022-09-15 12:34:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = students',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_student_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `branch_id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`) VALUES
(1, 1, 'Migration Certificate', 'This is certify that Shubham Gupta has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date] [category] [cast] [father_name] [mother_name] [religion] [email] [phone] .<br>We wish best of luck for future endeavors.', 'R/5 K123433', 'To Whomever It May Concern', 'Date: 16/07/2022', '...............................SIGN _DEMO INTERNATIONAL SCHOOL', '-------------------------------STAMP', '', 'sampletc1213.png', '2022-09-30 04:54:59', NULL, 2, 1, 360, 400, 480, 810, 1, 230),
(2, 1, 'Participation Certificate', 'This certificate is presented to Shubham Gupta for his active participation in the 7 Days Big data seminar', 'EOS/20RERYCF99', 'Congratulations', '16/07/2022', 'Ajay Mittal | Student Co-ordinator', 'Rishav Malhotra | DEAN of School', 'Demo International School', 'download1.jpeg', '2022-09-30 04:57:47', NULL, 2, 1, 450, 280, 520, 480, 1, 200),
(3, 2, 'Transfer Certificate', 'Master/Miss [name] son/daughter of [father_name] an inhabitant of [present_address] was admitted into Demo International School, on [admission_date] under Admission No. of [admission_no]. He/She took lessons in [class] in the year _________.', '', 'Transfer Certificate', '', '', '', '', 'test_certificate11.jpg', '2022-09-30 04:58:54', NULL, 2, 1, 100, 300, 50, 500, 1, 200),
(4, 2, 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', '', '2022-10-06 08:24:16', NULL, 2, 1, 500, 5, 50, 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat_connections`
--

CREATE TABLE `chat_connections` (
  `id` int(11) NOT NULL,
  `chat_user_one` int(11) NOT NULL,
  `chat_user_two` int(11) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `chat_user_id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  `is_first` int(1) DEFAULT 0,
  `is_read` int(1) NOT NULL DEFAULT 0,
  `chat_connection_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `create_staff_id` int(11) DEFAULT NULL,
  `create_student_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Pre/Nur', 'no', '2022-09-15 10:11:10', NULL),
(2, 'PP/KG', 'no', '2022-09-15 10:12:11', NULL),
(3, ' I', 'no', '2022-09-15 10:12:25', NULL),
(4, 'II', 'no', '2022-09-15 10:12:31', NULL),
(5, 'III', 'no', '2022-09-15 10:12:39', NULL),
(6, 'IV', 'no', '2022-09-15 10:12:48', NULL),
(7, 'V', 'no', '2022-09-15 10:13:13', NULL),
(8, 'VI', 'no', '2022-09-15 10:13:18', NULL),
(9, ' VII', 'no', '2022-09-15 10:13:32', NULL),
(10, 'VIII', 'no', '2022-09-15 10:13:39', NULL),
(11, 'IX', 'no', '2022-09-15 10:13:46', NULL),
(12, 'X', 'no', '2022-09-15 10:13:56', NULL),
(13, 'XI', 'no', '2022-09-15 10:14:22', NULL),
(14, 'XII', 'no', '2022-09-15 10:14:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'no', '2022-09-15 10:11:10', NULL),
(2, 2, 1, 'no', '2022-09-15 10:12:11', NULL),
(3, 3, 1, 'no', '2022-09-15 10:12:25', NULL),
(4, 4, 1, 'no', '2022-09-15 10:12:31', NULL),
(5, 5, 1, 'no', '2022-09-15 10:12:39', NULL),
(6, 6, 1, 'no', '2022-09-15 10:12:48', NULL),
(7, 7, 1, 'no', '2022-09-15 10:13:13', NULL),
(8, 8, 1, 'no', '2022-09-15 10:13:18', NULL),
(9, 9, 1, 'no', '2022-09-15 10:13:32', NULL),
(10, 10, 1, 'no', '2022-09-15 10:13:39', NULL),
(11, 11, 1, 'no', '2022-09-15 10:13:46', NULL),
(12, 12, 1, 'no', '2022-09-15 10:13:56', NULL),
(13, 13, 1, 'no', '2022-09-15 10:14:22', NULL),
(14, 14, 1, 'no', '2022-09-15 10:14:30', NULL),
(16, 1, 2, 'no', '2022-09-15 10:45:18', NULL),
(17, 2, 2, 'no', '2022-09-15 10:45:27', NULL),
(18, 3, 2, 'no', '2022-09-15 10:45:35', NULL),
(19, 4, 2, 'no', '2022-09-15 10:45:46', NULL),
(20, 5, 2, 'no', '2022-09-15 10:45:57', NULL),
(21, 6, 2, 'no', '2022-09-15 10:46:08', NULL),
(22, 7, 2, 'no', '2022-09-15 10:46:22', NULL),
(23, 8, 2, 'no', '2022-09-15 10:46:38', NULL),
(24, 9, 2, 'no', '2022-09-15 10:46:51', NULL),
(25, 10, 2, 'no', '2022-09-15 10:47:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

CREATE TABLE `class_teacher` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_teacher`
--

INSERT INTO `class_teacher` (`id`, `class_id`, `staff_id`, `section_id`, `session_id`) VALUES
(1, 1, 18, 1, 16),
(2, 2, 19, 2, 16);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(255) NOT NULL,
  `source` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complaint_type`
--

INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES
(1, 'General', '', '2021-09-04 11:13:45'),
(2, 'Bullying', '', '2021-09-04 11:13:51'),
(3, 'Staff Misbehavior', '', '2021-09-04 11:14:01'),
(4, 'Teacher Complaint', '', '2021-09-04 11:14:07'),
(5, 'Driver Misconduct', '', '2021-09-04 11:14:15'),
(6, ' Student misbehave', '', '2022-04-08 07:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `branch_id`, `title`, `type`, `is_public`, `class_id`, `cls_sec_id`, `file`, `created_by`, `note`, `is_active`, `created_at`, `updated_at`, `date`) VALUES
(1, 1, 'Assignment Title', 'assignments', 'No', 0, 0, 'uploads/school_content/material/1.jpg', 1, '', 'no', '2022-09-29 12:33:03', NULL, '2022-09-29'),
(2, 2, 'Branch 2 assignment', 'assignments', 'No', 0, 0, 'uploads/school_content/material/2.jpg', 1, '', 'no', '2022-09-29 12:33:36', NULL, '2022-09-29'),
(3, 1, 'Branch 1 Study Material', 'study_material', 'No', 0, 0, 'uploads/school_content/material/3.jpg', 16, '', 'no', '2022-09-29 12:36:33', NULL, '2022-09-29'),
(4, 2, 'Branch 2 Study Material', 'study_material', 'No', 0, 0, 'uploads/school_content/material/4.png', 1, '', 'no', '2022-09-29 12:36:59', NULL, '2022-09-29'),
(5, 1, 'Branch 1 Syllabus', 'syllabus', 'No', 0, 0, 'uploads/school_content/material/5.png', 1, '', 'no', '2022-09-29 12:46:23', NULL, '2022-09-29'),
(6, 2, 'Branch 2 Syllabus', 'syllabus', 'No', 0, 0, 'uploads/school_content/material/6.png', 1, '', 'no', '2022-09-29 12:46:44', NULL, '2022-09-29'),
(7, 1, 'Branch 1 other', 'other_download', 'No', 0, 0, 'uploads/school_content/material/7.png', 16, '', 'no', '2022-09-29 12:47:19', NULL, '2022-09-29'),
(8, 2, 'Branch 2 other', 'other_download', 'No', 0, 0, 'uploads/school_content/material/8.jpg', 1, '', 'no', '2022-09-29 12:47:36', NULL, '2022-09-29'),
(9, 2, 'Test', 'study_material', 'Yes', 0, 0, 'uploads/school_content/material/9.jpg', 1, '', 'no', '2022-10-06 07:52:07', NULL, '2022-10-06');

-- --------------------------------------------------------

--
-- Table structure for table `content_for`
--

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_for`
--

INSERT INTO `content_for` (`id`, `role`, `content_id`, `user_id`, `created_at`) VALUES
(1, 'Admin', 1, NULL, '2022-09-29 12:09:31'),
(2, 'student', 1, NULL, '2022-09-29 12:09:31'),
(3, 'Super Admin', 2, NULL, '2022-09-29 12:19:55'),
(4, 'student', 2, NULL, '2022-09-29 12:19:55'),
(5, 'Super Admin', 3, NULL, '2022-09-29 12:22:41'),
(6, 'Super Admin', 1, NULL, '2022-09-29 12:33:03'),
(7, 'Super Admin', 2, NULL, '2022-09-29 12:33:36'),
(8, 'Admin', 3, NULL, '2022-09-29 12:36:33'),
(9, 'Super Admin', 4, NULL, '2022-09-29 12:36:59'),
(10, 'Super Admin', 5, NULL, '2022-09-29 12:46:23'),
(11, 'Super Admin', 6, NULL, '2022-09-29 12:46:44'),
(12, 'Admin', 7, NULL, '2022-09-29 12:47:19'),
(13, 'Super Admin', 8, NULL, '2022-09-29 12:47:36'),
(14, 'student', 9, NULL, '2022-10-06 07:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(10) DEFAULT NULL,
  `validation` int(11) DEFAULT 0,
  `field_values` text DEFAULT NULL,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'school', 'staff', 'multiselect', 12, 1, '5', NULL, 0, NULL, 0, '2021-10-23 09:37:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`, `updated_at`) VALUES
(1, 16, 1, '5', '2022-09-28 10:06:37', NULL),
(2, 17, 1, '5', '2022-09-28 10:07:36', NULL),
(3, 18, 1, '5', '2022-09-28 10:08:26', NULL),
(4, 19, 1, '5', '2022-09-28 10:09:07', NULL),
(5, 20, 1, '5', '2022-09-28 10:10:08', NULL),
(6, 21, 1, '5', '2022-10-06 07:08:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES
(1, 'English', 'yes'),
(2, 'Hindi', 'yes'),
(3, 'Sanskrit', 'yes'),
(4, 'French', 'yes'),
(5, 'Spanish', 'yes'),
(6, 'Placement', 'yes'),
(7, 'Training', 'yes'),
(8, 'Admission', 'yes'),
(9, 'Business Development', 'yes'),
(10, 'Administraation', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason`
--

CREATE TABLE `disable_reason` (
  `id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_receive`
--

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `smtp_auth`, `is_active`, `created_at`) VALUES
(1, 'sendmail', 'localhost', '25', 'rahulraj1281998@gmail.com', 'rahul9939', '', 'false', 'yes', '2021-08-04 05:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` text NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL,
  `enquiry_type` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_groups`
--

CREATE TABLE `exam_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_groups`
--

INSERT INTO `exam_groups` (`id`, `name`, `exam_type`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Finals', 'gpa', '', 0, '2021-07-01 06:46:09', NULL),
(4, 'test exam', 'basic_system', '1', 0, '2021-10-21 10:13:06', NULL),
(5, 'half yearly', 'basic_system', 'half yearly ', 0, '2022-04-07 07:51:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exams`
--

CREATE TABLE `exam_group_class_batch_exams` (
  `id` int(11) NOT NULL,
  `exam` varchar(250) DEFAULT NULL,
  `session_id` int(10) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `use_exam_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_publish` int(1) DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_group_class_batch_exams`
--

INSERT INTO `exam_group_class_batch_exams` (`id`, `exam`, `session_id`, `date_from`, `date_to`, `description`, `exam_group_id`, `use_exam_roll_no`, `is_publish`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Final Exam 2022', 16, NULL, NULL, '', 1, 1, 1, 1, '2022-09-16 06:47:24', NULL),
(3, 'English', 16, NULL, NULL, '', 5, 1, 0, 1, '2022-04-07 07:53:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exam_students`
--

CREATE TABLE `exam_group_class_batch_exam_students` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `roll_no` int(6) NOT NULL DEFAULT 0,
  `teacher_remark` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_group_class_batch_exam_students`
--

INSERT INTO `exam_group_class_batch_exam_students` (`id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `teacher_remark`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, 100001, NULL, 0, '2021-10-21 09:50:09', NULL),
(3, 1, 5, 5, 100003, NULL, 0, '2021-10-21 09:50:09', NULL),
(13, 1, 43, 43, 0, NULL, 0, '2022-03-31 12:09:46', NULL),
(42, 3, 79, 81, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(43, 3, 3, 3, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(44, 3, 4, 4, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(45, 3, 6, 6, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(46, 3, 7, 7, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(47, 3, 41, 41, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(48, 3, 42, 42, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(49, 3, 44, 44, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(50, 3, 45, 45, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(51, 3, 46, 46, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(52, 3, 47, 47, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(53, 3, 48, 48, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(54, 3, 49, 49, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(55, 3, 50, 50, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(56, 3, 51, 51, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(57, 3, 52, 52, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(58, 3, 53, 53, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(59, 3, 54, 54, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(60, 3, 55, 55, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(61, 3, 56, 56, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(62, 3, 57, 57, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(63, 3, 58, 58, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(64, 3, 59, 59, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(65, 3, 60, 60, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(66, 3, 61, 61, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(67, 3, 62, 62, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(68, 3, 63, 63, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(69, 3, 64, 64, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(70, 3, 65, 65, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(71, 3, 66, 66, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(72, 3, 67, 67, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(73, 3, 68, 68, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(74, 3, 69, 69, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(75, 3, 70, 70, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(76, 3, 71, 71, 0, NULL, 0, '2022-04-07 07:53:27', NULL),
(77, 1, 1, 1, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(78, 1, 2, 2, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(79, 1, 4, 4, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(80, 1, 6, 6, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(81, 1, 7, 7, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(82, 1, 8, 8, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(83, 1, 9, 9, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(84, 1, 10, 10, 0, NULL, 0, '2022-09-16 06:51:00', NULL),
(85, 1, 11, 11, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(86, 1, 12, 12, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(87, 1, 13, 13, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(88, 1, 14, 14, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(89, 1, 15, 15, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(90, 1, 16, 16, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(91, 1, 17, 17, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(92, 1, 18, 18, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(93, 1, 19, 19, 0, NULL, 0, '2022-09-16 06:51:12', NULL),
(94, 1, 20, 20, 0, NULL, 0, '2022-09-16 06:51:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exam_subjects`
--

CREATE TABLE `exam_group_class_batch_exam_subjects` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `subject_id` int(10) NOT NULL,
  `date_from` date NOT NULL,
  `time_from` time NOT NULL,
  `duration` varchar(50) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `max_marks` float(10,2) DEFAULT NULL,
  `min_marks` float(10,2) DEFAULT NULL,
  `credit_hours` float(10,2) DEFAULT 0.00,
  `date_to` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_group_class_batch_exam_subjects`
--

INSERT INTO `exam_group_class_batch_exam_subjects` (`id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-07-23', '12:30:38', '1', '21', 100.00, 35.00, 1.00, NULL, 0, '2022-09-16 06:46:57', NULL),
(3, 1, 1, '2022-09-24', '12:30:18', '1', '21', 100.00, 35.00, 1.00, NULL, 0, '2022-09-16 06:46:57', NULL),
(4, 1, 7, '2022-09-26', '12:30:18', '1', '21', 100.00, 35.00, 1.00, NULL, 0, '2022-09-16 06:49:19', NULL),
(5, 1, 8, '2022-09-27', '12:30:18', '1', '21', 100.00, 35.00, 1.00, NULL, 0, '2022-09-16 06:50:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_exam_connections`
--

CREATE TABLE `exam_group_exam_connections` (
  `id` int(11) NOT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `exam_weightage` float(10,2) DEFAULT 0.00,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_exam_results`
--

CREATE TABLE `exam_group_exam_results` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exam_student_id` int(11) NOT NULL,
  `exam_group_class_batch_exam_subject_id` int(11) DEFAULT NULL,
  `attendence` varchar(10) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `exam_group_student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_group_exam_results`
--

INSERT INTO `exam_group_exam_results` (`id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES
(1, 1, 1, 'present', 78.00, '', 0, '2021-07-01 06:54:03', NULL, NULL),
(3, 3, 1, 'present', 25.00, '', 0, '2021-07-01 06:54:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_students`
--

CREATE TABLE `exam_group_students` (
  `id` int(11) NOT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(10) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `attendence` varchar(10) NOT NULL,
  `exam_schedule_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) DEFAULT NULL,
  `end_from` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `expenses` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expense_head`
--

INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Salary', '', 'yes', 'no', '2021-07-01 06:27:44', NULL),
(2, 'School Infrastructure', '', 'yes', 'no', '2021-07-01 06:27:54', NULL),
(3, 'Refund Fees-I', 'Fees refunded due to parents transfer', 'yes', 'no', '2022-09-03 10:55:47', NULL),
(4, 'Refund Fees-II', 'Fees refunded due to student transfer to different school', 'yes', 'no', '2022-09-03 10:56:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feecategory`
--

CREATE TABLE `feecategory` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feemasters`
--

CREATE TABLE `feemasters` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fees_discounts`
--

CREATE TABLE `fees_discounts` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_discounts`
--

INSERT INTO `fees_discounts` (`id`, `session_id`, `name`, `code`, `amount`, `description`, `is_active`, `created_at`) VALUES
(1, 16, 'PROMO21', 'PROMO21', '500.00', '', 'no', '2021-07-01 09:03:39'),
(2, 16, 'EWS Discount', '22454', '1000.00', '', 'no', '2021-09-06 10:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL,
  `reminder_type` varchar(10) DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_reminder`
--

INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'before', 2, 1, '2021-12-14 04:52:59', NULL),
(2, 'before', 5, 1, '2021-07-01 06:12:34', NULL),
(3, 'after', 2, 1, '2021-07-01 06:12:34', NULL),
(4, 'after', 5, 1, '2021-07-01 06:12:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feetype`
--

CREATE TABLE `feetype` (
  `id` int(11) NOT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feetype`
--

INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES
(1, 1, NULL, 'Previous Session Balance', 'Previous Session Balance', 'no', '2021-07-01 06:13:01', NULL, ''),
(12, 0, NULL, 'Tuition Fee - April', '221', 'no', '2021-12-06 05:59:47', NULL, ''),
(13, 0, NULL, 'Tuition Fee - May', '222', 'no', '2021-12-06 06:00:02', NULL, ''),
(14, 0, NULL, 'Tuition Fee - June', '223', 'no', '2021-12-06 06:00:14', NULL, ''),
(15, 0, NULL, 'Tuition Fee - July', '224', 'no', '2021-12-06 06:00:28', NULL, ''),
(16, 0, NULL, 'Tuition Fee - August', '225', 'no', '2021-12-06 06:00:45', NULL, ''),
(17, 0, NULL, 'Tuition Fee - September', '226', 'no', '2021-12-06 06:00:58', NULL, ''),
(18, 0, NULL, 'Tuition Fee - October', '227', 'no', '2021-12-06 06:01:12', NULL, ''),
(19, 0, NULL, 'Tuition Fee - November', '228', 'no', '2021-12-06 06:01:29', NULL, ''),
(20, 0, NULL, 'Tuition Fee - December', '229', 'no', '2021-12-06 06:01:42', NULL, ''),
(21, 0, NULL, 'Tuition Fee - January', '230', 'no', '2021-12-06 06:01:56', NULL, ''),
(22, 0, NULL, 'Tuition Fee - February', '231', 'no', '2021-12-06 06:02:09', NULL, ''),
(23, 0, NULL, 'Tuition Fee - March', '232', 'no', '2021-12-06 06:02:24', NULL, ''),
(24, 0, NULL, 'Annual Charges', '007', 'no', '2021-12-14 04:52:05', NULL, ''),
(25, 0, NULL, 'Academics Fees', '220', 'no', '2022-03-12 06:35:44', NULL, ''),
(26, 0, NULL, 'Transport fees', '256', 'no', '2022-03-24 08:17:35', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups`
--

INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES
(1, 'Balance Master', 1, NULL, 'no', '2021-07-01 06:13:01'),
(24, 'Tuition Fees ( Nur to 5th )', 0, 'Monthly Tuition fees', 'no', '2022-09-16 05:39:54'),
(25, 'Tuition Fees ( 5th to 10th )', 0, 'Monthly Tuition fees\r\n', 'no', '2022-09-16 05:40:29'),
(26, 'Tuition Fees ( 11th - 12th )', 0, 'Monthly Tuition fees', 'no', '2022-09-16 05:41:16'),
(27, 'Examination Fees', 0, 'Annual Exam fees', 'no', '2022-09-16 05:42:20'),
(28, 'Transport Fees', 0, 'Monthly Transport Fees', 'no', '2022-09-16 05:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_feetype`
--

CREATE TABLE `fee_groups_feetype` (
  `id` int(11) NOT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fine_type` varchar(50) NOT NULL DEFAULT 'none',
  `due_date` date DEFAULT NULL,
  `fine_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `fine_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `fine_term_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups_feetype`
--

INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `fine_term_id`, `created_at`) VALUES
(1, 1, 1, 1, 16, NULL, 'none', '2022-11-29', 0.00, 0.00, 'no', NULL, '2022-09-30 07:48:21'),
(36, 14, 24, 12, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:43:42'),
(37, 14, 24, 13, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:43:54'),
(38, 14, 24, 14, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:44:07'),
(39, 14, 24, 15, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:44:16'),
(40, 14, 24, 16, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:44:29'),
(41, 14, 24, 17, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:47:12'),
(42, 14, 24, 18, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:47:25'),
(43, 14, 24, 19, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:47:37'),
(44, 14, 24, 20, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:47:47'),
(45, 14, 24, 21, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:48:16'),
(46, 14, 24, 22, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:48:28'),
(47, 14, 24, 23, 16, '1500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:50:03'),
(48, 15, 25, 12, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:50:20'),
(49, 15, 25, 13, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:50:37'),
(50, 15, 25, 14, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:50:51'),
(51, 15, 25, 15, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:51:01'),
(52, 15, 25, 16, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:51:16'),
(53, 15, 25, 17, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:52:27'),
(54, 15, 25, 18, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:52:59'),
(55, 15, 25, 19, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 05:53:19'),
(56, 15, 25, 20, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 06:13:11'),
(57, 15, 25, 21, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 06:13:35'),
(58, 15, 25, 22, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 06:13:50'),
(59, 15, 25, 23, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 06:14:04'),
(60, 16, 28, 26, 16, '6000.00', 'none', NULL, 0.00, 0.00, 'no', NULL, '2022-09-16 06:14:41'),
(61, 2, 24, 12, 16, '500.00', 'percentage', '2022-10-31', 5.00, 25.00, 'no', NULL, '2022-10-06 06:58:29'),
(62, 2, 24, 18, 16, '5000.00', 'percentage', '2022-10-31', 5.00, 250.00, 'no', 1, '2022-10-07 09:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `fee_receipt_no`
--

CREATE TABLE `fee_receipt_no` (
  `id` int(11) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fee_session_groups`
--

CREATE TABLE `fee_session_groups` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_session_groups`
--

INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES
(1, 1, 16, 'no', '2022-09-30 07:48:21'),
(2, 24, 16, 'no', '2022-10-06 06:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE `filetypes` (
  `id` int(11) NOT NULL,
  `file_extension` text DEFAULT NULL,
  `file_mime` text DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_mime` text DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `file_extension`, `file_mime`, `file_size`, `image_extension`, `image_mime`, `image_size`, `created_at`) VALUES
(1, 'pdf, zip, jpg, jpeg, png, txt, 7z, gif, csv, docx, mp3, mp4, accdb, odt, ods, ppt, pptx, xlsx, wmv, jfif, apk, ppt, bmp, jpe, mdb, rar, xls, svg, mpeg, avi', 'application/pdf, image/zip, image/jpg, image/png, image/jpeg, text/plain, application/x-zip-compressed, application/zip, image/gif, text/csv, application/vnd.openxmlformats-officedocument.wordprocessingml.document, audio/mpeg, application/msaccess, application/vnd.oasis.opendocument.text, application/vnd.oasis.opendocument.spreadsheet, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, video/x-ms-wmv, video/mp4, image/jpeg, application/vnd.android.package-archive, application/x-msdownload, application/vnd.ms-powerpoint, image/bmp, image/jpeg, application/msaccess, application/vnd.ms-excel, image/svg+xml, video/mpeg, video/x-msvideo', 100048576, 'jfif, png, jpe, jpeg, jpg, bmp, gif, svg', 'image/jpeg, image/png, image/jpeg, image/jpeg, image/bmp, image/gif, image/x-ms-bmp, image/svg+xml', 10048576, '2021-07-27 09:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `finetype`
--

CREATE TABLE `finetype` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `finetype`
--

INSERT INTO `finetype` (`id`, `title`, `status`) VALUES
(1, 'daily', 1);

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_media_gallery`
--

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_media_gallery`
--

INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES
(2, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Banner 1.jpg', 'Banner 1.jpg', '2021-09-08 10:46:32', 'image/jpeg', '151063', '', ''),
(3, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Banner 2.png', 'Banner 2.png', '2021-09-08 10:46:39', 'image/png', '137676', '', ''),
(4, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Event Image.jpg', 'Event Image.jpg', '2021-09-08 10:49:36', 'image/jpeg', '923964', '', ''),
(5, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '15aug1.jpg', '15aug1.jpg', '2021-09-08 10:54:48', 'image/jpeg', '97403', '', ''),
(6, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '15aug2.jpg', '15aug2.jpg', '2021-09-08 10:54:48', 'image/jpeg', '170809', '', ''),
(7, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '15aug3.jpg', '15aug3.jpg', '2021-09-08 10:54:48', 'image/jpeg', '369696', '', ''),
(8, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', '15aug4.jpg', '15aug4.jpg', '2021-09-08 10:54:48', 'image/jpeg', '361390', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menus`
--

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `open_new_tab` int(10) NOT NULL DEFAULT 0,
  `ext_url` text NOT NULL,
  `ext_url_link` text NOT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menus`
--

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:49'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_items`
--

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` text DEFAULT NULL,
  `open_new_tab` int(11) DEFAULT 0,
  `ext_url_link` text DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menu_items`
--

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES
(1, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', 1, 0, NULL, 'no', '2019-12-02 22:11:50'),
(2, 1, 'Contact Us', 76, 0, NULL, NULL, NULL, 'contact-us', 7, 0, NULL, 'no', '2021-09-08 11:08:14'),
(3, 1, 'Complain', 2, 0, NULL, NULL, NULL, 'complain', 5, 0, NULL, 'no', '2021-09-08 11:08:14'),
(4, 1, 'Online Admission', 0, 0, '1', NULL, 'https://thewingshield.com/school_src/online_admission', 'online-admission', 3, 0, NULL, 'no', '2021-09-08 11:36:10'),
(5, 1, 'Our Events', 0, 0, '1', NULL, 'https://thewingshield.com/school_src/page/our-events', 'our-events', 2, 0, NULL, 'no', '2021-09-08 12:27:59'),
(6, 1, 'Gallery', 6, 0, NULL, NULL, NULL, 'gallery', 6, 0, NULL, 'no', '2021-09-08 11:08:14'),
(7, 1, 'School News', 9, 0, '1', NULL, 'https://thewingshield.com/school_src/read/huge-celebration-on-school-campus-for-15th-aug', 'school-news', 4, 0, NULL, 'no', '2021-09-09 07:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT 0,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_date` date NOT NULL,
  `publish` int(10) DEFAULT 0,
  `sidebar` int(10) DEFAULT 0,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', 'Emmanuel, School', 'Emmanuel, School', 'Emmanuel, School', '', '<!-- Meta -->\r\n<p>&nbsp;</p>\r\n\r\n<div>\r\n<div class=\"mwPageArea\">\r\n<div class=\"mwPageBlock Include\" id=\"w4OC5U0XZQ8DFQEC\">\r\n<div class=\"mwPageBlock Include\" id=\"w07EA69CHGBHD9RU\">\r\n<div class=\"callToActionWrap one\">\r\n<div class=\"callToAction\">\r\n<div class=\"sidebar right\">\r\n<div class=\"sidebarRight\">\r\n<div class=\"mwPageBlock Button\" id=\"wQCNYXV4YHOXTKPU\">\r\n<div class=\"mwBtnCenter\">\r\n<div class=\"button\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!-- Magnific Popup --><!-- Sidr Menu --><!-- Owl Carousel --><!--Slick--><!-- Images Resize --><!-- Images Resize --><!-- Scripts --></div>', '0000-00-00', 1, NULL, 'no', '2022-03-02 10:58:21'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>[form-builder:complain]</p>', '0000-00-00', 1, NULL, 'no', '2019-11-13 10:16:36'),
(3, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 14:46:04'),
(4, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<section class=\"contact\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<h2 class=\"col-md-12 col-sm-12\">Send In Your Query</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/pin.svg\" />\r\n<h3>Our Location</h3>\r\n\r\n<p>350 Fifth Avenue, 34th floor New York NY 10118-3299 USA</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/phone.svg\" />\r\n<h3>CALL US</h3>\r\n\r\n<p>E-mail : info@abcschool.com</p>\r\n\r\n<p>Mobile : +91-9009987654</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/clock.svg\" />\r\n<h3>Working Hours</h3>\r\n\r\n<p>Mon-Fri : 9 am to 5 pm</p>\r\n\r\n<p>Sat : 9 am to 3 pm</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"mapWrapper fullwidth\"><iframe frameborder=\"0\" height=\"500\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://maps.google.com/maps?f=q&source=s_q&hl=EN&q=time+square&aq=&sll=40.716558,-73.931122&sspn=0.40438,1.056747&ie=UTF8&rq=1&ev=p&split=1&radius=33.22&hq=time+square&hnear=&ll=37.061753,-95.677185&spn=0.438347,0.769043&z=9&output=embed\" width=\"100%\"></iframe></div>\r\n</div>', '0000-00-00', 0, NULL, 'no', '2019-05-04 15:46:41'),
(6, 'manual', 0, 'Our Gallary', 'page/our-gallary', 'page', 'our-gallary', '', '', '', '', '<p style=\"text-align: center;\"><span style=\"font-size:48px;\"><u><strong>Our Gallery</strong></u></span></p>', '0000-00-00', 0, NULL, 'no', '2021-09-08 10:58:49'),
(8, 'manual', 0, 'Our Events', 'page/our-events', 'page', 'our-events', '', '', '', '', '<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-4\" style=\"padding-top:10px;\">\r\n<img src=\"https://thewingshield.com/school_src/uploads/gallery/media/15aug3.jpg\" style=\"height:200px; width:300px\" />\r\n</div>\r\n\r\n<div class=\"col-md-4\"style=\"padding-top:10px;\"><img src=\"https://thewingshield.com/school_src/uploads/gallery/media/15aug2.jpg\" style=\"height:200px; width:300px\" /></div>\r\n\r\n<div class=\"col-md-4\" style=\"padding-top:10px;\"><img src=\"https://thewingshield.com/school_src/uploads/gallery/media/Event Image.jpg\" style=\"height:200px; width:300px\" /></div>\r\n</div>\r\n</div>', '0000-00-00', 0, NULL, 'no', '2021-09-09 07:26:20'),
(9, 'manual', 0, 'School News', 'page/school-news', 'page', 'school-news', '', '', '', '', '<p>dfdsfdsfdsfdfds</p>', '0000-00-00', 0, NULL, 'no', '2021-09-08 12:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_page_contents`
--

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_page_contents`
--

INSERT INTO `front_cms_page_contents` (`id`, `page_id`, `content_type`, `created_at`) VALUES
(2, 6, 'gallery', '2021-09-08 10:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_programs`
--

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `feature_image` text NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_programs`
--

INSERT INTO `front_cms_programs` (`id`, `branch_id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES
(1, NULL, 'banner', NULL, NULL, 'Banner Images', NULL, NULL, NULL, NULL, NULL, 'no', '2021-09-08 10:46:51', '', '', '', '', '0000-00-00', '0', 0),
(3, NULL, 'gallery', 'our-main-gallary', 'read/our-main-gallary', 'Our Main Gallary', NULL, NULL, NULL, NULL, '<p>Check</p>', 'no', '2021-09-08 11:02:02', '', '', '', 'https://thewingshield.com/school_src/uploads/gallery/media/Event Image.jpg', '0000-00-00', '0', NULL),
(4, NULL, 'notice', 'huge-celebration-on-school-campus-for-15th-aug', 'read/huge-celebration-on-school-campus-for-15th-aug', 'Huge Celebration on School Campus for 15th Aug', '2021-08-16', NULL, NULL, NULL, '<p><span style=\"font-family:lucida sans unicode,lucida grande,sans-serif;\">Huge Celebration in School Campus on 15th Aug</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color: rgb(34, 34, 34); font-family: proxima-regular1, Calibri; font-size: 18px; letter-spacing: 0.5px;\">Independence Day is an annual celebration of the day India gained freedom from foreign rule. It was a historic day for our nation, for after years of struggling against the British rule India was officially free. Indians celebrate this day annually, taking the time to remember the hero&#39;s that helped us gain Independence.</span></p>\r\n\r\n<p><span style=\"color: rgb(34, 34, 34); font-family: proxima-regular1, Calibri; font-size: 18px; letter-spacing: 0.5px;\">India had been ruled by the British for several years. For about 100 years India was ruled by the East India Company. In 1757 the Company won the Battle of Plassey started exerting power over India. In 1957 India had it&#39;s first rebellion against the foreign rule in which almost the entire country united against the British. Unfortunately, India was defeated but after that Indian rule passed to the British crown who ruled til India was independent. It was only after a long campaign for independence and Britain being weakened after two world wars was India finally granted it&#39;s freedom.</span></p>\r\n\r\n<p><img src=\"https://thewingshield.com/school_src/uploads/gallery/media/15aug4.jpg\" style=\"height: 280px; width: 500px;\" /></p>\r\n\r\n<div>&nbsp;</div>', 'no', '2021-09-13 07:16:45', '', '', '', '', '0000-00-00', '0', NULL),
(5, 1, 'events', 'test', 'read/test', 'Test', NULL, '2022-10-06', '2022-10-06', 'Test', '<p>Test</p>', 'no', '2022-10-06 09:13:36', '', '', '', 'http://192.168.68.114/school_src/uploads/gallery/media/15aug3.jpg', '0000-00-00', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_program_photos`
--

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_program_photos`
--

INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES
(3, 3, 8, '2021-09-08 11:02:02'),
(4, 3, 7, '2021-09-08 11:02:02'),
(5, 3, 6, '2021-09-08 11:02:02'),
(6, 3, 5, '2021-09-08 11:02:02'),
(7, 3, 4, '2021-09-08 11:02:02'),
(8, 1, 6, '2021-09-08 12:48:11'),
(9, 1, 2, '2021-09-08 12:48:23'),
(10, 1, 4, '2021-09-08 12:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_settings`
--

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT 0,
  `is_active_front_cms` int(11) DEFAULT 0,
  `is_active_sidebar` int(1) DEFAULT 0,
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` text NOT NULL,
  `whatsapp_url` varchar(255) NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `footer_text` varchar(500) DEFAULT NULL,
  `cookie_consent` varchar(255) NOT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_settings`
--

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `whatsapp_url`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `cookie_consent`, `fav_icon`, `created_at`) VALUES
(1, 'shadow_white', NULL, 1, 1, './uploads/school_content/logo/front_logo-60dc3ed4a2c762.85082780.png', '', '', '[\"news\",\"complain\"]', 'https://wa.me/+918882910517', '', '', '', '', '', '', '', '', 'Emmanuel International School©2021', '', './uploads/school_content/logo/front_fav_icon-60dc3ed4a2ee14.94206939.png', '2022-03-02 11:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `general_calls`
--

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `call_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `exam_type`, `name`, `point`, `mark_from`, `mark_upto`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'gpa', 'A+', 10.0, 100.00, 90.00, '', 'no', '2022-09-16 06:57:55', NULL),
(6, 'gpa', 'A', 9.0, 90.00, 85.00, '', 'no', '2022-09-16 06:58:49', NULL),
(7, 'gpa', 'B+', 8.0, 85.00, 75.00, '', 'no', '2022-09-16 06:59:45', NULL),
(8, 'gpa', 'B', 7.0, 75.00, 65.00, '', 'no', '2022-09-16 07:00:31', NULL),
(9, 'gpa', 'C', 6.0, 65.00, 55.00, '', 'no', '2022-09-16 07:01:03', NULL),
(10, 'gpa', 'D', 5.0, 55.00, 45.00, '', 'no', '2022-09-16 07:01:58', NULL),
(11, 'gpa', 'E', 4.0, 45.00, 35.00, '', 'no', '2022-09-16 07:02:37', NULL),
(12, 'gpa', 'F', 3.0, 35.00, 10.00, '', 'no', '2022-09-16 07:03:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(10) NOT NULL,
  `homework_date` date NOT NULL,
  `submit_date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `create_date` date NOT NULL,
  `evaluation_date` date NOT NULL,
  `document` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `evaluated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `class_id`, `branch_id`, `section_id`, `session_id`, `homework_date`, `submit_date`, `staff_id`, `subject_group_subject_id`, `subject_id`, `description`, `create_date`, `evaluation_date`, `document`, `created_by`, `evaluated_by`) VALUES
(1, 1, 1, 1, 16, '2022-09-28', '2022-09-29', 1, 1, 0, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-09-28', '0000-00-00', '', 1, 0),
(2, 1, 2, 1, 16, '2022-09-28', '2022-09-30', 1, 1, 0, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-09-28', '0000-00-00', '', 1, 0),
(3, 2, 2, 2, 16, '2022-10-07', '2022-10-08', 1, 5, 0, '<p>Test</p>', '2022-10-06', '0000-00-00', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `hostel_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `intake` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`id`, `branch_id`, `hostel_name`, `type`, `address`, `intake`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Student Hostel 1', 'Boys', 'B - 37, School Campus', 100, '', 'no', '2021-07-02 08:16:09', NULL),
(2, NULL, 'Student Hostel 2', 'Girls', 'A - 37, School Campus', 100, '', 'no', '2021-07-02 08:16:26', NULL),
(3, NULL, 'Teacher\'s Hostel', 'Combine', 'C - 37', 50, '', 'no', '2021-07-02 08:16:58', NULL),
(4, 1, 'Branch 1 Hotel', 'Girls', '', 0, '', 'no', '2022-09-29 10:30:56', NULL),
(5, 2, 'Branch 2 Hotel', 'Boys', '', 0, '', 'no', '2022-09-29 10:31:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hostel_rooms`
--

CREATE TABLE `hostel_rooms` (
  `id` int(11) NOT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT 0.00,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hostel_rooms`
--

INSERT INTO `hostel_rooms` (`id`, `hostel_id`, `branch_id`, `room_type_id`, `room_no`, `no_of_bed`, `cost_per_bed`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 16, '12', 12, 12.00, NULL, '', '2022-09-29 11:53:35', NULL),
(2, 5, 2, 15, '2332', 56, 3.00, NULL, '', '2022-09-29 11:54:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `id_card`
--

CREATE TABLE `id_card` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(500) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `header_color` varchar(100) NOT NULL,
  `enable_admission_no` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_class` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `id_card`
--

INSERT INTO `id_card` (`id`, `branch_id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `enable_vertical_card`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `status`) VALUES
(1, 1, 'RKS ID card', 'RKS International Public School', 'rks@gmail.com', 'background1.jpg', 'logo12.png', '', 1, '#0be60c', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 2, 'Raj School', 'Raj International School', 'raj@gmail.com', 'background2.jpg', 'logo22.png', 'sign21.png', 1, '#0d73dc', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `branch_id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `updated_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES
(1, 1, 1, 'Good Book', '50', NULL, '', '2022-09-29 06:53:17', NULL, NULL, NULL, 0, '0000-00-00'),
(2, 2, 1, 'Branch 2 Good Book', '20', NULL, '', '2022-09-29 06:53:40', NULL, NULL, NULL, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Book', 'yes', '', '2022-09-29 06:51:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_issue`
--

INSERT INTO `item_issue` (`id`, `branch_id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES
(1, NULL, '1', '17', 'Super Admin (9000)', '2022-09-01', '2022-09-02', 1, 2, 10, '', 1, '2022-09-29 10:14:33', 'no'),
(2, NULL, '1', '16', 'Super Admin (9000)', '2022-09-01', '2022-09-02', 1, 1, 10, '', 1, '2022-09-29 10:15:06', 'no'),
(3, NULL, '2', '18', 'Super Admin (9000)', '2022-09-15', '2022-09-23', 1, 1, 10, '', 1, '2022-09-29 10:20:25', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_stock`
--

INSERT INTO `item_stock` (`id`, `item_id`, `branch_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES
(1, 2, 2, 2, '+', 2, 20, '100', '0000-00-00', NULL, '', 'yes', '2022-09-29 10:05:00'),
(2, 1, 1, 1, '+', 1, 50, '450', '0000-00-00', NULL, '', 'yes', '2022-09-29 10:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_store`
--

INSERT INTO `item_store` (`id`, `branch_id`, `item_store`, `code`, `description`) VALUES
(1, 1, 'Branch one item store', 'IT001', ''),
(2, 2, 'Branch two item store', 'IT002', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_supplier`
--

INSERT INTO `item_supplier` (`id`, `branch_id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES
(1, 1, 'Branch 1Supplier', '', '', '', '', '', '', ''),
(2, 2, 'Branch 2 Supplier', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Azerbaijan', 'az', 'az', 'no', 'no', '2019-11-20 11:23:12', '0000-00-00'),
(2, 'Albanian', 'sq', 'al', 'no', 'no', '2019-11-20 11:42:42', '0000-00-00'),
(3, 'Amharic', 'am', 'am', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(4, 'English', 'en', 'us', 'no', 'no', '2019-11-20 11:38:50', '0000-00-00'),
(5, 'Arabic', 'ar', 'sa', 'no', 'no', '2019-11-20 11:47:28', '0000-00-00'),
(7, 'Afrikaans', 'af', 'af', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(8, 'Basque', 'eu', 'es', 'no', 'no', '2019-11-20 11:54:10', '0000-00-00'),
(11, 'Bengali', 'bn', 'in', 'no', 'no', '2019-11-20 11:41:53', '0000-00-00'),
(13, 'Bosnian', 'bs', 'bs', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(14, 'Welsh', 'cy', 'cy', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(15, 'Hungarian', 'hu', 'hu', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(16, 'Vietnamese', 'vi', 'vi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(17, 'Haitian', 'ht', 'ht', 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(18, 'Galician', 'gl', 'gl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(19, 'Dutch', 'nl', 'nl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(21, 'Greek', 'el', 'gr', 'no', 'no', '2019-11-20 12:12:08', '0000-00-00'),
(22, 'Georgian', 'ka', 'ge', 'no', 'no', '2019-11-20 12:11:40', '0000-00-00'),
(23, 'Gujarati', 'gu', 'in', 'no', 'no', '2019-11-20 11:39:16', '0000-00-00'),
(24, 'Danish', 'da', 'dk', 'no', 'no', '2019-11-20 12:03:25', '0000-00-00'),
(25, 'Hebrew', 'he', 'il', 'no', 'no', '2019-11-20 12:13:50', '0000-00-00'),
(26, 'Yiddish', 'yi', 'il', 'no', 'no', '2019-11-20 12:25:33', '0000-00-00'),
(27, 'Indonesian', 'id', 'id', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(28, 'Irish', 'ga', 'ga', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(29, 'Italian', 'it', 'it', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(30, 'Icelandic', 'is', 'is', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(31, 'Spanish', 'es', 'es', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(33, 'Kannada', 'kn', 'kn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(34, 'Catalan', 'ca', 'ca', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(36, 'Chinese', 'zh', 'cn', 'no', 'no', '2019-11-20 12:01:48', '0000-00-00'),
(37, 'Korean', 'ko', 'kr', 'no', 'no', '2019-11-20 12:19:09', '0000-00-00'),
(38, 'Xhosa', 'xh', 'ls', 'no', 'no', '2019-11-20 12:24:39', '0000-00-00'),
(39, 'Latin', 'la', 'it', 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(40, 'Latvian', 'lv', 'lv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(41, 'Lithuanian', 'lt', 'lt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(43, 'Malagasy', 'mg', 'mg', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(44, 'Malay', 'ms', 'ms', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(45, 'Malayalam', 'ml', 'ml', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(46, 'Maltese', 'mt', 'mt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(47, 'Macedonian', 'mk', 'mk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(48, 'Maori', 'mi', 'nz', 'no', 'no', '2019-11-20 12:20:27', '0000-00-00'),
(49, 'Marathi', 'mr', 'in', 'no', 'no', '2019-11-20 11:39:51', '0000-00-00'),
(51, 'Mongolian', 'mn', 'mn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(52, 'German', 'de', 'de', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(53, 'Nepali', 'ne', 'ne', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(54, 'Norwegian', 'no', 'no', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(55, 'Punjabi', 'pa', 'in', 'no', 'no', '2019-11-20 11:40:16', '0000-00-00'),
(57, 'Persian', 'fa', 'ir', 'no', 'no', '2019-11-20 12:21:17', '0000-00-00'),
(59, 'Portuguese', 'pt', 'pt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(60, 'Romanian', 'ro', 'ro', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(61, 'Russian', 'ru', 'ru', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(62, 'Cebuano', 'ceb', 'ph', 'no', 'no', '2019-11-20 11:59:12', '0000-00-00'),
(64, 'Sinhala', 'si', 'lk ', 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(65, 'Slovakian', 'sk', 'sk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(66, 'Slovenian', 'sl', 'sl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(67, 'Swahili', 'sw', 'ke', 'no', 'no', '2019-11-20 12:21:57', '0000-00-00'),
(68, 'Sundanese', 'su', 'sd', 'no', 'no', '2019-12-03 11:06:57', '0000-00-00'),
(70, 'Thai', 'th', 'th', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(71, 'Tagalog', 'tl', 'tl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(72, 'Tamil', 'ta', 'in', 'no', 'no', '2019-11-20 11:40:53', '0000-00-00'),
(74, 'Telugu', 'te', 'in', 'no', 'no', '2019-11-20 11:41:15', '0000-00-00'),
(75, 'Turkish', 'tr', 'tr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(77, 'Uzbek', 'uz', 'uz', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(79, 'Urdu', 'ur', 'pk', 'no', 'no', '2019-11-20 12:23:57', '0000-00-00'),
(80, 'Finnish', 'fi', 'fi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(81, 'French', 'fr', 'fr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(82, 'Hindi', 'hi', 'in', 'no', 'no', '2019-11-20 11:36:34', '0000-00-00'),
(84, 'Czech', 'cs', 'cz', 'no', 'no', '2019-11-20 12:02:36', '0000-00-00'),
(85, 'Swedish', 'sv', 'sv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(86, 'Scottish', 'gd', 'gd', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(87, 'Estonian', 'et', 'et', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(88, 'Esperanto', 'eo', 'br', 'no', 'no', '2019-11-21 04:49:18', '0000-00-00'),
(89, 'Javanese', 'jv', 'id', 'no', 'no', '2019-11-20 12:18:29', '0000-00-00'),
(90, 'Japanese', 'ja', 'jp', 'no', 'no', '2019-11-20 12:14:39', '0000-00-00'),
(91, 'Polish', 'pl', 'pl', 'no', 'no', '2020-06-15 03:25:27', '0000-00-00'),
(92, 'Kurdish', 'ku', 'iq', 'no', 'no', '2020-12-21 00:15:31', '0000-00-00'),
(93, 'Lao', 'lo', 'la', 'no', 'no', '2020-12-21 00:15:36', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES
(1, 'General', 'yes'),
(2, 'Emergency', 'yes'),
(3, 'Medical', 'yes'),
(4, 'Paid', 'yes'),
(5, 'marriage', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `subject_group_class_sections_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `branch_id`, `session_id`, `subject_group_subject_id`, `subject_group_class_sections_id`, `name`, `created_at`) VALUES
(1, NULL, 16, 1, 1, 'Synonyms', '2021-07-01 08:18:44'),
(2, NULL, 16, 1, 1, 'Antonyms', '2021-07-01 08:18:44'),
(3, NULL, 16, 1, 1, 'Proverb', '2021-07-01 08:18:44'),
(4, NULL, 16, 1, 1, 'Present Continuous', '2021-07-01 08:18:44'),
(5, NULL, 16, 2, 1, 'premchand', '2021-07-26 08:17:59'),
(6, NULL, 16, 9, 4, 'Xyz', '2021-08-04 09:27:41'),
(7, NULL, 16, 1, 1, 'synonyms', '2021-10-22 05:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `libarary_members`
--

CREATE TABLE `libarary_members` (
  `id` int(11) UNSIGNED NOT NULL,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libarary_members`
--

INSERT INTO `libarary_members` (`id`, `library_card_no`, `member_type`, `member_id`, `is_active`, `created_at`) VALUES
(4, '196', 'student', 76, 'no', '2022-04-07 11:43:12'),
(10, 'LIB1', 'teacher', 16, 'no', '2022-09-28 12:28:16'),
(11, 'LIB2', 'teacher', 17, 'no', '2022-09-28 12:28:20'),
(12, 'LIB3', 'teacher', 18, 'no', '2022-09-28 12:28:25'),
(13, 'LIB4', 'teacher', 19, 'no', '2022-09-28 12:28:29'),
(14, 'LIB6', 'teacher', 20, 'no', '2022-09-28 12:28:34'),
(15, 'XYZ', 'teacher', 21, 'no', '2022-10-06 08:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `record_id` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1, 'Record updated On staff id 16', '16', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:06:37', NULL),
(2, 'Record updated On staff id 17', '17', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:07:36', NULL),
(3, 'Record updated On staff id 18', '18', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:08:26', NULL),
(4, 'Record updated On staff id 19', '19', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:09:07', NULL),
(5, 'Record updated On staff id 20', '20', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:10:08', NULL),
(6, 'Record updated On staff id 16', '16', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:35:56', NULL),
(7, 'Record updated On staff id 16', '16', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:35:56', NULL),
(8, 'New Record inserted On staff leave request id 1', '1', 16, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 10:38:41', NULL),
(9, 'Record updated On  disable Staff id 17', '17', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:10:30', NULL),
(10, 'Record updated On  disable Staff id 18', '18', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:10:57', NULL),
(11, 'Record updated On  Enable Staff id 17', '17', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:11:33', NULL),
(12, 'Record updated On  Enable Staff id 18', '18', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:11:44', NULL),
(13, 'New Record inserted On send notification id 1', '1', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:33:11', NULL),
(14, 'New Record inserted On messages id 1', '1', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:39:03', NULL),
(15, 'New Record inserted On messages id 2', '2', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:39:03', NULL),
(16, 'New Record inserted On messages id 3', '3', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:45:29', NULL),
(17, 'New Record inserted On messages id 4', '4', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:45:29', NULL),
(18, 'New Record inserted On students id 1', '1', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:54', NULL),
(19, 'New Record inserted On  student session id 1', '1', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:54', NULL),
(20, 'New Record inserted On users id 1', '1', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:54', NULL),
(21, 'New Record inserted On users id 2', '2', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:54', NULL),
(22, 'Record updated On students id 1', '1', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:54', NULL),
(23, 'New Record inserted On students id 2', '2', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:57', NULL),
(24, 'New Record inserted On  student session id 2', '2', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:57', NULL),
(25, 'New Record inserted On users id 3', '3', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:57', NULL),
(26, 'New Record inserted On users id 4', '4', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:57', NULL),
(27, 'Record updated On students id 2', '2', 1, 'Update', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 11:54:57', NULL),
(28, 'New Record inserted On homework id 1', '1', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:10:13', NULL),
(29, 'New Record inserted On homework id 2', '2', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:11:05', NULL),
(30, 'New Record inserted On books id 32', '32', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:25:01', NULL),
(31, 'New Record inserted On books id 33', '33', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:25:12', NULL),
(32, 'New Record inserted On libarary members id 10', '10', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:28:16', NULL),
(33, 'New Record inserted On libarary members id 11', '11', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:28:20', NULL),
(34, 'New Record inserted On libarary members id 12', '12', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:28:25', NULL),
(35, 'New Record inserted On libarary members id 13', '13', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:28:29', NULL),
(36, 'New Record inserted On libarary members id 14', '14', 1, 'Insert', '192.168.0.9', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-28 12:28:34', NULL),
(37, 'New Record inserted On topic id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 04:53:02', NULL),
(38, 'New Record inserted On topic id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 04:53:02', NULL),
(39, 'New Record inserted On topic id 3', '3', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 04:53:33', NULL),
(40, 'New Record inserted On class teacher id 1', '1', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 05:23:38', NULL),
(41, 'New Record inserted On class teacher id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 05:24:10', NULL),
(42, 'New Record inserted On subject groups id 9', '9', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:14:33', NULL),
(43, 'New Record inserted On subject groups id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:17:10', NULL),
(44, 'New Record inserted On subject groups id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:18:20', NULL),
(45, 'New Record inserted On subject groups id 3', '3', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:22:18', NULL),
(46, 'New Record inserted On item category id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:51:37', NULL),
(47, 'New Record inserted On item id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:52:50', NULL),
(48, 'New Record inserted On item id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:53:17', NULL),
(49, 'New Record inserted On item id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 06:53:40', NULL),
(50, 'New Record inserted On item stock id 1', '1', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 07:24:31', NULL),
(51, 'New Record inserted On item supplier id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 07:48:56', NULL),
(52, 'New Record inserted On item supplier id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 07:49:10', NULL),
(53, 'New Record inserted On item store id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:02:24', NULL),
(54, 'New Record inserted On item store id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:02:35', NULL),
(55, 'Record updated On  item store id 2', '2', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:04:35', NULL),
(56, 'New Record inserted On item stock id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:05:00', NULL),
(57, 'New Record inserted On item stock id 2', '2', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:05:15', NULL),
(58, 'New Record inserted On item issue id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:13:34', NULL),
(59, 'New Record inserted On item issue id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:14:33', NULL),
(60, 'New Record inserted On item issue id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:15:06', NULL),
(61, 'New Record inserted On item issue id 3', '3', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:20:25', NULL),
(62, 'New Record inserted On transport route id 9', '9', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:22:46', NULL),
(63, 'New Record inserted On transport route id 10', '10', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:23:11', NULL),
(64, 'New Record inserted On vehicles id 4', '4', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:24:52', NULL),
(65, 'New Record inserted On vehicles id 5', '5', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:25:05', NULL),
(66, 'New Record inserted On vehicle routes id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:25:49', NULL),
(67, 'New Record inserted On hostel id 4', '4', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:28:22', NULL),
(68, 'New Record inserted On hostel id 5', '5', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:28:38', NULL),
(69, 'New Record inserted On room types id 13', '13', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:29:11', NULL),
(70, 'Record deleted On room types id 13', '13', 16, 'Delete', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:29:16', NULL),
(71, 'New Record inserted On room types id 14', '14', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:29:23', NULL),
(72, 'Record deleted On room types id 14', '14', 1, 'Delete', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:29:27', NULL),
(73, 'Record updated On  hostel id 4', '4', 16, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:30:56', NULL),
(74, 'Record updated On  hostel id 5', '5', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:31:11', NULL),
(75, 'New Record inserted On room types id 15', '15', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:38:36', NULL),
(76, 'New Record inserted On room types id 16', '16', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 10:40:36', NULL),
(77, 'New Record inserted On hostel rooms id 1', '1', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 11:53:35', NULL),
(78, 'New Record inserted On hostel rooms id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 11:54:50', NULL),
(79, 'New Record inserted On contents id 1', '1', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:09:31', NULL),
(80, 'Record updated On  contents id 1', '1', 16, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:09:31', NULL),
(81, 'New Record inserted On contents id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:19:55', NULL),
(82, 'Record updated On  contents id 2', '2', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:19:55', NULL),
(83, 'New Record inserted On contents id 3', '3', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:22:41', NULL),
(84, 'Record updated On  contents id 3', '3', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:22:41', NULL),
(85, 'New Record inserted On contents id 1', '1', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:33:03', NULL),
(86, 'Record updated On  contents id 1', '1', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:33:03', NULL),
(87, 'New Record inserted On contents id 2', '2', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:33:36', NULL),
(88, 'Record updated On  contents id 2', '2', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:33:36', NULL),
(89, 'New Record inserted On contents id 3', '3', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:36:33', NULL),
(90, 'Record updated On  contents id 3', '3', 16, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:36:33', NULL),
(91, 'New Record inserted On contents id 4', '4', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:36:59', NULL),
(92, 'Record updated On  contents id 4', '4', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:36:59', NULL),
(93, 'New Record inserted On contents id 5', '5', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:46:23', NULL),
(94, 'Record updated On  contents id 5', '5', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:46:23', NULL),
(95, 'New Record inserted On contents id 6', '6', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:46:44', NULL),
(96, 'Record updated On  contents id 6', '6', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:46:44', NULL),
(97, 'New Record inserted On contents id 7', '7', 16, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:47:19', NULL),
(98, 'Record updated On  contents id 7', '7', 16, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:47:19', NULL),
(99, 'New Record inserted On contents id 8', '8', 1, 'Insert', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:47:36', NULL),
(100, 'Record updated On  contents id 8', '8', 1, 'Update', '192.168.0.14', 'Windows 10', 'Chrome 105.0.0.0', '2022-09-29 12:47:36', NULL),
(101, 'Record deleted On certificates id 1', '1', 1, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 04:48:00', NULL),
(102, 'Record updated On  certificates id 1', '1', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 04:51:44', NULL),
(103, 'New Record inserted On certificates id 4', '4', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 04:53:15', NULL),
(104, 'New Record inserted On certificates id 1', '1', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 04:54:59', NULL),
(105, 'New Record inserted On certificates id 2', '2', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 04:57:47', NULL),
(106, 'New Record inserted On certificates id 3', '3', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 04:58:54', NULL),
(107, 'New Record inserted On id card id 1', '1', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:20:21', NULL),
(108, 'Record updated On  id card id 1', '1', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:20:21', NULL),
(109, 'New Record inserted On id card id 2', '2', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:21:33', NULL),
(110, 'Record updated On  id card id 2', '2', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:21:33', NULL),
(111, 'New Record inserted On id card id 1', '1', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:44:14', NULL),
(112, 'Record updated On  id card id 1', '1', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:44:14', NULL),
(113, 'New Record inserted On id card id 2', '2', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:45:15', NULL),
(114, 'Record updated On  id card id 2', '2', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:45:15', NULL),
(115, 'Record updated On  id card id 2', '2', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 05:45:30', NULL),
(116, 'Record deleted On banner delete id 1', '1', 1, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:41:02', NULL),
(117, 'New Record inserted On students id 3', '3', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:44', NULL),
(118, 'New Record inserted On  student session id 3', '3', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:44', NULL),
(119, 'New Record inserted On users id 5', '5', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:44', NULL),
(120, 'New Record inserted On users id 6', '6', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:44', NULL),
(121, 'Record updated On students id 3', '3', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:44', NULL),
(122, 'New Record inserted On students id 4', '4', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:46', NULL),
(123, 'New Record inserted On  student session id 4', '4', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:46', NULL),
(124, 'New Record inserted On users id 7', '7', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:46', NULL),
(125, 'New Record inserted On users id 8', '8', 1, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:46', NULL),
(126, 'Record updated On students id 4', '4', 1, 'Update', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 06:50:46', NULL),
(127, 'New Record inserted On Alumni Event id 1', '1', 16, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:19:12', NULL),
(128, 'New Record inserted On Alumni Event id 2', '2', 16, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:19:28', NULL),
(129, 'Record deleted On  Alumni Event   id 1', '1', 16, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:20:38', NULL),
(130, 'Record deleted On  Alumni Event   id 2', '2', 16, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:20:41', NULL),
(131, 'New Record inserted On Alumni Event id 3', '3', 16, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:21:02', NULL),
(132, 'New Record inserted On Alumni Event id 4', '4', 16, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:21:10', NULL),
(133, 'New Record inserted On Alumni Event id 5', '5', 16, 'Insert', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:21:16', NULL),
(134, 'Record deleted On  Alumni Event   id 4', '4', 16, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:21:43', NULL),
(135, 'Record deleted On  Alumni Event   id 5', '5', 16, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:21:46', NULL),
(136, 'Record deleted On  Alumni Event   id 3', '3', 16, 'Delete', '192.168.0.6', 'Windows 10', 'Chrome 106.0.0.0', '2022-09-30 07:21:50', NULL),
(137, 'New Record inserted On students id 5', '5', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 06:20:04', NULL),
(138, 'New Record inserted On  student session id 5', '5', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 06:20:04', NULL),
(139, 'New Record inserted On users id 9', '9', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 06:20:04', NULL),
(140, 'New Record inserted On users id 10', '10', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 06:20:04', NULL),
(141, 'Record updated On students id 5', '5', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 06:20:04', NULL),
(142, 'New Record inserted On  fee groups feetype id 61', '61', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 06:58:29', NULL),
(143, 'Record updated On staff id 21', '21', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:08:41', NULL),
(144, 'Record updated On staff leave request id 1', '1', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:32:00', NULL),
(145, 'New Record inserted On send notification id 2', '2', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:35:44', NULL),
(146, 'New Record inserted On messages id 5', '5', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:36:28', NULL),
(147, 'New Record inserted On messages id 6', '6', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:36:45', NULL),
(148, 'New Record inserted On messages id 7', '7', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:37:17', NULL),
(149, 'New Record inserted On messages id 8', '8', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:38:45', NULL),
(150, 'New Record inserted On contents id 9', '9', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:52:07', NULL),
(151, 'Record updated On  contents id 9', '9', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:52:07', NULL),
(152, 'New Record inserted On homework id 3', '3', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:54:57', NULL),
(153, 'Record updated On homework id 3', '3', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 07:56:46', NULL),
(154, 'New Record inserted On libarary members id 15', '15', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 08:09:24', NULL),
(155, 'New Record inserted On certificates id 4', '4', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 08:24:16', NULL),
(156, 'New Record inserted On event id 5', '5', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 09:13:36', NULL),
(157, 'New Record inserted On subject groups id 4', '4', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-06 10:06:53', NULL),
(158, 'New Record inserted On students id 6', '6', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 06:59:58', NULL),
(159, 'New Record inserted On  student session id 6', '6', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 06:59:58', NULL),
(160, 'New Record inserted On users id 11', '11', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 06:59:58', NULL),
(161, 'New Record inserted On users id 12', '12', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 06:59:58', NULL),
(162, 'Record updated On students id 6', '6', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 06:59:58', NULL),
(163, 'Record deleted On student fees deposite id 1', '1', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 08:28:38', NULL),
(164, 'New Record inserted On  fee groups feetype id 62', '62', 1, 'Insert', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 09:09:52', NULL),
(165, 'Record updated On  email config id 1', '1', 1, 'Update', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 09:26:32', NULL),
(166, 'Record deleted On student fees deposite id 3', '3', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:10:13', NULL),
(167, 'Record deleted On student fees deposite id 4', '4', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:10:22', NULL),
(168, 'Record deleted On student fees deposite id 5', '5', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:43:04', NULL),
(169, 'Record deleted On student fees deposite id 6', '6', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:44:59', NULL),
(170, 'Record deleted On student fees deposite id 7', '7', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:45:51', NULL),
(171, 'Record deleted On student fees deposite id 8', '8', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:46:34', NULL),
(172, 'Record deleted On student fees deposite id 9', '9', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:48:17', NULL),
(173, 'Record deleted On student fees deposite id 11', '11', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:50:30', NULL),
(174, 'Record deleted On student fees deposite id 10', '10', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:50:33', NULL),
(175, 'Record deleted On student fees deposite id 12', '12', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:53:24', NULL),
(176, 'Record deleted On student fees deposite id 13', '13', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:53:28', NULL),
(177, 'Record deleted On student fees deposite id 15', '15', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:57:07', NULL),
(178, 'Record deleted On student fees deposite id 14', '14', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 10:57:12', NULL),
(179, 'Record deleted On student fees deposite id 16', '16', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 11:01:13', NULL),
(180, 'Record deleted On student fees deposite id 17', '17', 1, 'Delete', '192.168.68.114', 'Windows 10', 'Chrome 105.0.0.0', '2022-10-07 11:13:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `template_id` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `branch_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(10) NOT NULL DEFAULT 0,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `title`, `template_id`, `message`, `send_mail`, `send_sms`, `is_group`, `branch_id`, `role_id`, `user_id`, `class_id`, `section_id`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES
(1, 'Text Email Check', '', '<p><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</strong></p>\r\n', '1', '0', '1', 1, 1, NULL, NULL, NULL, '0', 0, '[]', NULL, '2022-09-28 11:39:03', NULL),
(2, 'Text Email Check', '', '<p><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</strong></p>\r\n', '1', '0', '1', 1, 2, NULL, NULL, NULL, '0', 0, '[]', NULL, '2022-09-28 11:41:06', NULL),
(3, 'Check email indivisual', '', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '1', '0', '0', 1, NULL, 20, NULL, NULL, '1', 0, NULL, '[{\"category\":\"2\",\"user_id\":\"20\",\"email\":\"b22teacher@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"},{\"category\":\"2\",\"user_id\":\"18\",\"email\":\"b1teacher@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2022-09-28 11:45:29', NULL),
(4, 'Check email indivisual', '', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '1', '0', '0', 1, NULL, 18, NULL, NULL, '1', 0, NULL, '[{\"category\":\"2\",\"user_id\":\"20\",\"email\":\"b22teacher@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"},{\"category\":\"2\",\"user_id\":\"18\",\"email\":\"b1teacher@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2022-09-28 11:45:29', NULL),
(5, 'Test', '', '<p>Test</p>\r\n', '1', '0', '1', 1, 0, NULL, NULL, NULL, '0', 0, '[]', NULL, '2022-10-06 07:36:28', NULL),
(6, 'Test', '', '<p>Test</p>\r\n', '1', '0', '1', 1, 0, NULL, NULL, NULL, '0', 0, '[]', NULL, '2022-10-06 07:36:45', NULL),
(7, 'Test', '', '<p>Test</p>\r\n', '1', '0', '0', 1, NULL, 5, NULL, NULL, '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"5\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"9874563210\"}]', '2022-10-06 07:37:17', NULL),
(8, 'Test', '1', 'test', '0', '1', '1', 1, 0, NULL, NULL, NULL, '0', 0, '[]', NULL, '2022-10-06 07:38:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `multi_class_students`
--

CREATE TABLE `multi_class_students` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_roles`
--

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_roles`
--

INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES
(1, 1, 1, 0, '2022-09-28 11:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `is_notification` int(11) NOT NULL DEFAULT 0,
  `display_notification` int(11) NOT NULL DEFAULT 0,
  `display_sms` int(11) NOT NULL DEFAULT 1,
  `subject` varchar(255) NOT NULL,
  `template_id` varchar(100) NOT NULL,
  `template` longtext NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES
(1, 'student_admission', '1', '0', 0, 0, 1, 'Student Admission', '', 'Dear {{student_name}} your admission is confirm in Class: {{class}} Section:  {{section}} for Session: {{current_session_name}} for more \r\ndetail\r\n contact\r\n System\r\n Admin\r\n {{class}} {{section}} {{admission_no}} {{roll_no}} {{admission_date}} {{mobileno}} {{email}} {{dob}} {{guardian_name}} {{guardian_relation}} {{guardian_phone}} {{father_name}} {{father_phone}} {{blood_group}} {{mother_name}} {{gender}} {{guardian_email}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}}  {{admission_date}}   {{mobileno}}  {{email}}  {{dob}}  {{guardian_name}}  {{guardian_relation}}  {{guardian_phone}}  {{father_name}}  {{father_phone}}  {{blood_group}}  {{mother_name}}  {{gender}} {{guardian_email}} {{current_session_name}} ', '2021-06-02 08:43:30'),
(2, 'exam_result', '1', '0', 0, 1, 1, 'Exam Result', '', 'Dear {{student_name}} - {{exam_roll_no}}, your {{exam}} result has been published.', '{{student_name}} {{exam_roll_no}} {{exam}}', '2021-06-02 08:43:42'),
(3, 'fee_submission', '1', '0', 0, 1, 1, 'Fee Submission', '', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '2021-06-02 08:44:01'),
(4, 'absent_attendence', '1', '0', 0, 1, 1, 'Absent Attendence', '', 'Absent Notice :{{student_name}}  was absent on date {{date}} in period {{subject_name}} {{subject_code}} {{subject_type}} from Your School Name', '{{student_name}} {{mobileno}} {{email}} {{father_name}} {{father_phone}} {{father_occupation}} {{mother_name}} {{mother_phone}} {{guardian_name}} {{guardian_phone}} {{guardian_occupation}} {{guardian_email}} {{date}} {{current_session_name}}             {{time_from}} {{time_to}} {{subject_name}} {{subject_code}} {{subject_type}}  ', '2021-06-02 08:44:14'),
(5, 'login_credential', '1', '1', 0, 0, 1, 'Login Credential', '', 'Hello {{display_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}}', '{{url}} {{display_name}} {{username}} {{password}}', '2021-08-04 06:21:25'),
(6, 'homework', '1', '0', 0, 1, 1, 'Homework', '', 'New Homework has been created for \r\n{{student_name}} at\r\n\r\n\r\n\r\n{{homework_date}} for the class {{class}} {{section}} {{subject}}. kindly submit your\r\n\r\n\r\n homework before {{submit_date}} .Thank you', '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}}', '2021-06-02 08:44:39'),
(7, 'fees_reminder', '1', '0', 0, 1, 1, 'Fees Reminder', '', 'Dear parents, please pay fee amount Rs.{{due_amount}} of {{fee_type}} before {{due_date}} for {{student_name}}  from smart school (ignore if you already paid)', '{{fee_type}}{{fee_code}}{{due_date}}{{student_name}}{{school_name}}{{fee_amount}}{{due_amount}}{{deposit_amount}} ', '2021-06-02 08:44:54'),
(8, 'forgot_password', '1', '0', 0, 0, 0, 'Forgot Password', '', 'Dear  {{name}} , \r\n    Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetPassLink}}\'>Click here to reset your password</a>,\r\nif you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. your username {{username}}\r\n{{resetPassLink}}\r\n Regards,\r\n {{school_name}}', '{{school_name}}{{name}}{{username}}{{resetPassLink}} ', '2021-06-02 08:45:08'),
(9, 'online_examination_publish_exam', '1', '0', 0, 1, 1, 'Online Examination Publish Exam', '', 'A new exam {{exam_title}} has been created for  duration: {{time_duration}} min, which will be available from:  {{exam_from}} to  {{exam_to}}.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2021-06-02 08:45:36'),
(10, 'online_examination_publish_result', '1', '0', 0, 1, 1, 'Online Examination Publish Result', '', 'Exam {{exam_title}} result has been declared which was conducted between  {{exam_from}} to   {{exam_to}}, for more details, please check your student portal.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2021-06-02 08:45:58'),
(11, 'online_admission_form_submission', '1', '0', 0, 1, 1, 'Online Admission Form Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully  on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{reference_no}}', '2021-06-02 08:46:21'),
(12, 'online_admission_fees_submission', '1', '0', 0, 1, 1, 'Online Admission Fees Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has recieved successfully on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}}', '2021-06-30 11:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam`
--

CREATE TABLE `onlineexam` (
  `id` int(11) NOT NULL,
  `exam` text DEFAULT NULL,
  `attempt` int(11) NOT NULL,
  `exam_from` datetime DEFAULT NULL,
  `exam_to` datetime DEFAULT NULL,
  `is_quiz` int(11) NOT NULL DEFAULT 0,
  `auto_publish_date` datetime DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `duration` time NOT NULL,
  `passing_percentage` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `publish_result` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(1) DEFAULT '0',
  `is_marks_display` int(11) NOT NULL DEFAULT 0,
  `is_neg_marking` int(11) NOT NULL DEFAULT 0,
  `is_random_question` int(11) NOT NULL DEFAULT 0,
  `is_rank_generated` int(1) NOT NULL DEFAULT 0,
  `publish_exam_notification` int(1) NOT NULL,
  `publish_result_notification` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_attempts`
--

CREATE TABLE `onlineexam_attempts` (
  `id` int(11) NOT NULL,
  `onlineexam_student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_questions`
--

CREATE TABLE `onlineexam_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_students`
--

CREATE TABLE `onlineexam_students` (
  `id` int(11) NOT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `is_attempted` int(1) NOT NULL DEFAULT 0,
  `rank` int(1) DEFAULT 0,
  `quiz_attempted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_student_results`
--

CREATE TABLE `onlineexam_student_results` (
  `id` int(11) NOT NULL,
  `onlineexam_student_id` int(11) NOT NULL,
  `onlineexam_question_id` int(11) NOT NULL,
  `select_option` longtext DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `attachment_upload_name` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `online_admissions`
--

CREATE TABLE `online_admissions` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) NOT NULL DEFAULT 'No',
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_enroll` int(255) DEFAULT 0,
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `form_status` int(11) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `app_key` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `disable_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_fields`
--

CREATE TABLE `online_admission_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `online_admission_fields`
--

INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'middlename', 0, '2021-05-28 10:29:23'),
(2, 'lastname', 1, '2021-06-02 04:49:19'),
(3, 'category', 1, '2021-11-27 06:18:49'),
(4, 'religion', 1, '2021-09-08 11:26:23'),
(5, 'cast', 1, '2021-09-08 11:26:23'),
(6, 'mobile_no', 1, '2021-06-02 04:50:24'),
(7, 'admission_date', 0, '2021-06-02 04:48:35'),
(8, 'student_photo', 1, '2021-09-08 11:26:23'),
(9, 'is_student_house', 0, '2021-05-29 13:22:53'),
(10, 'is_blood_group', 1, '2021-09-08 11:26:23'),
(11, 'student_height', 1, '2021-09-08 11:26:23'),
(12, 'student_weight', 1, '2021-09-08 11:26:23'),
(13, 'father_name', 1, '2021-09-08 11:26:23'),
(14, 'father_phone', 1, '2021-09-08 11:26:23'),
(15, 'father_occupation', 1, '2021-09-08 11:26:23'),
(16, 'father_pic', 1, '2021-09-08 11:26:23'),
(17, 'mother_name', 1, '2021-09-08 11:26:23'),
(18, 'mother_phone', 1, '2021-09-08 11:26:23'),
(19, 'mother_occupation', 1, '2021-09-08 11:26:23'),
(20, 'mother_pic', 1, '2021-09-08 11:26:23'),
(21, 'guardian_name', 1, '2021-06-02 04:50:54'),
(22, 'guardian_phone', 1, '2021-06-02 04:50:54'),
(23, 'if_guardian_is', 1, '2021-06-02 04:50:54'),
(24, 'guardian_relation', 1, '2021-06-02 04:50:54'),
(25, 'guardian_email', 1, '2021-06-02 04:51:35'),
(26, 'guardian_occupation', 1, '2021-06-02 04:51:26'),
(27, 'guardian_address', 1, '2021-06-02 04:51:31'),
(28, 'bank_account_no', 0, '2021-06-02 04:48:35'),
(29, 'bank_name', 0, '2021-06-02 04:48:35'),
(30, 'ifsc_code', 0, '2021-06-02 04:48:35'),
(31, 'national_identification_no', 1, '2021-09-08 11:26:24'),
(32, 'local_identification_no', 1, '2021-09-08 11:26:47'),
(33, 'rte', 1, '2022-03-31 05:32:29'),
(34, 'previous_school_details', 1, '2021-09-08 11:26:24'),
(35, 'guardian_photo', 1, '2021-06-02 04:51:29'),
(36, 'student_note', 1, '2021-09-08 11:26:24'),
(37, 'measurement_date', 1, '2021-09-08 11:26:23'),
(38, 'student_email', 1, '2021-06-02 04:49:38'),
(39, 'current_address', 1, '2022-03-31 05:09:04'),
(40, 'permanent_address', 1, '2022-03-31 05:32:05'),
(41, 'Transport', 1, '2021-09-08 11:26:23');

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_payment`
--

CREATE TABLE `online_admission_payment` (
  `id` int(11) NOT NULL,
  `admission_id` int(11) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `note` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `gateway_mode` int(11) NOT NULL COMMENT '0 Testing, 1 live',
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `gateway_mode`, `paytm_website`, `paytm_industrytype`, `created_at`, `updated_at`) VALUES
(1, 'razorpay', NULL, 'aAER1HW9rzBVbyDw4yEMRpUu', '', 'rzp_test_nLFimRhIzMAr7Y', NULL, NULL, NULL, '', '', 'no', 0, '', '', '2021-10-11 12:37:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payslip_allowance`
--

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT 0,
  `enable_add` int(11) DEFAULT 0,
  `enable_edit` int(11) DEFAULT 0,
  `enable_delete` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(1, 1, 'Student', 'student', 1, 1, 1, 1, '2019-10-24 05:42:03'),
(2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2018-06-22 10:17:19'),
(3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2018-06-22 10:17:36'),
(4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2018-06-22 10:17:53'),
(5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2018-06-22 10:21:03'),
(6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2018-06-27 00:18:15'),
(7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2018-06-27 00:18:57'),
(8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2018-06-22 10:21:46'),
(9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 10:23:21'),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 10:22:44'),
(11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2018-06-22 10:23:00'),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 10:24:06'),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 10:23:47'),
(14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 10:24:13'),
(15, 5, 'Student / Period Attendance', 'student_attendance', 1, 1, 1, 0, '2019-11-29 01:19:05'),
(20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2018-06-22 10:25:25'),
(21, 7, 'Class Timetable', 'class_timetable', 1, 0, 1, 0, '2019-11-24 03:05:17'),
(23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2018-06-22 10:32:17'),
(24, 7, 'Class', 'class', 1, 1, 1, 1, '2018-06-22 10:32:35'),
(25, 7, 'Section', 'section', 1, 1, 1, 1, '2018-06-22 10:31:10'),
(26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2018-06-22 10:32:47'),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 10:33:19'),
(28, 9, 'Books List', 'books', 1, 1, 1, 1, '2019-11-24 00:37:12'),
(29, 9, 'Issue Return', 'issue_return', 1, 0, 0, 0, '2019-11-24 00:37:18'),
(30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2018-07-02 11:37:00'),
(31, 10, 'Issue Item', 'issue_item', 1, 1, 1, 1, '2019-11-29 06:39:27'),
(32, 10, 'Add Item Stock', 'item_stock', 1, 1, 1, 1, '2019-11-24 00:39:17'),
(33, 10, 'Add Item', 'item', 1, 1, 1, 1, '2019-11-24 00:39:39'),
(34, 10, 'Item Store', 'store', 1, 1, 1, 1, '2019-11-24 00:40:41'),
(35, 10, 'Item Supplier', 'supplier', 1, 1, 1, 1, '2019-11-24 00:40:49'),
(37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2018-06-22 10:39:17'),
(38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2018-06-22 10:39:36'),
(39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2018-06-27 04:39:20'),
(40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2018-06-22 10:40:49'),
(41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2018-06-22 10:40:27'),
(42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2018-06-25 06:23:03'),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 10:41:17'),
(44, 13, 'Email', 'email', 1, 0, 0, 0, '2019-11-26 05:20:37'),
(46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 10:41:23'),
(53, 15, 'Languages', 'languages', 0, 1, 0, 1, '2021-01-23 07:09:32'),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 09:08:35'),
(55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2018-06-22 10:44:15'),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 09:08:41'),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 09:08:47'),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 09:08:51'),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 09:08:55'),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 09:08:59'),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 03:50:06'),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 03:50:26'),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 10:46:02'),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 10:46:21'),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 10:47:02'),
(66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 10:47:20'),
(67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 08:39:34'),
(68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2018-06-22 10:20:42'),
(69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2018-06-22 10:19:34'),
(70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2018-06-22 10:20:10'),
(71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2018-06-22 10:20:17'),
(73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2018-06-22 10:20:27'),
(74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2018-06-22 10:20:35'),
(77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2018-06-22 10:30:52'),
(78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2018-06-22 10:51:24'),
(79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2018-06-22 10:51:39'),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 10:48:58'),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 10:50:57'),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 10:50:21'),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 10:50:04'),
(84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2018-07-03 08:40:55'),
(85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2018-06-22 10:49:24'),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 10:53:31'),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 10:53:12'),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 10:53:10'),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 10:52:51'),
(93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2018-06-22 10:53:50'),
(94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2018-06-27 03:07:21'),
(96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2018-07-06 10:41:07'),
(97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2018-07-06 10:37:16'),
(98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2018-07-06 10:41:28'),
(99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2018-07-06 10:41:49'),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 10:54:41'),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 10:34:33'),
(106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2018-06-22 10:54:45'),
(107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2018-06-25 06:21:34'),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 0, 1, 1, '2020-10-05 08:56:27'),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 0, '2019-11-28 23:47:46'),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 10:17:56'),
(111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2018-07-03 07:08:15'),
(114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2018-07-03 07:08:15'),
(115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(128, 1, 'Student Timeline', 'student_timeline', 0, 1, 0, 1, '2018-07-05 08:08:52'),
(129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 08:08:52'),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 04:17:17'),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 04:17:17'),
(134, 1, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2019-11-27 06:39:21'),
(135, 2, 'Fees Reminder', 'fees_reminder', 1, 0, 1, 0, '2019-10-25 00:39:49'),
(136, 5, 'Approve Leave', 'approve_leave', 1, 0, 0, 0, '2019-10-25 00:46:44'),
(137, 6, 'Exam Group', 'exam_group', 1, 1, 1, 1, '2019-10-25 01:02:34'),
(141, 6, 'Design Admit Card', 'design_admit_card', 1, 1, 1, 1, '2019-10-25 01:06:59'),
(142, 6, 'Print Admit Card', 'print_admit_card', 1, 0, 0, 0, '2019-11-23 23:57:51'),
(143, 6, 'Design Marksheet', 'design_marksheet', 1, 1, 1, 1, '2019-10-25 01:10:25'),
(144, 6, 'Print Marksheet', 'print_marksheet', 1, 0, 0, 0, '2019-10-25 01:11:02'),
(145, 7, 'Teachers Timetable', 'teachers_time_table', 1, 0, 0, 0, '2019-11-30 02:52:21'),
(146, 14, 'Student Report', 'student_report', 1, 0, 0, 0, '2019-10-25 01:27:00'),
(147, 14, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2019-10-25 01:30:27'),
(148, 14, 'Student History', 'student_history', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(149, 14, 'Student Login Credential Report', 'student_login_credential_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(150, 14, 'Class Subject Report', 'class_subject_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(151, 14, 'Admission Report', 'admission_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(152, 14, 'Sibling Report', 'sibling_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(153, 14, 'Homework Evaluation Report', 'homehork_evaluation_report', 1, 0, 0, 0, '2019-11-24 01:04:24'),
(154, 14, 'Student Profile', 'student_profile', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(155, 14, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(156, 14, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(157, 14, 'Fees Collection Report', 'fees_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(158, 14, 'Online Fees Collection Report', 'online_fees_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(159, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(160, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(161, 14, 'PayRoll Report', 'payroll_report', 1, 0, 0, 0, '2019-10-31 00:23:22'),
(162, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(163, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(164, 14, 'Attendance Report', 'attendance_report', 1, 0, 0, 0, '2019-10-25 02:08:06'),
(165, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-10-25 02:08:06'),
(174, 14, 'Transport Report', 'transport_report', 1, 0, 0, 0, '2019-10-25 02:13:56'),
(175, 14, 'Hostel Report', 'hostel_report', 1, 0, 0, 0, '2019-11-27 06:51:53'),
(176, 14, 'Audit Trail Report', 'audit_trail_report', 1, 0, 0, 0, '2019-10-25 02:16:39'),
(177, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2019-10-25 02:19:27'),
(178, 14, 'Book Issue Report', 'book_issue_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(179, 14, 'Book Due Report', 'book_due_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(180, 14, 'Book Inventory Report', 'book_inventory_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(181, 14, 'Stock Report', 'stock_report', 1, 0, 0, 0, '2019-10-25 02:31:28'),
(182, 14, 'Add Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-25 02:31:28'),
(183, 14, 'Issue Item Report', 'issue_item_report', 1, 0, 0, 0, '2019-11-29 03:48:06'),
(185, 23, 'Online Examination', 'online_examination', 1, 1, 1, 1, '2019-11-23 23:54:50'),
(186, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2019-11-23 23:55:18'),
(187, 6, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2019-11-23 23:58:50'),
(188, 7, 'Subject Group', 'subject_group', 1, 1, 1, 1, '2019-11-24 00:34:32'),
(189, 18, 'Teachers Rating', 'teachers_rating', 1, 0, 1, 1, '2019-11-24 03:12:54'),
(190, 22, 'Fees Awaiting Payment Widegts', 'fees_awaiting_payment_widegts', 1, 0, 0, 0, '2019-11-24 00:52:51'),
(191, 22, 'Conveted Leads Widegts', 'conveted_leads_widegts', 1, 0, 0, 0, '2019-11-24 00:58:24'),
(192, 22, 'Fees Overview Widegts', 'fees_overview_widegts', 1, 0, 0, 0, '2019-11-24 00:57:41'),
(193, 22, 'Enquiry Overview Widegts', 'enquiry_overview_widegts', 1, 0, 0, 0, '2019-12-02 05:06:09'),
(194, 22, 'Library Overview Widegts', 'book_overview_widegts', 1, 0, 0, 0, '2019-12-01 01:13:04'),
(195, 22, 'Student Today Attendance Widegts', 'today_attendance_widegts', 1, 0, 0, 0, '2019-12-03 04:57:45'),
(196, 6, 'Marks Import', 'marks_import', 1, 0, 0, 0, '2019-11-24 01:02:11'),
(197, 14, 'Student Attendance Type Report', 'student_attendance_type_report', 1, 0, 0, 0, '2019-11-24 01:06:32'),
(198, 14, 'Exam Marks Report', 'exam_marks_report', 1, 0, 0, 0, '2019-11-24 01:11:15'),
(200, 14, 'Online Exam Wise Report', 'online_exam_wise_report', 1, 0, 0, 0, '2019-11-24 01:18:14'),
(201, 14, 'Online Exams Report', 'online_exams_report', 1, 0, 0, 0, '2019-11-29 02:48:05'),
(202, 14, 'Online Exams Attempt Report', 'online_exams_attempt_report', 1, 0, 0, 0, '2019-11-29 02:46:24'),
(203, 14, 'Online Exams Rank Report', 'online_exams_rank_report', 1, 0, 0, 0, '2019-11-24 01:22:25'),
(204, 14, 'Staff Report', 'staff_report', 1, 0, 0, 0, '2019-11-24 01:25:27'),
(205, 6, 'Exam', 'exam', 1, 1, 1, 1, '2019-11-24 04:55:48'),
(207, 6, 'Exam Publish', 'exam_publish', 1, 0, 0, 0, '2019-11-24 05:15:04'),
(208, 6, 'Link Exam', 'link_exam', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(210, 6, 'Assign / View student', 'exam_assign_view_student', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(211, 6, 'Exam Subject', 'exam_subject', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(212, 6, 'Exam Marks', 'exam_marks', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(213, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2019-11-24 05:17:11'),
(214, 23, 'Add Questions in Exam ', 'add_questions_in_exam', 1, 0, 1, 0, '2019-11-28 01:38:57'),
(215, 15, 'Custom Fields', 'custom_fields', 1, 0, 0, 0, '2019-11-29 04:08:35'),
(216, 15, 'System Fields', 'system_fields', 1, 0, 0, 0, '2019-11-25 00:15:01'),
(217, 13, 'SMS', 'sms', 1, 0, 0, 0, '2018-06-22 10:40:54'),
(219, 14, 'Student / Period Attendance Report', 'student_period_attendance_report', 1, 0, 0, 0, '2019-11-29 02:19:31'),
(220, 14, 'Biometric Attendance Log', 'biometric_attendance_log', 1, 0, 0, 0, '2019-11-27 05:59:16'),
(221, 14, 'Book Issue Return Report', 'book_issue_return_report', 1, 0, 0, 0, '2019-11-27 06:30:23'),
(222, 23, 'Assign / View Student', 'online_assign_view_student', 1, 0, 1, 0, '2019-11-28 04:20:22'),
(223, 14, 'Rank Report', 'rank_report', 1, 0, 0, 0, '2019-11-29 02:30:21'),
(224, 25, 'Chat', 'chat', 1, 0, 0, 0, '2019-11-29 04:10:28'),
(226, 22, 'Income Donut Graph', 'income_donut_graph', 1, 0, 0, 0, '2019-11-29 05:00:33'),
(227, 22, 'Expense Donut Graph', 'expense_donut_graph', 1, 0, 0, 0, '2019-11-29 05:01:10'),
(228, 9, 'Import Book', 'import_book', 1, 0, 0, 0, '2019-11-29 06:21:01'),
(229, 22, 'Staff Present Today Widegts', 'staff_present_today_widegts', 1, 0, 0, 0, '2019-11-29 06:48:00'),
(230, 22, 'Student Present Today Widegts', 'student_present_today_widegts', 1, 0, 0, 0, '2019-11-29 06:47:42'),
(231, 26, 'Multi Class Student', 'multi_class_student', 1, 1, 1, 1, '2020-10-05 08:56:27'),
(232, 27, 'Online Admission', 'online_admission', 1, 0, 1, 1, '2019-12-02 06:11:10'),
(233, 15, 'Print Header Footer', 'print_header_footer', 1, 0, 0, 0, '2020-02-12 02:02:02'),
(234, 28, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2020-06-02 03:15:46'),
(235, 28, 'Events', 'events', 1, 1, 1, 1, '2020-05-28 21:48:52'),
(236, 29, 'Manage Lesson Plan', 'manage_lesson_plan', 1, 1, 1, 0, '2020-05-28 22:17:37'),
(237, 29, 'Manage Syllabus Status', 'manage_syllabus_status', 1, 0, 1, 0, '2020-05-28 22:20:11'),
(238, 29, 'Lesson', 'lesson', 1, 1, 1, 1, '2020-05-28 22:20:11'),
(239, 29, 'Topic', 'topic', 1, 1, 1, 1, '2020-05-28 22:20:11'),
(240, 14, 'Syllabus Status Report', 'syllabus_status_report', 1, 0, 0, 0, '2020-05-28 23:17:54'),
(241, 14, 'Teacher Syllabus Status Report', 'teacher_syllabus_status_report', 1, 0, 0, 0, '2020-05-28 23:17:54'),
(242, 14, 'Alumni Report', 'alumni_report', 1, 0, 0, 0, '2020-06-07 23:59:54'),
(243, 15, 'Student Profile Update', 'student_profile_update', 1, 0, 0, 0, '2020-08-21 05:36:33'),
(244, 14, 'Student Gender Ratio Report', 'student_gender_ratio_report', 1, 0, 0, 0, '2020-08-22 12:37:51'),
(245, 14, 'Student Teacher Ratio Report', 'student_teacher_ratio_report', 1, 0, 0, 0, '2020-08-22 12:42:27'),
(246, 14, 'Daily Attendance Report', 'daily_attendance_report', 1, 0, 0, 0, '2020-08-22 12:43:16'),
(247, 23, 'Import Question', 'import_question', 1, 0, 0, 0, '2019-11-23 18:25:18'),
(248, 20, 'Staff ID Card', 'staff_id_card', 1, 1, 1, 1, '2018-07-06 10:41:28'),
(249, 20, 'Generate Staff ID Card', 'generate_staff_id_card', 1, 0, 0, 0, '2018-07-06 10:41:49'),
(250, 15, 'Branch', 'branch', 1, 1, 1, 1, '2022-09-16 06:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT 0,
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES
(1, 'Student Information', 'student_information', 1, 1, '2019-03-15 09:30:22'),
(2, 'Fees Collection', 'fees_collection', 1, 0, '2020-06-11 00:51:35'),
(3, 'Income', 'income', 1, 0, '2020-06-01 01:57:39'),
(4, 'Expense', 'expense', 1, 0, '2019-03-15 09:06:22'),
(5, 'Student Attendance', 'student_attendance', 1, 0, '2018-07-02 07:48:08'),
(6, 'Examination', 'examination', 1, 0, '2018-07-11 02:49:08'),
(7, 'Academics', 'academics', 1, 1, '2018-07-02 07:25:43'),
(8, 'Download Center', 'download_center', 1, 0, '2018-07-02 07:49:29'),
(9, 'Library', 'library', 1, 0, '2018-06-28 11:13:14'),
(10, 'Inventory', 'inventory', 1, 0, '2018-06-27 00:48:58'),
(11, 'Transport', 'transport', 1, 0, '2018-06-27 07:51:26'),
(12, 'Hostel', 'hostel', 1, 0, '2021-07-29 07:55:50'),
(13, 'Communicate', 'communicate', 1, 0, '2018-07-02 07:50:00'),
(14, 'Reports', 'reports', 1, 1, '2018-06-27 03:40:22'),
(15, 'System Settings', 'system_settings', 1, 1, '2018-06-27 03:40:28'),
(16, 'Front CMS', 'front_cms', 1, 0, '2018-07-10 05:16:54'),
(17, 'Front Office', 'front_office', 1, 0, '2018-06-27 03:45:30'),
(18, 'Human Resource', 'human_resource', 1, 1, '2018-06-27 03:41:02'),
(19, 'Homework', 'homework', 1, 0, '2018-06-27 00:49:38'),
(20, 'Certificate', 'certificate', 1, 0, '2021-09-08 11:21:33'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '2019-03-15 09:06:25'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '2018-06-27 03:41:17'),
(23, 'Online Examination', 'online_examination', 1, 0, '2020-06-01 02:25:36'),
(25, 'Chat', 'chat', 1, 0, '2019-11-23 23:54:04'),
(26, 'Multi Class', 'multi_class', 1, 0, '2019-11-27 12:14:14'),
(27, 'Online Admission', 'online_admission', 1, 0, '2022-09-22 06:22:52'),
(28, 'Alumni', 'alumni', 1, 0, '2022-09-22 06:22:48'),
(29, 'Lesson Plan', 'lesson_plan', 1, 0, '2020-06-07 05:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `permission_student`
--

CREATE TABLE `permission_student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `system` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_student`
--

INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES
(1, 'Fees', 'fees', 0, 0, 1, 2, '2022-09-22 06:22:11'),
(2, 'Class Timetable', 'class_timetable', 1, 1, 1, 7, '2020-05-30 19:57:50'),
(3, 'Homework', 'homework', 0, 1, 1, 19, '2022-04-13 15:52:11'),
(4, 'Download Center', 'download_center', 0, 1, 1, 8, '2020-06-01 02:52:49'),
(5, 'Attendance', 'attendance', 0, 0, 1, 5, '2021-12-29 08:25:49'),
(7, 'Examinations', 'examinations', 0, 1, 1, 6, '2020-06-01 02:59:50'),
(8, 'Notice Board', 'notice_board', 0, 1, 1, 13, '2020-06-01 03:00:35'),
(11, 'Library', 'library', 0, 1, 1, 9, '2020-06-01 03:02:37'),
(12, 'Transport Routes', 'transport_routes', 0, 1, 0, 11, '2021-12-14 04:56:00'),
(13, 'Hostel Rooms', 'hostel_rooms', 0, 0, 1, 12, '2021-12-16 10:28:32'),
(14, 'Calendar To Do List', 'calendar_to_do_list', 0, 1, 1, 21, '2020-06-01 03:53:18'),
(15, 'Online Examination', 'online_examination', 0, 1, 1, 23, '2020-06-11 05:20:01'),
(16, 'Teachers Rating', 'teachers_rating', 0, 0, 1, 0, '2021-07-01 07:20:13'),
(17, 'Chat', 'chat', 0, 1, 1, 25, '2020-06-01 04:53:06'),
(18, 'Multi Class', 'multi_class', 1, 1, 1, 26, '2020-05-30 19:56:52'),
(19, 'Lesson Plan', 'lesson_plan', 0, 1, 1, 29, '2020-06-07 05:38:30'),
(20, 'Syllabus Status', 'syllabus_status', 0, 1, 1, 29, '2020-06-07 05:38:30'),
(23, 'Apply Leave', 'apply_leave', 0, 0, 1, 0, '2021-07-01 07:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `print_headerfooter`
--

CREATE TABLE `print_headerfooter` (
  `id` int(11) NOT NULL,
  `print_type` varchar(255) NOT NULL,
  `header_image` varchar(255) NOT NULL,
  `footer_content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `print_headerfooter`
--

INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`) VALUES
(1, 'staff_payslip', 'header_image.png', 'This payslip is computer generated hence no signature is required.', 1, '2021-07-06 06:27:30'),
(2, 'student_receipt', 'header_image.png', 'This receipt is computer generated hence no signature is required.', 1, '2022-05-05 10:11:03'),
(3, 'online_admission_receipt', 'header_image.png', 'This receipt is for online admission  computer generated hence no signature is required.', 1, '2021-09-02 08:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `question_type` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `opt_a` text DEFAULT NULL,
  `opt_b` text DEFAULT NULL,
  `opt_c` text DEFAULT NULL,
  `opt_d` text DEFAULT NULL,
  `opt_e` text DEFAULT NULL,
  `correct` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`id`, `reference`, `description`) VALUES
(1, 'Social Media', ''),
(2, 'Search Engine', ''),
(3, 'Email', ''),
(4, 'Friend', ''),
(5, 'Media Advertisement', ''),
(6, 'Web Advertisement', ''),
(7, 'Colleague', ''),
(8, 'Tuition Teacher', ''),
(9, 'Social Club', ''),
(10, 'Newspaper', ''),
(11, 'Billboard', '');

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `id` int(11) NOT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`id`, `religion`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Muslim', 'no', '2022-09-15 09:59:45', NULL),
(2, 'Christian', 'no', '2022-09-15 09:59:51', NULL),
(3, 'Sikh', 'no', '2022-09-15 09:59:55', NULL),
(4, 'Buddhists', 'no', '2022-09-15 10:00:00', NULL),
(5, 'Parsi', 'no', '2022-09-15 10:00:05', NULL),
(6, 'Jain', 'no', '2022-09-15 10:00:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `is_superadmin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, 0, 1, 0, '2018-06-30 15:39:11', '0000-00-00'),
(2, 'Teacher', NULL, 0, 1, 0, '2018-06-30 15:39:14', '0000-00-00'),
(3, 'Accountant', NULL, 0, 1, 0, '2018-06-30 15:39:17', '0000-00-00'),
(4, 'Librarian', NULL, 0, 1, 0, '2018-06-30 15:39:21', '0000-00-00'),
(6, 'Receptionist', NULL, 0, 1, 0, '2018-07-02 05:39:03', '0000-00-00'),
(7, 'Super Admin', NULL, 0, 1, 1, '2018-07-11 14:11:29', '0000-00-00'),
(8, 'Counselor', NULL, 0, 0, 0, '2021-10-11 12:41:12', NULL),
(9, 'Store Keeper', NULL, 0, 0, 0, '2021-11-19 06:45:35', NULL),
(10, 'HOD', NULL, 0, 0, 0, '2022-04-07 09:10:33', NULL),
(11, 'Birender', NULL, 0, 0, 0, '2022-04-27 12:04:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(2, 1, 2, 1, 0, 0, 0, '2022-09-16 05:51:07'),
(3, 1, 3, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(4, 1, 4, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(5, 1, 134, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(6, 1, 135, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(7, 1, 9, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(8, 1, 143, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(9, 1, 148, 1, 0, 0, 0, '2022-09-16 05:52:54'),
(10, 2, 250, 1, 0, 1, 0, '2022-09-16 06:22:20'),
(11, 2, 1, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(12, 2, 2, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(13, 2, 5, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(14, 2, 15, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(15, 2, 196, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(16, 2, 150, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(17, 2, 56, 1, 0, 0, 0, '2022-09-16 06:33:48'),
(18, 2, 54, 1, 0, 0, 0, '2022-09-16 06:34:10'),
(19, 1, 86, 1, 1, 1, 1, '2022-09-17 04:49:04'),
(20, 1, 87, 1, 0, 0, 0, '2022-09-17 05:29:49'),
(21, 1, 88, 1, 1, 1, 0, '2022-09-17 05:29:49'),
(22, 1, 90, 1, 1, 0, 1, '2022-09-17 05:29:49'),
(23, 1, 108, 1, 0, 1, 1, '2022-09-17 05:29:49'),
(24, 1, 109, 1, 1, 0, 0, '2022-09-17 05:29:49'),
(25, 1, 110, 1, 1, 1, 1, '2022-09-17 05:29:49'),
(26, 1, 111, 1, 1, 1, 1, '2022-09-17 05:29:49'),
(27, 1, 112, 1, 1, 1, 1, '2022-09-17 05:29:49'),
(28, 1, 127, 1, 0, 0, 0, '2022-09-17 05:29:49'),
(29, 1, 129, 0, 1, 0, 1, '2022-09-29 06:58:32'),
(30, 1, 189, 1, 0, 1, 1, '2022-09-17 05:29:49'),
(31, 2, 109, 1, 1, 0, 0, '2022-09-17 08:07:18'),
(32, 1, 107, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(33, 1, 128, 0, 1, 0, 1, '2022-09-19 07:44:53'),
(34, 1, 5, 1, 1, 0, 1, '2022-09-19 07:44:53'),
(35, 1, 6, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(36, 1, 7, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(37, 1, 8, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(38, 1, 68, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(39, 1, 69, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(40, 1, 70, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(41, 1, 71, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(42, 1, 73, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(43, 1, 74, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(44, 1, 10, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(45, 1, 11, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(46, 1, 12, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(47, 1, 13, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(48, 1, 14, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(49, 1, 15, 1, 1, 1, 0, '2022-09-19 07:44:53'),
(50, 1, 122, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(51, 1, 136, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(52, 1, 20, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(53, 1, 137, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(54, 1, 141, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(55, 1, 142, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(56, 1, 144, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(57, 1, 187, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(58, 1, 196, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(59, 1, 205, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(60, 1, 207, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(61, 1, 208, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(62, 1, 210, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(63, 1, 211, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(64, 1, 212, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(65, 1, 21, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(66, 1, 23, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(67, 1, 24, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(68, 1, 25, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(69, 1, 26, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(70, 1, 77, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(71, 1, 145, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(72, 1, 188, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(73, 1, 27, 1, 1, 0, 1, '2022-09-19 07:44:53'),
(74, 1, 28, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(75, 1, 29, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(76, 1, 30, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(77, 1, 123, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(78, 1, 228, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(79, 1, 31, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(80, 1, 222, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(81, 1, 247, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(82, 1, 224, 1, 0, 0, 0, '2022-09-19 07:44:53'),
(83, 1, 231, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(84, 1, 232, 1, 0, 1, 1, '2022-09-19 07:44:53'),
(85, 1, 234, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(86, 1, 235, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(87, 1, 236, 1, 1, 1, 0, '2022-09-19 07:44:53'),
(88, 1, 237, 1, 0, 1, 0, '2022-09-19 07:44:53'),
(89, 1, 238, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(90, 1, 239, 1, 1, 1, 1, '2022-09-19 07:44:53'),
(91, 1, 43, 1, 1, 1, 1, '2022-09-19 08:19:16'),
(92, 1, 44, 1, 0, 0, 0, '2022-09-19 08:19:16'),
(93, 1, 46, 1, 0, 0, 0, '2022-09-19 08:19:16'),
(94, 1, 217, 1, 0, 0, 0, '2022-09-19 08:19:16'),
(95, 1, 146, 1, 0, 0, 0, '2022-09-19 08:19:16'),
(96, 2, 43, 1, 0, 0, 0, '2022-09-19 08:33:32'),
(97, 2, 44, 1, 0, 0, 0, '2022-09-19 08:30:28'),
(98, 2, 46, 1, 0, 0, 0, '2022-09-19 08:30:28'),
(99, 2, 217, 1, 0, 0, 0, '2022-09-19 08:30:28'),
(100, 2, 146, 1, 0, 0, 0, '2022-09-19 08:30:28'),
(101, 2, 31, 1, 0, 0, 0, '2022-09-22 08:37:47'),
(102, 2, 32, 1, 0, 0, 0, '2022-09-22 08:37:47'),
(103, 2, 33, 1, 0, 0, 0, '2022-09-22 08:37:47'),
(104, 2, 34, 1, 0, 0, 0, '2022-09-22 08:37:47'),
(105, 2, 35, 1, 0, 0, 0, '2022-09-22 08:37:47'),
(106, 2, 104, 1, 0, 0, 0, '2022-09-22 08:37:47'),
(107, 1, 93, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(108, 1, 32, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(109, 1, 33, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(110, 1, 34, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(111, 1, 35, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(112, 1, 104, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(113, 1, 37, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(114, 1, 38, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(115, 1, 39, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(116, 1, 40, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(117, 1, 41, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(118, 1, 42, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(119, 1, 147, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(120, 1, 149, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(121, 1, 150, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(122, 1, 151, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(123, 1, 152, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(124, 1, 153, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(125, 1, 154, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(126, 1, 155, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(127, 1, 156, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(128, 1, 157, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(129, 1, 158, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(130, 1, 159, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(131, 1, 160, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(132, 1, 161, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(133, 1, 162, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(134, 1, 163, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(135, 1, 164, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(136, 1, 165, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(137, 1, 174, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(138, 1, 175, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(139, 1, 176, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(140, 1, 177, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(141, 1, 178, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(142, 1, 179, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(143, 1, 180, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(144, 1, 181, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(145, 1, 182, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(146, 1, 183, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(147, 1, 197, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(148, 1, 198, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(149, 1, 200, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(150, 1, 201, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(151, 1, 202, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(152, 1, 203, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(153, 1, 204, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(154, 1, 219, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(155, 1, 220, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(156, 1, 221, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(157, 1, 223, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(158, 1, 240, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(159, 1, 241, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(160, 1, 242, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(161, 1, 244, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(162, 1, 245, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(163, 1, 246, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(164, 1, 53, 0, 1, 0, 1, '2022-09-29 06:58:32'),
(165, 1, 54, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(166, 1, 55, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(167, 1, 56, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(168, 1, 57, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(169, 1, 58, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(170, 1, 59, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(171, 1, 60, 1, 0, 1, 0, '2022-09-29 06:58:32'),
(172, 1, 126, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(173, 1, 130, 1, 1, 0, 1, '2022-09-29 06:58:32'),
(174, 1, 131, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(175, 1, 213, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(176, 1, 215, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(177, 1, 216, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(178, 1, 233, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(179, 1, 243, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(180, 1, 250, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(181, 1, 61, 1, 1, 0, 1, '2022-09-29 06:58:32'),
(182, 1, 62, 1, 1, 0, 1, '2022-09-29 06:58:32'),
(183, 1, 63, 1, 1, 0, 1, '2022-09-29 06:58:32'),
(184, 1, 64, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(185, 1, 65, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(186, 1, 66, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(187, 1, 67, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(188, 1, 78, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(189, 1, 79, 1, 1, 0, 1, '2022-09-29 06:58:32'),
(190, 1, 80, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(191, 1, 81, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(192, 1, 82, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(193, 1, 83, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(194, 1, 84, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(195, 1, 85, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(196, 1, 94, 1, 1, 0, 0, '2022-09-29 06:58:32'),
(197, 1, 96, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(198, 1, 97, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(199, 1, 98, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(200, 1, 99, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(201, 1, 248, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(202, 1, 249, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(203, 1, 102, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(204, 1, 106, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(205, 1, 113, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(206, 1, 114, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(207, 1, 115, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(208, 1, 116, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(209, 1, 117, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(210, 1, 118, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(211, 1, 190, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(212, 1, 191, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(213, 1, 192, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(214, 1, 193, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(215, 1, 194, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(216, 1, 195, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(217, 1, 226, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(218, 1, 227, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(219, 1, 229, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(220, 1, 230, 1, 0, 0, 0, '2022-09-29 06:58:32'),
(221, 1, 185, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(222, 1, 186, 1, 1, 1, 1, '2022-09-29 06:58:32'),
(223, 1, 214, 1, 0, 1, 0, '2022-09-29 06:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `branch_id`, `room_type`, `description`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Non - AC Single Bed', '', '2021-07-02 08:17:23', NULL),
(2, NULL, 'Non - AC 2 Beds', '', '2021-07-02 08:18:17', NULL),
(3, NULL, 'Non-AC 3 Beds', '', '2021-07-02 08:18:04', NULL),
(4, NULL, 'Non - AC 4 Beds', '', '2021-07-02 08:18:29', NULL),
(5, NULL, 'AC Single Bed', '', '2021-07-02 08:18:48', NULL),
(6, NULL, 'AC 2 Beds', '', '2021-07-02 08:18:59', NULL),
(7, NULL, 'AC 3 Beds', '', '2021-07-02 08:19:06', NULL),
(8, NULL, 'AC 4 Beds', '', '2021-07-02 08:19:14', NULL),
(9, NULL, 'Non - AC Dormitory', '8 Bunker Beds  (16 Capacity)', '2021-07-02 08:20:00', NULL),
(10, NULL, 'AC Dormitory', '8 Bunker Beds (16 Capacity)', '2021-07-02 08:20:28', NULL),
(11, NULL, 'Bachelor\'s Quarters', '1 Bedroom, 1 Bathroom, 1 Kitchen', '2021-07-02 08:20:59', NULL),
(12, NULL, 'Family Quarters', '2 Bedrooms, 1 Hall, 1 Kitchen, 1 Bathroom', '2021-07-02 08:21:28', NULL),
(15, 2, '3BHK', '', '2022-09-29 10:38:36', NULL),
(16, 1, '1BHK', '', '2022-09-29 10:40:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_houses`
--

CREATE TABLE `school_houses` (
  `id` int(11) NOT NULL,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `school_houses`
--

INSERT INTO `school_houses` (`id`, `house_name`, `description`, `is_active`) VALUES
(1, 'Red', '', 'yes'),
(2, 'Blue', '', 'yes'),
(3, 'Green', '', 'yes'),
(4, 'Yellow', '', 'yes'),
(5, 'Nitin singh', 'OBC', 'yes'),
(6, 'piku', '78', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `biometric` int(11) DEFAULT 0,
  `biometric_device` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(500) NOT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `is_duplicate_fees_invoice` int(1) DEFAULT 0,
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `cron_secret_key` varchar(100) NOT NULL,
  `currency_place` varchar(50) NOT NULL DEFAULT 'before_number',
  `class_teacher` varchar(100) NOT NULL,
  `start_month` varchar(40) NOT NULL,
  `attendence_type` int(10) NOT NULL DEFAULT 0,
  `image` varchar(100) DEFAULT NULL,
  `admin_logo` varchar(255) NOT NULL,
  `admin_small_logo` varchar(255) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `fee_due_days` int(3) DEFAULT 0,
  `adm_auto_insert` int(1) NOT NULL DEFAULT 1,
  `adm_prefix` varchar(50) NOT NULL DEFAULT 'ssadm19/20',
  `adm_start_from` varchar(11) NOT NULL,
  `adm_no_digit` int(10) NOT NULL DEFAULT 6,
  `adm_update_status` int(11) NOT NULL DEFAULT 0,
  `staffid_auto_insert` int(11) NOT NULL DEFAULT 1,
  `staffid_prefix` varchar(100) NOT NULL DEFAULT 'staffss/19/20',
  `staffid_start_from` varchar(50) NOT NULL,
  `staffid_no_digit` int(11) NOT NULL DEFAULT 6,
  `staffid_update_status` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `online_admission` int(1) DEFAULT 0,
  `online_admission_payment` varchar(50) NOT NULL,
  `online_admission_amount` float NOT NULL,
  `online_admission_instruction` text NOT NULL,
  `online_admission_conditions` text NOT NULL,
  `is_blood_group` int(10) NOT NULL DEFAULT 1,
  `is_student_house` int(10) NOT NULL DEFAULT 1,
  `roll_no` int(11) NOT NULL DEFAULT 1,
  `category` int(11) NOT NULL,
  `religion` int(11) NOT NULL DEFAULT 1,
  `cast` int(11) NOT NULL DEFAULT 1,
  `mobile_no` int(11) NOT NULL DEFAULT 1,
  `student_email` int(11) NOT NULL DEFAULT 1,
  `admission_date` int(11) NOT NULL DEFAULT 1,
  `lastname` int(11) NOT NULL,
  `middlename` int(11) NOT NULL DEFAULT 1,
  `student_photo` int(11) NOT NULL DEFAULT 1,
  `student_height` int(11) NOT NULL DEFAULT 1,
  `student_weight` int(11) NOT NULL DEFAULT 1,
  `measurement_date` int(11) NOT NULL DEFAULT 1,
  `father_name` int(11) NOT NULL DEFAULT 1,
  `father_phone` int(11) NOT NULL DEFAULT 1,
  `father_occupation` int(11) NOT NULL DEFAULT 1,
  `father_pic` int(11) NOT NULL DEFAULT 1,
  `mother_name` int(11) NOT NULL DEFAULT 1,
  `mother_phone` int(11) NOT NULL DEFAULT 1,
  `mother_occupation` int(11) NOT NULL DEFAULT 1,
  `mother_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_name` int(1) NOT NULL,
  `guardian_relation` int(11) NOT NULL DEFAULT 1,
  `guardian_phone` int(1) NOT NULL,
  `guardian_email` int(11) NOT NULL DEFAULT 1,
  `guardian_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_occupation` int(1) NOT NULL,
  `guardian_address` int(11) NOT NULL DEFAULT 1,
  `current_address` int(11) NOT NULL DEFAULT 1,
  `permanent_address` int(11) NOT NULL DEFAULT 1,
  `route_list` int(11) NOT NULL DEFAULT 1,
  `hostel_id` int(11) NOT NULL DEFAULT 1,
  `bank_account_no` int(11) NOT NULL DEFAULT 1,
  `ifsc_code` int(1) NOT NULL,
  `bank_name` int(1) NOT NULL,
  `national_identification_no` int(11) NOT NULL DEFAULT 1,
  `local_identification_no` int(11) NOT NULL DEFAULT 1,
  `rte` int(11) NOT NULL DEFAULT 1,
  `previous_school_details` int(11) NOT NULL DEFAULT 1,
  `student_note` int(11) NOT NULL DEFAULT 1,
  `upload_documents` int(11) NOT NULL DEFAULT 1,
  `staff_designation` int(11) NOT NULL DEFAULT 1,
  `staff_department` int(11) NOT NULL DEFAULT 1,
  `staff_last_name` int(11) NOT NULL DEFAULT 1,
  `staff_father_name` int(11) NOT NULL DEFAULT 1,
  `staff_mother_name` int(11) NOT NULL DEFAULT 1,
  `staff_date_of_joining` int(11) NOT NULL DEFAULT 1,
  `staff_phone` int(11) NOT NULL DEFAULT 1,
  `staff_emergency_contact` int(11) NOT NULL DEFAULT 1,
  `staff_marital_status` int(11) NOT NULL DEFAULT 1,
  `staff_photo` int(11) NOT NULL DEFAULT 1,
  `staff_current_address` int(11) NOT NULL DEFAULT 1,
  `staff_permanent_address` int(11) NOT NULL DEFAULT 1,
  `staff_qualification` int(11) NOT NULL DEFAULT 1,
  `staff_work_experience` int(11) NOT NULL DEFAULT 1,
  `staff_note` int(11) NOT NULL DEFAULT 1,
  `staff_epf_no` int(11) NOT NULL DEFAULT 1,
  `staff_basic_salary` int(11) NOT NULL DEFAULT 1,
  `staff_contract_type` int(11) NOT NULL DEFAULT 1,
  `staff_work_shift` int(11) NOT NULL DEFAULT 1,
  `staff_work_location` int(11) NOT NULL DEFAULT 1,
  `staff_leaves` int(11) NOT NULL DEFAULT 1,
  `staff_account_details` int(11) NOT NULL DEFAULT 1,
  `staff_social_media` int(11) NOT NULL DEFAULT 1,
  `staff_upload_documents` int(11) NOT NULL DEFAULT 1,
  `mobile_api_url` tinytext NOT NULL,
  `app_primary_color_code` varchar(20) DEFAULT NULL,
  `app_secondary_color_code` varchar(20) DEFAULT NULL,
  `app_logo` varchar(250) DEFAULT NULL,
  `student_profile_edit` int(1) NOT NULL DEFAULT 0,
  `start_week` varchar(10) NOT NULL,
  `my_question` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `is_duplicate_fees_invoice`, `timezone`, `session_id`, `cron_secret_key`, `currency_place`, `class_teacher`, `start_month`, `attendence_type`, `image`, `admin_logo`, `admin_small_logo`, `theme`, `fee_due_days`, `adm_auto_insert`, `adm_prefix`, `adm_start_from`, `adm_no_digit`, `adm_update_status`, `staffid_auto_insert`, `staffid_prefix`, `staffid_start_from`, `staffid_no_digit`, `staffid_update_status`, `is_active`, `online_admission`, `online_admission_payment`, `online_admission_amount`, `online_admission_instruction`, `online_admission_conditions`, `is_blood_group`, `is_student_house`, `roll_no`, `category`, `religion`, `cast`, `mobile_no`, `student_email`, `admission_date`, `lastname`, `middlename`, `student_photo`, `student_height`, `student_weight`, `measurement_date`, `father_name`, `father_phone`, `father_occupation`, `father_pic`, `mother_name`, `mother_phone`, `mother_occupation`, `mother_pic`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_email`, `guardian_pic`, `guardian_occupation`, `guardian_address`, `current_address`, `permanent_address`, `route_list`, `hostel_id`, `bank_account_no`, `ifsc_code`, `bank_name`, `national_identification_no`, `local_identification_no`, `rte`, `previous_school_details`, `student_note`, `upload_documents`, `staff_designation`, `staff_department`, `staff_last_name`, `staff_father_name`, `staff_mother_name`, `staff_date_of_joining`, `staff_phone`, `staff_emergency_contact`, `staff_marital_status`, `staff_photo`, `staff_current_address`, `staff_permanent_address`, `staff_qualification`, `staff_work_experience`, `staff_note`, `staff_epf_no`, `staff_basic_salary`, `staff_contract_type`, `staff_work_shift`, `staff_work_location`, `staff_leaves`, `staff_account_details`, `staff_social_media`, `staff_upload_documents`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `student_profile_edit`, `start_week`, `my_question`, `created_at`, `updated_at`) VALUES
(1, 'Demo International School', 0, 'S-B251CB,192.168.0.224,5005,admin,Admin', 'emmanuelevan90@gmail.com', '8882910514', 'B-37, Sector 2, Third Floor', 4, '[\"4\",\"82\",\"79\",\"74\",\"72\",\"55\",\"53\",\"49\",\"23\",\"68\",\"5\"]', '10024', 'd-m-Y', '12-hour', 'INR', '₹', 'disabled', 0, 'Asia/Kolkata', 16, 'UpPV8VcERFW0VIaJ1nrGyc0os', 'after_number', 'no', '4', 0, '1.png', '1.png', '1.png', 'blue.jpg', 60, 1, 'EIS', '001', 3, 1, 1, 'EISSTA', '000000001', 9, 1, 'no', 1, 'yes', 1500, '<p><span style=\"font-size:48px\">Terms and Conditions</span></p>\r\n\r\n<p><strong>Instructions for online admission</strong></p>\r\n\r\n<div style=\"background:#eee;border:1px solid #ccc;padding:5px 10px;\"><em><strong>Note:</strong></em></div>\r\n\r\n<div style=\"background:#eee;border:1px solid #ccc;padding:5px 10px;\"><em>Online registration is mandatory for admission.</em></div>\r\n\r\n<p>Before proceeding to&nbsp;<strong>Online Registration</strong>&nbsp;Candidates must ensure:</p>\r\n\r\n<ul>\r\n	<li><span style=\"color:rgb(41, 43, 44); font-family:open sans,sans-serif; font-size:14px\">That they have scanned images of their photograph, Photo ID Proof and signature in .jpg/.tiff format, each of the scanned images of the photograph/ID Proof/signature should not exceed 100 KB in size (for photograph, the pixel size is 140 pixels height x 110 pixels width and for signature it should be 110 pixels height x 140 pixels width) and to be ensured that the uploaded photograph/signature are proper.</span></li>\r\n</ul>\r\n\r\n<p><span style=\"color:rgb(41, 43, 44); font-family:open sans,sans-serif; font-size:14px\">#&nbsp;The candidate should scan his signature, which has been put on white paper with Black / Blue Ink pen.</span></p>\r\n\r\n<p><span style=\"color:rgb(41, 43, 44); font-family:open sans,sans-serif; font-size:14px\">[Candidates using&nbsp;MS Window/MSOffice can easily obtain photo and signature in .jpg&nbsp;format not exceeding 40KB and less than 3 KB in size by using&nbsp;MS Paint&nbsp;or MSOffice Picture Manager. Scanned photograph and signature (scan at 200 dpi) can be saved in .jpg&nbsp;format by using &#39;Save As&#39; option in the File menu and size can be reduced to the desired size by using crop and then resize option (please see point 3 above for the pixel sizes) in the &#39;Image&#39; menu. Similar options are available in other photo editors also]</span></p>\r\n\r\n<p><strong>After registration</strong><span style=\"color:rgb(41, 43, 44); font-family:open sans,sans-serif; font-size:14px\">, the candidate can pay through&nbsp;</span><strong>Online Payment through Net banking/Debit &amp; Credit Card:</strong><span style=\"color:rgb(41, 43, 44); font-family:open sans,sans-serif; font-size:14px\">&nbsp;Login through the credentials received and pay through the appropriate channel.</span></p>\r\n\r\n<div style=\"background:#eee;border:1px solid #ccc;padding:5px 10px;\"><em>Note:</em></div>\r\n\r\n<div style=\"background:#eee;border:1px solid #ccc;padding:5px 10px;\"><span style=\"background-color:rgb(246, 244, 244); font-family:open sans,sans-serif; font-size:14px\">Your admission to the concerned batch is provisional. It will be confirmed after we get payment confirmation.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n', '<div class=\"dheading\" id=\"ctl00_divheading\" style=\"box-sizing: inherit; outline: 0px; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">\r\n<div class=\"container\" style=\"box-sizing: inherit; outline: 0px; margin: 0px auto; padding: 0px 15px; border: 0px; vertical-align: baseline; position: relative; width: 1290px; max-width: 1290px;\">\r\n<div class=\"row\" style=\"box-sizing: inherit; outline: 0px; margin: 0px -15px; padding: 0px; border: 0px; vertical-align: baseline; display: flex; flex-wrap: wrap;\">\r\n<div class=\"col-lg-12\" style=\"box-sizing: inherit; outline: 0px; margin: 0px; padding: 0px 15px; border: 0px; vertical-align: baseline; position: relative; width: 1290px; min-height: 1px; -webkit-box-flex: 0; flex: 0 0 100%; max-width: 100%;\">\r\n<h1>Terms and Conditions</h1>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"cms rightpadd\" style=\"box-sizing: inherit; outline: 0px; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; min-height: 500px;\">\r\n<div class=\"container\" id=\"ctl00_divcontainer\" style=\"box-sizing: inherit; outline: 0px; margin: 0px auto; padding: 0px 15px; border: 0px; vertical-align: baseline; position: relative; width: 1290px; max-width: 1290px;\">\r\n<div class=\"terms\" style=\"box-sizing: inherit; outline: 0px; margin: 0px 0px 35px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(41, 43, 44); font-family: \">\r\n<p style=\"text-align:justify\"><strong>Instructions for Online Registration</strong></p>\r\n\r\n<div class=\"bg-secondary\" style=\"box-sizing: inherit; outline: 0px; margin: 25px 0px 0px; padding: 30px; border: 0px; vertical-align: baseline; color: rgb(160, 28, 36); font-style: italic; font-weight: 600; background-color: rgb(246, 244, 244) !important;\">Note:\r\n<p style=\"text-align:justify\">Online registration is mandatory for admission.</p>\r\n</div>\r\n\r\n<p style=\"text-align:justify\">Before proceeding to&nbsp;<strong>Online Registration</strong>&nbsp;Candidates must ensure:</p>\r\n\r\n<div class=\"list-style mt-3\" style=\"box-sizing: inherit; outline: 0px; margin-top: 1rem !important; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">\r\n<ul>\r\n	<li style=\"text-align:justify\">That they have scanned images of their photograph, Photo ID Proof and signature in .jpg/.tiff format, each of the scanned images of the photograph/ID Proof/signature should not exceed 100 KB in size (for photograph, the pixel size is 140 pixels height x 110 pixels width and for signature it should be 110 pixels height x 140 pixels width) and to be ensured that the uploaded photograph/signature are proper.</li>\r\n</ul>\r\n</div>\r\n\r\n<p style=\"text-align:justify\"># The candidate should scan his signature, which has been put on white paper with Black / Blue Ink pen.</p>\r\n\r\n<p style=\"text-align:justify\">[Candidates using&nbsp;MS Window/MSOffice can easily obtain photo and signature in .jpg&nbsp;format not exceeding 40KB and less than 3 KB in size by using&nbsp;MS Paint&nbsp;or MSOffice Picture Manager. Scanned photograph and signature (scan at 200 dpi) can be saved in .jpg&nbsp;format by using &#39;Save As&#39; option in the File menu and size can be reduced to the desired size by using crop and then resize option (please see point 3 above for the pixel sizes) in the &#39;Image&#39; menu. Similar options are available in other photo editors also]</p>\r\n\r\n<p style=\"text-align:justify\"><strong>After registration</strong>, the candidate can pay through:</p>\r\n\r\n<div class=\"list-style mt-3\" style=\"box-sizing: inherit; outline: 0px; margin-top: 1rem !important; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">\r\n<ul>\r\n	<li style=\"text-align:justify\"><strong>Online Payment through Net banking/Debit &amp; Credit Card:</strong>&nbsp;Login through the credentials received and pay through the appropriate channel.</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"bg-secondary\" style=\"box-sizing: inherit; outline: 0px; margin: 25px 0px 0px; padding: 30px; border: 0px; vertical-align: baseline; color: rgb(160, 28, 36); font-style: italic; font-weight: 600; background-color: rgb(246, 244, 244) !important;\">Note:\r\n<p style=\"text-align:justify\">Your admission to the concerned batch is provisional. It will be confirmed after we get payment confirmation.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', '#424242', '#eeeeee', '1.png', 1, 'Monday', 1, '2022-07-18 05:13:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'A', 'no', '2021-06-30 10:37:43', NULL),
(2, 'B', 'no', '2021-06-30 10:38:02', NULL),
(3, 'C', 'no', '2021-07-20 13:03:15', NULL),
(4, 'D', 'no', '2021-07-20 13:03:20', NULL),
(5, 'E', 'no', '2021-07-20 13:03:25', NULL),
(6, 'F', 'no', '2021-10-22 06:03:59', NULL),
(7, 'Online Classes', 'no', '2022-03-22 06:18:38', NULL),
(8, 'Offline Classes', 'no', '2022-03-22 06:19:34', NULL),
(9, 'Online & Offline Classes', 'no', '2022-03-22 06:19:45', NULL),
(14, 'Combined Class', 'no', '2022-09-03 11:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `send_notification`
--

INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `branch_id`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Branch One Admin Message Title', '2022-09-28', '2022-09-28', '<p><b>Branch One Admin Message </b><br></p><p><b>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</b></p>', 1, 'No', 'Yes', 'No', 'Super Admin', 1, 'no', '2022-09-28 11:34:06', NULL),
(2, 'Test', '2022-10-06', '2022-10-06', '<p>Test</p>', 2, 'Yes', 'No', 'No', 'Super Admin', 1, 'no', '2022-10-06 07:35:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES
(7, '2016-17', 'no', '2017-04-20 06:42:19', '0000-00-00'),
(11, '2017-18', 'no', '2017-04-20 06:41:37', '0000-00-00'),
(13, '2018-19', 'no', '2016-08-24 19:26:44', '0000-00-00'),
(14, '2019-20', 'no', '2016-08-24 19:26:55', '0000-00-00'),
(15, '2020-21', 'no', '2016-10-01 05:28:08', '0000-00-00'),
(16, '2021-22', 'no', '2021-11-20 07:07:15', '0000-00-00'),
(18, '2022-23', 'no', '2016-10-01 05:29:02', '0000-00-00'),
(19, '2023-24', 'no', '2016-10-01 05:29:10', '0000-00-00'),
(20, '2024-25', 'no', '2016-10-01 05:29:18', '0000-00-00'),
(21, '2025-26', 'no', '2016-10-01 05:30:10', '0000-00-00'),
(22, '2026-27', 'no', '2016-10-01 05:30:18', '0000-00-00'),
(23, '2027-28', 'no', '2016-10-01 05:30:24', '0000-00-00'),
(24, '2028-29', 'no', '2016-10-01 05:30:30', '0000-00-00'),
(25, '2029-30', 'no', '2016-10-01 05:30:37', '0000-00-00'),
(26, '2021-22 Hindi', 'no', '2021-08-05 06:44:13', NULL),
(27, '2017-2018', 'no', '2021-10-21 05:39:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_config`
--

INSERT INTO `sms_config` (`id`, `type`, `name`, `api_id`, `authkey`, `senderid`, `contact`, `username`, `url`, `password`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'text_local', '', '', '', 'Emmanuel School', NULL, 'jackykumar24@gmail.com', NULL, 'MzA0ZjUyNzQ3MTYyNmY0NDZmNzAzNzQ5Mzc0NDUwNDQ=		', 'disabled', '2021-08-11 11:55:18', NULL),
(2, 'bulk_sms', '', '', '', '', NULL, 'jacky17', NULL, 'Jacky@123', 'enabled', '2021-08-11 11:55:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `source`, `description`) VALUES
(1, 'Website', ''),
(2, 'Phone Call', ''),
(3, 'Email', ''),
(4, 'WhatsApp', ''),
(5, 'SMS', ''),
(6, 'Physical Visit', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `department` int(11) DEFAULT 0,
  `designation` int(11) DEFAULT 0,
  `qualification` varchar(200) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `disable_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `qualification`, `branch_id`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `disable_at`) VALUES
(1, '9000', 4, 1, 3, 'B.Tech; MBA', 0, '7 years', 'Super', 'Admin', 'super', 'admin', '8876654567', '8876656474', 'evanemmanuel@sartiaglobal.com', '1989-10-03', 'Single', '2017-01-15', '0000-00-00', 'B-37, Sector 2,\r\nThird Floor', 'B-37, Sector 2,\r\nThird Floor', '', '1.jpg', '$2y$10$Nzxmog37UeQYgvUnVBvNLuAHcdXF1jjZ4fRAjsDmJ0TrG2Pk1uRVG', 'Male', 'Salary Account', '1000000033225', 'SBI', 'SBIN554747', 'Delhi', '', '25000', 'EIS5544778', 'permanent', 'Day', 'Delhi', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL),
(16, 'EISSTA000009001', 0, 1, 1, '', 1, '', 'Branch1', 'Admin', '', '', '', '', 'b1admin@gmail.com', '2022-09-28', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$OvBfdTv5JXZSWNS.8CMSLuUMw3AYZYSmzkS.3P6cc1w65v8EkSkKW', 'Male', '', '', '', '', '', '', '250000', 'PF1', 'permanent', 'Day', 'New Delhi', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL),
(17, 'EISSTA000009002', 0, 1, 1, '', 2, '', 'Branch2', 'Admin', '', '', '', '', 'b2admin@gmail.com', '2022-09-28', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$OvBfdTv5JXZSWNS.8CMSLuUMw3AYZYSmzkS.3P6cc1w65v8EkSkKW', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '0000-00-00'),
(18, 'EISSTA000009003', 0, 1, 1, '', 1, '', 'Branch1', 'Teacher', '', '', '', '', 'b1teacher@gmail.com', '2022-09-28', '', '2022-09-28', '0000-00-00', '', '', '', '', '$2y$10$OvBfdTv5JXZSWNS.8CMSLuUMw3AYZYSmzkS.3P6cc1w65v8EkSkKW', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '0000-00-00'),
(19, 'EISSTA000009004', 0, 0, 0, '', 2, '', 'Branch2', 'Teacher', '', '', '', '', 'b2teacher@gmail.com', '2022-09-28', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$OvBfdTv5JXZSWNS.8CMSLuUMw3AYZYSmzkS.3P6cc1w65v8EkSkKW', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(20, 'EISSTA000009005', 0, 0, 0, '', 1, '', 'Branch1', 'Second Teacher', '', '', '', '', 'b22teacher@gmail.com', '2022-09-28', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$OvBfdTv5JXZSWNS.8CMSLuUMw3AYZYSmzkS.3P6cc1w65v8EkSkKW', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(21, 'EISSTA000009006', 0, 1, 6, '', 2, '', 'Test', 'Test ', '', '', '', '', 'test@mail.com', '2022-10-05', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$55kEvbt6PdT/2xPQPY5Lau4qMfvJ23OxmZNbQiA0vEaqM69K908im', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_attendance`
--

INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2022-09-28', 16, 1, '', 1, '2022-09-28 12:17:59', NULL),
(2, '2022-09-28', 17, 1, '', 1, '2022-09-28 12:17:59', NULL),
(3, '2022-09-28', 18, 1, '', 1, '2022-09-28 12:17:59', NULL),
(4, '2022-09-28', 19, 1, '', 1, '2022-09-28 12:17:59', NULL),
(5, '2022-09-28', 20, 1, '', 1, '2022-09-28 12:17:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance_type`
--

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_attendance_type`
--

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16', '0000-00-00'),
(5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES
(1, 'Intern', 'yes'),
(2, 'Junior Teacher', 'yes'),
(3, 'Senior Teacher', 'yes'),
(4, 'Placement Coordinator', 'yes'),
(5, 'Branch Manager', 'yes'),
(6, 'Business Development Executive', 'yes'),
(7, 'Trainer', 'yes'),
(8, 'Administrator', 'yes'),
(9, 'Admission Counselor ', 'yes'),
(10, 'Business Development Associate ', 'yes'),
(11, 'Mechanical Engineer', 'yes'),
(12, 'Multimedia Executive', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `staff_id_card`
--

CREATE TABLE `staff_id_card` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_address` varchar(255) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `enable_staff_role` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_department` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_designation` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_date_of_joining` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_permanent_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_id_card`
--

INSERT INTO `staff_id_card` (`id`, `branch_id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_vertical_card`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `status`) VALUES
(1, 1, 'RKS School', 'Rks Interational School', 'Rks@gmail.com', 'background1.jpg', 'logo12.png', '', '#000000', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, NULL, 'Raj School', 'Raj Interational School', 'raj@gmail.com', 'background21.png', 'logo21.png', 'sign21.png', '#000000', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_details`
--

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_leave_details`
--

INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES
(1, 16, 1, '5'),
(2, 16, 2, '4'),
(3, 16, 3, '2'),
(4, 16, 4, '1'),
(5, 16, 5, '10'),
(6, 17, 1, '5'),
(7, 17, 2, '4'),
(8, 17, 3, '2'),
(9, 17, 4, '1'),
(10, 17, 5, '10');

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_request`
--

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_leave_request`
--

INSERT INTO `staff_leave_request` (`id`, `staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES
(1, 16, 1, '2022-09-28', '2022-09-28', 1, '', 'Test', 'approve', 'Branch1 Admin', '', '2022-09-28');

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payslip`
--

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `basic` float(10,2) NOT NULL,
  `total_allowance` float(10,2) NOT NULL,
  `total_deduction` float(10,2) NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `net_salary` float(10,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_payslip`
--

INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES
(1, 6, 25000.00, 0.00, 0.00, 0, '0', 25000.00, 'paid', 'October', '2021', 'online', '2021-11-22', ''),
(2, 6, 0.00, 300.00, 0.00, 0, '0', 300.00, 'paid', 'February', '2022', 'cash', '2022-03-28', ''),
(4, 6, 0.00, 20000.00, 1230.00, 0, '0', 18770.00, 'paid', 'March', '2022', 'cash', '2022-04-02', ''),
(5, 9, 0.00, 2000.00, 150.00, 0, '0', 1850.00, 'generated', 'March', '2022', '', '2022-04-04', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff_rating`
--

CREATE TABLE `staff_rating` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 decline, 1 Approve',
  `entrydt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_rating`
--

INSERT INTO `staff_rating` (`id`, `staff_id`, `comment`, `rate`, `user_id`, `role`, `status`, `entrydt`) VALUES
(1, 18, '', 5, 2, '', 1, '2022-09-28 11:01:34'),
(2, 20, '', 5, 2, '', 1, '2022-09-28 11:05:22'),
(3, 19, '', 5, 2, '', 1, '2022-09-28 11:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_roles`
--

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 0, '2022-09-17 04:45:01', NULL),
(2, 2, 9, 0, '2022-09-17 04:45:50', NULL),
(3, 1, 10, 0, '2022-09-17 04:46:23', NULL),
(4, 2, 11, 0, '2022-09-17 04:47:10', NULL),
(5, 7, 1, 1, '2022-09-17 09:40:13', NULL),
(6, 2, 12, 0, '2022-09-21 05:50:51', NULL),
(7, 1, 16, 0, '2022-09-28 10:06:37', NULL),
(8, 1, 17, 0, '2022-09-28 10:07:36', NULL),
(9, 2, 18, 0, '2022-09-28 10:08:26', NULL),
(10, 2, 19, 0, '2022-09-28 10:09:07', NULL),
(11, 2, 20, 0, '2022-09-28 10:10:08', NULL),
(12, 1, 21, 0, '2022-10-06 07:08:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_timeline`
--

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) DEFAULT NULL,
  `bpl` varchar(250) DEFAULT NULL,
  `bpl_no` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `measurement_date` date NOT NULL,
  `dis_reason` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `dis_note` text NOT NULL,
  `app_key` text DEFAULT NULL,
  `parent_app_key` text DEFAULT NULL,
  `disable_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `bpl`, `bpl_no`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'EIS001', '201', NULL, 'SIDHI', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, '2', 'FEMALE', NULL, 'Female', '', '', '3', 0, 0, 'O+', 0, 0, '', '', '', '', '', 'Father', 'RAMKARAN', '9813873398', '', '', '', '', 'RAMKARAN', 'Father', '9813873398', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-10-07 07:05:03', NULL),
(2, 4, 'EIS002', '202', NULL, 'HANSHIKA', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, '4', 'FEMALE', NULL, 'Male', '', '', '3', 0, 0, 'O+', 0, 0, '', '', '', '', '', 'Father', 'KAPIL', '7988108004', '', '', '', '', 'KAPIL', 'Father', '7988108004', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-10-07 07:04:58', NULL),
(3, 6, 'EIS003', '201', NULL, 'Ramesh', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, 'Hindu', 'FEMALE', NULL, 'Female', '', '', '1', 0, 0, 'O+', 0, 0, '', '', '', '', '', 'Father', 'RAMKARAN', '9813873398', '', '', '', '', 'RAMKARAN', 'Father', '9813873398', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-10-07 07:04:55', NULL),
(4, 8, 'EIS004', '202', NULL, 'Suresh', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, 'Hindu', 'FEMALE', NULL, 'Male', '', '', '1', 0, 0, 'O+', 0, 0, '', '', '', '', '', 'Father', 'KAPIL', '7988108004', '', '', '', '', 'KAPIL', 'Father', '7988108004', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-10-07 07:04:52', NULL),
(5, 10, 'EIS005', '', '2022-10-06', 'Mohit', NULL, 'Singh', 'No', NULL, NULL, 'uploads/student_images/default_male.jpg', '9874563210', '', NULL, NULL, NULL, '1', '', '2016-03-01', 'Male', '', '', '4', 0, 0, '', 0, 0, '', '', '', '', '', 'father', '', '', '', '', '', '', 'MS', 'Father', '9632587410', '', '', '', '', '', '', 'yes', '', '', '', '2022-10-06', 0, '', '', NULL, NULL, '0000-00-00', '2022-10-06 06:20:04', NULL),
(6, 12, 'EIS006', '201', '2021-03-18', 'Edward', '', 'Thomas', '', NULL, NULL, NULL, '8233366613', 'thomas@gmail.com', NULL, NULL, NULL, '', '', '2014-11-03', 'Male', 'West Brooklyn', 'West Brooklyn', '2', 0, 0, 'A', 0, 0, '46464746', '446464', '68654', ' UBS Bank', 'UBS5644', 'Father', 'Olivier Thomas', '98654646', 'Lawyer', 'Caroline Thomas', '6598656', 'Teacher', 'Olivier Thomas', 'Father', '98654646', 'Lawyer', 'West Brooklyn', '', '', '', '', 'yes', '', '4\'2', '34 kg', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-10-07 07:04:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_applyleave`
--

CREATE TABLE `student_applyleave` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `apply_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `docs` text NOT NULL,
  `reason` text NOT NULL,
  `approve_by` int(11) NOT NULL,
  `request_type` int(11) NOT NULL COMMENT '0 student,1 staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendences`
--

CREATE TABLE `student_attendences` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `biometric_attendence` int(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `biometric_device_data` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_doc`
--

CREATE TABLE `student_doc` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_edit_fields`
--

CREATE TABLE `student_edit_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_edit_fields`
--

INSERT INTO `student_edit_fields` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'guardian_address', 1, '2021-07-01 08:08:33'),
(2, 'father_phone', 1, '2021-07-01 08:08:53'),
(3, 'mother_phone', 1, '2021-07-01 08:08:58'),
(4, 'current_address', 1, '2021-07-01 08:09:08'),
(5, 'permanent_address', 1, '2021-07-01 08:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_deposite`
--

CREATE TABLE `student_fees_deposite` (
  `id` int(11) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_deposite`
--

INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `amount_detail`, `is_active`, `created_at`) VALUES
(2, 7, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2022-10-07 09:18:54'),
(18, 3, 62, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2022-10-07 11:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_discounts`
--

CREATE TABLE `student_fees_discounts` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_discounts`
--

INSERT INTO `student_fees_discounts` (`id`, `student_session_id`, `fees_discount_id`, `status`, `payment_id`, `description`, `is_active`, `created_at`) VALUES
(1, 47, 2, 'assigned', NULL, NULL, 'no', '2021-09-06 10:29:07'),
(2, 61, 2, 'assigned', NULL, NULL, 'no', '2021-09-06 10:29:07'),
(3, 8, 1, 'applied', '161/1', '', 'no', '2022-04-19 05:24:52'),
(8, 7, 1, 'assigned', NULL, NULL, 'no', '2022-04-19 05:29:51'),
(40, 100, 1, 'applied', '182//1', '', 'no', '2022-04-28 06:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_master`
--

CREATE TABLE `student_fees_master` (
  `id` int(11) NOT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_master`
--

INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES
(1, 1, 2, 1, 10.00, 'no', '2022-09-30 08:28:20'),
(2, 1, 1, 1, 0.00, 'no', '2022-09-30 07:48:21'),
(3, 0, 1, 2, 0.00, 'no', '2022-10-06 07:05:20'),
(4, 0, 2, 2, 0.00, 'no', '2022-10-06 07:05:20'),
(5, 0, 3, 2, 0.00, 'no', '2022-10-06 07:05:20'),
(6, 0, 4, 2, 0.00, 'no', '2022-10-06 07:05:20'),
(7, 0, 5, 2, 0.00, 'no', '2022-10-07 09:17:59');

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
(8, 1, 'R2210071665131318', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"50\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 08:28:38', 'Teste', 1),
(9, 1, 'R22100716651374138', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"tws\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:10:13', 'Test', 1),
(10, 1, 'R22100716651374229', 3, 62, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:10:22', 'Test', 1),
(11, 1, 'R221007166513938410', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"Testet\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:43:04', '', 1),
(12, 1, 'R221007166513949911', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:44:59', '', 1),
(13, 1, 'R221007166513955112', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:45:51', '', 1),
(14, 1, 'R221007166513959413', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:46:34', '', 1),
(15, 1, 'R221007166513969714', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:48:17', 'rest', 1),
(16, 1, 'R221007166513983015', 3, 62, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:50:30', '', 1),
(17, 1, 'R221007166513983316', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:50:33', '', 1),
(18, 1, 'R221007166514000417', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:53:24', '', 1),
(19, 1, 'R221007166514000818', 3, 62, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:53:28', '', 1),
(20, 1, 'R221007166514022719', 3, 62, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:57:07', '', 1),
(21, 1, 'R221007166514023220', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"tes\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 10:57:12', '', 1),
(22, 1, 'R221007166514047321', 3, 62, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 11:01:13', '', 1),
(23, 1, 'R221007166514122022', 3, 61, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-10-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"test\",\"collected_by\":\"Super Admin(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'yes', '2022-10-07 11:13:40', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_session`
--

CREATE TABLE `student_session` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `route_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `vehroute_id` int(10) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT 0.00,
  `fees_discount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(255) DEFAULT 'no',
  `is_alumni` int(11) NOT NULL,
  `default_login` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_session`
--

INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `branch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES
(1, 16, 1, 1, 1, 1, 0, 0, NULL, 0.00, 0.00, 'no', 0, 0, '2022-09-28 11:56:26', NULL),
(2, 16, 2, 1, 1, 1, 0, 0, NULL, 0.00, 0.00, 'no', 0, 0, '2022-09-28 11:56:28', NULL),
(3, 16, 3, 1, 1, 2, 0, 0, NULL, 0.00, 0.00, 'no', 0, 0, '2022-09-30 06:51:15', NULL),
(4, 16, 4, 1, 1, 2, 0, 0, NULL, 0.00, 0.00, 'no', 0, 0, '2022-09-30 06:51:19', NULL),
(5, 16, 5, 3, 1, 1, 0, 0, NULL, 0.00, 0.00, 'no', 0, 0, '2022-10-06 06:20:04', NULL),
(6, 16, 6, 2, 1, 2, 0, 0, NULL, 0.00, 0.00, 'no', 0, 0, '2022-10-07 06:59:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_sibling`
--

CREATE TABLE `student_sibling` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `sibling_student_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_attendances`
--

CREATE TABLE `student_subject_attendances` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_timeline`
--

CREATE TABLE `student_timeline` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'English', '001', 'theory', 'no', '2021-07-01 06:38:06', NULL),
(2, 'Hindi', '002', 'theory', 'no', '2021-07-01 06:38:15', NULL),
(3, 'Sanskrit', '003', 'theory', 'no', '2021-07-01 06:38:27', NULL),
(4, 'French', '004', 'theory', 'no', '2021-07-01 06:38:35', NULL),
(5, 'Spanish', '005', 'theory', 'no', '2021-07-01 06:38:42', NULL),
(6, 'science', '', 'practical', 'no', '2021-08-04 08:53:28', NULL),
(7, 'Phy', '006', 'theory', 'no', '2021-08-04 08:59:24', NULL),
(8, 'che', '007', 'theory', 'no', '2021-08-04 08:59:42', NULL),
(9, 'Bio', '008', 'theory', 'no', '2021-08-04 08:59:59', NULL),
(10, 'Ultrasonic Testing', 'UT-89', 'theory', 'no', '2022-01-08 12:19:40', NULL),
(11, 'Magnetic Particle Testing', 'MT-90', 'theory', 'no', '2022-01-08 12:20:43', NULL),
(12, 'Liquid Penetrant Testing', 'PT-91', 'theory', 'no', '2022-01-08 12:21:17', NULL),
(13, 'Radiography Testing', 'RT-92', 'theory', 'no', '2022-01-08 12:22:32', NULL),
(14, 'Visual Testing', 'VT-93', 'theory', 'no', '2022-01-08 12:23:48', NULL),
(15, 'Radiographic Film Interpretation', 'RTFI-98', 'theory', 'no', '2022-01-08 12:24:36', NULL),
(16, 'Ultrasonic Testing Practical', 'UT-89P', 'practical', 'no', '2022-03-22 06:24:28', NULL),
(17, 'Magnetic Particle Testing Practical', 'MT-90P', 'practical', 'no', '2022-03-22 06:25:07', NULL),
(18, 'Liquid Penetrant Testing Practical', 'PT-91P', 'practical', 'no', '2022-03-22 06:25:28', NULL),
(19, 'Radiography Testing Practical', 'RT-92P', 'practical', 'no', '2022-03-22 06:26:05', NULL),
(20, 'English speaking', '', 'theory', 'no', '2022-04-08 12:50:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_groups`
--

CREATE TABLE `subject_groups` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_groups`
--

INSERT INTO `subject_groups` (`id`, `branch_id`, `name`, `description`, `session_id`, `created_at`) VALUES
(1, 1, 'Check', '', 16, '2022-09-29 06:20:29'),
(2, 2, 'Branch 2 Check', '', 16, '2022-09-29 06:20:22'),
(3, 1, 'sdsdss', '', 16, '2022-09-29 06:22:18'),
(4, 1, 'Test', 'Test', 16, '2022-10-06 10:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `subject_group_class_sections`
--

CREATE TABLE `subject_group_class_sections` (
  `id` int(11) NOT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_group_class_sections`
--

INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 16, NULL, 0, '2022-09-29 06:18:20', NULL),
(2, 3, 17, 16, NULL, 0, '2022-09-29 06:22:18', NULL),
(3, 4, 1, 16, NULL, 0, '2022-10-06 10:06:53', NULL),
(4, 4, 16, 16, NULL, 0, '2022-10-06 10:06:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_group_subjects`
--

CREATE TABLE `subject_group_subjects` (
  `id` int(11) NOT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_group_subjects`
--

INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES
(1, 1, 16, 1, '2021-07-01 06:39:47'),
(2, 1, 16, 2, '2021-07-01 06:39:47'),
(3, 1, 16, 3, '2021-07-01 06:39:47'),
(4, 2, 16, 4, '2021-07-01 07:25:53'),
(5, 3, 16, 7, '2021-08-04 09:00:38'),
(6, 3, 16, 8, '2021-08-04 09:00:38'),
(7, 3, 16, 9, '2021-08-04 09:00:38'),
(8, 4, 16, 1, '2021-08-04 09:12:41'),
(9, 4, 16, 2, '2021-08-04 09:12:41'),
(10, 4, 16, 3, '2021-08-04 09:12:41'),
(11, 4, 16, 7, '2021-08-04 09:12:41'),
(12, 4, 16, 8, '2021-08-04 09:12:41'),
(13, 4, 16, 9, '2021-08-04 09:12:41'),
(14, 5, 16, 1, '2021-08-09 06:01:08'),
(15, 5, 16, 2, '2021-08-09 06:01:08'),
(16, 5, 16, 3, '2021-08-09 06:01:08'),
(17, 5, 16, 7, '2021-08-09 06:01:08'),
(18, 5, 16, 8, '2021-08-09 06:01:08'),
(19, 5, 16, 9, '2021-08-09 06:01:08'),
(20, 6, 16, 1, '2021-09-07 10:21:16'),
(21, 6, 16, 2, '2021-09-07 10:21:16'),
(22, 6, 16, 3, '2021-09-07 10:21:16'),
(23, 6, 16, 7, '2021-09-07 10:21:16'),
(24, 6, 16, 8, '2021-09-07 10:21:16'),
(25, 6, 16, 9, '2021-09-07 10:21:16'),
(26, 7, 16, 10, '2022-03-22 06:28:43'),
(27, 7, 16, 11, '2022-03-22 06:28:43'),
(28, 7, 16, 12, '2022-03-22 06:28:43'),
(29, 7, 16, 13, '2022-03-22 06:28:43'),
(30, 7, 16, 16, '2022-03-22 06:28:43'),
(31, 7, 16, 17, '2022-03-22 06:28:43'),
(32, 7, 16, 18, '2022-03-22 06:28:43'),
(33, 7, 16, 19, '2022-03-22 06:28:43'),
(34, 8, 16, 1, '2022-04-08 12:54:16'),
(35, 8, 16, 2, '2022-04-08 12:54:16'),
(36, 8, 16, 20, '2022-04-08 12:54:16'),
(37, 9, 16, 1, '2022-09-29 06:14:33'),
(38, 1, 16, 20, '2022-09-29 06:17:10'),
(39, 2, 16, 1, '2022-09-29 06:18:20'),
(40, 3, 16, 2, '2022-09-29 06:22:18'),
(41, 4, 16, 1, '2022-10-06 10:06:53'),
(42, 4, 16, 2, '2022-10-06 10:06:53'),
(43, 4, 16, 7, '2022-10-06 10:06:53'),
(44, 4, 16, 8, '2022-10-06 10:06:53'),
(45, 4, 16, 9, '2022-10-06 10:06:53'),
(46, 4, 16, 10, '2022-10-06 10:06:53'),
(47, 4, 16, 11, '2022-10-06 10:06:53'),
(48, 4, 16, 12, '2022-10-06 10:06:53'),
(49, 4, 16, 13, '2022-10-06 10:06:53'),
(50, 4, 16, 14, '2022-10-06 10:06:53'),
(51, 4, 16, 15, '2022-10-06 10:06:53'),
(52, 4, 16, 16, '2022-10-06 10:06:53'),
(53, 4, 16, 17, '2022-10-06 10:06:53'),
(54, 4, 16, 18, '2022-10-06 10:06:53'),
(55, 4, 16, 19, '2022-10-06 10:06:53'),
(56, 4, 16, 20, '2022-10-06 10:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `subject_syllabus`
--

CREATE TABLE `subject_syllabus` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_for` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_from` varchar(255) NOT NULL,
  `time_to` varchar(255) NOT NULL,
  `presentation` text NOT NULL,
  `attachment` text NOT NULL,
  `lacture_youtube_url` varchar(255) NOT NULL,
  `lacture_video` varchar(255) NOT NULL,
  `sub_topic` text NOT NULL,
  `teaching_method` text NOT NULL,
  `general_objectives` text NOT NULL,
  `previous_knowledge` text NOT NULL,
  `comprehensive_questions` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_syllabus`
--

INSERT INTO `subject_syllabus` (`id`, `topic_id`, `session_id`, `created_by`, `created_for`, `date`, `time_from`, `time_to`, `presentation`, `attachment`, `lacture_youtube_url`, `lacture_video`, `sub_topic`, `teaching_method`, `general_objectives`, `previous_knowledge`, `comprehensive_questions`, `status`, `created_at`) VALUES
(1, 1, 16, 1, 3, '2021-06-28', '7:30 AM', '8:10 AM', '', '', '', '', '', '', '', '', '', 0, '2021-07-01 08:20:23'),
(2, 1, 16, 1, 3, '2021-07-26', '7:30 AM', '8:10 AM', '<p>Hello Today is English Day</p>\r\n', '', '', '', '10 Pages', '', '', '', '', 0, '2021-07-26 08:47:07'),
(3, 6, 16, 1, 6, '2021-09-07', '12:07 PM', '1:07 PM', '', '', '', '', '', '', '', '', '', 0, '2021-09-06 11:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `subject_timetable`
--

CREATE TABLE `subject_timetable` (
  `id` int(11) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `time_from` varchar(20) DEFAULT NULL,
  `time_to` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_timetable`
--

INSERT INTO `subject_timetable` (`id`, `day`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `session_id`, `created_at`) VALUES
(1, 'Monday', 1, 1, 1, 1, 3, '7:30 AM', '8:10 AM', '07:30:00', '08:10:00', '47', 16, '2021-07-01 06:44:46'),
(2, 'Monday', 2, 1, 2, 4, 3, '8:10 AM', '8:50 AM', '08:10:00', '08:50:00', '23', 16, '2021-07-01 07:26:57'),
(3, 'Monday', 1, 1, 1, 2, 3, '8:10 AM', '8:50 AM', '08:10:00', '08:50:00', '47', 16, '2021-07-01 11:09:42'),
(4, 'Monday', 1, 1, 1, 3, 3, '8:50 AM', '9:30 AM', '08:50:00', '09:30:00', '47', 16, '2021-07-01 11:10:13'),
(5, 'Tuesday', 1, 1, 1, 1, 3, '7:30 AM', '8:10 AM', '07:30:00', '08:10:00', '47', 16, '2021-07-01 11:10:57'),
(6, 'Tuesday', 1, 1, 1, 3, 3, '8:10 AM', '8:50 AM', '08:10:00', '08:50:00', '47', 16, '2021-07-01 11:12:21'),
(7, 'Tuesday', 1, 1, 1, 2, 3, '8:50 AM', '9:30 AM', '08:50:00', '09:30:00', '47', 16, '2021-07-01 11:12:21'),
(8, 'Wednesday', 1, 1, 1, 2, 3, '7:30 AM', '8:10 PM', '07:30:00', '20:10:00', '47', 16, '2021-07-01 11:13:33'),
(9, 'Wednesday', 1, 1, 1, 1, 3, '8:10 AM', '8:50 AM', '08:10:00', '08:50:00', '47', 16, '2021-07-01 11:13:33'),
(10, 'Wednesday', 1, 1, 1, 3, 3, '8:50 AM', '9:30 PM', '08:50:00', '21:30:00', '47', 16, '2021-07-01 11:13:33'),
(11, 'Thursday', 1, 1, 1, 3, 3, '7:30 AM', '8:10 AM', '07:30:00', '08:10:00', '47', 16, '2021-07-01 11:14:01'),
(12, 'Thursday', 1, 1, 1, 1, 3, '8:10 AM', '8:50 AM', '08:10:00', '08:50:00', '47', 16, '2021-07-01 11:14:41'),
(13, 'Thursday', 1, 1, 1, 2, 3, '8:50 AM', '9:30 AM', '08:50:00', '09:30:00', '47', 16, '2021-07-01 11:14:41'),
(14, 'Friday', 1, 1, 1, 1, 3, '7:30 AM', '8:10 AM', '07:30:00', '08:10:00', '47', 16, '2021-07-01 11:15:39'),
(15, 'Friday', 1, 1, 1, 3, 3, '8:10 AM', '8:50 AM', '08:10:00', '08:50:00', '47', 16, '2021-07-01 11:15:39'),
(16, 'Friday', 1, 1, 1, 2, 3, '8:50 AM', '9:30 AM', '08:50:00', '09:30:00', '47', 16, '2021-07-01 11:15:39'),
(18, 'Monday', 13, 1, 4, 8, 3, '2:45 PM', '3:15 PM', '14:45:00', '15:15:00', '10', 16, '2021-08-04 09:18:43'),
(20, 'Monday', 13, 1, 4, 10, 6, '10:30 AM', '11:00 AM', '10:30:00', '11:00:00', '10', 16, '2021-08-04 09:18:43'),
(21, 'Monday', 13, 1, 4, 11, 6, '11:00 AM', '11:30 AM', '11:00:00', '11:30:00', '10', 16, '2021-08-04 09:18:43'),
(23, 'Monday', 1, 1, 1, 1, 6, '4:14 AM', '6:14 AM', '04:14:00', '06:14:00', '121', 16, '2021-08-12 22:45:08'),
(24, 'Tuesday', 1, 1, 1, 2, 6, '12:07 PM', '1:07 PM', '12:07:00', '13:07:00', '14', 16, '2021-08-24 06:37:52'),
(25, 'Monday', 4, 2, 6, 20, 6, '7:30 AM', '8:15 AM', '07:30:00', '08:15:00', 'Class 9 B', 16, '2021-09-07 10:22:24'),
(26, 'Monday', 4, 2, 6, 21, 6, '8:15 AM', '9:00 AM', '08:15:00', '09:00:00', 'Class 9 B', 16, '2021-09-07 10:22:54'),
(27, 'Monday', 4, 2, 6, 22, 6, '9:00 AM', '9:45 AM', '09:00:00', '09:45:00', 'Class 9 B', 16, '2021-09-07 10:23:24'),
(28, 'Monday', 4, 2, 6, 23, 6, '9:45 AM', '10:30 AM', '09:45:00', '10:30:00', 'Class 9 B', 16, '2021-09-07 10:23:58'),
(29, 'Monday', 4, 2, 6, 24, 6, '10:30 AM', '11:15 AM', '10:30:00', '11:15:00', 'Class 9 B', 16, '2021-09-07 10:24:28'),
(30, 'Monday', 4, 2, 6, 25, 6, '11:15 AM', '12:00 PM', '11:15:00', '12:00:00', 'Class 9 B', 16, '2021-09-07 10:24:51'),
(31, 'Monday', 1, 1, 1, 2, 6, '5:40 PM', '7:00 PM', '17:40:00', '19:00:00', '45', 16, '2021-11-22 08:09:03'),
(32, 'Monday', 1, 1, 1, 3, 6, '3:00 PM', '4:00 PM', '15:00:00', '16:00:00', '12', 16, '2022-04-07 09:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `submit_assignment`
--

CREATE TABLE `submit_assignment` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `docs` varchar(225) NOT NULL,
  `file_name` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_branch`
--

CREATE TABLE `tb_branch` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `branch_status` enum('0','1') NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_branch`
--

INSERT INTO `tb_branch` (`id`, `branch_name`, `location`, `branch_status`, `update_date`, `created_date`) VALUES
(1, 'Branch1', 'New Delhi', '1', '2022-09-28 10:02:56', '2022-09-28 10:02:56'),
(2, 'Branch 2', 'Gurgon', '1', '2022-09-28 10:03:08', '2022-09-28 10:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pagecontain`
--

CREATE TABLE `tb_pagecontain` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `add_subtitle` varchar(200) DEFAULT NULL,
  `direction` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `file` varchar(200) NOT NULL,
  `statu` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template_admitcards`
--

CREATE TABLE `template_admitcards` (
  `id` int(11) NOT NULL,
  `template` varchar(250) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `is_name` int(1) NOT NULL DEFAULT 1,
  `is_father_name` int(1) NOT NULL DEFAULT 1,
  `is_mother_name` int(1) NOT NULL DEFAULT 1,
  `is_dob` int(1) NOT NULL DEFAULT 1,
  `is_admission_no` int(1) NOT NULL DEFAULT 1,
  `is_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_address` int(1) NOT NULL DEFAULT 1,
  `is_gender` int(1) NOT NULL DEFAULT 1,
  `is_photo` int(11) NOT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_admitcards`
--

INSERT INTO `template_admitcards` (`id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `sign`, `background_img`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_address`, `is_gender`, `is_photo`, `is_class`, `is_section`, `content_footer`, `created_at`, `updated_at`) VALUES
(1, 'Sample Admit Card', 'Da-viruz Systems, MADHYA PRADESH, BHOPAL', 'HIGHER SECONDARY SCHOOL CERTIFICATE EXAMINATION (10+2) 2014', 'ab12c4b65f53ee621dcf84370a7c5be4.png', '0910482bf79df5fd103e8383d61b387a.png', 'Test', 'Mount Carmel School', 'test dmit card2', 'aa9c7087e68c5af1d2c04946de1d3bd3.png', '782a71f53ea6bca213012d49e9d46d98.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2020-02-28 14:26:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_marksheets`
--

CREATE TABLE `template_marksheets` (
  `id` int(11) NOT NULL,
  `template` varchar(200) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `left_sign` varchar(200) DEFAULT NULL,
  `middle_sign` varchar(200) DEFAULT NULL,
  `right_sign` varchar(200) DEFAULT NULL,
  `exam_session` int(1) DEFAULT 1,
  `is_name` int(1) DEFAULT 1,
  `is_father_name` int(1) DEFAULT 1,
  `is_mother_name` int(1) DEFAULT 1,
  `is_dob` int(1) DEFAULT 1,
  `is_admission_no` int(1) DEFAULT 1,
  `is_roll_no` int(1) DEFAULT 1,
  `is_photo` int(11) DEFAULT 1,
  `is_division` int(1) NOT NULL DEFAULT 1,
  `is_customfield` int(1) NOT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_teacher_remark` int(11) NOT NULL DEFAULT 1,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_marksheets`
--

INSERT INTO `template_marksheets` (`id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `left_sign`, `middle_sign`, `right_sign`, `exam_session`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_photo`, `is_division`, `is_customfield`, `background_img`, `date`, `is_class`, `is_teacher_remark`, `is_section`, `content`, `content_footer`, `created_at`, `updated_at`) VALUES
(1, 'Sample Marksheet', 'Da-viruz Systems, MADHYA PRADESH, BHOPAL', 'BOARD OF SECONDARY EDUCATION, MADHYA PRADESH, BHOPAL', 'f314cec3f688771ccaeddbcee6e52f7c.png', 'e824b2df53266266be2dbfd2001168b8.png', 'HIGHER SECONDARY SCHOOL CERTIFICATE EXAMINATION', 'Mount Carmel School', 'GOVT GIRLS H S SCHOOL', '331e0690e50f8c6b7a219a0a2b9667f7.png', '351f513d79ee5c0f642c2d36514a1ff4.png', 'fb79d2c0d163357d1706b78550a05e2c.png', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', NULL, 0, 1, 0, NULL, NULL, '2020-02-28 14:26:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` int(11) NOT NULL,
  `teacher_subject_id` int(20) DEFAULT NULL,
  `day_name` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `lesson_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `complete_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `session_id`, `branch_id`, `lesson_id`, `name`, `status`, `complete_date`, `created_at`) VALUES
(1, 16, 1, 1, 'Check topic', 0, '0000-00-00', '2022-09-29 04:53:02'),
(2, 16, 1, 1, 'Check topic2', 0, '0000-00-00', '2022-09-29 04:53:02'),
(3, 16, 2, 5, 'Premchand', 0, '0000-00-00', '2022-09-29 04:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `route_title` varchar(100) DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `fare` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport_route`
--

INSERT INTO `transport_route` (`id`, `branch_id`, `route_title`, `no_of_vehicle`, `fare`, `note`, `is_active`, `created_at`, `updated_at`) VALUES
(5, NULL, 'Karhans - Nursery to 4th', NULL, 350.00, NULL, 'no', '2022-04-14 05:32:58', NULL),
(6, NULL, 'Karhans - 5th to 10th', NULL, 400.00, NULL, 'no', '2022-04-14 05:33:18', NULL),
(7, NULL, 'Machhrouli - Nursery to 4th', NULL, 350.00, NULL, 'no', '2022-04-14 05:33:35', NULL),
(8, NULL, 'Machhrouli - 5th to 10th', NULL, 400.00, NULL, 'no', '2022-04-14 05:33:51', NULL),
(9, 1, 'Check branch 1 Route', NULL, 150.00, NULL, 'no', '2022-09-29 10:22:46', NULL),
(10, 2, 'Check branch 2 Route', NULL, 200.00, NULL, 'no', '2022-09-29 10:23:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(1, 'asifgrc@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 04:08:14'),
(2, 'asifgrc@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 10:10:05'),
(3, 'asifgrc@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 10:21:05'),
(4, 'asifgrc@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 10:24:18'),
(5, 'asifgrc@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 10:24:30'),
(6, 'asifgrc@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-06-30 10:43:39'),
(7, 'asifgrc@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 11:53:57'),
(8, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 18:06:09'),
(9, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '119.42.59.210', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 22:30:44'),
(10, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '119.42.59.210', 'Chrome 91.0.4472.124, Windows 10', '2021-06-30 22:35:12'),
(11, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 10:22:45'),
(12, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 10:54:37'),
(13, 'manager.suraj@wingshieldtechnologies.com', 'Librarian', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-01 11:02:26'),
(14, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 11:41:19'),
(15, 'parent3', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:36:18'),
(16, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:38:47'),
(17, 'parent3', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:40:09'),
(18, 'Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:42:54'),
(19, 'parent4', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:46:19'),
(20, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:47:53'),
(21, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 12:54:11'),
(22, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 13:14:11'),
(23, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 13:17:06'),
(24, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 13:22:16'),
(25, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-01 13:23:02'),
(26, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-01 13:24:19'),
(27, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 15:07:12'),
(28, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 15:31:18'),
(29, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-01 16:35:35'),
(30, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-01 17:09:01'),
(31, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-02 12:21:24'),
(32, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-02 14:09:12'),
(33, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-03 14:45:38'),
(34, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-03 16:57:22'),
(35, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-03 17:02:27'),
(36, 'sales.abhishek@wingshieldtechnologies.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-03 17:16:19'),
(37, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.114, Windows 10', '2021-07-05 13:43:55'),
(38, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-06 11:08:07'),
(39, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-06 11:53:45'),
(40, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-06 15:18:38'),
(41, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-06 15:25:44'),
(42, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-07 17:44:27'),
(43, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '119.42.59.210', 'Chrome 91.0.4472.124, Windows 10', '2021-07-07 20:51:05'),
(44, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '119.42.59.210', 'Chrome 91.0.4472.124, Windows 10', '2021-07-07 23:20:05'),
(45, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-08 11:11:28'),
(46, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-08 15:31:27'),
(47, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-08 15:39:02'),
(48, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '103.87.59.189', 'Chrome 91.0.4472.124, Windows 10', '2021-07-08 16:36:12'),
(49, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-08 16:36:46'),
(50, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-08 16:57:10'),
(51, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-09 14:34:31'),
(52, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-09 15:27:05'),
(53, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-09 15:47:38'),
(54, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-12 13:26:15'),
(55, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-12 14:57:57'),
(56, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-12 15:18:27'),
(57, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-13 14:24:12'),
(58, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-13 17:16:22'),
(59, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-13 17:20:11'),
(60, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-13 17:21:33'),
(61, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-13 17:32:20'),
(62, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-13 20:38:57'),
(63, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.124, Windows 10', '2021-07-14 14:51:57'),
(64, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-17 15:46:02'),
(65, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-17 16:04:17'),
(66, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '47.31.158.76', 'Chrome 91.0.4472.164, Windows 10', '2021-07-18 15:07:01'),
(67, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-19 10:02:21'),
(68, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-19 10:15:58'),
(69, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-20 18:26:08'),
(70, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-21 14:06:21'),
(71, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-22 14:52:36'),
(72, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-22 18:07:43'),
(73, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-22 18:11:17'),
(74, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-23 15:34:41'),
(75, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-26 12:58:57'),
(76, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-26 13:00:56'),
(77, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-26 13:16:26'),
(78, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Firefox 90.0, Windows 10', '2021-07-27 12:44:05'),
(79, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-27 12:50:55'),
(80, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-27 13:13:31'),
(81, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-27 13:15:06'),
(82, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-27 13:16:16'),
(83, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-27 14:31:45'),
(84, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-27 16:40:03'),
(85, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 91.0.4472.164, Windows 10', '2021-07-28 11:45:15'),
(86, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-28 12:37:24'),
(87, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-28 13:34:00'),
(88, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-28 14:59:35'),
(89, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-28 16:10:07'),
(90, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 10:40:47'),
(91, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 10:41:26'),
(92, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 11:09:43'),
(93, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 11:10:17'),
(94, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 11:21:25'),
(95, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 11:23:10'),
(96, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-29 13:20:47'),
(97, 'jackykumar24@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 13:16:30'),
(98, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 13:26:07'),
(99, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 13:50:57'),
(100, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 13:51:34'),
(101, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 13:57:56'),
(102, 'Mr. Yadav', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 14:00:56'),
(103, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 14:02:14'),
(104, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 14:44:04'),
(105, 'std8', 'student', 3, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 14:49:34'),
(106, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 14:55:31'),
(107, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-30 15:04:27'),
(108, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 01:23:59'),
(109, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 01:25:06'),
(110, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 01:30:32'),
(111, 'parent6', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 01:32:01'),
(112, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 10:47:15'),
(113, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:06:59'),
(114, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:28:57'),
(115, 'parent7', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:30:07'),
(116, 'parent8', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:34:26'),
(117, 'am.jacky@wingshieldtechnologies.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:55:56'),
(118, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:56:35'),
(119, 'am.jacky@wingshieldtechnologies.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 11:59:00'),
(120, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 12:14:38'),
(121, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-07-31 15:56:17'),
(122, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-02 10:24:19'),
(123, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-02 18:22:26'),
(124, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 10:48:44'),
(125, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 10:50:48'),
(126, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 10:50:57'),
(127, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 11:58:11'),
(128, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 12:59:09'),
(129, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 15:48:46'),
(130, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 16:30:40'),
(131, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 17:19:41'),
(132, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-03 18:40:38'),
(133, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 10:49:52'),
(134, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 11:23:27'),
(135, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 13:55:42'),
(136, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 13:58:18'),
(137, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 14:14:16'),
(138, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 14:14:44'),
(139, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 14:36:58'),
(140, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 15:32:47'),
(141, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 15:51:53'),
(142, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-04 17:46:23'),
(143, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-04 17:49:01'),
(144, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-04 17:49:19'),
(145, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-04 17:50:31'),
(146, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-04 17:52:14'),
(147, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 18:45:37'),
(148, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 20:13:00'),
(149, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-04 22:07:13'),
(150, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-05 09:41:14'),
(151, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-05 10:18:24'),
(152, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-05 10:46:04'),
(153, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Safari 605.1.15, Mac OS X', '2021-08-05 12:21:17'),
(154, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '182.68.167.89', 'Chrome 92.0.4515.131, Windows 10', '2021-08-05 12:43:35'),
(155, 'std9', 'student', 5, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-05 12:43:38'),
(156, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-05 15:09:06'),
(157, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-05 15:21:17'),
(158, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-05 16:00:58'),
(159, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 09:59:58'),
(160, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 10:09:32'),
(161, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 10:41:15'),
(162, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 10:52:56'),
(163, 'std9', 'student', 5, '122.160.77.106', 'Chrome 92.0.4515.107, Windows 10', '2021-08-06 11:27:23'),
(164, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '103.214.119.185', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 11:54:05'),
(165, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 12:07:35'),
(166, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 12:17:18'),
(167, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '47.31.203.85', 'Chrome 92.0.4515.131, Android', '2021-08-06 13:52:28'),
(168, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-06 15:25:09'),
(169, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-09 11:30:10'),
(170, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-09 11:50:48'),
(171, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-09 12:05:41'),
(172, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-09 12:07:43'),
(173, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-09 12:31:23'),
(174, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.115, Linux', '2021-08-09 12:32:38'),
(175, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-09 12:34:51'),
(176, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-10 11:18:03'),
(177, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-10 12:04:51'),
(178, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Android', '2021-08-10 17:26:06'),
(179, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-11 10:49:03'),
(180, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-11 15:10:28'),
(181, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-11 16:28:48'),
(182, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-11 17:12:48'),
(183, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-11 17:43:14'),
(184, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-11 18:13:16'),
(185, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-12 09:54:49'),
(186, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-12 10:03:08'),
(187, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-12 12:54:45'),
(188, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 7', '2021-08-12 15:07:31'),
(189, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-13 03:33:24'),
(190, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-13 03:58:42'),
(191, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '157.37.199.93', 'Chrome 92.0.4515.131, Android', '2021-08-13 05:12:40'),
(192, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '157.37.199.93', 'Chrome 92.0.4515.131, Android', '2021-08-13 05:13:36'),
(193, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-14 12:37:09'),
(194, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-14 15:12:43'),
(195, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-16 13:51:49'),
(196, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Linux', '2021-08-17 12:09:50'),
(197, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Linux', '2021-08-17 16:56:52'),
(198, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-17 17:52:56'),
(199, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-18 12:02:48'),
(200, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-18 12:03:07'),
(201, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-18 12:11:24'),
(202, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-18 16:55:26'),
(203, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.131, Windows 10', '2021-08-18 16:58:16'),
(204, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-19 12:41:17'),
(205, 'std6', 'student', 1, '122.160.77.106', 'Firefox 91.0, Windows 10', '2021-08-19 12:43:18'),
(206, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-19 15:06:36'),
(207, 'std4', 'student', 1, '122.160.77.106', 'Firefox 91.0, Windows 10', '2021-08-19 15:07:53'),
(208, 'yadav123', 'parent', NULL, '122.160.77.106', 'Firefox 91.0, Windows 10', '2021-08-19 15:10:34'),
(209, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-19 15:16:31'),
(210, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-19 15:19:19'),
(211, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-19 15:20:01'),
(212, 'std3', 'student', 1, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-23 11:06:51'),
(213, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-23 12:25:31'),
(214, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-23 15:03:09'),
(215, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-23 15:20:16'),
(216, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-24 11:54:32'),
(217, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.51, Windows 10', '2021-08-24 13:20:19'),
(218, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Linux', '2021-08-25 11:03:02'),
(219, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Linux', '2021-08-25 11:27:02'),
(220, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Linux', '2021-08-25 12:15:18'),
(221, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 92.0.4515.131, Linux', '2021-08-25 14:06:50'),
(222, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-25 15:39:34'),
(223, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-25 17:43:29'),
(224, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-25 19:24:13'),
(225, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.58, Windows 10', '2021-08-26 10:03:50'),
(226, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.58, Windows 10', '2021-08-26 13:01:32'),
(227, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.58, Windows 10', '2021-08-27 17:18:22'),
(228, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-27 18:19:17'),
(229, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-27 22:33:48'),
(230, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.20, Windows 10', '2021-08-28 11:14:01'),
(231, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-28 12:42:25'),
(232, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-28 15:00:09'),
(233, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-28 16:12:51'),
(234, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-28 16:14:58'),
(235, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-28 16:15:21'),
(236, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-28 16:40:26'),
(237, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.20, Windows 10', '2021-08-28 16:57:06'),
(238, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-30 11:03:05'),
(239, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-31 10:44:32'),
(240, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-31 11:39:46'),
(241, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.20, Windows 10', '2021-08-31 11:51:15'),
(242, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-08-31 11:51:39'),
(243, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-01 15:05:00'),
(244, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-01 17:18:38'),
(245, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-02 02:58:24'),
(246, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.20, Windows 10', '2021-09-02 10:16:46'),
(247, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-02 12:32:56'),
(248, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-02 13:47:52'),
(249, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-02 13:56:17'),
(250, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-03 10:07:54'),
(251, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-03 11:04:56'),
(252, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-03 16:32:57'),
(253, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-03 17:25:58'),
(254, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-03 17:45:02'),
(255, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.31, Windows 10', '2021-09-03 18:24:07'),
(256, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-04 10:08:46'),
(257, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.31, Windows 10', '2021-09-04 10:48:12'),
(258, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.31, Windows 10', '2021-09-04 13:25:17'),
(259, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-04 13:26:54'),
(260, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-04 14:11:19'),
(261, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-04 15:00:21'),
(262, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.177.75.104', 'Chrome 93.0.4577.62, Android', '2021-09-05 13:26:50'),
(263, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.177.75.104', 'Chrome 93.0.4577.62, Android', '2021-09-05 13:29:53'),
(264, 'Sjacky439@gmail.com', 'Admin', NULL, '122.177.75.104', 'Chrome 93.0.4577.62, Android', '2021-09-05 13:30:49'),
(265, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-06 10:25:31'),
(266, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-06 10:29:13'),
(267, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-06 11:20:24'),
(268, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-06 14:00:58'),
(269, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 7', '2021-09-06 14:53:34'),
(270, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-06 15:32:42'),
(271, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.31, Windows 10', '2021-09-06 16:12:05'),
(272, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 7', '2021-09-06 17:30:51'),
(273, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-06 17:55:26'),
(274, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 92.0.4515.159, Windows 10', '2021-09-07 02:29:13'),
(275, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 10:28:02'),
(276, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 11:03:31'),
(277, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 11:04:30'),
(278, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 7', '2021-09-07 11:22:53'),
(279, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 13:31:59'),
(280, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 15:38:40'),
(281, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 15:40:45'),
(282, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 16:12:36'),
(283, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 16:13:23'),
(284, 'jacky.kumar@thewingshield.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 16:16:42'),
(285, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-07 17:33:37'),
(286, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 10:26:14'),
(287, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 7', '2021-09-08 10:27:00'),
(288, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.31, Windows 10', '2021-09-08 10:28:53'),
(289, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 15:35:41'),
(290, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 16:39:39'),
(291, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 17:04:14'),
(292, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 17:30:16'),
(293, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 7', '2021-09-08 17:37:25'),
(294, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.31, Windows 10', '2021-09-08 17:40:29'),
(295, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 18:07:15'),
(296, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-08 18:27:45'),
(297, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 10:11:39'),
(298, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 7', '2021-09-09 10:17:36'),
(299, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 10:23:58'),
(300, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 10:24:22'),
(301, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 12:47:55'),
(302, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 16:14:24'),
(303, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 16:18:08'),
(304, 'std3', 'student', 1, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 16:21:42'),
(305, 'std3', 'student', 1, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 16:22:56'),
(306, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-09 16:23:30'),
(307, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Linux', '2021-09-10 09:58:39'),
(308, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-10 10:38:15'),
(309, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-10 12:04:51'),
(310, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-10 12:05:16'),
(311, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-10 18:19:32'),
(312, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-10 18:19:46'),
(313, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-13 11:34:41'),
(314, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-13 11:36:19'),
(315, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 11:09:33'),
(316, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 11:56:24'),
(317, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 12:37:49'),
(318, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 12:38:48'),
(319, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 15:51:48'),
(320, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 16:03:26'),
(321, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 16:14:57'),
(322, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 16:31:41'),
(323, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-14 17:52:09'),
(324, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-15 10:27:54'),
(325, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-15 15:25:20'),
(326, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-15 15:34:02'),
(327, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.41, Windows 10', '2021-09-15 15:56:55'),
(328, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-15 16:00:29'),
(329, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-15 16:02:38'),
(330, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-15 16:50:24'),
(331, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-16 10:10:51'),
(332, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-16 11:59:45'),
(333, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-17 10:04:28'),
(334, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-17 11:57:17'),
(335, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-17 14:08:10'),
(336, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-17 14:08:18'),
(337, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-17 15:51:56'),
(338, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.63, Windows 10', '2021-09-18 10:04:30'),
(339, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-18 13:45:53'),
(340, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-18 17:12:46'),
(341, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-18 17:17:16'),
(342, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-18 17:43:36'),
(343, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-18 17:46:50'),
(344, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-20 10:11:55'),
(345, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-20 11:19:58'),
(346, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-20 11:24:49'),
(347, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.50, Windows 10', '2021-09-20 16:34:26'),
(348, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-20 18:28:23'),
(349, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-21 10:33:27'),
(350, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-21 13:13:34'),
(351, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '157.37.151.90', 'Chrome 93.0.4577.82, Windows 10', '2021-09-21 14:45:39'),
(352, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-21 15:24:59'),
(353, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-22 10:23:57'),
(354, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.54, Windows 10', '2021-09-22 10:48:51'),
(355, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Safari 604.1, iOS', '2021-09-22 15:49:20'),
(356, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-22 15:56:03'),
(357, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.54, Windows 10', '2021-09-23 11:02:54'),
(358, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-23 11:21:51'),
(359, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-24 17:01:14'),
(360, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.61, Windows 10', '2021-09-27 10:34:29'),
(361, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.61, Windows 10', '2021-09-27 12:09:45'),
(362, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-28 14:18:20'),
(363, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.61, Windows 10', '2021-09-28 14:21:33'),
(364, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 93.0.4577.82, Windows 10', '2021-09-28 17:11:03'),
(365, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.61, Windows 10', '2021-10-01 12:51:13'),
(366, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-04 10:23:27'),
(367, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.61, Windows 10', '2021-10-04 14:58:32'),
(368, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.61, Windows 10', '2021-10-04 16:08:19'),
(369, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.32, Windows 10', '2021-10-05 18:10:25'),
(370, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-06 11:31:57'),
(371, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.32, Windows 10', '2021-10-06 12:19:54'),
(372, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-06 15:16:59'),
(373, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.32, Windows 10', '2021-10-06 16:46:39'),
(374, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-06 16:52:46'),
(375, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-07 10:55:03'),
(376, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-07 11:37:51'),
(377, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.32, Windows 10', '2021-10-07 14:28:37'),
(378, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-07 17:16:39'),
(379, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-07 17:36:45'),
(380, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-08 10:23:23'),
(381, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-08 10:55:04'),
(382, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-08 13:45:38'),
(383, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-08 15:27:58'),
(384, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-08 15:44:15'),
(385, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-09 11:10:15'),
(386, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-09 11:10:46'),
(387, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-09 11:20:25'),
(388, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.40, Windows 10', '2021-10-09 11:42:27'),
(389, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-09 12:26:42'),
(390, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-09 17:38:03'),
(391, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-11 17:56:23'),
(392, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.40, Windows 10', '2021-10-12 10:25:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(393, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-12 11:06:07'),
(394, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-12 12:18:46'),
(395, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-12 16:33:04'),
(396, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-13 06:22:10'),
(397, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-13 09:43:20'),
(398, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-13 09:45:55'),
(399, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.40, Windows 10', '2021-10-14 04:44:56'),
(400, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-14 04:59:23'),
(401, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-14 09:40:58'),
(402, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-14 10:03:48'),
(403, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-18 04:40:52'),
(404, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-19 04:46:23'),
(405, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.49, Windows 10', '2021-10-19 05:04:18'),
(406, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.49, Windows 10', '2021-10-19 08:03:20'),
(407, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-19 08:04:14'),
(408, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-20 06:39:29'),
(409, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-20 06:44:24'),
(410, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-20 10:23:29'),
(411, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-20 10:54:33'),
(412, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-20 11:12:54'),
(413, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-20 11:19:35'),
(414, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-20 11:25:07'),
(415, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-21 04:50:46'),
(416, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-21 05:13:56'),
(417, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-21 05:48:59'),
(418, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-21 06:43:08'),
(419, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-21 10:14:55'),
(420, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-22 04:41:46'),
(421, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-22 05:11:04'),
(422, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-22 09:33:18'),
(423, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-22 11:51:15'),
(424, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-22 12:16:32'),
(425, 'std3', 'student', 1, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-22 12:55:22'),
(426, 'std7', 'student', 1, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-22 13:00:19'),
(427, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-23 04:38:07'),
(428, 'std7', 'student', 1, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-23 06:19:32'),
(429, 'std9', 'student', 5, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-23 06:34:29'),
(430, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-23 06:53:10'),
(431, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-23 09:32:44'),
(432, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-23 10:01:29'),
(433, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-23 11:20:16'),
(434, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-23 11:45:49'),
(435, 'std3', 'student', 1, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-23 11:48:10'),
(436, 'parent8', 'parent', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-23 11:49:06'),
(437, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '157.37.198.134', 'Chrome 89.0.4389.105, Android', '2021-10-23 12:11:01'),
(438, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-25 04:49:17'),
(439, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-25 05:12:33'),
(440, 'std41', 'student', 1, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-25 05:19:11'),
(441, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-25 05:20:03'),
(442, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-25 06:26:27'),
(443, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-25 07:50:43'),
(444, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-25 08:03:41'),
(445, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-25 09:56:50'),
(446, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-25 10:11:05'),
(447, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.71, Windows 10', '2021-10-25 11:43:01'),
(448, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '157.37.163.30', 'Chrome 89.0.4389.105, Android', '2021-10-25 14:27:37'),
(449, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.18, Windows 10', '2021-10-26 04:43:33'),
(450, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 94.0.4606.81, Windows 10', '2021-10-26 08:03:52'),
(451, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-27 04:43:17'),
(452, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.18, Windows 10', '2021-10-27 06:27:35'),
(453, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-28 06:07:19'),
(454, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-28 12:11:25'),
(455, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-29 09:58:59'),
(456, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-30 04:46:58'),
(457, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-10-30 09:41:04'),
(458, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-01 04:58:04'),
(459, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-01 09:18:16'),
(460, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-01 09:25:27'),
(461, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-02 06:24:46'),
(462, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-03 06:36:04'),
(463, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-08 05:01:09'),
(464, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.54, Windows 10', '2021-11-08 10:42:18'),
(465, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-09 06:25:26'),
(466, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-09 07:41:05'),
(467, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 05:04:06'),
(468, 'prachi74', 'student', 4, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 05:08:48'),
(469, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 05:09:53'),
(470, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 06:59:20'),
(471, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 09:04:59'),
(472, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 09:18:59'),
(473, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-10 12:30:48'),
(474, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-11 04:52:50'),
(475, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-12 05:08:02'),
(476, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-12 09:34:12'),
(477, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-13 05:43:39'),
(478, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-15 04:48:42'),
(479, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-16 04:38:35'),
(480, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-16 09:37:38'),
(481, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-17 04:44:14'),
(482, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 04:50:52'),
(483, 'chetan76', 'student', 8, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 06:50:51'),
(484, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 09:22:12'),
(485, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 11:54:49'),
(486, 'std3', 'student', 1, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 12:05:25'),
(487, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 12:10:39'),
(488, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-18 12:16:57'),
(489, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-18 13:42:39'),
(490, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-19 04:47:00'),
(491, 'sales.shubham@wingshieldtechnologies.com', 'Accountant', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-19 06:10:38'),
(492, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-19 06:12:30'),
(493, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-19 06:34:41'),
(494, 'parent8', 'parent', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-19 06:37:10'),
(495, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 95.0.4638.69, Windows 10', '2021-11-19 06:40:43'),
(496, 'php.rahul@wingshieldtechnologies.com', 'Store Keeper', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Linux', '2021-11-19 06:54:26'),
(497, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-19 09:24:07'),
(498, 'std3', 'student', 1, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-19 12:11:44'),
(499, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 04:40:42'),
(500, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.20, Windows 10', '2021-11-20 10:55:03'),
(501, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:02:32'),
(502, 'std77', 'student', 6, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:15:26'),
(503, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:18:18'),
(504, 'chetan76', 'student', 8, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:18:53'),
(505, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:19:51'),
(506, 'std43', 'student', 1, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:20:15'),
(507, 'parent43', 'parent', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:21:09'),
(508, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:21:41'),
(509, 'ayush75', 'student', 4, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:22:19'),
(510, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-20 12:24:19'),
(511, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-22 05:02:32'),
(512, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-22 09:15:45'),
(513, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-23 04:52:14'),
(514, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '157.37.137.65', 'Chrome 96.0.4664.45, Windows 10', '2021-11-23 06:23:09'),
(515, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-23 09:23:20'),
(516, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-23 09:26:29'),
(517, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-24 05:01:45'),
(518, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-24 08:21:42'),
(519, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-24 12:42:35'),
(520, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-25 05:01:43'),
(521, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-25 10:54:15'),
(522, 'rajesh74', 'parent', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-25 11:10:22'),
(523, 'prachi74', 'student', 4, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-25 11:11:24'),
(524, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-25 11:12:04'),
(525, 'rajesh74', 'parent', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Linux', '2021-11-25 11:12:58'),
(526, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-26 06:29:20'),
(527, 'prachi74', 'student', 4, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-26 06:30:14'),
(528, 'rajesh74', 'parent', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-26 06:31:13'),
(529, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-26 06:32:43'),
(530, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-26 10:09:57'),
(531, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-26 10:10:54'),
(532, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '47.31.237.187', 'Chrome 96.0.4664.45, Windows 10', '2021-11-27 05:19:16'),
(533, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-29 04:54:26'),
(534, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.55, Windows 10', '2021-11-29 06:10:26'),
(535, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-29 07:24:49'),
(536, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-30 05:32:55'),
(537, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-11-30 12:21:48'),
(538, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-01 07:26:17'),
(539, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-02 06:01:18'),
(540, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-02 12:34:42'),
(541, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-03 08:13:19'),
(542, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-03 10:22:06'),
(543, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-03 10:22:40'),
(544, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-03 12:11:04'),
(545, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-03 12:18:13'),
(546, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-03 15:02:03'),
(547, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 06:40:15'),
(548, 'std77', 'student', 6, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:22:28'),
(549, 'parent77', 'parent', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:23:15'),
(550, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:26:02'),
(551, 'std77', 'student', 6, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:26:22'),
(552, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:26:54'),
(553, 'std9', 'student', 5, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:30:31'),
(554, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-04 08:31:17'),
(555, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 04:49:14'),
(556, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 05:33:52'),
(557, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 06:11:08'),
(558, 'std77', 'student', 6, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 06:16:57'),
(559, 'sales.shubham@wingshieldtechnologies.com', 'Counselor', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 06:21:16'),
(560, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 06:21:53'),
(561, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 08:43:38'),
(562, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 09:26:05'),
(563, 'parent77', 'parent', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 09:31:30'),
(564, 'std77', 'student', 6, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-06 09:36:35'),
(565, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-07 08:31:18'),
(566, 'std77', 'student', 6, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-07 08:43:15'),
(567, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-07 11:11:20'),
(568, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.45, Windows 10', '2021-12-08 08:01:05'),
(569, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-08 11:56:55'),
(570, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-10 05:19:42'),
(571, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-10 11:49:03'),
(572, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-13 14:06:29'),
(573, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '102.147.78.215', 'Chrome 80.0.3987.99, Android', '2021-12-13 14:16:58'),
(574, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-13 15:54:54'),
(575, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-14 04:37:37'),
(576, 'std7', 'student', 1, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-14 05:08:42'),
(577, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-14 05:09:28'),
(578, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-14 08:09:41'),
(579, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '102.149.85.93', 'Chrome 80.0.3987.99, Android', '2021-12-14 18:46:29'),
(580, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-14 18:53:34'),
(581, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '102.149.85.93', 'Chrome 96.0.4664.93, Windows 10', '2021-12-14 21:54:07'),
(582, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-15 07:43:47'),
(583, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '102.150.110.62', 'Chrome 80.0.3987.99, Android', '2021-12-15 10:01:51'),
(584, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.93, Windows 10', '2021-12-15 12:31:35'),
(585, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.45, Windows 10', '2021-12-16 04:56:47'),
(586, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-16 09:37:44'),
(587, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-16 10:16:00'),
(588, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.192.173', 'Chrome 96.0.4664.93, Windows 10', '2021-12-16 16:02:36'),
(589, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.131.245', 'Chrome 96.0.4664.93, Windows 10', '2021-12-17 02:00:31'),
(590, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-17 04:52:13'),
(591, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.128.5', 'Chrome 96.0.4664.110, Windows 10', '2021-12-17 05:47:36'),
(592, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-17 08:29:57'),
(593, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-17 10:18:08'),
(594, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-18 08:26:18'),
(595, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-18 11:29:10'),
(596, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-20 05:25:19'),
(597, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-20 12:44:56'),
(598, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-21 10:36:53'),
(599, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-21 12:17:44'),
(600, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-22 07:16:03'),
(601, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-22 12:59:34'),
(602, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-24 09:03:29'),
(603, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.56, Windows 10', '2021-12-27 05:34:37'),
(604, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-27 06:15:36'),
(605, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-27 06:16:21'),
(606, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.56, Windows 10', '2021-12-27 08:20:56'),
(607, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-28 06:45:18'),
(608, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-28 10:43:45'),
(609, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-28 11:33:45'),
(610, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-28 12:14:55'),
(611, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.137.245', 'Chrome 96.0.4664.110, Windows 8.1', '2021-12-28 15:10:34'),
(612, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.203.53', 'Chrome 96.0.4664.110, Windows 8.1', '2021-12-29 03:09:48'),
(613, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-29 05:17:00'),
(614, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.137.245', 'Chrome 96.0.4664.110, Windows 8.1', '2021-12-29 05:31:50'),
(615, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-29 07:16:58'),
(616, 'std4', 'student', 1, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-29 08:15:35'),
(617, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-29 09:11:53'),
(618, 'Emmanuelevan90@gmail.com', 'Super Admin', NULL, '47.31.161.218', 'Chrome 96.0.4664.104, Android', '2021-12-29 17:22:59'),
(619, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-30 06:00:57'),
(620, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-30 09:16:06'),
(621, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-30 10:59:46'),
(622, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-31 05:20:48'),
(623, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-31 09:28:49'),
(624, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2021-12-31 12:24:16'),
(625, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-01 04:57:03'),
(626, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-01 07:23:26'),
(627, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-03 05:37:51'),
(628, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-03 11:27:01'),
(629, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-04 12:33:50'),
(630, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '106.198.238.139', 'Chrome 96.0.4664.110, Windows 8.1', '2022-01-04 17:53:50'),
(631, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-05 04:50:13'),
(632, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-05 10:15:14'),
(633, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-06 04:44:29'),
(634, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-06 09:31:51'),
(635, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 96.0.4664.110, Windows 10', '2022-01-06 12:17:19'),
(636, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-07 08:14:32'),
(637, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-07 11:19:00'),
(638, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.161.50.179', 'Chrome 97.0.4692.71, Windows 10', '2022-01-08 12:02:05'),
(639, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.161.50.179', 'Chrome 97.0.4692.71, Windows 7', '2022-01-08 12:18:08'),
(640, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-10 08:34:23'),
(641, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-11 05:31:32'),
(642, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-11 11:42:08'),
(643, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-13 04:41:42'),
(644, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-13 09:45:35'),
(645, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '150.129.44.159', 'Chrome 97.0.4692.71, Windows 8', '2022-01-15 09:44:09'),
(646, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '150.129.44.159', 'Chrome 97.0.4692.71, Windows 8', '2022-01-15 12:46:29'),
(647, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '184.168.121.119', 'Chrome 97.0.4692.71, Windows 10', '2022-01-18 12:39:24'),
(648, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-20 08:35:22'),
(649, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 04:39:35'),
(650, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 06:11:33'),
(651, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 06:12:25'),
(652, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 06:13:10'),
(653, 'emmanuelevan90@gmail.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 09:24:25'),
(654, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 09:27:01'),
(655, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 09:31:06'),
(656, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.71, Windows 10', '2022-01-21 10:07:14'),
(657, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-21 11:19:33'),
(658, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '184.168.121.119', 'Chrome 97.0.4692.71, Windows 8.1', '2022-01-24 05:12:14'),
(659, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-24 05:48:06'),
(660, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '193.176.84.134', 'Chrome 97.0.4692.71, Windows 10', '2022-01-24 08:01:26'),
(661, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-24 12:51:06'),
(662, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-25 05:36:12'),
(663, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-27 06:49:35'),
(664, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-29 07:58:02'),
(665, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-31 06:31:14'),
(666, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-31 10:58:17'),
(667, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-01-31 10:59:09'),
(668, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-01 06:53:39'),
(669, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-01 06:53:54'),
(670, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-01 07:59:57'),
(671, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-01 11:34:49'),
(672, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-02 06:18:49'),
(673, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-03 06:04:53'),
(674, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-03 06:30:42'),
(675, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-03 09:39:13'),
(676, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-03 12:49:25'),
(677, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-04 11:16:48'),
(678, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-04 11:17:00'),
(679, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-04 11:22:27'),
(680, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.100.4844.17, Windows 10', '2022-02-05 04:43:13'),
(681, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.87, Windows 10', '2022-02-05 04:44:28'),
(682, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-05 05:17:43'),
(683, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-05 06:00:53'),
(684, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-05 09:08:15'),
(685, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-07 07:27:19'),
(686, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 97.0.4692.99, Windows 10', '2022-02-07 08:01:12'),
(687, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-07 09:54:32'),
(688, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-08 08:09:09'),
(689, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-09 05:22:12'),
(690, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-09 11:59:02'),
(691, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-10 05:59:49'),
(692, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-10 06:02:41'),
(693, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-10 08:23:13'),
(694, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-11 06:11:03'),
(695, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-11 09:56:03'),
(696, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-11 12:36:11'),
(697, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-11 12:37:06'),
(698, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-11 12:37:27'),
(699, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-14 06:46:34'),
(700, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-14 09:41:29'),
(701, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-15 04:31:00'),
(702, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-15 04:51:32'),
(703, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.82, Windows 10', '2022-02-15 09:26:25'),
(704, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-16 09:23:23'),
(705, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.80, Windows 10', '2022-02-16 11:02:03'),
(706, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-18 06:57:15'),
(707, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-19 10:23:21'),
(708, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-19 11:31:44'),
(709, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-21 09:34:12'),
(710, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.35, Windows 10', '2022-02-22 08:13:54'),
(711, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-23 09:20:49'),
(712, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-23 09:49:27'),
(713, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-23 12:08:10'),
(714, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-24 12:32:21'),
(715, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-24 14:37:40'),
(716, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-25 04:51:15'),
(717, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-25 05:33:04'),
(718, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-25 10:47:54'),
(719, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-02-28 10:06:40'),
(720, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-01 05:55:35'),
(721, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-01 07:10:37'),
(722, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-01 07:11:44'),
(723, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-01 07:30:33'),
(724, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-01 12:11:55'),
(725, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-02 05:28:35'),
(726, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-02 05:39:33'),
(727, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-02 08:44:54'),
(728, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-02 10:49:53'),
(729, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-03 10:38:23'),
(730, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-03 12:50:16'),
(731, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 98.0.4758.102, Windows 10', '2022-03-04 06:34:17'),
(732, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Linux', '2022-03-04 06:46:00'),
(733, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-04 06:54:41'),
(734, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-04 07:20:20'),
(735, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '42.109.252.61', 'Chrome 98.0.4758.101, Android', '2022-03-04 14:42:21'),
(736, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '103.157.11.141', 'Chrome 98.0.4758.102, Windows 8', '2022-03-05 11:54:32'),
(737, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-07 04:34:24'),
(738, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-10 06:15:57'),
(739, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-10 12:04:23'),
(740, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-10 12:26:25'),
(741, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-12 06:24:39'),
(742, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-12 09:35:39'),
(743, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-12 10:40:30'),
(744, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-12 11:31:04'),
(745, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-12 11:58:24'),
(746, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-14 05:37:48'),
(747, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-14 06:57:09'),
(748, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-14 07:06:53'),
(749, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-15 08:22:38'),
(750, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-15 11:57:43'),
(751, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-15 11:57:53'),
(752, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-15 11:58:01'),
(753, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-16 05:57:53'),
(754, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.74, Windows 10', '2022-03-17 07:23:10'),
(755, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.51, Windows 10', '2022-03-17 07:24:17'),
(756, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '49.36.217.147', 'Chrome 99.0.4844.73, Android', '2022-03-21 08:00:34'),
(757, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.74, Windows 10', '2022-03-21 10:18:46'),
(758, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.161.51.159', 'Chrome 99.0.4844.74, Windows 10', '2022-03-21 10:25:04'),
(759, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.161.51.159', 'Chrome 99.0.4844.74, Windows 10', '2022-03-21 10:25:24'),
(760, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-22 05:00:03'),
(761, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.161.51.148', 'Chrome 99.0.4844.82, Windows 10', '2022-03-22 05:25:13'),
(762, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-22 06:00:08'),
(763, 'std41', 'student', 1, '122.161.53.4', 'Chrome 99.0.4844.82, Windows 10', '2022-03-22 07:48:51'),
(764, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-22 12:06:31'),
(765, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.168.22.56', 'Chrome 99.0.4844.73, Android', '2022-03-23 06:10:23'),
(766, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-24 08:12:47'),
(767, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '27.60.101.241', 'Chrome 99.0.4844.82, Windows 7', '2022-03-24 08:27:56'),
(768, 'shubhamgupta@sartiaglobal.com', 'Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-24 09:19:29'),
(769, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.74, Windows 10', '2022-03-24 09:40:35'),
(770, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-25 05:06:30'),
(771, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-25 05:13:21'),
(772, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.161.49.77', 'Chrome 99.0.4844.83, Windows 10', '2022-03-25 05:54:47'),
(773, 'std4', 'student', 1, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-25 06:13:14'),
(774, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '157.37.151.96', 'Chrome 99.0.4844.82, Windows 10', '2022-03-25 09:41:55'),
(775, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '47.31.98.151', 'Chrome 99.0.4844.83, Windows 10', '2022-03-25 09:56:38'),
(776, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '157.37.151.96', 'Chrome 99.0.4844.82, Windows 10', '2022-03-25 12:16:53'),
(777, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.161.52.27', 'Chrome 99.0.4844.82, Windows 10', '2022-03-25 12:23:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(778, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '157.37.151.96', 'Chrome 99.0.4844.82, Windows 10', '2022-03-25 12:24:15'),
(779, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-26 06:00:48'),
(780, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-26 08:57:27'),
(781, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-26 12:42:00'),
(782, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-26 12:42:33'),
(783, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '5.41.92.140', 'Chrome 99.0.4844.73, Android', '2022-03-26 13:03:34'),
(784, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '47.31.149.56', 'Chrome 99.0.4844.73, Android', '2022-03-27 06:01:26'),
(785, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-28 05:04:37'),
(786, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-28 05:05:18'),
(787, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-03-28 05:05:41'),
(788, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-28 05:09:06'),
(789, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-28 05:10:13'),
(790, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.88, Windows 10', '2022-03-28 05:14:18'),
(791, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.88, Windows 10', '2022-03-28 05:14:33'),
(792, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.83, Windows 10', '2022-03-28 07:55:18'),
(793, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.74, Windows 10', '2022-03-28 08:07:36'),
(794, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-28 10:48:11'),
(795, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-29 05:05:08'),
(796, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-29 05:11:27'),
(797, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-29 05:12:03'),
(798, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-29 05:15:04'),
(799, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-29 05:18:11'),
(800, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.82, Windows 10', '2022-03-29 08:24:20'),
(801, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-29 08:33:01'),
(802, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.88, Windows 10', '2022-03-29 11:45:15'),
(803, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-03-30 06:36:56'),
(804, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '182.69.140.33', 'Chrome 99.0.4844.84, Windows 10', '2022-03-30 10:29:18'),
(805, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-03-31 04:40:53'),
(806, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-31 04:45:57'),
(807, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.88, Windows 10', '2022-03-31 05:10:24'),
(808, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.88, Windows 10', '2022-03-31 05:40:31'),
(809, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-31 10:55:44'),
(810, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-03-31 11:01:11'),
(811, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-03-31 11:28:18'),
(812, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-01 04:55:06'),
(813, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-04-01 05:03:08'),
(814, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-01 08:49:43'),
(815, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.15, Windows 10', '2022-04-01 09:53:42'),
(816, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-01 11:36:58'),
(817, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-04-01 11:38:59'),
(818, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-01 11:49:35'),
(819, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-04-01 11:49:42'),
(820, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-01 11:56:48'),
(821, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '45.249.86.233', 'Chrome 99.0.4844.84, Windows 7', '2022-04-02 03:26:10'),
(822, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-02 05:06:13'),
(823, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-02 12:07:56'),
(824, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-02 12:08:32'),
(825, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-04 05:24:48'),
(826, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-04 13:18:09'),
(827, 'Evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.58, Android', '2022-04-05 05:17:52'),
(828, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '157.38.241.210', 'Chrome 94.0.4606.85, Android', '2022-04-05 07:03:38'),
(829, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-05 07:40:58'),
(830, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '103.121.152.191', 'Chrome 100.0.4896.60, Windows 10', '2022-04-05 12:44:54'),
(831, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '157.38.137.126', 'Chrome 100.0.4896.75, Windows 8.1', '2022-04-05 12:46:36'),
(832, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-06 06:59:15'),
(833, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.88, Android', '2022-04-06 09:38:57'),
(834, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.18, Windows 10', '2022-04-06 09:41:08'),
(835, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 99.0.4844.84, Windows 10', '2022-04-07 04:37:07'),
(836, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.60, Windows 10', '2022-04-07 05:27:35'),
(837, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-07 11:26:12'),
(838, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-07 11:27:52'),
(839, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-07 11:28:13'),
(840, 'std8', 'student', 3, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-07 11:28:27'),
(841, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 04:44:14'),
(842, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 07:24:06'),
(843, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 07:26:28'),
(844, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-08 07:55:29'),
(845, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 08:17:42'),
(846, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 09:03:34'),
(847, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 09:56:39'),
(848, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-08 10:55:57'),
(849, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 11:59:37'),
(850, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 12:41:29'),
(851, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-08 12:47:54'),
(852, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '47.31.167.17', 'Chrome 100.0.4896.75, Windows 10', '2022-04-10 04:31:20'),
(853, 'std4', 'student', 1, '47.31.167.17', 'Chrome 100.0.4896.75, Windows 10', '2022-04-10 05:07:57'),
(854, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '47.31.167.17', 'Chrome 100.0.4896.75, Windows 10', '2022-04-10 05:22:55'),
(855, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 04:50:13'),
(856, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-11 05:05:40'),
(857, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '106.204.32.117', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 05:43:32'),
(858, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-11 05:50:11'),
(859, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 07:55:35'),
(860, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 08:03:47'),
(861, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 08:12:45'),
(862, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 08:17:05'),
(863, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 08:29:05'),
(864, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 08:53:18'),
(865, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 09:17:08'),
(866, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 09:31:53'),
(867, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 09:39:32'),
(868, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 10:11:55'),
(869, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 10:57:46'),
(870, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 11:23:57'),
(871, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 11:33:14'),
(872, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 11:58:38'),
(873, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 12:31:02'),
(874, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-11 12:42:31'),
(875, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-12 10:13:53'),
(876, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.47, Windows 10', '2022-04-12 13:27:55'),
(877, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Mac OS X', '2022-04-12 13:31:20'),
(878, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 04:41:11'),
(879, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 05:26:28'),
(880, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 05:42:40'),
(881, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 05:45:23'),
(882, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 05:46:28'),
(883, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 06:01:36'),
(884, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 06:34:03'),
(885, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-13 06:58:18'),
(886, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 07:43:01'),
(887, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 08:28:07'),
(888, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 08:40:16'),
(889, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 09:12:52'),
(890, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 10:42:28'),
(891, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 11:15:42'),
(892, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 11:34:28'),
(893, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 11:50:21'),
(894, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.79, Windows 10', '2022-04-13 11:56:03'),
(895, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 12:04:43'),
(896, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 12:10:41'),
(897, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 12:19:00'),
(898, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 15:08:53'),
(899, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-13 15:23:58'),
(900, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.47, Windows 10', '2022-04-14 04:59:41'),
(901, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-14 12:06:12'),
(902, 'surajtripathi@sartiaglobal.com', 'Teacher', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-14 12:11:18'),
(903, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-14 12:30:29'),
(904, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.47, Windows 10', '2022-04-14 12:32:09'),
(905, 'std3', 'student', 1, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-14 12:32:52'),
(906, 'parent8', 'parent', NULL, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-14 12:34:58'),
(907, 'kapil82', 'student', 5, '122.160.77.106', 'Opera 85.0.4341.47, Windows 10', '2022-04-14 12:40:12'),
(908, 'kapil82', 'student', 5, '122.160.77.106', 'Chrome 100.0.4896.88, Linux', '2022-04-14 12:49:27'),
(909, 'kapil82', 'student', 5, '122.160.77.106', 'Chrome 100.0.4896.75, Windows 10', '2022-04-15 05:45:20'),
(910, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.88, Windows 10', '2022-04-15 05:45:54'),
(911, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-18 06:43:39'),
(912, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-18 06:48:13'),
(913, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-19 05:11:30'),
(914, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.60, Windows 10', '2022-04-19 05:28:59'),
(915, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-19 05:52:58'),
(916, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.34, Windows 10', '2022-04-19 11:08:36'),
(917, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-25 09:43:22'),
(918, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-27 10:09:52'),
(919, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '105.112.155.120', 'Chrome 70.0.3538.110, Android', '2022-04-27 11:38:38'),
(920, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-27 12:03:32'),
(921, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-04-27 12:07:27'),
(922, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Mac OS X', '2022-04-27 13:16:00'),
(923, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '105.112.76.43', 'Chrome 100.0.4896.127, Android', '2022-04-28 08:45:51'),
(924, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.41, Windows 10', '2022-04-29 06:50:53'),
(925, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.41, Windows 10', '2022-05-02 05:23:47'),
(926, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.41, Windows 10', '2022-05-02 05:46:54'),
(927, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.54, Windows 10', '2022-05-05 05:03:58'),
(928, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 100.0.4896.127, Windows 10', '2022-05-05 10:04:31'),
(929, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.54, Windows 10', '2022-05-07 07:06:46'),
(930, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 85.0.4341.75, Windows 10', '2022-05-13 08:42:58'),
(931, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.67, Windows 10', '2022-05-17 06:39:52'),
(932, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.67, Windows 10', '2022-05-17 06:42:31'),
(933, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.67, Windows 10', '2022-05-18 11:23:06'),
(934, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.67, Windows 10', '2022-05-18 11:35:03'),
(935, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 101.0.4951.67, Windows 10', '2022-05-20 12:37:42'),
(936, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 86.0.4363.59, Windows 10', '2022-05-21 07:48:33'),
(937, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 86.0.4363.59, Windows 10', '2022-05-23 06:37:41'),
(938, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-25 07:58:40'),
(939, 'std4', 'student', 1, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-25 08:29:54'),
(940, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Opera 86.0.4363.59, Windows 10', '2022-05-27 09:09:27'),
(941, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-27 09:50:28'),
(942, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-27 11:52:40'),
(943, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-27 11:58:54'),
(944, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '49.36.237.156', 'Chrome 101.0.4951.61, Android', '2022-05-27 17:47:01'),
(945, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-30 05:18:15'),
(946, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-30 05:18:36'),
(947, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-30 05:19:38'),
(948, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-30 06:01:54'),
(949, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-31 04:36:09'),
(950, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-31 04:39:31'),
(951, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '117.222.30.197', 'Firefox 100.0, Windows 7', '2022-05-31 06:32:33'),
(952, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-05-31 06:35:08'),
(953, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-06-01 07:29:45'),
(954, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.176.78.160', 'Chrome 102.0.0.0, Mac OS X', '2022-06-07 06:23:54'),
(955, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-06-07 06:56:07'),
(956, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-06-07 11:32:04'),
(957, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-06-09 08:28:49'),
(958, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.61, Windows 10', '2022-06-09 11:44:45'),
(959, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.63, Windows 10', '2022-06-09 13:02:18'),
(960, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-15 09:42:23'),
(961, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-16 11:36:21'),
(962, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-17 04:57:26'),
(963, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-17 05:31:47'),
(964, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.0.0, Windows 10', '2022-06-18 09:20:46'),
(965, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-18 09:30:27'),
(966, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-20 07:19:16'),
(967, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-21 07:53:59'),
(968, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-21 07:54:41'),
(969, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.5005.115, Windows 10', '2022-06-22 04:58:22'),
(970, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.53, Windows 10', '2022-06-24 11:11:51'),
(971, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 102.0.0.0, Windows 10', '2022-06-27 04:37:36'),
(972, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.53, Windows 10', '2022-06-27 06:13:48'),
(973, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.53, Windows 10', '2022-06-29 05:40:27'),
(974, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-11 07:00:56'),
(975, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-07-12 08:12:57'),
(976, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-12 08:16:38'),
(977, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-12 09:07:44'),
(978, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-12 09:34:30'),
(979, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 04:46:52'),
(980, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 09:48:01'),
(981, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 10:43:52'),
(982, 'parent42', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 10:45:02'),
(983, 'parent41', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 10:48:43'),
(984, 'std41', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 10:51:31'),
(985, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-07-16 11:08:41'),
(986, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-07-16 11:09:11'),
(987, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-07-16 11:11:20'),
(988, 'parent71_1', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 11:18:05'),
(989, 'std7', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 11:18:32'),
(990, 'parent71_1', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 11:22:15'),
(991, 'std4', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 11:48:13'),
(992, 'yadav123', 'parent', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-16 11:48:45'),
(993, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-18 05:04:30'),
(994, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-18 05:12:30'),
(995, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-19 06:36:10'),
(996, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-19 10:24:50'),
(997, 'rachit79', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-19 10:40:23'),
(998, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-20 05:01:00'),
(999, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-20 05:07:41'),
(1000, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '103.124.173.229', 'Chrome 103.0.0.0, Windows 10', '2022-07-20 05:10:42'),
(1001, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-20 05:49:33'),
(1002, 'std4', 'student', 1, '103.124.173.229', 'Chrome 103.0.0.0, Windows 10', '2022-07-20 05:50:42'),
(1003, 'std4', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-20 05:51:11'),
(1004, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-20 08:05:27'),
(1005, 'rachit79', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-20 08:07:05'),
(1006, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-21 04:46:51'),
(1007, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Windows 10', '2022-07-21 12:48:06'),
(1008, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-07-26 11:35:45'),
(1009, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-07-27 07:43:49'),
(1010, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-07-27 07:45:18'),
(1011, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-07-27 12:51:37'),
(1012, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-07-27 12:58:26'),
(1013, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-08-03 05:08:45'),
(1014, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:24:31'),
(1015, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:44:22'),
(1016, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:45:53'),
(1017, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:46:12'),
(1018, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:46:21'),
(1019, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:46:28'),
(1020, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:46:44'),
(1021, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:48:22'),
(1022, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:48:26'),
(1023, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:48:31'),
(1024, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:48:37'),
(1025, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:48:39'),
(1026, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:49:03'),
(1027, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:52:25'),
(1028, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Android', '2022-08-03 10:55:44'),
(1029, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 10:56:05'),
(1030, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.129, Android', '2022-08-03 10:59:11'),
(1031, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.129, Android', '2022-08-03 10:59:39'),
(1032, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.0.0, Windows 10', '2022-08-03 11:07:55'),
(1033, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-08-04 05:35:41'),
(1034, 'rachit79', 'student', 1, '122.160.77.106', 'Chrome 103.0.5060.134, Windows 10', '2022-08-04 05:49:57'),
(1035, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.5112.81, Windows 10', '2022-08-05 06:07:29'),
(1036, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.114, Linux', '2022-08-05 12:16:03'),
(1037, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.129, Android', '2022-08-05 12:16:53'),
(1038, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.129, Android', '2022-08-05 12:23:35'),
(1039, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 103.0.5060.129, Android', '2022-08-05 12:38:50'),
(1040, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.5112.81, Windows 10', '2022-08-08 06:29:46'),
(1041, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.161.49.124', 'Chrome 103.0.0.0, Windows 10', '2022-08-14 11:21:12'),
(1042, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.0.0, Windows 10', '2022-08-16 10:50:08'),
(1043, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.5112.102, Windows 10', '2022-09-01 08:30:31'),
(1044, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.5112.102, Windows 10', '2022-09-02 11:38:46'),
(1045, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-03 10:12:54'),
(1046, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.0.0, Windows 10', '2022-09-03 10:49:00'),
(1047, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.0.0, Windows 10', '2022-09-06 07:05:02'),
(1048, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.0.0, Windows 10', '2022-09-06 09:46:07'),
(1049, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-07 07:04:10'),
(1050, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 104.0.0.0, Windows 10', '2022-09-07 10:03:21'),
(1051, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-08 12:10:24'),
(1052, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '103.196.54.119', 'Chrome 104.0.0.0, Mac OS X', '2022-09-08 12:15:42'),
(1053, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-13 05:30:36'),
(1054, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 04:57:36'),
(1055, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 05:13:11'),
(1056, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 05:22:35'),
(1057, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 05:25:16'),
(1058, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 05:38:41'),
(1059, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 08:11:18'),
(1060, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 08:12:25'),
(1061, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:10:39'),
(1062, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:35:32'),
(1063, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:36:11'),
(1064, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:36:42'),
(1065, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:37:50'),
(1066, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:39:21'),
(1067, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:40:07'),
(1068, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:40:20'),
(1069, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:41:45'),
(1070, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:41:57'),
(1071, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:42:24'),
(1072, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:44:35'),
(1073, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:44:56'),
(1074, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 09:54:46'),
(1075, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 10:45:03'),
(1076, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 10:45:27'),
(1077, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '122.160.77.106', 'Chrome 105.0.0.0, Windows 10', '2022-09-14 11:08:49'),
(1078, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '::1', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 09:40:56'),
(1079, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 10:25:27'),
(1080, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.20', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 10:29:08'),
(1081, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 10:37:55'),
(1082, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.12', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 12:46:04'),
(1083, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 05:11:18'),
(1084, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.21', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 05:17:13'),
(1085, 'tea@gmail.com', 'Teacher', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 06:30:39'),
(1086, 'tea@gmail.com', 'Teacher', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 06:31:50'),
(1087, 'tea@gmail.com', 'Teacher', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 06:32:46'),
(1088, 'tea@gmail.com', 'Teacher', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 06:44:32'),
(1089, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 04:40:49'),
(1090, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 04:48:24'),
(1091, 'b2admin@gmail.com', 'Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 05:11:51'),
(1092, 'evanemmanuel@sartiaglobal.com', '', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:04:27'),
(1093, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:05:45'),
(1094, 'evanemmanuel@sartiaglobal.com', '', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:06:06'),
(1095, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:16:44'),
(1096, 'evanemmanuel@sartiaglobal.com', '', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:16:54'),
(1097, 'evanemmanuel@sartiaglobal.com', 'Teacher', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:34:01'),
(1098, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:43:18'),
(1099, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:46:35'),
(1100, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:48:09'),
(1101, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 07:53:08'),
(1102, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 08:04:15'),
(1103, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 08:13:54'),
(1104, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.12', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 08:35:41'),
(1105, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.11', 'Chrome 105.0.0.0, Windows 10', '2022-09-17 10:26:04'),
(1106, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 04:41:40'),
(1107, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 05:22:32'),
(1108, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '::1', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 05:24:18'),
(1109, 'b1admin@gmail.com', 'Admin', NULL, '::1', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 05:24:57'),
(1110, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 07:23:45'),
(1111, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 07:26:13'),
(1112, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 08:29:22'),
(1113, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 08:35:11'),
(1114, 'b2admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 08:36:01'),
(1115, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 10:18:27'),
(1116, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 10:23:25'),
(1117, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 10:26:58'),
(1118, 'b2admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 10:28:13'),
(1119, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-19 12:34:58'),
(1120, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 04:50:54'),
(1121, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 04:58:00'),
(1122, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 06:22:30'),
(1123, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 06:22:44'),
(1124, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 10:29:18'),
(1125, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 10:29:38'),
(1126, 'b2admin@gmail.com', 'Admin', NULL, '192.168.0.15', 'Chrome 105.0.0.0, Windows 10', '2022-09-20 11:54:07'),
(1127, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 04:36:18'),
(1128, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 04:41:36'),
(1129, 'b1teacher2@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 05:52:48'),
(1130, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 05:53:23'),
(1131, 'b1teacher2@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 06:38:16'),
(1132, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 06:47:17'),
(1133, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 06:47:44'),
(1134, 'b1teacher2@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 06:49:02'),
(1135, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 08:23:50'),
(1136, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-21 09:54:24'),
(1137, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 04:44:41'),
(1138, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 04:45:15'),
(1139, 'b1teacher2@gmail.com', 'Teacher', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 05:16:15'),
(1140, 'govind chaudhary1', 'student', 1, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 06:13:07'),
(1141, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.24', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 06:21:35'),
(1142, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.25', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 06:44:34'),
(1143, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 06:59:23'),
(1144, 'b2admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 07:00:16'),
(1145, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-22 08:36:37'),
(1146, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-23 08:20:05'),
(1147, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-23 08:25:55'),
(1148, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-23 09:29:01'),
(1149, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-23 09:38:49'),
(1150, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.19', 'Chrome 105.0.0.0, Windows 10', '2022-09-23 09:40:21'),
(1151, 'evanemmanuel@sartiaglobal.com', '', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 09:55:10'),
(1152, 'evanemmanuel@sartiaglobal.com', '', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 09:58:49'),
(1153, 'evanemmanuel@sartiaglobal.com', '', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 10:00:39'),
(1154, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 10:01:04'),
(1155, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 10:12:08'),
(1156, 'b2admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 10:44:41'),
(1157, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 10:49:41'),
(1158, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 11:34:23'),
(1159, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 11:34:52'),
(1160, 'b1teacher@gmail.com', 'Teacher', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 11:39:49'),
(1161, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.9', 'Chrome 105.0.0.0, Windows 10', '2022-09-28 11:46:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(1162, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.14', 'Chrome 105.0.0.0, Windows 10', '2022-09-29 04:28:56'),
(1163, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.14', 'Chrome 105.0.0.0, Windows 10', '2022-09-29 04:54:07'),
(1164, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-29 05:07:18'),
(1165, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.14', 'Chrome 105.0.0.0, Windows 10', '2022-09-29 09:53:28'),
(1166, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.14', 'Chrome 105.0.0.0, Windows 10', '2022-09-29 09:55:09'),
(1167, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.13', 'Chrome 105.0.0.0, Windows 10', '2022-09-29 11:56:59'),
(1168, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.6', 'Chrome 106.0.0.0, Windows 10', '2022-09-30 04:32:53'),
(1169, 'b1admin@gmail.com', 'Admin', NULL, '192.168.0.6', 'Chrome 106.0.0.0, Windows 10', '2022-09-30 04:41:40'),
(1170, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.0.6', 'Chrome 106.0.0.0, Windows 10', '2022-09-30 12:32:59'),
(1171, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.68.114', 'Chrome 105.0.0.0, Windows 10', '2022-10-06 05:17:28'),
(1172, 'evanemmanuel@sartiaglobal.com', 'Super Admin', NULL, '192.168.68.114', 'Chrome 105.0.0.0, Windows 10', '2022-10-07 05:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'sidhi1', '123456', '', 'student', '', 0, 'yes', '2022-09-28 11:54:54', NULL),
(2, 1, 'ramkaran1', NULL, '1', 'parent', '', 0, 'yes', '2022-09-28 11:54:54', NULL),
(3, 2, 'hanshika2', '123456', '', 'student', '', 0, 'yes', '2022-09-28 11:54:57', NULL),
(4, 2, 'kapil2', NULL, '2', 'parent', '', 0, 'yes', '2022-09-28 11:54:57', NULL),
(5, 3, 'ramesh3', '123456', '', 'student', '', 0, 'yes', '2022-09-30 06:50:44', NULL),
(6, 3, 'ramkaran3', NULL, '3', 'parent', '', 0, 'yes', '2022-09-30 06:50:44', NULL),
(7, 4, 'suresh4', '123456', '', 'student', '', 0, 'yes', '2022-09-30 06:50:46', NULL),
(8, 4, 'kapil4', NULL, '4', 'parent', '', 0, 'yes', '2022-09-30 06:50:46', NULL),
(9, 5, 'mohit5', '123456', '', 'student', '', 0, 'yes', '2022-10-06 06:20:04', NULL),
(10, 0, 'ms5', '123456', '5', 'parent', '', 0, 'yes', '2022-10-06 06:20:04', NULL),
(11, 6, 'edward6', '123456', '', 'student', '', 0, 'yes', '2022-10-07 06:59:58', NULL),
(12, 6, 'olivier thomas6', NULL, '6', 'parent', '', 0, 'yes', '2022-10-07 06:59:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `branch_id`, `vehicle_no`, `vehicle_model`, `manufacture_year`, `driver_name`, `driver_licence`, `driver_contact`, `note`, `created_at`) VALUES
(1, NULL, 'DL 1C 2045', 'Tata Omni', '2018', 'Rohit Sharma', 'DL113ASDF14D', '9994448575', '', '2021-07-01 07:54:19'),
(2, NULL, 'dl2c2058', 'tata', '2019', 'mohit', 'dl....', '999', '', '2022-04-11 05:59:58'),
(3, NULL, 'HR36AR2626', 'TATA', '2017', 'AALOK', '..', '', '', '2022-04-11 06:23:24'),
(4, 1, 'DL-11-SS-1111', '', NULL, '', '', '', '', '2022-09-29 10:24:52'),
(5, 2, 'DL-22-SS-2222', '', NULL, '', '', '', '', '2022-09-29 10:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_routes`
--

CREATE TABLE `vehicle_routes` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle_routes`
--

INSERT INTO `vehicle_routes` (`id`, `route_id`, `vehicle_id`, `created_at`) VALUES
(1, 9, 4, '2022-09-29 10:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `visitors_book`
--

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_purpose`
--

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors_purpose`
--

INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`) VALUES
(1, 'Student Visit', ''),
(2, 'Parent Techer Meeting', 'School Organized Parent Teacher Meeting'),
(3, 'annual funcation', ''),
(4, 'Placement', ''),
(5, 'Interview', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aadhar_card`
--
ALTER TABLE `aadhar_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `attendence_type`
--
ALTER TABLE `attendence_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `caste`
--
ALTER TABLE `caste`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_connections`
--
ALTER TABLE `chat_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_user_one` (`chat_user_one`),
  ADD KEY `chat_user_two` (`chat_user_two`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_user_id` (`chat_user_id`),
  ADD KEY `chat_connection_id` (`chat_connection_id`);

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `create_staff_id` (`create_staff_id`),
  ADD KEY `create_student_id` (`create_student_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_for`
--
ALTER TABLE `content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_groups`
--
ALTER TABLE `exam_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`);

--
-- Indexes for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_id` (`exam_group_class_batch_exam_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`);

--
-- Indexes for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_subject_id` (`exam_group_class_batch_exam_subject_id`),
  ADD KEY `exam_group_student_id` (`exam_group_student_id`),
  ADD KEY `exam_group_class_batch_exam_student_id` (`exam_group_class_batch_exam_student_id`);

--
-- Indexes for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_schedule_id` (`exam_schedule_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_subject_id` (`teacher_subject_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_head`
--
ALTER TABLE `expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feecategory`
--
ALTER TABLE `feecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feemasters`
--
ALTER TABLE `feemasters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feetype`
--
ALTER TABLE `feetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `feetype_id` (`feetype_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `filetypes`
--
ALTER TABLE `filetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finetype`
--
ALTER TABLE `finetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_calls`
--
ALTER TABLE `general_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `id_card`
--
ALTER TABLE `id_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_head`
--
ALTER TABLE `income_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `item_store`
--
ALTER TABLE `item_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `subject_group_class_sections_id` (`subject_group_class_sections_id`);

--
-- Indexes for table `libarary_members`
--
ALTER TABLE `libarary_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_class_students`
--
ALTER TABLE `multi_class_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_notification_id` (`send_notification_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onlineexam`
--
ALTER TABLE `onlineexam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_student_id` (`onlineexam_student_id`);

--
-- Indexes for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_student_id` (`onlineexam_student_id`),
  ADD KEY `onlineexam_question_id` (`onlineexam_question_id`);

--
-- Indexes for table `online_admissions`
--
ALTER TABLE `online_admissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`);

--
-- Indexes for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_student`
--
ALTER TABLE `permission_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_headerfooter`
--
ALTER TABLE `print_headerfooter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_houses`
--
ALTER TABLE `school_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_settings`
--
ALTER TABLE `sch_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_attendance_staff` (`staff_id`),
  ADD KEY `FK_staff_attendance_staff_attendance_type` (`staff_attendance_type_id`);

--
-- Indexes for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_id_card`
--
ALTER TABLE `staff_id_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_leave_details_staff` (`staff_id`),
  ADD KEY `FK_staff_leave_details_leave_types` (`leave_type_id`);

--
-- Indexes for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_leave_request_staff` (`staff_id`),
  ADD KEY `FK_staff_leave_request_leave_types` (`leave_type_id`);

--
-- Indexes for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_payslip_staff` (`staff_id`);

--
-- Indexes for table `staff_rating`
--
ALTER TABLE `staff_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_rating_staff` (`staff_id`);

--
-- Indexes for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_timeline_staff` (`staff_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendences`
--
ALTER TABLE `student_attendences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`);

--
-- Indexes for table `student_doc`
--
ALTER TABLE `student_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_edit_fields`
--
ALTER TABLE `student_edit_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`);

--
-- Indexes for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fees_discount_id` (`fees_discount_id`);

--
-- Indexes for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`);

--
-- Indexes for table `student_fees_refund`
--
ALTER TABLE `student_fees_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`);

--
-- Indexes for table `student_session`
--
ALTER TABLE `student_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `student_sibling`
--
ALTER TABLE `student_sibling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `subject_timetable_id` (`subject_timetable_id`);

--
-- Indexes for table `student_timeline`
--
ALTER TABLE `student_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_groups`
--
ALTER TABLE `subject_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `created_for` (`created_for`);

--
-- Indexes for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_branch`
--
ALTER TABLE `tb_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pagecontain`
--
ALTER TABLE `tb_pagecontain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `template_admitcards`
--
ALTER TABLE `template_admitcards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_marksheets`
--
ALTER TABLE `template_marksheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_authentication`
--
ALTER TABLE `users_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_book`
--
ALTER TABLE `visitors_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aadhar_card`
--
ALTER TABLE `aadhar_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_events`
--
ALTER TABLE `alumni_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alumni_students`
--
ALTER TABLE `alumni_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendence_type`
--
ALTER TABLE `attendence_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `caste`
--
ALTER TABLE `caste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_connections`
--
ALTER TABLE `chat_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `class_teacher`
--
ALTER TABLE `class_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `content_for`
--
ALTER TABLE `content_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `disable_reason`
--
ALTER TABLE `disable_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_groups`
--
ALTER TABLE `exam_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feecategory`
--
ALTER TABLE `feecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feemasters`
--
ALTER TABLE `feemasters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feetype`
--
ALTER TABLE `feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `filetypes`
--
ALTER TABLE `filetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `finetype`
--
ALTER TABLE `finetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_calls`
--
ALTER TABLE `general_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `id_card`
--
ALTER TABLE `id_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `libarary_members`
--
ALTER TABLE `libarary_members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `multi_class_students`
--
ALTER TABLE `multi_class_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_roles`
--
ALTER TABLE `notification_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `onlineexam`
--
ALTER TABLE `onlineexam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admissions`
--
ALTER TABLE `online_admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `permission_student`
--
ALTER TABLE `permission_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `print_headerfooter`
--
ALTER TABLE `print_headerfooter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `religion`
--
ALTER TABLE `religion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `school_houses`
--
ALTER TABLE `school_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff_id_card`
--
ALTER TABLE `staff_id_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_rating`
--
ALTER TABLE `staff_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_attendences`
--
ALTER TABLE `student_attendences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_doc`
--
ALTER TABLE `student_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_edit_fields`
--
ALTER TABLE `student_edit_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_fees_refund`
--
ALTER TABLE `student_fees_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `student_session`
--
ALTER TABLE `student_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_sibling`
--
ALTER TABLE `student_sibling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_timeline`
--
ALTER TABLE `student_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `subject_groups`
--
ALTER TABLE `subject_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_branch`
--
ALTER TABLE `tb_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pagecontain`
--
ALTER TABLE `tb_pagecontain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_admitcards`
--
ALTER TABLE `template_admitcards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `template_marksheets`
--
ALTER TABLE `template_marksheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1173;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visitors_book`
--
ALTER TABLE `visitors_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD CONSTRAINT `alumni_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_connections`
--
ALTER TABLE `chat_connections`
  ADD CONSTRAINT `chat_connections_ibfk_1` FOREIGN KEY (`chat_user_one`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_connections_ibfk_2` FOREIGN KEY (`chat_user_two`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_user_id`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`chat_connection_id`) REFERENCES `chat_connections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_for`
--
ALTER TABLE `content_for`
  ADD CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
