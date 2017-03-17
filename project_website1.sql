+-- phpMyAdmin SQL Dump
+-- version 4.6.5.2
+-- https://www.phpmyadmin.net/
+--
+-- Host: 127.0.0.1
+-- Generation Time: Mar 13, 2017 at 11:12 PM
+-- Server version: 10.1.21-MariaDB
+-- PHP Version: 5.6.30
+
+SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
+SET time_zone = "+00:00";
+
+
+/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
+/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
+/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
+/*!40101 SET NAMES utf8mb4 */;
+
+--
+-- Database: `project_website1`
+--
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `bannedusers`
+--
+
+CREATE TABLE `bannedusers` (
+  `banned_id` int(10) UNSIGNED NOT NULL,
+  `user_of_id` int(10) UNSIGNED NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `claimed_task`
+--
+
+CREATE TABLE `claimed_task` (
+  `claimed_task_id` int(10) UNSIGNED NOT NULL,
+  `task_id` int(10) UNSIGNED NOT NULL,
+  `user_id` int(10) UNSIGNED NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `flagged_tasks`
+--
+
+CREATE TABLE `flagged_tasks` (
+  `flagged_task_id` int(10) UNSIGNED NOT NULL,
+  `task_id` int(10) UNSIGNED NOT NULL,
+  `user_id` int(10) UNSIGNED NOT NULL,
+  `time_stamp_flagged` datetime NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `progress`
+--
+
+CREATE TABLE `progress` (
+  `status_id` int(10) UNSIGNED NOT NULL,
+  `status` enum('Complete','InProgress','Cancelled') NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `subjects`
+--
+
+CREATE TABLE `subjects` (
+  `subject_id` int(10) UNSIGNED NOT NULL,
+  `subject_name` varchar(128) NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `subject_student`
+--
+
+CREATE TABLE `subject_student` (
+  `subject_user_id` int(10) UNSIGNED NOT NULL,
+  `user_subject_id` int(10) UNSIGNED NOT NULL,
+  `subject_table_id` int(10) UNSIGNED NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `tags`
+--
+
+CREATE TABLE `tags` (
+  `tag_id` int(10) UNSIGNED NOT NULL,
+  `tag_name` varchar(20) NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `task`
+--
+
+CREATE TABLE `task` (
+  `task_id` int(10) UNSIGNED NOT NULL,
+  `user_id` int(10) UNSIGNED NOT NULL,
+  `title` varchar(128) NOT NULL,
+  `description` varchar(256) NOT NULL,
+  `pg_num` int(8) UNSIGNED NOT NULL,
+  `num_words` int(10) NOT NULL,
+  `deadline_claim` datetime NOT NULL,
+  `deadline_completion` datetime NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `task_progress`
+--
+
+CREATE TABLE `task_progress` (
+  `task_id_progress` int(10) UNSIGNED NOT NULL,
+  `task_id` int(10) UNSIGNED NOT NULL,
+  `time_stamp` datetime NOT NULL,
+  `status_id` int(10) UNSIGNED NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `task_tag`
+--
+
+CREATE TABLE `task_tag` (
+  `task_tag_id` int(10) UNSIGNED NOT NULL,
+  `task_id` int(10) UNSIGNED NOT NULL,
+  `tag_id` int(10) UNSIGNED NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `userdetails`
+--
+
+CREATE TABLE `userdetails` (
+  `user_id` int(10) UNSIGNED NOT NULL,
+  `first_name` varchar(128) NOT NULL,
+  `second_name` varchar(128) NOT NULL,
+  `email` varchar(128) DEFAULT NULL,
+  `password` char(128) NOT NULL,
+  `score` int(2) UNSIGNED NOT NULL
+) ENGINE=InnoDB DEFAULT CHARSET=latin1;
+
+--
+-- Indexes for dumped tables
+--
+
+--
+-- Indexes for table `bannedusers`
+--
+ALTER TABLE `bannedusers`
+  ADD PRIMARY KEY (`banned_id`),
+  ADD KEY `fk_banned_users` (`user_of_id`);
+
+--
+-- Indexes for table `claimed_task`
+--
+ALTER TABLE `claimed_task`
+  ADD PRIMARY KEY (`claimed_task_id`),
+  ADD KEY `fk_task_id_claimed` (`task_id`),
+  ADD KEY `fk_user_id_claimed` (`user_id`);
+
+--
+-- Indexes for table `flagged_tasks`
+--
+ALTER TABLE `flagged_tasks`
+  ADD PRIMARY KEY (`flagged_task_id`),
+  ADD KEY `fk_task_id_flagged` (`task_id`),
+  ADD KEY `fk_user_id_flagged` (`user_id`);
+
+--
+-- Indexes for table `progress`
+--
+ALTER TABLE `progress`
+  ADD PRIMARY KEY (`status_id`);
+
+--
+-- Indexes for table `subjects`
+--
+ALTER TABLE `subjects`
+  ADD PRIMARY KEY (`subject_id`);
+
+--
+-- Indexes for table `subject_student`
+--
+ALTER TABLE `subject_student`
+  ADD PRIMARY KEY (`subject_user_id`),
+  ADD KEY `fk_user_id` (`user_subject_id`),
+  ADD KEY `fk_subject_id` (`subject_table_id`);
+
+--
+-- Indexes for table `tags`
+--
+ALTER TABLE `tags`
+  ADD PRIMARY KEY (`tag_id`);
+
+--
+-- Indexes for table `task`
+--
+ALTER TABLE `task`
+  ADD PRIMARY KEY (`task_id`),
+  ADD KEY `fk_task_users` (`user_id`);
+
+--
+-- Indexes for table `task_progress`
+--
+ALTER TABLE `task_progress`
+  ADD PRIMARY KEY (`task_id_progress`),
+  ADD KEY `fk_task_id` (`task_id`),
+  ADD KEY `fk_status_id` (`status_id`);
+
+--
+-- Indexes for table `task_tag`
+--
+ALTER TABLE `task_tag`
+  ADD PRIMARY KEY (`task_tag_id`),
+  ADD KEY `fk_task_tag` (`task_id`),
+  ADD KEY `fk_tag` (`tag_id`);
+
+--
+-- Indexes for table `userdetails`
+--
+ALTER TABLE `userdetails`
+  ADD PRIMARY KEY (`user_id`),
+  ADD UNIQUE KEY `ul_email` (`email`);
+
+--
+-- AUTO_INCREMENT for dumped tables
+--
+
+--
+-- AUTO_INCREMENT for table `bannedusers`
+--
+ALTER TABLE `bannedusers`
+  MODIFY `banned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `claimed_task`
+--
+ALTER TABLE `claimed_task`
+  MODIFY `claimed_task_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `flagged_tasks`
+--
+ALTER TABLE `flagged_tasks`
+  MODIFY `flagged_task_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `subject_student`
+--
+ALTER TABLE `subject_student`
+  MODIFY `subject_user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `tags`
+--
+ALTER TABLE `tags`
+  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `task`
+--
+ALTER TABLE `task`
+  MODIFY `task_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `task_progress`
+--
+ALTER TABLE `task_progress`
+  MODIFY `task_id_progress` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `task_tag`
+--
+ALTER TABLE `task_tag`
+  MODIFY `task_tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- AUTO_INCREMENT for table `userdetails`
+--
+ALTER TABLE `userdetails`
+  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
+--
+-- Constraints for dumped tables
+--
+
+--
+-- Constraints for table `bannedusers`
+--
+ALTER TABLE `bannedusers`
+  ADD CONSTRAINT `fk_banned_users` FOREIGN KEY (`user_of_id`) REFERENCES `userdetails` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+--
+-- Constraints for table `claimed_task`
+--
+ALTER TABLE `claimed_task`
+  ADD CONSTRAINT `fk_task_id_claimed` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
+  ADD CONSTRAINT `fk_user_id_claimed` FOREIGN KEY (`user_id`) REFERENCES `userdetails` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+--
+-- Constraints for table `flagged_tasks`
+--
+ALTER TABLE `flagged_tasks`
+  ADD CONSTRAINT `fk_task_id_flagged` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
+  ADD CONSTRAINT `fk_user_id_flagged` FOREIGN KEY (`user_id`) REFERENCES `userdetails` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+--
+-- Constraints for table `subject_student`
+--
+ALTER TABLE `subject_student`
+  ADD CONSTRAINT `fk_subject_id` FOREIGN KEY (`subject_table_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
+  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_subject_id`) REFERENCES `userdetails` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+--
+-- Constraints for table `task`
+--
+ALTER TABLE `task`
+  ADD CONSTRAINT `fk_task_users` FOREIGN KEY (`user_id`) REFERENCES `userdetails` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+--
+-- Constraints for table `task_progress`
+--
+ALTER TABLE `task_progress`
+  ADD CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `progress` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
+  ADD CONSTRAINT `fk_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+--
+-- Constraints for table `task_tag`
+--
+ALTER TABLE `task_tag`
+  ADD CONSTRAINT `fk_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
+  ADD CONSTRAINT `fk_task_tag` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;
+
+/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
+/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
+/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
