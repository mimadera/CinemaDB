Cena najwieksza (ASC - najmniejsza)
SELECT * FROM Ticket ORDER BY price DESC LIMIT 1;

SELECT * FROM Theater WHERE 3D = '1'

SELECT * FROM movie m WHERE DATE(m.date_start) = '2018-10-09' ORDER BY m.date_start;*/
SELECT * FROM movie m INNER JOIN theater t ON m.theater_id = t.id WHERE LOWER(t.name) = 'warszawa';*/
SELECT * FROM seat s INNER JOIN theater t ON s.theater_id = t.id WHERE LOWER(t.name) = 'polonia' AND s.is_taken = true;
SELECT * FROM scheduledMovie sm WHERE DATE(sm.date_start) = '2018-10-17' ORDER BY sm.date_start;
SELECT * FROM scheduledmovie sm INNER JOIN movie m ON sm.movie_id = m.id WHERE DATE(sm.date_start) = '2018-10-17' ORDER BY sm.date_start;

SELECT * FROM movie WHERE date_start="2018-10-09" order by DESC 

SELECT * FROM Movie WHERE title LIKE '%Wiedz%'