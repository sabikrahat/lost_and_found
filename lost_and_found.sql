-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 05:05 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lost_and_found`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `point` varchar(5) NOT NULL,
  `completeProfile` varchar(5) NOT NULL,
  `location` varchar(50) NOT NULL,
  `messengerUrl` varchar(100) NOT NULL,
  `whatsappUrl` varchar(100) NOT NULL,
  `telegramUrl` varchar(100) NOT NULL,
  `profileImg` varchar(100) DEFAULT NULL,
  `nidFrontImg` varchar(100) DEFAULT NULL,
  `nidBackImg` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `name`, `email`, `password`, `phoneNumber`, `bio`, `point`, `completeProfile`, `location`, `messengerUrl`, `whatsappUrl`, `telegramUrl`, `profileImg`, `nidFrontImg`, `nidBackImg`, `created_at`) VALUES
(1, 'Md. Sabik Alam Rahat', 'sabikrahat72428@gmail.com', 'pbkdf2_sha256$260000$bBMmVmrZYXm11PS1lF7GnE$zF1ZrHTxR+oa2465drusb9FmIyuzkl3hIPuJMZ4u1/A=', '01647629698', 'A self-taught programmer who always tries to learn something new and interesting.', '150', '100%', 'Merul Badda, Anandanagar', 'https://m.me/sabikrahat', 'https://wa.me/8801647629698', 'https://t.me/sabikrahat', 'uploads/20220105212745-rahat.jpg', 'uploads/20220105212745-nid-card-front.jpg', 'uploads/20220105212745-nid-card-back.png', '2022-01-05 15:26:20.513000'),
(2, 'Humaira Tabassum', 'humaira.tabassumkhan@gmail.com', 'pbkdf2_sha256$260000$OstTXmRseJkl87XJPG0wfl$jaGyeD3iEs6h0Ybu4OHXFrZbBPAZpB+yrz94N4jPmcg=', '01733627713', 'Hello there!', '100', '100%', 'Malibag, Dhaka', 'https://m.me/humairatabassum.khan', 'https://wa.me/8801733627713', 'https://t.me/humairatabassum.khan', 'uploads/20220105213201-humaira.jpg', 'uploads/20220105213201-nid-card-front.jpg', 'uploads/20220105213201-nid-card-back.png', '2022-01-05 15:30:56.366117'),
(3, 'Kawshik Das', 'kawshik400@gmail.com', 'pbkdf2_sha256$260000$rgRbU5GBtmg3VBMSI570s6$4wApIFBMVdxXTSo9nV2fx2ikMfjaBW5GtRpUsA1Targ=', '01875602853', 'Hello there!', '100', '100%', 'Puran Dhaka', 'https://m.me/kawshikdas400', 'https://wa.me/8801875602853', 'https://t.me/kawshikdas400', 'uploads/20220105213542-kawshik.jpg', 'uploads/20220105213542-nid-card-front.jpg', 'uploads/20220105213542-nid-card-back.png', '2022-01-05 15:34:49.806958'),
(4, 'Lost and Found', 'lostandfound72428@gmail.com', 'pbkdf2_sha256$260000$2zRvuhTkMZS6VSvfGmOQlM$g4Ni9O4xjgZTPUXLF9Sq1dfXN+07hXZFdNSM0ukrXQ4=', '01647629698', 'Hello there! I\'m Admin User', '200', '100%', 'Aftab Nagar', 'https://m.me/sabikrahat', 'https://wa.me/8801647629698', 'https://t.me/sabikrahat', 'uploads/20220105215044-lost-and-found.jpg', 'uploads/20220105215044-nid-card-front.jpg', 'uploads/20220105215044-nid-card-back.png', '2022-01-05 15:48:52.760575'),
(5, 'Test User', 'test@gmail.com', 'pbkdf2_sha256$260000$wQ8V2OdyfP0K0QicOuNciT$u67yF30BhLbZX1aNOM0fFkVViNquQ+nENhPg62htcnw=', '', '', '200', '25%', '', '', '', '', '', '', '', '2022-01-05 16:04:37.616669');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add bkash payment', 7, 'add_bkashpayment'),
(26, 'Can change bkash payment', 7, 'change_bkashpayment'),
(27, 'Can delete bkash payment', 7, 'delete_bkashpayment'),
(28, 'Can view bkash payment', 7, 'view_bkashpayment'),
(29, 'Can add claim owner', 8, 'add_claimowner'),
(30, 'Can change claim owner', 8, 'change_claimowner'),
(31, 'Can delete claim owner', 8, 'delete_claimowner'),
(32, 'Can view claim owner', 8, 'view_claimowner'),
(33, 'Can add post model', 9, 'add_postmodel'),
(34, 'Can change post model', 9, 'change_postmodel'),
(35, 'Can delete post model', 9, 'delete_postmodel'),
(36, 'Can view post model', 9, 'view_postmodel'),
(37, 'Can add user contact', 10, 'add_usercontact'),
(38, 'Can change user contact', 10, 'change_usercontact'),
(39, 'Can delete user contact', 10, 'delete_usercontact'),
(40, 'Can view user contact', 10, 'view_usercontact'),
(41, 'Can add user feedback', 11, 'add_userfeedback'),
(42, 'Can change user feedback', 11, 'change_userfeedback'),
(43, 'Can delete user feedback', 11, 'delete_userfeedback'),
(44, 'Can view user feedback', 11, 'view_userfeedback'),
(45, 'Can add user model', 12, 'add_usermodel'),
(46, 'Can change user model', 12, 'change_usermodel'),
(47, 'Can delete user model', 12, 'delete_usermodel'),
(48, 'Can view user model', 12, 'view_usermodel'),
(49, 'Can add reset pwd tokens', 13, 'add_resetpwdtokens'),
(50, 'Can change reset pwd tokens', 13, 'change_resetpwdtokens'),
(51, 'Can delete reset pwd tokens', 13, 'delete_resetpwdtokens'),
(52, 'Can view reset pwd tokens', 13, 'view_resetpwdtokens');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bkash_payment`
--

