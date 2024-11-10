-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Ноя 03 2024 г., 06:39
-- Версия сервера: 5.7.44
-- Версия PHP: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `social`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(1, 'ded'),
(2, 'efwe'),
(3, 'wefewd');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `image_url`, `category_id`) VALUES
(1, 1, 'First Post', 'This is the content of the first post', 'https://via.placeholder.com/400x300', 1),
(2, 2, 'Second Post', 'This is the content of the second post', 'https://via.placeholder.com/400x400', 2),
(3, 3, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x600', 1),
(4, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x400', 2),
(5, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x300', 3),
(6, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x400', 1),
(7, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x600', 2),
(8, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x400', 2),
(9, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x300', 3),
(10, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x500', 1),
(11, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x300', 2),
(12, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x400', 3),
(13, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x500', 1),
(14, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x600', 2),
(15, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x400', 2),
(16, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x300', 1),
(17, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x500', 2),
(18, 1, 'Third Post', 'This is the content of the third post', 'https://via.placeholder.com/400x300', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `avatar_url`) VALUES
(1, 'John Doe', 'https://via.placeholder.com/300x300'),
(2, 'Jane Smith', 'https://via.placeholder.com/300x300'),
(3, 'Alice Brown', 'https://via.placeholder.com/300x300');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
