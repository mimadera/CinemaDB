use cinema;

DELIMITER $$
CREATE PROCEDURE sellTicket(

	in price decimal(4,2),
	in cinemaShow int(11),
    in t_seat_id int(11))
   
    
BEGIN


INSERT INTO Ticket (Ticket.price, Ticket.cinemaShowId, Ticket.seatId)  
    SELECT price, cinemaShow, t_seat_id
        FROM DUAL
        WHERE EXISTS (SELECT cinemaShow.cinemaShowId, cinemaShow.theaterName, Seat.seatId, Seat.theaterName FROM Ticket 
											JOIN cinemaShow ON cinemaShow = cinemaShow.cinemaShowId 
                                            JOIN Seat ON t_seat_id = Seat.seatId WHERE cinemaShow.theaterName = Seat.theaterName);

END$$


