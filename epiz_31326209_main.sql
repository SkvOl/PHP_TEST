-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql111.epizy.com
-- Время создания: Мар 21 2022 г., 00:00
-- Версия сервера: 10.3.27-MariaDB
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `epiz_31326209_main`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Schedule1`
--

CREATE TABLE `Schedule1` (
  `id` int(11) NOT NULL,
  `id_subject` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Связь дисциплин и специальностей со временем';

--
-- Дамп данных таблицы `Schedule1`
--

INSERT INTO `Schedule1` (`id`, `id_subject`, `date_time`) VALUES
(1, 1, '2022-03-01 09:00:00'),
(2, 2, '2022-03-07 09:00:00'),
(3, 3, '2022-03-03 12:00:00'),
(4, 4, '2022-03-02 09:00:00'),
(5, 5, '2022-03-01 12:00:00'),
(6, 6, '2022-03-03 09:00:00'),
(7, 7, '2022-03-04 09:00:00'),
(8, 8, '2022-03-05 12:00:00'),
(9, 9, '2022-03-04 12:00:00'),
(10, 10, '2022-03-05 09:00:00'),
(11, 11, '2022-03-06 09:00:00'),
(12, 12, '2022-03-07 12:00:00'),
(13, 13, '2022-03-02 12:00:00'),
(14, 14, '2022-03-06 12:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `Specialities1`
--

CREATE TABLE `Specialities1` (
  `id` int(11) NOT NULL,
  `code_sp` int(11) DEFAULT NULL,
  `title` varchar(150) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Специальности и код специальностей';

--
-- Дамп данных таблицы `Specialities1`
--

INSERT INTO `Specialities1` (`id`, `code_sp`, `title`) VALUES
(1, 1, 'Фундаментальная математика'),
(2, 2, 'Прикладная математика'),
(3, 3, 'Экономика'),
(4, 4, 'Физика'),
(5, 5, 'Программирование'),
(6, 6, 'Право'),
(7, 7, 'Филология'),
(8, 8, 'Литература');

-- --------------------------------------------------------

--
-- Структура таблицы `Subjects1`
--

CREATE TABLE `Subjects1` (
  `id` int(11) NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Названия различных дисциплин.';

--
-- Дамп данных таблицы `Subjects1`
--

INSERT INTO `Subjects1` (`id`, `title`) VALUES
(5, 'Алгебра'),
(3, 'Дифференциальные уравнения'),
(8, 'История Руси'),
(6, 'История экономики'),
(14, 'Литература'),
(11, 'ПОПД'),
(9, 'Программирование'),
(12, 'Русский язык'),
(10, 'Создание и управление БД'),
(2, 'УСЧП'),
(7, 'Физика'),
(13, 'Философия'),
(1, 'Функциональный анализ'),
(4, 'Экономика');

-- --------------------------------------------------------

--
-- Структура таблицы `Subjects_to_specialities1`
--

CREATE TABLE `Subjects_to_specialities1` (
  `id` int(11) NOT NULL,
  `id_speciality` int(11) DEFAULT NULL,
  `id_subject` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Связь дисциплин и специальностей.';

--
-- Дамп данных таблицы `Subjects_to_specialities1`
--

INSERT INTO `Subjects_to_specialities1` (`id`, `id_speciality`, `id_subject`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 4, 2),
(11, 4, 7),
(12, 4, 8),
(13, 5, 9),
(14, 5, 5),
(15, 5, 10),
(16, 6, 11),
(17, 6, 12),
(18, 6, 13),
(19, 7, 12),
(20, 7, 11),
(21, 7, 13),
(22, 8, 14),
(23, 8, 13),
(24, 8, 12);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Schedule1`
--
ALTER TABLE `Schedule1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Schedule1_ibfk_1` (`id_subject`);

--
-- Индексы таблицы `Specialities1`
--
ALTER TABLE `Specialities1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_sp` (`code_sp`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Индексы таблицы `Subjects1`
--
ALTER TABLE `Subjects1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Индексы таблицы `Subjects_to_specialities1`
--
ALTER TABLE `Subjects_to_specialities1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Subjects_to_specialities1_ibfk_1` (`id_speciality`),
  ADD KEY `Subjects_to_specialities1_ibfk_2` (`id_subject`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Schedule1`
--
ALTER TABLE `Schedule1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Specialities1`
--
ALTER TABLE `Specialities1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `Subjects1`
--
ALTER TABLE `Subjects1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Subjects_to_specialities1`
--
ALTER TABLE `Subjects_to_specialities1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Schedule1`
--
ALTER TABLE `Schedule1`
  ADD CONSTRAINT `Schedule1_ibfk_1` FOREIGN KEY (`id_subject`) REFERENCES `Subjects1` (`id`) ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `Subjects_to_specialities1`
--
ALTER TABLE `Subjects_to_specialities1`
  ADD CONSTRAINT `Subjects_to_specialities1_ibfk_1` FOREIGN KEY (`id_speciality`) REFERENCES `Specialities1` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `Subjects_to_specialities1_ibfk_2` FOREIGN KEY (`id_subject`) REFERENCES `Subjects1` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
