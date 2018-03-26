-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 27 2018 г., 00:56
-- Версия сервера: 5.7.16
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `labv`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Channel_Desc`
--

CREATE TABLE `Channel_Desc` (
  `id` int(11) NOT NULL,
  `id_Info` int(11) NOT NULL,
  `channel_Num` int(11) NOT NULL,
  `channel_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Channel_Val`
--

CREATE TABLE `Channel_Val` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `id_Channel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Info`
--

CREATE TABLE `Info` (
  `id` int(11) NOT NULL,
  `N_CH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Channel_Desc`
--
ALTER TABLE `Channel_Desc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Channel_Desc` (`id_Info`);

--
-- Индексы таблицы `Channel_Val`
--
ALTER TABLE `Channel_Val`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Channel_Val` (`id_Channel`);

--
-- Индексы таблицы `Info`
--
ALTER TABLE `Info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Channel_Desc`
--
ALTER TABLE `Channel_Desc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Channel_Val`
--
ALTER TABLE `Channel_Val`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Info`
--
ALTER TABLE `Info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Channel_Desc`
--
ALTER TABLE `Channel_Desc`
  ADD CONSTRAINT `fk_Channel_Desc` FOREIGN KEY (`id_Info`) REFERENCES `Info` (`id`)
ON DELETE SET NULL
ON UPDATE SET NULL;
--
-- Ограничения внешнего ключа таблицы `Channel_Val`
--
ALTER TABLE `Channel_Val`
  ADD CONSTRAINT `fk_Channel_Val` FOREIGN KEY (`id_Channel`) REFERENCES `Channel_Desc` (`id`)
ON DELETE SET NULL
ON UPDATE SET NULL;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
