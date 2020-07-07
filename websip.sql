-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2020 at 06:42 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websip`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(256) NOT NULL,
  `image` varchar(200) NOT NULL,
  `id_role` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`, `image`, `id_role`, `is_active`, `date_created`) VALUES
(5, 'Dudun Sukadun', 'dudun@gmail.com', '$2y$10$OsRjKQeOAirqL4CxXtAUeOw6H.V.Uxw9UhccyN01IrTh0Wp.lyKJC', 'default.jpg', 3, 1, 1591178570),
(6, 'Admin12345', 'admin12345@gmail.com', '$2y$10$8N6EEB7r3m8HxrmWvNIsxOIsSNV0jumJ/arlj9S8iOC0.zXvvx7tG', 'default.jpg', 3, 1, 1594096673);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id_menu`, `menu`) VALUES
(1, 'Super Admin'),
(2, 'Konsultan Pusat'),
(3, 'Konsultan Daerah');

-- --------------------------------------------------------

--
-- Table structure for table `user_menu_access`
--

CREATE TABLE `user_menu_access` (
  `id_menu_access` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu_access`
--

INSERT INTO `user_menu_access` (`id_menu_access`, `id_role`, `id_menu`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_role`, `role`) VALUES
(1, 'Super Admin'),
(2, 'Konsultan Pusat'),
(3, 'Konsultan Daerah');

-- --------------------------------------------------------

--
-- Table structure for table `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id_submenu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_submenu`
--

INSERT INTO `user_submenu` (`id_submenu`, `id_menu`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'My Profile', 'SuperAdmin', 'fas fa-fw fa-user-alt', 1),
(2, 1, 'Edit Profile', 'SuperAdmin', 'fas fa-fw fa-user-edit', 1),
(3, 2, 'My Profile', 'KonsultanPusat', 'fas fa-fw fa-user-alt', 1),
(4, 2, 'Edit Profile', 'KonsultanPusat', 'fas fa-fw fa-user-edit', 1),
(5, 2, 'File Status', 'KonsultanPusat', 'far fa-fw fa-file', 1),
(6, 3, 'My Profile', 'KonsultanDaerah', 'fas fa-fw fa-user-alt', 1),
(7, 3, 'Edit Profile', 'KonsultanDaerah', 'fas fa-fw fa-user-edit', 1),
(8, 1, 'Dashboard', 'SuperAdmin', 'fas fa-fw fa-tachometer-alt', 1),
(9, 1, 'Manage Account', 'SuperAdmin', 'fas fa-fw fa-users', 1),
(10, 2, 'File Monitoring', 'KonsultanPusat', 'fas fa-fw fa-file', 1),
(11, 3, 'Upload File', 'KonsultanDaerah', 'fas fa-fw fa-file-upload', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `user_menu_access`
--
ALTER TABLE `user_menu_access`
  ADD PRIMARY KEY (`id_menu_access`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id_submenu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_menu_access`
--
ALTER TABLE `user_menu_access`
  MODIFY `id_menu_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
