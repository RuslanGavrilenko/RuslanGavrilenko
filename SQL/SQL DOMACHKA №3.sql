-/(Группировка)найти общее ко-во индивидуально
 обучающихся студентов для каждого уровня/-
SELECT level,
COUNT(*)
FROM  student
GROUP BY level;
--Найдите общее кол-во учащихся школы с уровнем Advanced для каждой формы обучения--
SELECT level,
COUNT(*)
FROM  student
WHERE level IN('Advanced')
GROUP BY level;
-/Найдите общее кол-во учащихся школы в разрезе уровня и формы
обучения,отсортированных по уровню в порядке возрастания и по
форме обучения в порядке убывания/-
SELECT level,education_form,
COUNT(*)
FROM  student
GROUP BY level,education_form
ORDER BY education_form DESC;
--отсортировка по убывани(отдельно)--
SELECT *
FROM  student
ORDER BY education_form DESC ;
--отсортировка по возростанию(отдельно)--
SELECT *
FROM  student
ORDER BY level ASC ;
--найдите максимальное и минимальное id групы (одним запросом)--
SELECT MIN(group_id),MAX(group_id)
FROM group_student;
--найдите кол-во учеников и id группы,в которой найбольшее,
--кол-во учеников--
SELECT*FROM group_student
ORDER BY user_id,group_id DESC
LIMIT 7;

