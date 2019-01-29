use cinema;
START transaction;
update Movie set Movie.title = 'Hobbit2' WHERE Movie.title = 'Hobbit';

