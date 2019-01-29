use MovieHouse;

SELECT cinemaShow.movieTitle, Ticket.price, cinemaShow.theaterName FROM Ticket JOIN cinemaShow ON Ticket.cinemaShow = cinemaShow.id WHERE movieTitle = 'Witcher'  