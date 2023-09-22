INSERT INTO Genre (title_g) VALUES ('Поп-музыка'), ('Джаз'), ('Рок-музыка');

INSERT INTO Singer (name) VALUES ('Долина'), ('Рики Мартин'), ('Валерий Меладзе'), ('Агата Кристи');

INSERT INTO Albom (title, year) VALUES ('Альбом1', '2009-04-23'), ('Альбом2', '2016-07-17'), ('Альбом3', '2020-10-27');

INSERT INTO Song (title_song, long, Albom_id_s) VALUES ('MySong1', 3, 2), ('Song2', 4, 1), ('МойSong3', 5, 3), ('Song4', 6, 1), ('Song5', 3, 2), ('Song6', 7, 3), ('MySong7', 3, 2), ('Song8', 1, 3);

INSERT INTO Collection (title, year) VALUES ('Collection1', '2022-04-24'), ('Collection2', '2015-10-31'), ('Collection3', '2018-03-12'), ('Collection4', '2014-08-28');

INSERT INTO GenreSinger (Genre_id, Singer_id_g) VALUES (1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (3, 3), (3, 4);

INSERT INTO SingerAlbom (Singer_id, Albom_id) VALUES (1, 1), (2, 2), (3, 3), (4, 2);

INSERT INTO SongCollection (Song_id, Collection_id) VALUES (1, 1), (2, 2), (2, 4), (3, 3), (4, 4), (5, 3), (6, 1);
