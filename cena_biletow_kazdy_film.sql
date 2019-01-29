use cinema;
SELECT title, price FROM Ticket JOIN cinemaShow ON cinemaShow.id=ticket.cinemaShow JOIN Movie ON Movie.title=cinemaShow.movieTitle