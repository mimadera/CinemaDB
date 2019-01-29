use cinema;
-- tworzenie view
-- CREATE VIEW film_action AS SELECT * FROM Movie; 

-- querrry do wyswietlania 
-- SELECT * FROM film_action ; 


-- View samo sie zaktualizuje jak dodamy coś do oryginalnej Tabeli

-- updatowanie tabeli 

-- forcowanie mozliwosci updatu
-- SET SQL_SAFE_UPDATES = 1;

-- UPDATE film_action SET duration=120; 
-- SELECT IS_UPDATABLE FROM film_action;alter
-- CREATE VIEW user_restricted AS SELECT userId, role, username FROM User;

-- Create view for you database(zad 2)

-- view that displays schedule of movies for today - include only shows that are to be show (do not include 
-- shows that already ended or have already started). Include information about movie title and duration

-- CREATE VIEW movies_today AS SELECT cinemaShow.movieTitle, cinemaShow.date_start, Movie.duration 
-- FROM cinemaShow JOIN Movie
--  ON cinemaShow.movieTitle = Movie.title  WHERE cinemaShow.date_start > NOW() && DATE(cinemaShow.date_start) < ADDDATE(CURDATE(), INTERVAL +1 DAY)
																																												-- = CURDATE()
-- INSERT INTO movies_today                                                                                                                                                                                
																																										
-- drop view tickets_for_today;

 CREATE VIEW tickets_for_today AS SELECT Theater.theaterName, cinemaShow.movieTitle, Seat.seatId, Seat.rowNumber, Seat.seatNumber FROM cinemaShow
 JOIN Theater ON Theater.theaterName = cinemaShow.theaterName JOIN Seat ON Theater.theaterName = Seat.theaterName
 LEFT JOIN Ticket ON Seat.seatId = Ticket.seatId
 WHERE Ticket.seatId IS NULL && cinemaShow.date_start >= NOW() && TIME(cinemaShow.date_start) < '23:00:00'

 SELECT * FROM tickets_for_today;
-- SELECT * FROM movies_today;
-- drop view movies_today;
-- view that displays information about how many seats/tickets are left (available) for today shows - view should contain information 
-- about show and seats/tickets available (not sold), 
-- may contain information about movie to be played during this show. 

-- CREATE VIEW tickets_left_today AS SELECT 


-- w domu ogarnac definer vs invoker

/*
film_comedy
film_action
*/
