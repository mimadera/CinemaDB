CREATE DATABASE IF NOT EXISTS cinema;
use cinema;
CREATE TABLE IF NOT EXISTS  `cinema`.`Theater` (
	`theaterName` VARCHAR(29) not null,
  `capacity` SMALLINT NOT NULL,
  `3D` BOOL NOT NULL,
    PRIMARY KEY (`theaterName`));

CREATE TABLE IF NOT EXISTS `cinema`.`Seat` (
  `seatId` INT AUTO_INCREMENT not null,
  `rowNumber` SMALLINT(100) not null,
  `seatNumber` SMALLINT(100) not null,
  `theaterName` VARCHAR(29) not null,
  
  FOREIGN KEY (theaterName)
      REFERENCES Theater(theaterName)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      
	PRIMARY KEY (`seatId`));
  


CREATE TABLE IF NOT EXISTS  `cinema`.`Movie` (
	`duration` SMALLINT(199) not null,
    `category` VARCHAR(29),
    `title` VARCHAR(39) not null,
    `description` VARCHAR(255),
    PRIMARY KEY (`title`));

CREATE TABLE IF NOT EXISTS  `cinema`.`cinemaShow` (
	  `cinemaShowId` INT auto_increment not null,
    `date_start` datetime not null,
    `movieTitle` varchar(39) not null,
    `theaterName` varchar(29) not null,
    CHECK (TIME(date_start) >= '09:00:00'),
  
    
    FOREIGN KEY (theaterName)
      REFERENCES Theater(theaterName)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      
      FOREIGN KEY (movieTitle)
      REFERENCES Movie(title)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	PRIMARY KEY (`cinemaShowId`));
    
    CREATE TABLE IF NOT EXISTS  `cinema`.`Users` (
  `userId` BIGINT not null,
  `role` VARCHAR(255) not null,
  `password` VARCHAR(255) not null,
  `username` VARCHAR(255) not null,
    PRIMARY KEY (`userId`));
    
      CREATE TABLE IF NOT EXISTS  `cinema`.`Ticket` (
	 `price` DECIMAL(4,2) NOT NULL,
    `cinemaShowId` INT not null,
    `seatId` INT not null,
	`ticketId` INT AUTO_INCREMENT not null,

  FOREIGN KEY (cinemaShowId)
      REFERENCES cinemaShow(cinemaShowId)
      ON UPDATE CASCADE ON DELETE RESTRICT,


  FOREIGN KEY (seatId)
      REFERENCES Seat(seatId)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      unique key (seatId, cinemaShowId),
  PRIMARY KEY (`ticketId`));
  
    
      