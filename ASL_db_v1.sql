create database if not exists `heroku_ce8d863ea9ec583`;
use `heroku_ce8d863ea9ec583`;


drop table if exists `picture`;
create table `picture` (
	`id` bigint auto_increment not null,
    `path` varchar(255) not null unique,
    `letter` char(1) default null, -- unprocessed yet
    `validated` boolean default null,
    
    primary key (`id`),
    unique key(`path`)
    
)engine=innoDB default charset=utf8;

drop table if exists `user`;
create table `user` (
	`id` bigint auto_increment not null,
    `username` varchar(45) not null,
    `password` varchar(255) not null,
	-- `first_name` varchar(45) not null,
	-- `last_name` varchar(45) not null,
    
    primary key (`id`),
    unique key (`username`)

)engine=innoDB default charset=utf8;

INSERT INTO `user` (`username`, `password`)
VALUES 
('admin', '$2a$10$wNUJzhx8rqOD6/Bnmq3KieiuHUSwSgmu6EkdMs905TQJhvv4tNp66');

drop table if exists `test_type`;
create table `test_type` (
	`name` varchar(45) not null,
   
    primary key (`name`)

)engine=innoDB default charset=utf8;

drop table if exists `model_type`;
create table `model_type` (
	`name` varchar(45) not null,
   
    primary key (`name`)

)engine=innoDB default charset=utf8;

INSERT INTO `model_type` (`name`)
VALUES 
('classifier'),
('neural network');

drop table if exists `model`;
create table `model` (
	`id` bigint auto_increment not null,
    `type` varchar(45) not null,
    `path` varchar(255) not null,
    `creation_date` datetime not null,
    `dataset_size` int not null,
	`dataset_imbalance_ratio` decimal(3,2) not null, -- value from 0 to 1
    
    primary key (`id`),
    unique key (`path`),
    constraint `fk_model_type` foreign key (`type`) references `model_type` (`name`)

)engine=innoDB default charset=utf8;

INSERT INTO `test_type` (`name`)
VALUES 
('naive'),
('cross');

drop table if exists `test_info`;
create table `test_info` (
	`id` bigint auto_increment not null,
	`type` varchar(45) not null,
    `dataset_size` int not null,
	`imbalance_ratio` decimal(3,2) not null, -- value from 0 to 1

    primary key (`id`),
    constraint `fk_test_info_type` foreign key (`type`) references `test_type` (`name`)

)engine=innoDB default charset=utf8;

drop table if exists `research`;
create table `research` (
	`id` bigint auto_increment not null,
	`date` datetime not null,
    `test_info_id` bigint not null,
	`model_id` bigint not null,
    `accuracy` decimal(5,3) not null,
    `precision` decimal(5,3) not null,
    `recall` decimal(5,3) not null,
    `comment` text not null,
   
    primary key (`id`),
	constraint `fk_research_test_info_id` foreign key (`test_info_id`) references `test_info` (`id`),
    constraint `fk_research_model_id` foreign key (`model_id`) references `model` (`id`)
 

)engine=InnoDB default charset=utf8;





