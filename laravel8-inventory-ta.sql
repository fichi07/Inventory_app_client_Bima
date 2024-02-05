-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for laravel_inventory_ta
CREATE DATABASE IF NOT EXISTS `laravel_inventory_ta` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `laravel_inventory_ta`;

-- Dumping structure for table laravel_inventory_ta.applications
CREATE TABLE IF NOT EXISTS `applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.applications: ~0 rows (approximately)
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` (`id`, `name`, `copyright`) VALUES
	(1, 'PT. Auto Sunrise Mandiri', 'Inventaris 2023');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.brands: ~0 rows (approximately)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.expenditure_transactions
CREATE TABLE IF NOT EXISTS `expenditure_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `picker` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expenditure_transactions_reference_number_unique` (`reference_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.expenditure_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `expenditure_transactions` DISABLE KEYS */;
INSERT INTO `expenditure_transactions` (`id`, `picker`, `reference_number`, `remarks`, `created_at`) VALUES
	(7, 'ucok', '321412521', 'Disetujui', 1686595610);
/*!40000 ALTER TABLE `expenditure_transactions` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.expenditure_transaction_items
CREATE TABLE IF NOT EXISTS `expenditure_transaction_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `expenditure_transaction_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `expenditure_transaction_items_expenditure_transaction_id_foreign` (`expenditure_transaction_id`),
  KEY `expenditure_transaction_items_item_id_foreign` (`item_id`),
  CONSTRAINT `expenditure_transaction_items_expenditure_transaction_id_foreign` FOREIGN KEY (`expenditure_transaction_id`) REFERENCES `expenditure_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenditure_transaction_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.expenditure_transaction_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `expenditure_transaction_items` DISABLE KEYS */;
INSERT INTO `expenditure_transaction_items` (`id`, `expenditure_transaction_id`, `item_id`, `amount`) VALUES
	(15, 7, 4, 23.45);
/*!40000 ALTER TABLE `expenditure_transaction_items` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.income_transactions
CREATE TABLE IF NOT EXISTS `income_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `income_transactions_reference_number_unique` (`reference_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.income_transactions: ~2 rows (approximately)
/*!40000 ALTER TABLE `income_transactions` DISABLE KEYS */;
INSERT INTO `income_transactions` (`id`, `supplier`, `reference_number`, `remarks`, `created_at`) VALUES
	(3, 'udin', '32141251', 'Disetujui', 1686570078),
	(4, 'jamal', '1123241', 'Belum Disetujui', 1686590692),
	(5, 'jamal', '112324121', 'Disetujui', 1686594268),
	(6, 'ucil', '3215124', 'Belum Disetujui', 1686597410);
/*!40000 ALTER TABLE `income_transactions` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.income_transaction_items
CREATE TABLE IF NOT EXISTS `income_transaction_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `income_transaction_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `income_transaction_items_income_transaction_id_foreign` (`income_transaction_id`),
  KEY `income_transaction_items_item_id_foreign` (`item_id`),
  CONSTRAINT `income_transaction_items_income_transaction_id_foreign` FOREIGN KEY (`income_transaction_id`) REFERENCES `income_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `income_transaction_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.income_transaction_items: ~3 rows (approximately)
/*!40000 ALTER TABLE `income_transaction_items` DISABLE KEYS */;
INSERT INTO `income_transaction_items` (`id`, `income_transaction_id`, `item_id`, `amount`) VALUES
	(8, 4, 3, 24.10),
	(9, 5, 5, 23.45),
	(10, 3, 5, 234.71),
	(11, 3, 4, 1003.45),
	(12, 6, 4, 10.50);
/*!40000 ALTER TABLE `income_transaction_items` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `part_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `satuan_brg` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_part_number_unique` (`part_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.items: ~2 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `part_number`, `description`, `price`, `image`, `satuan_brg`) VALUES
	(3, 'Q070', 'Transparency Enhancing Binder', 576.00, NULL, 'kilogram'),
	(4, 'Q065', 'connector', 410.00, NULL, 'gram'),
	(5, 'Q110', 'white', 460.00, 'uploads/images/CIj80M989ls5nh6R61BWX26eN791f7I6s7xVVg27.jpg', 'gram');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.migrations: ~13 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_02_19_160145_create_categories_table', 1),
	(6, '2023_02_19_160817_create_brands_table', 1),
	(7, '2023_02_19_161034_create_unit_of_measurements_table', 1),
	(8, '2023_02_19_161439_create_items_table', 1),
	(9, '2023_02_19_163153_create_income_transactions_table', 1),
	(10, '2023_02_19_163943_create_income_transaction_items_table', 1),
	(11, '2023_02_19_165530_create_expenditure_transactions_table', 1),
	(12, '2023_02_19_165908_create_expenditure_transaction_items_table', 1),
	(13, '2023_02_20_014831_create_applications_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.unit_of_measurements
CREATE TABLE IF NOT EXISTS `unit_of_measurements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.unit_of_measurements: ~0 rows (approximately)
/*!40000 ALTER TABLE `unit_of_measurements` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_of_measurements` ENABLE KEYS */;

-- Dumping structure for table laravel_inventory_ta.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','Operator') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_inventory_ta.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'John Doe', 'mrama08282@gmail.com', 'admin', NULL, '$2y$10$Mx.Tf0q3OPAl5MeGKEDJPeeQATfwRwVtJ6QiMQq5kTbfE47KWHwgW', 'Admin', NULL, 1686489155, NULL),
	(2, 'Jane Doe', 'janedoe@gmail.com', 'operator', NULL, '$2y$10$73fuNk1L.ecRgssjaREs8OgPllIiEzGIhQjKEUEehLoZh2apvDG56', 'Operator', NULL, 1686489155, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
