-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 23, 2024 lúc 11:08 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `trumamthuc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_category`
--

CREATE TABLE `app_category` (
  `id` bigint(20) NOT NULL,
  `is_sub` tinyint(1) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `sub_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_category`
--

INSERT INTO `app_category` (`id`, `is_sub`, `name`, `slug`, `sub_category_id`) VALUES
(1, 0, 'Food', 'food', NULL),
(2, 0, 'Drinks', 'drinks', NULL),
(3, 0, 'All Product', 'allproduct', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_order`
--

CREATE TABLE `app_order` (
  `id` bigint(20) NOT NULL,
  `date_order` datetime(6) NOT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_order`
--

INSERT INTO `app_order` (`id`, `date_order`, `complete`, `transaction_id`, `customer_id`) VALUES
(1, '2024-02-21 09:45:13.643737', 0, NULL, 1),
(2, '2024-02-22 14:59:21.094968', 0, NULL, 2),
(3, '2024-02-22 21:37:19.457702', 0, NULL, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_orderitem`
--

CREATE TABLE `app_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_orderitem`
--

INSERT INTO `app_orderitem` (`id`, `quantity`, `date_added`, `order_id`, `product_id`) VALUES
(1, 4, '2024-02-21 18:00:51.861088', 1, 1),
(2, 4, '2024-02-21 18:01:18.325016', 1, 2),
(3, 4, '2024-02-22 15:38:19.900881', 2, 1),
(4, 2, '2024-02-22 15:38:23.708669', 2, 3),
(5, 3, '2024-02-22 21:08:59.425259', 1, 4),
(6, 1, '2024-02-22 21:41:31.045282', 2, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_product`
--

CREATE TABLE `app_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_product`
--

INSERT INTO `app_product` (`id`, `name`, `price`, `image`) VALUES
(1, 'Gà rán', 29000, 'garan_hNMFnIx.jpg'),
(2, 'Gà sốt H&S', 35000, 'soths_56V5Ilh.jpg'),
(3, 'Khoai tây chiên', 20000, 'khoaitaychien_uAKY8df.jpg'),
(4, 'Coca Cola', 25000, 'cocacola_3vvyx81.jpg'),
(5, 'Sprite', 25000, 'sprite.jpg'),
(6, 'Gà sốt đậu', 35000, 'gasotdau.jpg'),
(7, 'Gà thảo mộc', 40000, 'gathaomoc.jpg'),
(8, 'Gà sốt phomai', 40000, 'gasotphomai.jpg'),
(9, 'Trà sữa chân trâu', 40000, 'suatuoitranchau.jpg'),
(10, 'Khoai tây chiên lắc phô mai', 30000, 'khoaitaychienlacphomai.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_product_category`
--

CREATE TABLE `app_product_category` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_product_category`
--

INSERT INTO `app_product_category` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 1),
(4, 2, 3),
(5, 3, 1),
(6, 3, 3),
(7, 4, 2),
(8, 5, 2),
(9, 5, 3),
(10, 6, 1),
(11, 6, 3),
(12, 7, 1),
(13, 7, 3),
(14, 8, 1),
(15, 8, 3),
(16, 9, 2),
(17, 9, 3),
(18, 10, 1),
(19, 10, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_shippingaddress`
--

CREATE TABLE `app_shippingaddress` (
  `id` bigint(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_shippingaddress`
--

INSERT INTO `app_shippingaddress` (`id`, `address`, `state`, `mobile`, `date_added`, `customer_id`, `order_id`, `email`, `name`) VALUES
(1, 'HN', 'HN', '0111111111', '2024-02-22 14:33:13.314340', 1, 1, 'aa@gmail.com', 'Do'),
(3, 'HY', 'HY', '0111111111', '2024-02-22 20:48:26.444037', 2, 2, 'dodo@gmail.com', 'Do Do'),
(5, 'HH', 'HH', '0333333333', '2024-02-22 21:11:20.686172', 1, 1, 'hiep@gmail.com', 'Hiep');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
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
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add order', 9, 'add_order'),
(34, 'Can change order', 9, 'change_order'),
(35, 'Can delete order', 9, 'delete_order'),
(36, 'Can view order', 9, 'view_order'),
(37, 'Can add order item', 10, 'add_orderitem'),
(38, 'Can change order item', 10, 'change_orderitem'),
(39, 'Can delete order item', 10, 'delete_orderitem'),
(40, 'Can view order item', 10, 'view_orderitem'),
(41, 'Can add shipping address', 11, 'add_shippingaddress'),
(42, 'Can change shipping address', 11, 'change_shippingaddress'),
(43, 'Can delete shipping address', 11, 'delete_shippingaddress'),
(44, 'Can view shipping address', 11, 'view_shippingaddress');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$zECjqN1tEXEP0ybgY2Do22$yS4Na8pb7pgpqKHsZaYBMCMyWr8G6EQP/qDhoszSazs=', '2024-02-22 21:34:53.670007', 1, 'admin', '', '', 'a@gmail.com', 1, 1, '2024-02-21 09:27:48.579679'),
(2, 'pbkdf2_sha256$720000$pJyyPskqwNp3rbz73jXKVx$Ilg7qxmbHM487L1JL2innms0hQpTiG9UKzsMh98NnH8=', '2024-02-22 21:41:19.346087', 0, 'dodo', 'Do', 'Do', 'dodo@gmail.com', 0, 1, '2024-02-22 14:59:15.184533'),
(3, 'pbkdf2_sha256$720000$J8nmyQW0MfWSIpFHCv98x4$zLHitGQP1rdcLudwuAyyHhp1BY3ZNvL8gOOnDUEEsGk=', '2024-02-22 21:37:19.434277', 0, 'dodo1', 'Đô', 'Đô', 'dodo1@gmail.com', 0, 1, '2024-02-22 21:37:09.912768');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-02-21 09:29:50.556401', '1', 'Food', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-02-21 09:30:11.916716', '2', 'Drinks', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-02-21 09:31:52.345993', '2', 'Drink', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 8, 1),
(4, '2024-02-21 09:31:57.306932', '2', 'Drinks', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 8, 1),
(5, '2024-02-21 09:32:48.657100', '3', 'All Product', 1, '[{\"added\": {}}]', 8, 1),
(6, '2024-02-21 09:34:51.449841', '1', 'Gà rán', 1, '[{\"added\": {}}]', 7, 1),
(7, '2024-02-21 09:35:00.996700', '1', 'Gà rán', 2, '[]', 7, 1),
(8, '2024-02-21 09:35:25.375054', '2', 'Gà sốt H&S', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-02-21 09:35:51.094649', '3', 'Khoai tây chiên', 1, '[{\"added\": {}}]', 7, 1),
(10, '2024-02-21 09:36:14.886997', '4', 'Coca Cola', 1, '[{\"added\": {}}]', 7, 1),
(11, '2024-02-21 09:40:10.316990', '5', 'Sprite', 1, '[{\"added\": {}}]', 7, 1),
(12, '2024-02-21 09:41:10.623022', '5', 'Sprite', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 7, 1),
(13, '2024-02-21 09:41:36.368830', '6', 'Gà sốt đậu', 1, '[{\"added\": {}}]', 7, 1),
(14, '2024-02-21 09:45:12.607395', '7', 'Gà thảo mộc', 1, '[{\"added\": {}}]', 7, 1),
(15, '2024-02-21 09:46:27.263739', '8', 'Gà sốt phomai', 1, '[{\"added\": {}}]', 7, 1),
(16, '2024-02-21 09:47:24.055547', '9', 'Sữa tươi trân châu đường đen', 1, '[{\"added\": {}}]', 7, 1),
(17, '2024-02-21 09:51:10.631209', '10', 'Khoai tây chiên lắc phô mai', 1, '[{\"added\": {}}]', 7, 1),
(18, '2024-02-21 09:55:48.174734', '9', 'Trà sữa chân trâu', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(19, '2024-02-21 09:55:57.138026', '10', 'Khoai tây chiên lắc phô mai', 2, '[]', 7, 1),
(20, '2024-02-21 09:56:20.365295', '10', 'lắc phô mai', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(21, '2024-02-21 09:56:47.695742', '10', 'Khoai tây chiên lắc phô mai', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(22, '2024-02-22 14:33:31.620128', '1', 'HN', 2, '[{\"changed\": {\"fields\": [\"State\"]}}]', 11, 1),
(23, '2024-02-22 20:47:57.454581', '2', 'None', 3, '', 11, 1),
(24, '2024-02-22 21:11:14.361455', '4', 'None', 3, '', 11, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'app', 'category'),
(9, 'app', 'order'),
(10, 'app', 'orderitem'),
(7, 'app', 'product'),
(11, 'app', 'shippingaddress'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-21 09:26:17.341358'),
(2, 'auth', '0001_initial', '2024-02-21 09:26:17.689981'),
(3, 'admin', '0001_initial', '2024-02-21 09:26:17.779790'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-21 09:26:17.786772'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-21 09:26:17.796744'),
(6, 'app', '0001_initial', '2024-02-21 09:26:18.074636'),
(7, 'app', '0002_product_category', '2024-02-21 09:26:18.160738'),
(8, 'contenttypes', '0002_remove_content_type_name', '2024-02-21 09:26:18.210190'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-02-21 09:26:18.248847'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-02-21 09:26:18.259817'),
(11, 'auth', '0004_alter_user_username_opts', '2024-02-21 09:26:18.268794'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-02-21 09:26:18.304911'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-02-21 09:26:18.306905'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-02-21 09:26:18.318875'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-02-21 09:26:18.330156'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-02-21 09:26:18.340181'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-02-21 09:26:18.355140'),
(18, 'auth', '0011_update_proxy_permissions', '2024-02-21 09:26:18.365113'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-02-21 09:26:18.376084'),
(20, 'sessions', '0001_initial', '2024-02-21 09:26:18.392657'),
(21, 'app', '0003_remove_product_digital', '2024-02-21 09:31:31.336497'),
(22, 'app', '0004_alter_product_price', '2024-02-21 09:34:05.986305'),
(23, 'app', '0005_rename_city_shippingaddress_address_and_more', '2024-02-22 14:26:30.818841');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7wdcdidxp1jslco1ot4v8srad0onbmnu', '.eJxVjMsOwiAQRf-FtSEM5VFcuvcbyAyDUjWQlHZl_HdD0oVu7znnvkXEfStx73mNC4uzAHH63QjTM9cB-IH13mRqdVsXkkORB-3y2ji_Lof7d1Cwl1FPVt1AgZuJM3sVmIMBn4M1c0pJoWbnmcB6RUhkp0DAlvMERjutnPh8AeXUN78:1rdAFu:jYcEyOza4zFRiA3CXKq4X-7GmPAPY04Wv640DX9khTE', '2024-03-07 14:40:58.926687'),
('hq4as7xbm73dy89qcnbd4homfq9e0jhh', '.eJxVjMsOwiAQRf-FtSEj5enSvd9ABgakaiAp7cr479KkC92ec-59M4_bWvzW0-JnYhcm2OmXBYzPVHdBD6z3xmOr6zIHvif8sJ3fGqXX9Wj_Dgr2MtYOzxFCcjQpiZIiULQglZ10DoKcJMrZEBiDSmuFAyTADA5HLcAm9vkC-nY4YA:1rdGoh:FY2bP0pIMZcdHtzyURa_D3I55E0G8KoX0yVnuqxBbbE', '2024-03-07 21:41:19.349007'),
('pv2e3hbq43n7uyhhvpdphubiz0hjlp35', '.eJxVjMsOwiAQRf-FtSEj5enSvd9ABgakaiAp7cr479KkC92ec-59M4_bWvzW0-JnYhcm2OmXBYzPVHdBD6z3xmOr6zIHvif8sJ3fGqXX9Wj_Dgr2MtYOzxFCcjQpiZIiULQglZ10DoKcJMrZEBiDSmuFAyTADA5HLcAm9vkC-nY4YA:1rdFN8:qlIQX9CUBUdQrmDrdv4BiS3txlO-pzwJOKHwHJh6n2U', '2024-03-07 20:08:46.369555');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `app_category`
--
ALTER TABLE `app_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_category_sub_category_id_7b7f6a7f_fk_app_category_id` (`sub_category_id`);

--
-- Chỉ mục cho bảng `app_order`
--
ALTER TABLE `app_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_order_customer_id_7c27c407_fk_auth_user_id` (`customer_id`);

--
-- Chỉ mục cho bảng `app_orderitem`
--
ALTER TABLE `app_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_orderitem_order_id_41257a1b_fk_app_order_id` (`order_id`),
  ADD KEY `app_orderitem_product_id_5f40ddb0_fk_app_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `app_product`
--
ALTER TABLE `app_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_product_category`
--
ALTER TABLE `app_product_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_product_category_product_id_category_id_73528da5_uniq` (`product_id`,`category_id`),
  ADD KEY `app_product_category_category_id_369a9753_fk_app_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `app_shippingaddress`
--
ALTER TABLE `app_shippingaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_shippingaddress_customer_id_24c9534f_fk_auth_user_id` (`customer_id`),
  ADD KEY `app_shippingaddress_order_id_220f1517_fk_app_order_id` (`order_id`);

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `app_category`
--
ALTER TABLE `app_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `app_order`
--
ALTER TABLE `app_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `app_orderitem`
--
ALTER TABLE `app_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `app_product`
--
ALTER TABLE `app_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `app_product_category`
--
ALTER TABLE `app_product_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `app_shippingaddress`
--
ALTER TABLE `app_shippingaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `app_category`
--
ALTER TABLE `app_category`
  ADD CONSTRAINT `app_category_sub_category_id_7b7f6a7f_fk_app_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `app_category` (`id`);

--
-- Các ràng buộc cho bảng `app_order`
--
ALTER TABLE `app_order`
  ADD CONSTRAINT `app_order_customer_id_7c27c407_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `app_orderitem`
--
ALTER TABLE `app_orderitem`
  ADD CONSTRAINT `app_orderitem_order_id_41257a1b_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`),
  ADD CONSTRAINT `app_orderitem_product_id_5f40ddb0_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`);

--
-- Các ràng buộc cho bảng `app_product_category`
--
ALTER TABLE `app_product_category`
  ADD CONSTRAINT `app_product_category_category_id_369a9753_fk_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`),
  ADD CONSTRAINT `app_product_category_product_id_c059d7b6_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`);

--
-- Các ràng buộc cho bảng `app_shippingaddress`
--
ALTER TABLE `app_shippingaddress`
  ADD CONSTRAINT `app_shippingaddress_customer_id_24c9534f_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `app_shippingaddress_order_id_220f1517_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`);

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
