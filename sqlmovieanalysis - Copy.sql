USE movies_project;

SELECT COUNT(*) FROM ratings;

SELECT @@secure_file_priv;
CREATE TABLE movies (movieId INT, title TEXT, genres TEXT);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies.csv'
INTO TABLE movies
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM movies;
CREATE TABLE links (movieId INT, imdbId VARCHAR(20), tmdbId VARCHAR(20));

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/links.csv'
INTO TABLE links
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM links;

CREATE TABLE tags (userId INT, movieId INT, tag TEXT, timestamp BIGINT);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tags.csv'
INTO TABLE tags
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM tags;

USE movies_project;

SELECT * FROM movies;

SELECT m.title,ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(*) AS num_ratings
FROM movies m
JOIN ratings r ON m.movieId = r.movieId
GROUP BY m.movieId, m.title
HAVING num_ratings >= 50
ORDER BY avg_rating DESC
LIMIT 10;

SELECT tag, COUNT(*) AS a
FROM tags
GROUP BY tag
ORDER BY a DESC
LIMIT 10;

SELECT ROUND(AVG(r.rating),2) AS avg_rating, COUNT(*) AS num_rating
FROM movies m
JOIN ratings r ON m.movieId=r.movieId
WHERE m.genres LIKE '%comedy%';

SELECT title
FROM movies
WHERE genres LIKE '%Comedy%' AND genres LIKE '%Romance%';
USE movies_project;

SELECT userId, COUNT(*) AS num_ratings, ROUND(AVG(rating), 2) AS avg_rating
FROM ratings
GROUP BY userId
ORDER BY num_ratings DESC
LIMIT 10;

SELECT DISTINCT m.title, ROUND(AVG(r.rating) OVER (PARTITION BY m.movieId), 2) AS avg_rating
FROM tags t
JOIN movies m ON t.movieId = m.movieId
JOIN ratings r ON m.movieId = r.movieId
WHERE t.tag = 'funny';
 
SELECT m1.title AS movie_a, m2.title AS movie_b, COUNT(*) AS users_who_loved_both
FROM ratings r1
JOIN ratings r2 ON r1.userId = r2.userId AND r1.movieId < r2.movieId
JOIN movies m1 ON r1.movieId = m1.movieId
JOIN movies m2 ON r2.movieId = m2.movieId
WHERE r1.rating = 5.0 AND r2.rating = 5.0
GROUP BY r1.movieId, r2.movieId, m1.title, m2.title
ORDER BY users_who_loved_both DESC
LIMIT 10;

 
 
 
 