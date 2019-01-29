use cinema;

SELECT movie.Title, Theater.theaterName FROM Movie RIGHT JOIN cinemaShow ON cinemaShow.movieTitle=movie.Title JOIN Theater ON theater.theaterName=cinemaShow.theaterName