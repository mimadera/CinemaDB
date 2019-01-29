START transaction;
set transaction isolation level repeatable read;
update Movie set duration = duration - 10 WHERE Movie.duration = 89 AND Movie.title = 'Hobbit';

