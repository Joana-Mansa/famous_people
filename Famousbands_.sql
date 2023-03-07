/*This project lists famous bands to ever live
1. created the dataset from a google search, it contains the bands' name,
their origin, year they began, genre, famous song*/

/*using the challenges database*/
USE challenges;

/*this table contains the name and origin of the bands */
CREATE TABLE famousbands (id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255), 
 origin TEXT);
INSERT INTO famousbands (name, origin)
	VALUES ("Led Zeppelin", "British");
INSERT INTO famousbands (name, origin)
	VALUES ("Pink Floyd", "British");
INSERT INTO famousbands (name, origin)
	VALUES ("The Beatles", "British");
    
 INSERT INTO famousbands (name, origin)
	VALUES ("The Rolling Stones", "British");
 INSERT INTO famousbands (name, origin)
	VALUES ("Queen", "British");
 INSERT INTO famousbands (name, origin)
	VALUES ("AC/DC", "Sydney");
 INSERT INTO famousbands (name, origin)
	VALUES ("The Doors", "America");
 INSERT INTO famousbands (name, origin)
	VALUES ("Aerosmith", "America");
 INSERT INTO famousbands (name, origin)
	VALUES ("The Eagles", "America");
 INSERT INTO famousbands (name, origin)
	VALUES ("Guns N' Roses", "American");
 INSERT INTO famousbands (name, origin)
	VALUES ("Black Sabbath", "British");
 INSERT INTO famousbands (name, origin)
	VALUES ("Nirvana", "America");
 INSERT INTO famousbands (name, origin)
	VALUES ("Deep Purple", "British");
/*selects the famousbands table which contains the band name and their origin*/
SELECT *
FROM famousbands;

/*creating the second table. the table will contain the genre and the year the bands started*/
CREATE TABLE ygenre (id INTEGER PRIMARY KEY AUTO_INCREMENT, year VARCHAR(255), 
 genre TEXT);
  INSERT INTO ygenre (year, genre)
	VALUES ("1968", "Rock");
   INSERT INTO ygenre (year, genre)
	VALUES ("1965", "Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1960", "Rock n roll");
     INSERT INTO ygenre (year, genre)
	VALUES ("1962", "Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1970", "Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1973", "Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1964", "Hard Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1970", "blues-based hard rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1968", "Country and Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1985", "Hard Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1968", "Classic Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1987", "Rock");
     INSERT INTO ygenre (year, genre)
	VALUES ("1968", "Rock");
    
    SELECT *
    FROM ygenre;
    
    /*final table which contains the bands' popular songs*/
    CREATE TABLE popular_song (id INTEGER PRIMARY KEY AUTO_INCREMENT, title VARCHAR(255));
     INSERT INTO popular_song (title)
	VALUES ("Stairway To Heaven");
     INSERT INTO popular_song (title)
	VALUES ("Another Brick In the Wall");
     INSERT INTO popular_song (title)
	VALUES ("Love Me Do");
     INSERT INTO popular_song (title)
	VALUES ("It's Only Rock 'n' Roll");
     INSERT INTO popular_song (title)
	VALUES ("Bohemian Rhapsody");
     INSERT INTO popular_song (title)
	VALUES ("Highway to Hell");
     INSERT INTO popular_song (title)
	VALUES ("Roadhouse Blues");
     INSERT INTO popular_song (title)
	VALUES ("I don't want to miss a thing");
    INSERT INTO popular_song (title)
	VALUES ("Hotel California");
    INSERT INTO popular_song (title)
	VALUES ("Welcome to the Jungle");
    INSERT INTO popular_song (title)
	VALUES ("Paranoid");
    INSERT INTO popular_song (title)
	VALUES ("Smells Like Teen Spirit");
      INSERT INTO popular_song (title)
	VALUES ("Highway Star 1972");
    
    /*selecting the popular_song table*/
    SELECT *
    FROM popular_song;
    
    /*joining all 3 tables into a single table containing 
    names of the bands, their origin, year they started, a popular hit*/
    SELECT famousbands.id, name, origin, year, genre, title
    FROM famousbands
	JOIN ygenre
    ON famousbands.id = ygenre.id
    JOIN popular_song
    ON popular_song.id = ygenre.id;
    
    /*List of bands present before 1970*/
        SELECT famousbands.id, name, origin, year, genre, title
    FROM famousbands
	JOIN ygenre
    ON famousbands.id = ygenre.id
    JOIN popular_song
    ON popular_song.id = ygenre.id
    WHERE year < 1970;
    
    /*bands that came after the 70s*/
	SELECT famousbands.id, name, origin, year, genre, title
    FROM famousbands
	JOIN ygenre
    ON famousbands.id = ygenre.id
    JOIN popular_song
    ON popular_song.id = ygenre.id
    WHERE year > 1970;
    
    /*counting popular bands from British*/
	SELECT famousbands.id, name, COUNT(origin), year, genre, title
    FROM famousbands
	JOIN ygenre
    ON famousbands.id = ygenre.id
    JOIN popular_song
    ON popular_song.id = ygenre.id
    GROUP BY name
    HAVING famousbands.origin LIKE 'British';
    
    
    
    
    