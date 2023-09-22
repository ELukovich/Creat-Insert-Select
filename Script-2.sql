--2.1 Название и продолжительность самого длительного трека.
SELECT title_song, long FROM Song
WHERE long = (SELECT MAX(long) FROM Song); 

--2.2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT title_song, long FROM Song
WHERE long >= 3.5; 

--2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title FROM Collection
WHERE DATE(year) BETWEEN '2018-01-01' AND '2020-12-31';

--2.4 Исполнители, чьё имя состоит из одного слова.
SELECT name FROM Singer
WHERE name NOT LIKE '% %';

--2.5 Название треков, которые содержат слово «мой» или «my».
SELECT title_song FROM Song
WHERE title_song iLIKE '%Мой%' OR title_song LIKE '%My%';

--3.1 Количество исполнителей в каждом жанре.
SELECT title_g, COUNT(Singer_id_g) FROM Genre g
LEFT JOIN GenreSinger gs ON gs.genre_id = g.id
GROUP BY g.title_g;

--3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT title, COUNT(title_song) FROM Albom a
LEFT JOIN Song s ON s.Albom_id_s = a.id
GROUP BY a.title;

--3.3 Средняя продолжительность треков по каждому альбому.
SELECT title, AVG(long) FROM Albom a
LEFT JOIN Song s ON a.id = s.Albom_id_s
GROUP BY a.title;

--3.4(9) Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT name FROM Singer s
FULL JOIN SingerAlbom sa ON sa.Singer_id = s.id
LEFT JOIN Albom a ON sa.Albom_id = a.id
WHERE name NOT IN (SELECT name FROM Singer s
FULL JOIN SingerAlbom sa ON sa.Singer_id = s.id
LEFT JOIN Albom a ON sa.Albom_id = a.id WHERE EXTRACT(YEAR FROM year) = 2020)
GROUP BY s.name;

--3.5(10) Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT title FROM Collection c
RIGHT JOIN SongCollection sc ON sc.collection_id = c.id
INNER JOIN Song s ON s.id = sc.Song_id
INNER JOIN SingerAlbom sa ON sa.Albom_id = s.Albom_id_s
INNER JOIN Singer si ON si.id = sa.Singer_id
WHERE name LIKE '%Долина%';

--4.1(11) Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT title, COUNT(Genre_id) FROM Albom a
JOIN SingerAlbom sa ON sa.Albom_id = a.id
JOIN GenreSinger gs ON gs.Singer_id_g = sa.Singer_id
JOIN Genre g ON gs.Genre_id = g.id
GROUP BY a.title
HAVING COUNT(Genre_id) > 1;

--4.2(12) Наименования треков, которые не входят в сборники.
SELECT title_song FROM Song s
LEFT JOIN SongCollection sc ON sc.song_id = s.id
WHERE sc.collection_id IS NULL;

--4.3(13) Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT name, long FROM Singer si
FULL JOIN SingerAlbom sa ON si.id = sa.Singer_id
FULL JOIN Song s ON s.Albom_id_s = sa.id
WHERE s.long = (SELECT MIN(long) FROM Song);

--4.4(14) Названия альбомов, содержащих наименьшее количество треков.
SELECT DISTINCT title, COUNT(title_song) FROM Albom a
FULL JOIN Song s ON s.Albom_id_s = a.id
GROUP BY a.title
HAVING COUNT(title_song) = (SELECT MIN(COUNT) FROM (SELECT COUNT(title_song) FROM Albom a
FULL JOIN Song s ON s.Albom_id_s = a.id
GROUP BY a.title)ff);



