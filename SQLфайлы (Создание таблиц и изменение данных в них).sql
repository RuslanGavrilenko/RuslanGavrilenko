--создание таблици--
CREATE TABLE posts ( 
    post_id  INTEGER,
    text_len NUMERIC(16),
    post_date date
);
--проверка созданной таблици--
SELECT * FROM posts;
--создание таблици--
CREATE TABLE tags ( 
    post_id INTEGER,
    tag TEXT);
--проверка сознанной таблици--	
SELECT * FROM tags;
--заполнение таблици данными--
INSERT INTO posts (post_id,text_len,post_date )
VALUES
(1,6799,('2023.03.09')),
(2,7800,('2023.03.12')),
(3,6907,('2023.03.19')),
(4,8890,('2023.03.22')),
(5,9802,('2023.03.30'));
--проверка заполненности--
SELECT * FROM posts;
--заполнение таблици данными--
INSERT INTO tags (post_id,tag) 
VALUES 
(1,'nofilter'),
(2,'happy'),
(3,'joy'),
(4,'music'),
(5,'dark');
--проверка заполненности-- 
SELECT * FROM tags;
--Вывод данных по постам, которые длиннее 8000 символов.
SELECT * FROM posts
WHERE text_len >8000 ;
--Вывод id постов, которые отмечены тегами happy или joy.
SELECT * FROM tags
WHERE post_id IN (2,3); 
--Вывод id постов, которые были размещены до 10 марта 2023.
SELECT * FROM posts
WHERE post_date<'10.03.2023';
--Добавление поста с id 6, сделанный 31 марта 2023, 
--содержащий 10782 символ и отмеченный тегом love (два INSERT в обе таблицы)-/
INSERT INTO posts (post_id,text_len,post_date)
VALUES
(6,10782,'31.03.2023');

INSERT INTO tags (post_id,tag)
VALUES
(6,'love');
--проверка добавления данных в таблицы (tags,posts)--
SELECT * FROM tags; 
--Изменение тег для поста с id =5 c dark на live.
UPDATE tags 
    SET tag='live'
    WHERE post_id=5;
--проверка изменений--
SELECT * FROM tags; 