-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 04, 2022 at 06:51 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `talkingspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Web Programming', 'Sed hendrerit. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.\r\n\r\nPellentesque posuere. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Praesent venenatis metus at tortor pulvinar varius.'),
(2, 'Web Design', 'Vivamus aliquet elit ac nisl. Donec posuere vulputate arcu. Aliquam eu nunc. Morbi nec metus. Nam adipiscing.');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
CREATE TABLE IF NOT EXISTS `replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `body` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `topic_id`, `user_id`, `body`, `create_date`) VALUES
(1, 1, 2, 'This is great. Praesent ut ligula non mi varius sagittis. Nunc nec neque. Aenean viverra rhoncus pede. Cras id dui.\r\n\r\nPraesent congue erat at massa. Donec id justo. In ut quam vitae odio lacinia tincidunt. Mauris sollicitudin fermentum libero.', '2022-05-02 12:55:57'),
(2, 2, 1, 'In consectetuer turpis ut velit. Sed a libero.\r\n\r\nDonec vitae orci sed dolor rutrum auctor. Praesent venenatis metus at tortor pulvinar varius.\r\n\r\nNunc nonummy metus. Curabitur turpis.', '2022-05-02 12:55:57'),
(3, 1, 1, '<p>We are just replying</p>', '2022-05-03 17:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `category_id`, `user_id`, `title`, `body`, `last_activity`, `create_date`) VALUES
(1, 1, 1, 'Favorite Server Side Language', 'What is your Favorite Server Side Language?', '2022-04-29 21:29:24', '2022-04-29 21:30:45'),
(2, 2, 4, 'How did you learn HTML and CSS?', 'Maecenas egestas arcu quis ligula mattis placerat.. Morbi ac felis. Vivamus aliquet elit ac nisl. Cras varius.\r\n\r\n', '2022-04-29 21:29:24', '2022-04-29 21:30:45'),
(3, 2, 1, 'Test Post', '<p><strong>Pellentesque egestas, neque</strong> sit amet convallis pulvinar, justo nulla eleifend augue, ac auctor orci leo non est. Donec elit libero, sodales nec, volutpat a, suscipit non, turpis. In ut quam vitae odio lacinia tincidunt. Nunc egestas, augue at pellentesque laoreet, felis eros vehicula leo, at malesuada velit leo quis pede.</p><p>Etiam ultricies nisi vel augue<em>. Praesent nec nisl a purus </em>blandit viverra. Praesent vestibulum dapibus nibh. Donec mi odio, faucibus at, scelerisque quis, convallis in, nisi.</p><p>Ut varius tincidunt libero. Nulla sit amet est. Pellentesque auctor neque nec urna. Phasellus gravida semper nisi.</p><p>In auctor lobortis lacus. Quisque rutrum. Donec mollis hendrerit risus. Praesent congue erat at massa.</p><p>Sed fringilla mauris sit amet nibh. Phasellus ullamcorper ipsum rutrum nunc. Ut id nisl quis enim dignissim sagittis. Fusce vel dui.</p>', '2022-05-03 12:10:29', '2022-05-03 12:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(64) NOT NULL,
  `about` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `username`, `password`, `about`, `last_activity`, `join_date`) VALUES
(1, 'Panama Fomnya', 'pjay@gmail.com', 'avatar1.jpg', 'pjay', '5f4dcc3b5aa765d61d8327deb882cf99', 'Just a gentle man upcoming big boy', '2022-04-29 21:25:08', '2022-04-29 21:26:59'),
(2, 'Panada Fomnya', 'panada@gmail.com', 'avatar2.jpg', 'panada', '5f4dcc3b5aa765d61d8327deb882cf99', 'The pretty lady with enough swag', '2022-05-02 09:54:08', '2022-05-02 09:54:55'),
(3, 'Tester tesy', 'tester@test.com', 'download (1).png', 'tester', '5f4dcc3b5aa765d61d8327deb882cf99', 'testert', '2022-05-02 13:55:37', '2022-05-02 13:55:37'),
(4, 'Hyelda Joseph', 'hyeldaj@gmail.com', 'Hyelda.jpg', 'hyeldajoe', '5f4dcc3b5aa765d61d8327deb882cf99', 'BigJose', '2022-05-02 15:51:57', '2022-05-02 15:51:57');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
