CREATE DATABASE IF NOT EXISTS cinema;

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
      
  PRIMARY KEY (`id`));
  
  CREATE TABLE IF NOT EXISTS  `cinema`.`Ticket` (
	 `price` DECIMAL(4,2) not null,
    'cinemaShowID' INT not null,
    'seatId' INT not null,

  FOREIGN KEY (cinemaShowID)
      REFERENCES cinemaShow(cinemaShowID)
      ON UPDATE CASCADE ON DELETE RESTRICT,


  FOREIGN KEY (seatId)
      REFERENCES Seat(seatId)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    PRIMARY KEY (`seatId`, 'cinemaShowID'));

CREATE TABLE IF NOT EXISTS  `cinema`.`Movie` (
	`duration` SMALLINT(199) not null,
    `category` VARCHAR(29),
    `title` VARCHAR(39) not null,
    `description` VARCHAR(255),
    PRIMARY KEY (`title`));

CREATE TABLE IF NOT EXISTS  `cinema`.`cinemaShow` (
	  `cinemaShowId` INT auto_increment not null,
    `date_start` datetime not null,
    `date_end` datetime not null,
    `movieTitle` varchar(39) not null,
    `theaterName` varchar(29) not null,
    CHECK EXTRACT(HOUR FROM date_start) >= "09:00:00"
    
    FOREIGN KEY (theaterName)
      REFERENCES Theater(theaterName)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      
      FOREIGN KEY (movieTitle)
      REFERENCES Movie(title)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      
    PRIMARY KEY (`id`));