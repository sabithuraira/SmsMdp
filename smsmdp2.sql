-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 24, 2017 at 08:05 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smsmdp`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensis`
--

CREATE TABLE `absensis` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `pertemuan_ke` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2017-05-25 19:40:45', '2017-05-25 19:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `daemons`
--

CREATE TABLE `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dosens`
--

CREATE TABLE `dosens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `place_birth` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosens`
--

INSERT INTO `dosens` (`id`, `name`, `nim`, `date_birth`, `place_birth`, `created_at`, `updated_at`) VALUES
(1, 'Fithri Selva Jumeilah', '23948239899', '1990-05-04', 'Baturaja', '2017-07-21 02:49:15', '2017-07-21 02:52:33'),
(2, 'Fransiska', '123982938198', '1989-01-01', 'Palembang', '2017-08-20 17:14:33', '2017-08-20 17:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

CREATE TABLE `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `grade_value` decimal(64,12) DEFAULT NULL,
  `min_value` decimal(64,12) DEFAULT NULL,
  `max_value` decimal(64,12) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `grade`, `grade_value`, `min_value`, `max_value`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'A', '4.000000000000', '80.000000000000', '100.000000000000', NULL, NULL, '2017-08-22 09:28:12', '2017-08-22 09:28:12'),
(2, 'A-', '3.700000000000', '76.000000000000', '79.000000000000', NULL, NULL, '2017-08-22 09:39:18', '2017-08-22 13:21:52'),
(3, 'B+', '3.300000000000', '72.000000000000', '75.000000000000', NULL, NULL, '2017-08-22 09:40:06', '2017-08-22 13:21:58'),
(4, 'B', '3.000000000000', '68.000000000000', '71.000000000000', NULL, NULL, '2017-08-22 09:40:21', '2017-08-22 09:40:21'),
(5, 'B-', '2.700000000000', '64.000000000000', '67.000000000000', NULL, NULL, '2017-08-22 09:40:53', '2017-08-22 13:22:09'),
(6, 'C+', '2.300000000000', '60.000000000000', '63.000000000000', NULL, NULL, '2017-08-22 09:41:21', '2017-08-22 13:22:15'),
(7, 'C', '2.000000000000', '56.000000000000', '59.000000000000', NULL, NULL, '2017-08-22 09:41:45', '2017-08-22 09:41:45'),
(8, 'D', '1.000000000000', '45.000000000000', '55.000000000000', NULL, NULL, '2017-08-22 09:42:01', '2017-08-22 09:42:01'),
(10, 'E', '0.000000000000', '0.000000000000', '44.000000000000', NULL, NULL, '2017-08-22 09:43:01', '2017-08-22 09:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `inbox`
--
DELIMITER $$
CREATE TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox` FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `mata_pelajaran_id` int(11) NOT NULL,
  `tahun_ajaran` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `dosen_id`, `mata_pelajaran_id`, `tahun_ajaran`, `nama`, `created_by`, `updated_by`, `created_at`, `updated_at`, `sks`) VALUES
