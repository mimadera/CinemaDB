use MovieHouse;
/*
SELECT cinemaShow.movieTitle , Movie.duration FROM cinemaShow JOIN Movie ON cinemaShow.movieTitle = Movie.title;
*/
/*
SELECT cinemaShow.movieTitle, Movie.category FROM cinemaShow JOIN Movie ON cinemaShow.movieTitle = Movie.title WHERE Movie.category = 'Dokument';
*/
/*
SELECT Seat.row_no, Seat.seat_number, Theater.theaterName FROM Seat RIGHT JOIN Theater ON Seat.theaterName = Theater.theaterName;
*/
/*
SELECT cinemaShow.movieTitle, Ticket.price FROM cinemaShow JOIN Ticket ON Ticket.cinemaShow = cinemaShow.id WHERE price > 19.51;
*/
/*
SELECT cinemaShow.movieTitle, Movie.duration, cinemaShow.date_start FROM cinemaShow JOIN Movie ON Movie.title = cinemaShow.movieTitle;
*/
/*
SELECT cinemaShow.date_start, Movie.title FROM cinemaShow JOIN Movie ON movie.title = cinemaShow.movieTitle WHERE cinemaShow.date_start > '2018-10-25 15:00:00'
*/
/*
SELECT Movie.title, cinemaShow.date_start, cinemaShow.date_end FROM cinemaShow JOIN Movie ON Movie.title = cinemaShow.movieTitle WHERE cinemaShow.date_end < '2018-10-27 15:00:00'
*/
/*
SELECT cinemaShow.movieTitle , Ticket.price, Theater.capacity FROM Ticket JOIN cinemaShow ON Ticket.cinemaShow = cinemaShow.id JOIN Theater ON Theater.theaterName = cinemaShow.theaterName;
*/

