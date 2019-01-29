CREATE DATABASE IF NOT EXISTS movieHouse;
use movieHouse;
CREATE TABLE IF NOT EXISTS  `movieHouse`.`Theater` (
	`theater_id` VARCHAR(255) not null,
  `capacity` SMALLINT NOT NULL,
  `3D` BOOL NOT NULL,
    PRIMARY KEY (`theater_id`));

CREATE TABLE IF NOT EXISTS `movieHouse`.`Seat` (
  `id` INT(254) AUTO_INCREMENT not null,
  `row_num` SMALLINT(100) not null,
  `seat_num` SMALLINT(100) not null,
  `theater_id` VARCHAR(255) not null,
  
      KEY idx_seat_theater_id_idx ( `id`,`theater_id`),
  
  FOREIGN KEY (theater_id)
      REFERENCES Theater(theater_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      
	PRIMARY KEY (`id`));
  


CREATE TABLE IF NOT EXISTS  `movieHouse`.`Movie` (
	`duration` SMALLINT(199) not null,
    `category` VARCHAR(29),
    `title` VARCHAR(39) not null,
    `description` VARCHAR(255),
    PRIMARY KEY (`title`))ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS  `movieHouse`.`scheduledMovie` (
	  `id` INT(254)  auto_increment not null,
    `date_start` datetime not null,
    `movie_title` varchar(39) not null,
    `theater_id` varchar(255) not null,
    CHECK (TIME(date_start) >= '09:00:00'),
    
   KEY idx_scheduledMovie_theater_id_idx ( `id`,`theater_id`),
  
    
    FOREIGN KEY (theater_id)
      REFERENCES Theater(theater_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
      
      FOREIGN KEY (movie_title)
      REFERENCES Movie(title)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	PRIMARY KEY (`id`));
    
      CREATE TABLE IF NOT EXISTS  `movieHouse`.`Ticket` (
	 `price` DECIMAL(4,2) NOT NULL CHECK (price > 0),
    `scheduledMovie_id` INT(254)  not null,
    `seat_id` INT(254)  not null,
	`ticket_id` INT AUTO_INCREMENT not null,
  `theater_id` varchar(255) not null,

constraint fk_ticket_seat_id foreign key (seat_id, theater_id) references Seat (id, theater_id),
constraint fk_ticket_scheduledMovie_id foreign key (scheduledMovie_id, theater_id) references scheduledMovie (id,theater_id),
      
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY (`seat_id`),
  UNIQUE KEY (`scheduledMovie_id`));