--Найдите учеников и все группы, в которых преподает учитель, 
--с почтой blanda.jamil@yahoo.com.

SELECT*FROM teacher;
SELECT  group_student.user_id,
        group_student.group_id,
        teacher.teacher_id, 
        teacher.email	    
FROM group_student
INNER JOIN  teacher
ON group_student.group_id=teacher.group_id
WHERE  teacher.email = 'blanda.jamil@yahoo.com'

--Выведите уровень ученика с почтой gpagac@jacobs.com
SELECT  student.level,
        users.user_email
FROM student
INNER JOIN users
ON student.user_id=users.user_id
WHERE users.user_email='gpagac@jacobs.com';

--Выведите уникальные названия предметов, которые изучает, 
--ученик c user_id=11300 (таблицы user и subject).

SELECT DISTINCT subject_title FROM subject
INNER JOIN users
ON subject.subject_id=users.subject_id
WHERE user_id=11300; 
                          
--Выведите уникальные уровни учеников, которые занимаются в группе с id = 10.
SELECT*FROM group_student;
SELECT DISTINCT level FROM student
INNER JOIN group_student
ON student.user_id=group_student.user_id
WHERE group_student.group_id=10;
  
--Или же можно составить такой запрос с Алиасами--
SELECT DISTINCT s.level
FROM student as s
JOIN group_student as gs ON s.user_id = gs.user_id 
WHERE gs.group_id = 10;

--Ссылка на соединение таблиц(статтья): https://shra.ru/2017/09/sql-join-v-primerakh-s-opisaniem/


