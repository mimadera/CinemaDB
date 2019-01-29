use cinema;
set transaction isolation level serializable;
START transaction;
SELECT * FROM Movie WHERE Movie.title = 'Hobbit2';
