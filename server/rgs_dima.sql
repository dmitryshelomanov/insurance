-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 31 2017 г., 13:24
-- Версия сервера: 5.7.11
-- Версия PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rgs_dima`
--

-- --------------------------------------------------------

--
-- Структура таблицы `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `agents`
--

INSERT INTO `agents` (`id`, `name`, `text`, `phone`, `created_at`, `updated_at`) VALUES
(5, 'дима', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque laudantium porro amet dolorum soluta nobis dignissimos esse a quasi illo dolorem commodi, voluptatibus non deserunt pariatur libero maiores tempore dolore.', 654654, '2017-03-20 17:21:36', '2017-03-20 17:21:36'),
(6, 'дима1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque laudantium porro amet dolorum soluta nobis dignissimos esse a quasi illo dolorem commodi, voluptatibus non deserunt pariatur libero maiores tempore dolore.', 654654, '2017-03-20 17:21:38', '2017-03-20 17:21:38'),
(7, 'дима2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque laudantium porro amet dolorum soluta nobis dignissimos esse a quasi illo dolorem commodi, voluptatibus non deserunt pariatur libero maiores tempore dolore.', 654654, '2017-03-20 17:21:39', '2017-03-20 17:21:39'),
(8, 'дима3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque laudantium porro amet dolorum soluta nobis dignissimos esse a quasi illo dolorem commodi, voluptatibus non deserunt pariatur libero maiores tempore dolore.', 654654, '2017-03-20 17:21:40', '2017-03-20 17:21:40'),
(9, 'ddfdf', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque laudantium porro amet dolorum soluta nobis dignissimos esse a quasi illo dolorem commodi, voluptatibus non deserunt pariatur libero maiores tempore dolore.', 54654, '2017-03-20 17:21:42', '2017-03-20 17:21:42');

-- --------------------------------------------------------

--
-- Структура таблицы `insurance`
--

CREATE TABLE IF NOT EXISTS `insurance` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `insurance`
--

INSERT INTO `insurance` (`id`, `name`, `price`, `text`, `created_at`, `updated_at`) VALUES
(7, 'test', 100.00, '<h3><font color="#ff0000"><b>нет это а summernote это визивиг редактор</b></font></h3><h3><font color="#ff0000"><b>он весь код да и его в бд из бд на станицу</b></font></h3><h3><font color="#ff0000"><b><br></b></font></h3><h3><font color="#ff0000"><b>нет это я просто прикрутил ну так да что бы не делать панель я все сделал на сайте</b></font></h3>', NULL, '2017-03-31 05:48:27'),
(8, 'test2', 500.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2017_02_11_161620_Users', 1),
(7, '2017_03_12_102058_Agent', 1),
(8, '2017_03_12_102226_Insurance', 1),
(9, '2017_03_12_102217_Orders', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2d67e8231b66696cc260f2c709e64f3c99550590fe45e4b90b7d554925995e6bfda7247906035919', 1, 2, NULL, '[]', 0, '2017-03-31 05:26:47', '2017-03-31 05:26:47', '2018-03-31 09:26:47'),
('90fa25744280980f0cf8b40aced6d9910d5c645cae37a4ba5ca0963cf3266cb5b449acd7fbfe28d3', 2, 2, NULL, '[]', 0, '2017-03-31 05:46:28', '2017-03-31 05:46:28', '2018-03-31 09:46:28'),
('d53988c1f3c65e36379d67b625d1e9a1c225aef30e613b2e2b40d539a835caf240bed8b0381860a9', 2, 2, NULL, '[]', 0, '2017-03-26 05:49:46', '2017-03-26 05:49:46', '2018-03-26 09:49:46');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'gEQ2yj8fXbaDHNXpGA9JAjh8C6XkyDCN3VFX6dtt', 'http://localhost', 1, 0, 0, '2017-03-12 06:44:35', '2017-03-12 06:44:35'),
(2, NULL, 'Laravel Password Grant Client', 'zuwZjwP2whDqGYytR3WYfXhaV3B19clL0QYLsGQi', 'http://localhost', 0, 1, 0, '2017-03-12 06:44:35', '2017-03-12 06:44:35');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('1bb6f6278dd24a5376b8ede2618761c226ed18f43cab2c2ef5016b9b0c8d746528edda6b3f550768', '6061df382aec54af5cd583dc618cd1f1590cf9f22cd162dddb36070f04204e33631940d927697704', 0, '2018-03-14 09:28:01'),
('1d925d0cfe8c7338e85abeff3c3cb10663529bfae3b6f9eb8d0c4d5fda431189d11f6cfa1a9da500', 'd53988c1f3c65e36379d67b625d1e9a1c225aef30e613b2e2b40d539a835caf240bed8b0381860a9', 0, '2018-03-26 09:49:46'),
('2cf7bfccf99ade174516fcc7cdc77c68e9f3f1bac3d6a62cddf52a2685be939ea7fb4e0634176e99', '69a4c8dc445c2def65a7d6ef270bb284dd92f0cf3f6a2d787ae0d06cd995ad3475037a8abe408469', 0, '2018-03-14 15:31:33'),
('45badb145d1b666952328c91e7648b0d534e957275a2908b879f0bead86fa40739bfd9322bbfa96c', '4b980883685944f535532bf9443655eccb8b7393de24bc3b3abb8daf084d7d304458af023ff849e5', 0, '2018-03-14 09:22:54'),
('614c32bf6c75f1f9e38e746b2d03c0eb56986e8d99eb5e617a3dd274ff26176a6d102c7e13134c2b', '41da5046e0f4a66980342b2b9b5a7b0023de194f6bd3cb85866f1eb95a52b9d9efd98b9229302cbd', 0, '2018-03-14 14:15:06'),
('7b00b7c2385075fb7c014b724d21a5ebcd60e6dd3154c94d60d31c82ecb05635d0aba8b3af97affe', '55c9c5a0958a7b4d6d55f18553a8094f879f2df366cbffbfcb976dd823d5d67271c125ec3ab8464d', 0, '2018-03-14 14:12:46'),
('816cc01e9db425a92f1120c49efe123282daa985eaeddd4073a1053b00c2bdf0d0be75b7c1de08a1', '2d67e8231b66696cc260f2c709e64f3c99550590fe45e4b90b7d554925995e6bfda7247906035919', 0, '2018-03-31 09:26:47'),
('89652cb5700e25999e879799d020ca78bf95081c9620f874e180941d203769a438fdc93a17b77690', '90fa25744280980f0cf8b40aced6d9910d5c645cae37a4ba5ca0963cf3266cb5b449acd7fbfe28d3', 0, '2018-03-31 09:46:28'),
('ba054ed4b826b1606053cb531ecaa83a2e6af2c1090ac304a771f4907379fea2ee431d0f67601b74', '41422774d52a4843a6cc34e29eef4915c09d26f58805c69ec0685fa42f1b6e3b2703b543ba4ce1ce', 0, '2018-03-14 14:15:49'),
('fb709fda1909ab07990f9750e8b142dca3ddbb4f535c5e5b034b1f6a2211a336d239546426bd1b81', '3304512b897df1bce2d681ec90d5ae19d9e31aba6a96b65228773d69d9c2d0ff240379ee5f0c94a1', 0, '2018-03-14 14:10:21');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `insurance_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passport` int(11) DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT '-',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `passport`, `address`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'дима', 'dima', 1020304060, 'Брянская обл., Трубчевск', '$2y$10$XeIXjxJUngMDNOnMDAnRL.OsRzD4CwikXPZrvTLgZInCzBNI1K1Hi', 0, NULL, '2017-03-12 19:36:53', '2017-03-12 19:36:54'),
(2, 'Димас', 'admin', 1010101010, '-', '$2y$10$gq0ecWtsqyD7eoYMIqYIB.8chJQBSaHCj.KtY/AU41s9aA2jU9AaW', 1, NULL, '2017-03-12 19:36:55', '2017-03-12 19:36:55');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Индексы таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_insurance_id_foreign` (`insurance_id`),
  ADD KEY `orders_agent_id_foreign` (`agent_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `insurance`
--
ALTER TABLE `insurance`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  ADD CONSTRAINT `orders_insurance_id_foreign` FOREIGN KEY (`insurance_id`) REFERENCES `insurance` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
