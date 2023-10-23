--Список таблиц-
SELECT*FROM species_in_places;
SELECT*FROM places;
SELECT*FROM species;
SELECT*FROM species_type;

--1-Составьте запрос, который выведет имя вида с наименьшим id--
SELECT species_name 
FROM species 
ORDER BY species_id LIMIT 1;
--2-Составьте запрос, который выведет имя вида с количеством 
--представителей более 1800--
SELECT species_name,species_amount FROM species
WHERE species_amount > 1800;
--3-Составьте запрос, который выведет имя вида, начинающегося 
--на «п» и относящегося к типу с type_id = 5.
SELECT*FROM species
WHERE species_name LIKE 'п%'AND type_id=5;
--4-Составьте запрос, который выведет имя вида, заканчивающегося 
--на «са» или количество представителей которого равно 5
SELECT*FROM species
WHERE species_name LIKE '%са';
--5-Составьте запрос, который выведет имя вида, появившегося 
--на учете в 2023 году.
SELECT species_name,date_start
FROM species
WHERE date_start>='2023-01-01';
--6-Составьте запрос, который выведет названия отсутствующего
--(status = absent) вида, расположенного вместе с place_id = 3
SELECT species_name,place_id
FROM species
INNER JOIN species_in_places ON species_in_places . species_id=species. species_id
WHERE species_status='absent'AND place_id = 3;
--7-Составьте запрос, который выведет название вида,
--расположенного в доме и появившегося в мае, 
--а также и количество представителей вида.
SELECT species_name,species_amount
FROM species
INNER JOIN species_in_places ON species_in_places. species_id=species. species_id
INNER JOIN places ON species_in_places. place_id=places. place_id
WHERE place_name='дом' AND date_start='2010-05-30';
--8-Составьте запрос, который выведет название вида,
--состоящего из двух слов (содержит пробел)
--Результат будет соответствовать знаку !
SELECT species_name,date_start
FROM species
WHERE species_name LIKE'% %';
--9-Составьте запрос, который выведет имя вида, появившегося с
--малышом в один день
SELECT s1. species_name 
FROM species s1
INNER JOIN species s2 ON s1.date_start = s2.date_start 
WHERE s2.species_name = 'малыш'AND s1.species_name != 'малыш';
--10-Составьте запрос, который выведет название вида,
--расположенного в здании с наибольшей площадью
SELECT DISTINCT place_name,place_size
FROM places
INNER JOIN species_in_places ON species_in_places. place_id= places. place_id
WHERE place_size =(SELECT MAX (place_size) FROM places);
--11-Составьте запрос/запросы, которые найдут название вида,
--относящегося к 5-й по численности группе проживающей дома
SELECT species_name,species_amount
FROM species
WHERE species_amount IN 
  (SELECT species_amount
   FROM (SELECT ROW_NUMBER() OVER (ORDER BY COUNT (*) DESC) AS rn, species_amount 
         FROM species GROUP BY species_amount) AS tmp
		 WHERE rn=5) 
AND species_name IN (SELECT species_name
		             FROM species
		INNER JOIN species_in_places ON species.species_id=species_in_places.species_id
	    INNER JOIN places ON species_in_places.place_id=places.place_id
	   WHERE places.place_name='дом');
--12-Составьте запрос, который выведет сказочный вид (статус fairy)
--не расположенный ни в одном месте
SELECT species_name,species_status 
FROM species
WHERE species_status='fairy';
					