(1, 1, 1, '2016/2017', 'Algoritma dan Pemgrograman 1', 3, 3, '2017-07-21 03:15:23', '2017-07-21 03:15:23', 2),
(2, 2, 8, '2016/2017', 'Daspro Pagi 1', 4, 4, '2017-08-20 17:15:01', '2017-08-20 17:15:01', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_penilaians`
--

CREATE TABLE `kelas_penilaians` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_penilaians`
--

INSERT INTO `kelas_penilaians` (`id`, `kelas_id`, `tanggal`, `keterangan`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-10-30', 'Tugas membuat program', 4, 4, '2017-08-19 10:32:35', '2017-08-19 10:32:35'),
(2, 1, '2017-08-08', 'quiz', 4, 4, '2017-08-21 04:30:50', '2017-08-21 04:30:50'),
(3, 1, '2017-09-06', 'sdf', 4, 4, '2017-08-21 04:31:17', '2017-08-21 04:31:17'),
(4, 1, '2017-09-08', 'esasd', 4, 4, '2017-08-21 04:31:57', '2017-08-21 04:31:57'),
(5, 1, '2017-09-09', 'sdf', 4, 4, '2017-08-21 04:33:06', '2017-08-21 04:33:06'),
(6, 1, '2017-09-07', 'asdf', 4, 4, '2017-08-21 04:35:24', '2017-08-21 04:35:24'),
(7, 1, '2017-09-07', 'af', 4, 4, '2017-08-21 04:41:36', '2017-08-21 04:41:36'),
(8, 1, '2017-09-07', 'af', 4, 4, '2017-08-21 04:41:47', '2017-08-21 04:41:47'),
(9, 1, '2017-09-07', 'sdf', 4, 4, '2017-08-21 04:43:55', '2017-08-21 04:43:55'),
(10, 1, '2017-09-09', 'sdf', 4, 4, '2017-08-21 05:06:38', '2017-08-21 05:06:38'),
(11, 1, '2017-09-09', 'asdf', 4, 4, '2017-08-24 14:39:20', '2017-08-24 14:39:20'),
(12, 1, '2017-09-06', 'dsfd', 4, 4, '2017-08-24 14:39:55', '2017-08-24 14:39:55'),
(13, 1, '2017-09-06', 'sdf', 4, 4, '2017-08-24 14:40:49', '2017-08-24 14:40:49'),
(14, 2, '2017-09-15', 'tugas', 4, 4, '2017-09-17 03:33:03', '2017-09-17 03:33:03'),
(15, 2, '2017-09-29', 'uts', 4, 4, '2017-09-17 03:33:20', '2017-09-17 03:33:20'),
(16, 2, '2017-10-06', 'quiz', 4, 4, '2017-09-17 03:33:37', '2017-09-17 03:33:37'),
(17, 2, '2017-10-07', 'uas', 4, 4, '2017-09-17 03:34:09', '2017-09-17 03:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_pertemuans`
--

CREATE TABLE `kelas_pertemuans` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `materi` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `is_before_uts` int(11) DEFAULT NULL,
  `is_before_uas` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pertemuan_ke` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_pertemuans`
--

INSERT INTO `kelas_pertemuans` (`id`, `kelas_id`, `tanggal`, `materi`, `keterangan`, `is_before_uts`, `is_before_uas`, `created_by`, `updated_by`, `created_at`, `updated_at`, `pertemuan_ke`) VALUES
(1, 1, '2017-08-15', 'Pengatar Algoritma dan Pemrograman', 'Perkenalan', NULL, 0, 4, 4, '2017-08-18 17:52:08', '2017-08-18 17:52:08', 1),
(2, 1, '2017-08-29', 'Tipe data', 'Memahami jenis-jenis tipe data pada bahasa C++', NULL, 1, 4, 4, '2017-08-18 17:53:39', '2017-08-18 17:53:39', 2),
(3, 2, '2017-09-01', 'pertemuan1', 'pertemuan1', NULL, 0, 4, 4, '2017-09-17 03:27:53', '2017-09-17 03:27:53', 1),
(4, 2, '2017-09-08', 'pertemuan2', 'pertemuan2', NULL, 0, 4, 4, '2017-09-17 03:28:16', '2017-09-17 03:28:16', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `place_birth` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `name`, `nim`, `date_birth`, `place_birth`, `created_at`, `updated_at`, `parent_phone`) VALUES
(1, 'Abidzar Ghifari', '201512345', NULL, '', '2017-05-27 15:09:40', '2017-06-08 02:34:09', '+6281373028055'),
(2, 'Zea Shakira Sabit', '20161000002', '2016-09-25', 'Palembang', '2017-05-27 15:29:20', '2017-06-07 13:47:22', '+628999826256'),
(3, 'Abdul', '20168990', '2012-08-08', 'kjkj', '2017-06-03 03:47:26', '2017-06-08 02:33:52', '+628131234567');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_kelas`
--

CREATE TABLE `mahasiswa_kelas` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `abs1` int(11) DEFAULT NULL,
  `abs2` int(11) DEFAULT NULL,
  `abs3` int(11) DEFAULT NULL,
  `abs4` int(11) DEFAULT NULL,
  `abs5` int(11) DEFAULT NULL,
  `abs6` int(11) DEFAULT NULL,
  `abs7` int(11) DEFAULT NULL,
  `abs8` int(11) DEFAULT NULL,
  `abs9` int(11) DEFAULT NULL,
  `abs10` int(11) DEFAULT NULL,
  `abs11` int(11) DEFAULT NULL,
  `abs12` int(11) DEFAULT NULL,
  `abs13` int(11) DEFAULT NULL,
  `abs14` int(11) DEFAULT NULL,
  `abs15` int(11) DEFAULT NULL,
  `abs16` int(11) DEFAULT NULL,
  `abs17` int(11) DEFAULT NULL,
  `abs18` int(11) DEFAULT NULL,
  `abs19` int(11) DEFAULT NULL,
  `abs20` int(11) DEFAULT NULL,
  `abs21` int(11) DEFAULT NULL,
  `abs22` int(11) DEFAULT NULL,
  `abs23` int(11) DEFAULT NULL,
  `abs24` int(11) DEFAULT NULL,
  `abs25` int(11) DEFAULT NULL,
  `abs26` int(11) DEFAULT NULL,
  `abs27` int(11) DEFAULT NULL,
  `abs28` int(11) DEFAULT NULL,
  `quiz` decimal(64,12) DEFAULT NULL,
  `uts` decimal(64,12) DEFAULT NULL,
  `uas` decimal(64,12) DEFAULT NULL,
  `tugas` decimal(64,12) DEFAULT NULL,
  `total_nilai` decimal(64,12) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa_kelas`
--

INSERT INTO `mahasiswa_kelas` (`id`, `mahasiswa_id`, `kelas_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `abs1`, `abs2`, `abs3`, `abs4`, `abs5`, `abs6`, `abs7`, `abs8`, `abs9`, `abs10`, `abs11`, `abs12`, `abs13`, `abs14`, `abs15`, `abs16`, `abs17`, `abs18`, `abs19`, `abs20`, `abs21`, `abs22`, `abs23`, `abs24`, `abs25`, `abs26`, `abs27`, `abs28`, `quiz`, `uts`, `uas`, `tugas`, `total_nilai`, `grade`) VALUES
(5, 3, 1, 4, 4, '2017-08-06 16:41:44', '2017-08-24 14:40:49', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '70.000000000000', '70.000000000000', '70.000000000000', '80.000000000000', '71.000000000000', 'B'),
(6, 2, 1, 4, 4, '2017-08-07 13:04:59', '2017-08-21 04:35:24', 1, 2, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100.000000000000', '100.000000000000', '100.000000000000', '90.000000000000', '99.000000000000', 'A'),
(7, 2, 2, 4, 4, '2017-08-20 17:16:58', '2017-09-17 03:34:09', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100.000000000000', '100.000000000000', '100.000000000000', '100.000000000000', '100.000000000000', 'A'),
(8, 3, 2, 4, 4, '2017-09-17 03:22:27', '2017-09-17 03:34:09', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '81.000000000000', '80.000000000000', '90.000000000000', '90.000000000000', '85.200000000000', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajarans`
--

CREATE TABLE `mata_pelajarans` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajarans`
--

INSERT INTO `mata_pelajarans` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Algoritma dan Pemgrograman', '2017-05-25 20:54:00', '2017-05-25 20:54:00'),
(7, 'Pengantar Teknologi Informasi', '2017-05-27 02:44:09', '2017-05-27 02:44:09'),
(8, 'Dasar Pemrograman', '2017-05-27 02:44:16', '2017-05-27 02:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `nilais`
--

CREATE TABLE `nilais` (
  `id` int(11) NOT NULL,
  `dosen` int(11) DEFAULT NULL,
  `mp` int(11) DEFAULT NULL,
  `mahasiswa` varchar(255) DEFAULT NULL,
  `tahun_ajaran` varchar(255) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `nilai` decimal(64,12) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilais`
--

INSERT INTO `nilais` (`id`, `dosen`, `mp`, `mahasiswa`, `tahun_ajaran`, `semester`, `nilai`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, '1', '2016/2017', 1, '74.500000000000', '2017-05-28 03:14:28', '2017-05-28 03:14:28'),
(6, 4, 8, '3', '2016/2017', 1, '51.000000000000', '2017-06-08 02:34:28', '2017-06-08 02:34:28'),
(7, 4, 1, '2', '2016/2017', 1, '100.000000000000', '2017-06-08 02:34:47', '2017-06-08 02:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbox`
--

INSERT INTO `outbox` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `SendBefore`, `SendAfter`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `MultiPart`, `RelativeValidity`, `SenderID`, `SendingTimeOut`, `DeliveryReport`, `CreatorID`) VALUES
('2017-06-08 02:34:28', '2017-06-08 02:34:28', '2017-06-08 02:34:28', '23:59:59', '00:00:00', NULL, '+628131234567', 'Default_No_Compression', NULL, -1, 'Salam, pengumuman nilai dari Abdul matkul Dasar Pemrograman 51.0. Terima kasih', 2, 'false', -1, NULL, '2017-06-08 02:34:28', 'default', 'Gammu'),
('2017-10-18 21:38:06', '2017-10-18 21:38:06', '2017-10-18 21:38:06', '23:59:59', '00:00:00', NULL, '+628131234567', 'Default_No_Compression', NULL, -1, 'Salam, bayaran nilai dari Abdul BPP adalah 6000000.0 dan per SKS adalah 200000.0. Terima kasih', 17, 'false', -1, NULL, '2017-10-18 21:38:06', 'default', 'Gammu'),
('2017-10-18 21:38:06', '2017-10-18 21:38:06', '2017-10-18 21:38:06', '23:59:59', '00:00:00', NULL, '+628999826256', 'Default_No_Compression', NULL, -1, 'Salam, bayaran nilai dari Zea Shakira Sabit BPP adalah 6000000.0 dan per SKS adalah 200000.0. Terima kasih', 16, 'false', -1, NULL, '2017-10-18 21:38:06', 'default', 'Gammu'),
('2017-08-18 17:53:39', '2017-08-18 17:53:39', '2017-08-18 17:53:39', '23:59:59', '00:00:00', NULL, '+628999826256', 'Default_No_Compression', NULL, -1, 'Absen Zea Shakira Sabit 50.0% kurang 70% dan tidak bisa mengikuti ujian. Terima kasih', 15, 'false', -1, NULL, '2017-08-18 17:53:39', 'default', 'Gammu');

--
-- Triggers `outbox`
--
DELIMITER $$
CREATE TRIGGER `outbox_timestamp` BEFORE INSERT ON `outbox` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingTimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.SendingTimeOut = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

CREATE TABLE `pbk` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

CREATE TABLE `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '-1',
  `Signal` int(11) NOT NULL DEFAULT '-1',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `phones`
--
DELIMITER $$
CREATE TRIGGER `phones_timestamp` BEFORE INSERT ON `phones` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.TimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.TimeOut = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20170525191533'),
('20170525194921'),
('20170525195532'),
('20170527103558'),
('20170527103606'),
('20170527112505'),
('20170527154925'),
('20170528133342'),
('20170528133631'),
('20170528165619'),
('20170531021659'),
('20170607133709'),
('20170721015124'),
('20170723143512'),
('20170723143631'),
('20170807052522'),
('20170817165225'),
('20170817170006'),
('20170819050611'),
('20170820165134'),
('20170820170631'),
('20170820172921'),
('20170822023651'),
('20170822023921'),
('20170822043011'),
('20171017125304');

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2017-07-18 17:41:52', '2017-07-18 17:41:27', '2017-07-18 17:41:27', NULL, 'Salam.. IPK dari Abdul Mustofa adalah 2,3. Terima kasih.', '+628999826256', 'Default_No_Compression', '', '', -1, '', 0, '', 1, 'SendingOK', -1, -1, -1, '');

--
-- Triggers `sentitems`
--
DELIMITER $$
CREATE TRIGGER `sentitems_timestamp` BEFORE INSERT ON `sentitems` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tagihans`
--

CREATE TABLE `tagihans` (
  `id` int(11) NOT NULL,
  `tahun_masuk` varchar(4) NOT NULL,
  `bpp` decimal(64,12) DEFAULT NULL,
  `per_sks` decimal(64,12) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihans`
--

INSERT INTO `tagihans` (`id`, `tahun_masuk`, `bpp`, `per_sks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, '2015', '5000000.000000000000', '200000.000000000000', NULL, NULL, '2017-10-17 15:22:54', '2017-10-17 15:22:54'),
(3, '2016', '6000000.000000000000', '200000.000000000000', NULL, NULL, '2017-10-17 15:23:40', '2017-10-17 15:23:40'),
(4, '2017', '6500000.000000000000', '220000.000000000000', NULL, NULL, '2017-10-17 15:23:57', '2017-10-17 15:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `place_birth` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `level_access` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `date_birth`, `place_birth`, `created_at`, `updated_at`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `level_access`) VALUES
(2, NULL, NULL, NULL, NULL, '2017-05-31 05:36:47', '2017-05-31 05:36:47', 'fithri.selva@gmail.com', '$2a$11$flaJjtfjDYPq1w08HBkQmeBP3ny43M00DQezCin0ef/taPdUJDs3C', NULL, NULL, NULL, 1, '2017-05-31 05:36:47', '2017-05-31 05:36:47', '127.0.0.1', '127.0.0.1', NULL),
(3, 'Farifam Store', NULL, NULL, NULL, '2017-06-03 17:38:48', '2017-07-18 17:37:19', 'farifamstore2nd@gmail.com', '$2a$11$XRb/GP6GTQBaqS9oHVHehO.3oD6TBDB8pviVFlZ7PMMFUwAYRdYN.', NULL, NULL, NULL, 6, '2017-07-18 17:37:19', '2017-06-21 16:14:41', '127.0.0.1', '127.0.0.1', 'dosen'),
(4, 'Sabit Huraira', NULL, NULL, NULL, '2017-06-03 19:50:18', '2017-09-17 02:55:21', 'sabitzhabit@gmail.com', '$2a$11$n.Rce04oK1pi.WqXDHXamu8fY.M0A/LE08EscBU45lxYhYhvXmldC', NULL, NULL, NULL, 11, '2017-09-17 02:55:21', '2017-09-09 09:34:33', '127.0.0.1', '127.0.0.1', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensis`
--
ALTER TABLE `absensis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `dosens`
--
ALTER TABLE `dosens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas_penilaians`
--
ALTER TABLE `kelas_penilaians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas_pertemuans`
--
ALTER TABLE `kelas_pertemuans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa_kelas`
--
ALTER TABLE `mahasiswa_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mata_pelajarans`
--
ALTER TABLE `mata_pelajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilais`
--
ALTER TABLE `nilais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
  ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `pbk`
--
ALTER TABLE `pbk`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
  ADD PRIMARY KEY (`ID`,`SequencePosition`),
  ADD KEY `sentitems_date` (`DeliveryDateTime`),
  ADD KEY `sentitems_tpmr` (`TPMR`),
  ADD KEY `sentitems_dest` (`DestinationNumber`),
  ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `tagihans`
--
ALTER TABLE `tagihans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_users_on_email` (`email`),
  ADD UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensis`
--
ALTER TABLE `absensis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dosens`
--
ALTER TABLE `dosens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kelas_penilaians`
--
ALTER TABLE `kelas_penilaians`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `kelas_pertemuans`
--
ALTER TABLE `kelas_pertemuans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mahasiswa_kelas`
--
ALTER TABLE `mahasiswa_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mata_pelajarans`
--
ALTER TABLE `mata_pelajarans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `nilais`
--
ALTER TABLE `nilais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `pbk`
--
ALTER TABLE `pbk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tagihans`
--
ALTER TABLE `tagihans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