CREATE TABLE `bkash_payment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bkashNumber` varchar(20) NOT NULL,
  `bkashTransaction` varchar(512) NOT NULL,
  `point` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bkash_payment`
--

INSERT INTO `bkash_payment` (`id`, `name`, `email`, `bkashNumber`, `bkashTransaction`, `point`, `status`, `created_at`) VALUES
(1, 'Md. Sabik Alam Rahat', 'sabikrahat72428@gmail.com', '01647629698', 'kljuhyfgtrytghgf', '100', 'Pending', '2022-01-05 21:30:17.145864'),
(2, 'Md. Sabik Alam Rahat', 'sabikrahat72428@gmail.com', '01647629698', 'fhgjdhgjr', '147', 'Pending', '2022-01-05 21:30:27.744393'),
(3, 'Humaira Tabassum', 'humaira.tabassumkhan@gmail.com', '01733627713', 'kljuhyfgtrytghgf', '50', 'Pending', '2022-01-05 21:34:02.667315'),
(4, 'Humaira Tabassum', 'humaira.tabassumkhan@gmail.com', '01733627713', 'sfdgg', '50', 'Pending', '2022-01-05 21:34:11.633617'),
(5, 'Kawshik Das', 'kawshik400@gmail.com', '01875602853', 'kljuhyfgtrytghgf', '123', 'Pending', '2022-01-05 21:37:09.345595'),
(6, 'Kawshik Das', 'kawshik400@gmail.com', '01875602853', 'fhgjdhgjr', '147', 'Pending', '2022-01-05 21:37:17.914222');

-- --------------------------------------------------------

--
-- Table structure for table `claim_owner`
--

CREATE TABLE `claim_owner` (
  `id` bigint(20) NOT NULL,
  `claimerId` varchar(20) NOT NULL,
  `claimerName` varchar(50) NOT NULL,
  `claimerEmail` varchar(40) NOT NULL,
  `postId` varchar(20) NOT NULL,
  `postPunlisherEmail` varchar(40) NOT NULL,
  `postPunlisherName` varchar(50) NOT NULL,
  `claimFileImg` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `claim_owner`
--

INSERT INTO `claim_owner` (`id`, `claimerId`, `claimerName`, `claimerEmail`, `postId`, `postPunlisherEmail`, `postPunlisherName`, `claimFileImg`, `status`, `created_at`) VALUES
(1, '2', 'Humaira Tabassum', 'humaira.tabassumkhan@gmail.com', '1', 'sabikrahat72428@gmail.com', 'Md. Sabik Alam Rahat', 'uploads/20220105213338-wallet-secret.jpg', 'Pending', '2022-01-05 15:33:38.744387'),
(2, '3', 'Kawshik Das', 'kawshik400@gmail.com', '2', 'humaira.tabassumkhan@gmail.com', 'Humaira Tabassum', 'uploads/20220105213732-mobile.jpg', 'Pending', '2022-01-05 15:37:32.543610'),
(3, '1', 'Md. Sabik Alam Rahat', 'sabikrahat72428@gmail.com', '3', 'kawshik400@gmail.com', 'Kawshik Das', 'uploads/20220105213846-watch-secret.jpg', 'Pending', '2022-01-05 15:38:46.515847'),
(4, '2', 'Humaira Tabassum', 'humaira.tabassumkhan@gmail.com', '1', 'sabikrahat72428@gmail.com', 'Md. Sabik Alam Rahat', 'uploads/20220105214035-umbrella-secret.jpg', 'Pending', '2022-01-05 15:40:35.935596'),
(5, '3', 'Kawshik Das', 'kawshik400@gmail.com', '2', 'humaira.tabassumkhan@gmail.com', 'Humaira Tabassum', 'uploads/20220105214311-glass-secret.jpg', 'Pending', '2022-01-05 15:43:11.054087'),
(6, '1', 'Md. Sabik Alam Rahat', 'sabikrahat72428@gmail.com', '3', 'kawshik400@gmail.com', 'Kawshik Das', 'uploads/20220105214422-earphone-secret.jpg', 'Pending', '2022-01-05 15:44:22.113435');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'home', 'bkashpayment'),
(8, 'home', 'claimowner'),
(9, 'home', 'postmodel'),
(13, 'home', 'resetpwdtokens'),
(10, 'home', 'usercontact'),
(11, 'home', 'userfeedback'),
(12, 'home', 'usermodel'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-01-05 15:25:25.145479'),
(2, 'auth', '0001_initial', '2022-01-05 15:25:28.846029'),
(3, 'admin', '0001_initial', '2022-01-05 15:25:29.732085'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-05 15:25:29.752661'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-05 15:25:29.777136'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-01-05 15:25:30.040186'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-01-05 15:25:30.736141'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-01-05 15:25:30.840364'),
(9, 'auth', '0004_alter_user_username_opts', '2022-01-05 15:25:30.891905'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-01-05 15:25:31.265381'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-01-05 15:25:31.275384'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-01-05 15:25:31.306394'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-01-05 15:25:31.357503'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-01-05 15:25:31.402552'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-01-05 15:25:31.434196'),
(16, 'auth', '0011_update_proxy_permissions', '2022-01-05 15:25:31.453191'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-01-05 15:25:31.503573'),
(18, 'home', '0001_initial', '2022-01-05 15:25:32.883880'),
(19, 'sessions', '0001_initial', '2022-01-05 15:25:33.190496');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zj5q5ajx9i9k7pqa3ed8xouttpegkcl9', 'eyJlbWFpbCI6InNhYmlrcmFoYXQ3MjQyOEBnbWFpbC5jb20ifQ:1n58mw:uRCbAtmL9vyOZ61t4V0tHUXxcHZJSaQPAst_ZX6sUTc', '2022-01-19 16:05:22.988089');

-- --------------------------------------------------------

--
-- Table structure for table `reset_pwd_tokens`
--

CREATE TABLE `reset_pwd_tokens` (
  `id` bigint(20) NOT NULL,
  `forget_password_token` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reset_pwd_tokens`
