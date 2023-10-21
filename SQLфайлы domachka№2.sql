--выводим таблицу--
SELECT * FROM users;
 
--находим в таблице нужного пользователя--
SELECT * FROM group_student WHERE user_id=9651;

--делаем запрос и задаем алиас меняем имя колонки--
SELECT user_id AS stud_level FROM users;

--выводим уровень студента с id = 9651.Задаём алиас для колонки stud_level, а для таблицы s.
SELECT level as stud_level
FROM student as s
WHERE user_id = 9651;

--выводим email учителей с id 30019 и 31433 (в одном запросе)
SELECT*FROM teacher
WHERE teacher_id IN(30019,31433);

--выводим данные о пользователях с уровнем Advanced, занимающихся в группах (group)
-- и пользователях с уровнем Upper-Intermediate, занимающихся индивидуально (personal).
SELECT*FROM student
WHERE
(level='Advanced'AND education_form='group')
OR(level='Upper-Intermediate'AND education_form='personal');

--выводим данные об учителях из групп от 180 до 190 (group_id).
SELECT * FROM teacher employees
WHERE group_id BETWEEN 180 and 190;

--выводим данные о пользователях, у которых email заканчивается на yahoo.com
SELECT * FROM users
 WHERE user_email LIKE '%yahoo.com';

--добавляем в таблицу subject новый предмет — Chinese (выбрать id, равное 16 или следующее по порядку).
INSERT INTO subject(subject_id,subject_title)
  VALUES (16,'Chinese');

--Проверка—
SELECT*FROM subject;

--обновление данных учителя с id 5562. У него изменилась почта с cold@gmail.com на cold5562@gmail.com.
UPDATE teacher SET email= 'cold5562@gmail.com'
 WHERE teacher_id=5562;

--Проверка—
SELECT*FROM teacher
 WHERE teacher_id=5562;
