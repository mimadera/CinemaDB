use cinema;

DELIMITER $$
CREATE PROCEDURE checkEndingHour(

	in date_start datetime,
    in movieTitle varchar(39),
    in theaterName varchar(29))
   
    
BEGIN

set @v1 = (SELECT Movie.duration  FROM Movie WHERE Movie.Title = movieTitle);

IF  (ADDTIME(TIME(date_start), sec_to_time(@v1*60)) <= '23:00:00')

THEN 

INSERT INTO cinemaShow (cinemaShow.date_start, cinemaShow.movieTitle, cinemaShow.theaterName) 
VALUES (date_start, movieTitle, theaterName);

END IF;
END$$ 


