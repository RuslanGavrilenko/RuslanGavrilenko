                                                 Домашняя робота 1 по  SQL

    (1 запрос"Найдите id (поле user_id) пользователя с почтой houston42@gmail.com (таблица users).

SELECT user_id FROM users
WHERE user_email='houston42@gmail.com'


     (2 запрос)     Найдите уровень (поле level) студента с user_id = 44133 (таблица student)              

SELECT level FROM student   
WHERE user_id=44133;

     (3 запрос)Найдите предмет (поле subject_title) с id = 8 (таблица subject)

SELECT * FROM subject
WHERE subject_id=8; 

     (4 запрос)Найдите email учителя группы с group_id = 80 (таблица teacher)       

SELECT * FROM teacher      
WHERE group_id=80;

     (5-й запрос)Выведите уникальные форматы обучения (education_form) для студента с user_id = 12203 (таблица student).

SELECT DISTINCT education_form FROM student
WHERE user_id = 12203;                            



                                       Дополнительное задание

     1.Создайте таблицу salary (зарплата учителей), используя готовый скрипт.

CREATE TABLE salary ( 
    teacher_id  INTEGER,
    salary_amt  NUMERIC(16,2),
    salary_val  CHAR(3)
);

SELECT * FROM salary;   (Прорерка)
    
     2.Составьте запрос и создайте таблицу rooms (кабинеты). Поля таблицы и их тип можно найти на схеме БД.
 
 CREATE TABLE rooms ( 
	teacher_id INTEGER,
	rooms_nomer NUMERIC(11),
	rooms_floor CHAR(2)
	);
SELECT * FROM rooms;       (Прорерка)

      3.Теперь добавим 5 записей в таблицу salary.
	
INSERT INTO salary (teacher_id, salary_amt, salary_val)
VALUES
(965, 70000, 'RUR'),
(29091,100000, 'RUR'),
(29410, 1000, 'EUR'),
(33576, 1800, 'USD'),
(33902, 1200, 'EUR');

SELECT * FROM salary;      (Прорерка)

    4.Составьте запрос и заполните таблицу rooms следующими данными


SELECT rooms_id,rooms_floor (2)FROM rooms;

INSERT INTO rooms (teacher_id ,rooms_nomer ,rooms_floor)
VALUES
(965,1,1),
(29091,2,1),
(29410,3,1),
(33576,10,2),
(33902,11,2);

SELECT * FROM rooms;        (Прорерка)

      5.Составьте следующие запросы:

Выведите id учителей с кабинетами на втором этаже.
Выведите id учителей, которые получают зарплату в евро.




SELECT *FROM rooms WHERE rooms_floor='2';

SELECT *FROM salary WHERE salary_val='EUR'

                                              

