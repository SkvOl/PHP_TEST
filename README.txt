ФАЙЛ С ОПИСАНИЕМ РАБОТЫ


Логика работы базы данных:
Существует 2 таблицы "Specialities1" и "Subjects1" с неповторяющимеся элементами.
Эти таблицы показывают список различных специальностей ("Specialities1") и 
различных предметов ("Subjects1"). Логика взаимосвязи специальности с различными 
субъектами(предметами) реализована в таблице "Subjects_to_specialities1" с 
повторяющимеся элементами(т.к на одну специальность приходится три субъекта).
Время экзамена и его индекс находятся в таблице "Schedule1" с повторяющимеся элементами
(т.к. в одно и тоже время может проходить два различных экзамена).   

Файл index.php:
На главной странице расположен календарь, ниже расположены поля для добавления времени
(даты) и названия выбранного предмета.

Файл Add.php:
Нажав на кнопку "добавить" запускается Add.php, на строках 3-5 считываются выбраные 
данные в соответствующие переменные. Далеее, объединив дату и время, подключаемся к 
базе данных, на строках 10-11 выбираем кодировку (на строке 13 комментарий с выводом
названия выбранного предмета в "title" в таблицу "Subjects1". Эта строка нам не 
понадобится). Далее расположен запрос на считывание индекса предмета по полученному
названию из таблицы "Subjects1". Далее полученный индекс и время записываем в таблицу
"Schedule1". Таким образом мы полностью заполнили строку таблицы "Schedule1".

Файл table.php:
При нажатии на ссылку на главной странице мы переходим в файл table.php. После
подключения стилей мы считываем в переменную $day выбраный день и выводим его на 
экран (строки 15-16). Далее выводим шапку таблицы (19-31). После чего подключаемся к
базе данных к таблице "Schedule1" и СОРТИРУЯ считываем время и индекс предмета 
только в нужной нам дате (38-50). По полученному индексу предмета делаем запрос в 
таблицу "Subjects1" на получение названия предмета (52-55) и обращаемся к таблице
"Subjects_to_specialities1" для получения индекса соответствующей специальности(57-60).
По полученному индексу специальности получаем название этой специальности и выводим 
все полученные данные на экран (62-82). Далее выводим на экран количество итераций
цикла которые являются количеством экзаменов в этот день.

Ссылка на сайт: http://www.skvol.infinityfreeapp.com/

