CREATE DATABASE IF NOT EXISTS db_student;

SET @OLD_FOREIGN_KEY_CHECKS=@@foreign_key_checks, FOREIGN_KEY_CHECKS=0;

use db_student;

CREATE TABLE IF NOT EXISTS  `db_student`.`student` (

  `name` VARCHAR(29) not null,
  `lastName` VARCHAR(29) not null,
  `id` int NOT NULL,
  `current_semester` int not null,
  
	FOREIGN KEY (`current_semester`)
	REFERENCES `semester`(`id`)
	ON UPDATE CASCADE,
  
	FOREIGN KEY (`id`)
	REFERENCES `enrollment`(`student_id`)

	ON UPDATE CASCADE,
  
    PRIMARY KEY (`id`));
    

CREATE TABLE IF NOT EXISTS `db_student`.`course` (

  `name` VARCHAR(29) not null,
  `id` INT not null,
  `plannedSemester` INT not null,
  
      FOREIGN KEY (`plannedSemester`)
      REFERENCES `semester`(`id`)
	  ON UPDATE CASCADE,
      
	PRIMARY KEY (`id`));
    
      
    CREATE TABLE IF NOT EXISTS  `db_student`.`semester` (
    
	 `id` INT not null,
      
	  FOREIGN KEY (`id`)
      REFERENCES `course`(`plannedSemester`)
      ON UPDATE CASCADE,
      
      
	PRIMARY KEY (`id`));
    

    

CREATE TABLE IF NOT EXISTS  `db_student`.`enrollment` (
	
     `id` int NOT NULL,
	`student_id` int NOT NULL,
	`course_id` int NOT NULL,
    `grade` decimal(2,1) not null,
    
      
      FOREIGN KEY (`student_id`)
      REFERENCES `student`(`id`)
      ON UPDATE CASCADE,
      
	 FOREIGN KEY (`course_id`)
	 REFERENCES `course`(`id`)
	 ON UPDATE CASCADE,
      
	PRIMARY KEY (`id`));
    
    
    CREATE TABLE IF NOT EXISTS  `db_student`.`partial_grade` (
    
	 `id` INT not null,
     `grade`decimal(2,1) not null,
     `enrollment_id` INT not null,
     
      
	  FOREIGN KEY (`enrollment_id`)
      REFERENCES `enrollment`(`id`)
      ON UPDATE CASCADE,
      
      
	PRIMARY KEY (`id`));