--

INSERT INTO `reset_pwd_tokens` (`id`, `forget_password_token`, `created_at`, `user_id`) VALUES
(1, '', '2022-01-05 15:26:20.552825', 1),
(2, '', '2022-01-05 15:30:56.401118', 2),
(3, '', '2022-01-05 15:34:49.876956', 3),
(4, '', '2022-01-05 15:48:52.816104', 4),
(5, '', '2022-01-05 16:04:38.045692', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users_contacts`
--

CREATE TABLE `users_contacts` (
  `id` bigint(20) NOT NULL,
  `messengerId` varchar(10) NOT NULL,
  `messengerName` varchar(50) NOT NULL,
  `messengerEmail` varchar(40) NOT NULL,
  `message` varchar(3072) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_feedbacks`
--

CREATE TABLE `users_feedbacks` (
  `id` bigint(20) NOT NULL,
  `messengerId` varchar(10) NOT NULL,
  `messengerName` varchar(50) NOT NULL,
  `messengerEmail` varchar(40) NOT NULL,
  `message` varchar(3072) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

CREATE TABLE `user_posts` (
  `id` bigint(20) NOT NULL,
  `publisherId` varchar(20) NOT NULL,
  `publisherName` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(3072) NOT NULL,
  `location` varchar(50) NOT NULL,
  `lostDateTime` datetime(6) NOT NULL,
  `fileImg` varchar(100) DEFAULT NULL,
  `fileSecretImg` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_posts`
--

INSERT INTO `user_posts` (`id`, `publisherId`, `publisherName`, `title`, `description`, `location`, `lostDateTime`, `fileImg`, `fileSecretImg`, `created_at`) VALUES
(1, '1', 'Md. Sabik Alam Rahat', 'Found a Wallet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Badda', '2021-12-28 21:29:00.000000', 'uploads/20220105212943-wallet.jpg', 'uploads/20220105212943-wallet-secret.jpg', '2022-01-05 15:29:43.787784'),
(2, '2', 'Humaira Tabassum', 'Found a Mobile', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Khilgaon', '2021-12-29 21:32:00.000000', 'uploads/20220105213323-mobile-secret.jpg', 'uploads/20220105213323-mobile.jpg', '2022-01-05 15:33:23.175576'),
(3, '3', 'Kawshik Das', 'Found a Watch', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Malibag', '2021-12-30 21:36:00.000000', 'uploads/20220105213658-watch.jpg', 'uploads/20220105213658-watch-secret.jpg', '2022-01-05 15:36:58.812258'),
(4, '1', 'Md. Sabik Alam Rahat', 'Found a Umbrella', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Puran Dhaka', '2021-12-31 21:38:00.000000', 'uploads/20220105213832-umbrella.jpg', 'uploads/20220105213832-umbrella-secret.jpg', '2022-01-05 15:38:32.272254'),
(5, '2', 'Humaira Tabassum', 'Found a Glass', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Badda', '2022-01-01 21:41:00.000000', 'uploads/20220105214114-glass.jpg', 'uploads/20220105214114-glass-secret.jpg', '2022-01-05 15:41:14.060378'),
(6, '3', 'Kawshik Das', 'Found a Earphone', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Khilgaon', '2022-01-02 21:43:00.000000', 'uploads/20220105214350-earphone.jpg', 'uploads/20220105214350-earphone-secret.jpg', '2022-01-05 15:43:50.689314'),
(7, '1', 'Md. Sabik Alam Rahat', 'Found some Documents', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio ut enim. Integer malesuada nunc vel risus. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. Vivamus arcu felis bibendum ut tristique et. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Tempus quam pellentesque nec nam aliquam sem. Sed arcu non odio euismod lacinia at quis risus. Pretium quam vulputate dignissim suspendisse in. Elementum eu facilisis sed odio morbi quis. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus.\r\n\r\nEget gravida cum sociis natoque penatibus. Tristique et egestas quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Egestas sed tempus urna et. Dignissim sodales ut eu sem integer vitae justo eget. Urna duis convallis convallis tellus id interdum velit laoreet. In hac habitasse platea dictumst. Nulla aliquet enim tortor at auctor urna nunc id. Dictum at tempor commodo ullamcorper a. Amet mauris commodo quis imperdiet massa. Ut aliquam purus sit amet luctus venenatis lectus. Nibh tellus molestie nunc non. Quis enim lobortis scelerisque fermentum dui faucibus in. Nulla porttitor massa id neque aliquam.\r\n\r\nAmet nisl suscipit adipiscing bibendum est ultricies integer quis. Iaculis at erat pellentesque adipiscing commodo. Pretium vulputate sapien nec sagittis. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Rhoncus aenean vel elit scelerisque mauris. Nibh praesent tristique magna sit amet purus. Semper quis lectus nulla at volutpat diam ut venenatis tellus. Habitant morbi tristique senectus et netus et. Scelerisque eu ultrices vitae auctor. Quis commodo odio aenean sed. Varius duis at consectetur lorem. Adipiscing vitae proin sagittis nisl rhoncus. Nunc vel risus commodo viverra maecenas accumsan lacus. Odio tempor orci dapibus ultrices in iaculis. Risus nullam eget felis eget nunc lobortis mattis. Est ultricies integer quis auctor elit sed.', 'Puran Dhaka', '2022-01-03 21:47:00.000000', 'uploads/20220105214746-document.jpg', 'uploads/20220105214746-document-secret.jpg', '2022-01-05 15:47:46.436381');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `bkash_payment`
--
ALTER TABLE `bkash_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claim_owner`
--
ALTER TABLE `claim_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `reset_pwd_tokens`
--
ALTER TABLE `reset_pwd_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users_contacts`
--
ALTER TABLE `users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_feedbacks`
--
ALTER TABLE `users_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bkash_payment`
--
ALTER TABLE `bkash_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `claim_owner`
--
ALTER TABLE `claim_owner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reset_pwd_tokens`
--
ALTER TABLE `reset_pwd_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_contacts`
--
ALTER TABLE `users_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_feedbacks`
--
ALTER TABLE `users_feedbacks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_posts`
--
ALTER TABLE `user_posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `reset_pwd_tokens`
--
ALTER TABLE `reset_pwd_tokens`
  ADD CONSTRAINT `reset_pwd_tokens_user_id_7263e5fc_fk_app_users_id` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
