-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2019 at 04:15 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor-appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `doc_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `attended` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(10) UNSIGNED NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `doc_id`, `user_id`, `attended`, `name`, `mobile`, `email`, `gender`, `age`, `address`, `city`, `state`, `country`, `created_at`, `updated_at`) VALUES
(8, 4, 33, '0', 'Kumar vishwas', '8286857370', 'hbwebsol3@gmail.com', 'Male', 45, '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-29', '2019-01-05 07:47:14'),
(9, 15, 33, '0', 'nitish kumar', '7869467216', 'hbwebsol3@gmail.com', 'male', 45, '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-29', '2019-01-05 07:47:10'),
(10, 8, 33, '1', 'reneg joseph', '7869467216', 'hbwebsol3@gmail.com', 'Burhan Sarangpurwala', 45, '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-30', '2019-01-05 07:49:03'),
(11, 11, 33, '0', 'sanjay Raot', '7869467216', 'hbwebsol3@gmail.com', 'male', 45, '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-30', '2019-01-05 06:13:44'),
(12, 15, 33, '0', 'champak lal', '8286857370', 'hbwebsol3@gmail.com', 'male', 45, '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-31', '2019-01-05 07:38:50'),
(13, 16, 33, '0', 'Jethalal', '7869467216', 'hbwebsol3@gmail.com', 'male', 56, '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-31', '2019-01-05 07:46:03'),
(14, 17, 33, '0', 'Bal Thankery', '7869413533', 'bal@beta.com', 'Transgender', 56, '1601 Biscayne Blvd', 'Miami', 'Florida', 'India', '2019-01-03', '2019-01-05 05:59:19'),
(15, 16, 33, '0', 'Raj Thakery', '7869467216', 'hbwebsol3@gmail.com', 'Male', 45, '1601 Biscayne Blvd', 'Miami', 'Florida', 'India', '2019-01-04', '2019-01-05 07:47:08'),
(16, 8, 33, '1', 'Dimpi Pandit', '7869467216', 'hbwebsol3@gmail.com', 'Male', 22, '1601 Biscayne Blvd', 'Miami', 'Florida', 'India', '2019-01-05', '2019-01-05 08:28:03'),
(17, 15, 33, '0', 'Jana', '7869467216', 'hbwebsol3@gmail.com', 'Male', 34, '1601 Biscayne Blvd', 'Miami', 'Florida', 'India', '2019-01-05', '2019-01-05 07:39:34'),
(18, 15, 33, '0', 'Manoj tiwari', '7869467216', 'hbwebsol3@gmail.com', 'Male', 34, '30 Largo Lane', 'Hendersonville', 'North Carolina', 'India', '2019-01-05', '2019-01-05 07:47:19'),
(19, 15, 33, '0', 'Mahedra chacha', '7869467216', 'hbwebsol3@gmail.com', 'Male', 34, '1601 Biscayne Blvd', 'Miami', 'Florida', 'India', '2019-01-13', '2019-01-13 04:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`id`, `user_id`, `name`, `address`, `city`, `state`, `country`, `created_at`, `updated_at`) VALUES
(4, 19, 'CH', '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'India', '2018-12-26 10:59:11', '2018-12-26 10:59:11'),
(10, 33, 'CHL-Apolo', '30 Largo Lane singer', 'Hendersonville singer', 'North Carolina singer', 'India', '2018-12-27 05:34:21', '2018-12-28 23:15:22'),
(12, 35, 'Kwality drug house', 'dawa bazar', 'indore', 'mp', 'India', '2018-12-28 11:08:11', '2018-12-28 11:08:11'),
(13, 36, 'Unique Hospital', '1601 Biscayne Blvd', 'Miami', 'FLORIDA', 'Pak', '2018-12-28 23:00:41', '2018-12-28 23:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `doc_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mob` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialist_in` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `doc_name`, `mob`, `email`, `specialist_in`, `created_at`, `updated_at`) VALUES
(4, 33, 'Sanjay Sinha', '7869467217', 'hbwebsol113@gmail.com', 'Diabetic doc', '2018-12-27 09:27:08', '2018-12-29 00:06:05'),
(8, 33, 'Albert', '9891234567', 'hbwebsol3@gmail.com', 'Diabetic', '2018-12-27 09:27:08', '2019-01-04 06:16:51'),
(11, 33, 'sanjay rawot', '9713135257', 'test@test.com', 'Neurologist', '2018-12-28 06:07:11', '2018-12-28 06:07:11'),
(15, 33, 'Ashwini daas', '92119211420', 'test@test.com', 'Skin', '2018-12-28 11:08:54', '2018-12-28 11:08:54'),
(16, 33, 'Sanjay Kucheria', '9713135257', 'test@test.com', 'Md', '2018-12-28 11:33:59', '2018-12-28 11:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_12_24_053320_create_clinics_table', 2),
(4, '2018_12_24_054627_create_doctors_table', 2),
(5, '2018_12_24_062355_create_appointments_table', 3),
(6, '2018_12_24_062849_create_tokens_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `appointment_id`, `token`, `created_at`, `updated_at`) VALUES
(5, 8, '06-D4-C33-29th December 2018 06:22:41 AM', '2018-12-29 00:52:41', '2018-12-29 00:52:41'),
(6, 9, '01-D15-C33-30th December 2018 01:01:41 PM', '2018-12-30 07:31:41', '2018-12-30 07:31:41'),
(7, 10, '02-D8-C33-30th December 2018 01:21:06 PM', '2018-12-30 07:51:06', '2018-12-30 07:51:06'),
(8, 11, '03-D11-C33-30th December 2018 01:35:27 PM', '2018-12-30 08:05:27', '2018-12-30 08:05:27'),
(9, 12, '04-D15-C33-30th December 2018 01:38:28 PM', '2018-12-30 08:08:28', '2018-12-30 08:08:28'),
(10, 13, '05-D16-C33-30th December 2018 01:39:38 PM', '2018-12-30 08:09:38', '2018-12-30 08:09:38'),
(12, 14, '01-D17-C33-5th January 2019 06:39:35 AM', '2019-01-05 01:09:35', '2019-01-05 01:09:35'),
(13, 15, '02-D16-C33-5th January 2019 06:40:37 AM', '2019-01-05 01:10:37', '2019-01-05 01:10:37'),
(14, 16, '03-D8-C33-5th January 2019 06:41:26 AM', '2019-01-05 01:11:26', '2019-01-05 01:11:26'),
(15, 17, '04-D15-C33-5th January 2019 06:42:16 AM', '2019-01-05 01:12:16', '2019-01-05 01:12:16'),
(16, 18, '03-D15-C33-5th January 2019 01:08:21 PM', '2019-01-05 07:38:21', '2019-01-05 07:38:21'),
(17, 19, '01-D15-C33-13th January 2019 09:42:42 AM', '2019-01-13 04:12:42', '2019-01-13 04:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `status` enum('active','blocked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `is_admin`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Burhanuddin Sarangpurwala', 'admin', '123456', 'burhanuddinsarangpurwala@gmail.com', 1, 'active', NULL, NULL, NULL, NULL),
(19, 'albert', 'ch-admin', '654321', 'hbwebsol3@gmail.com', 0, 'active', NULL, NULL, '2018-12-26 10:59:11', '2019-01-04 06:21:19'),
(33, 'Shirly Setia', 'CHL-admin', '123456', 'hbwebsol10singer@gmail.com', 0, 'active', NULL, NULL, '2018-12-27 05:34:21', '2018-12-28 23:15:22'),
(35, 'mdhur verma', 'kwality-admin', '123456', 'test@test.com', 0, 'active', NULL, NULL, '2018-12-28 11:08:11', '2018-12-28 11:08:11'),
(36, 'Vicky Koshal', 'Unique-admin', '9826', 'hbwebsol55@gmail.com', 0, 'active', NULL, NULL, '2018-12-28 23:00:41', '2018-12-28 23:00:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
