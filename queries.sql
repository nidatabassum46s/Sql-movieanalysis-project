-- ============================================
-- Movie Ratings Analysis (MovieLens dataset)
-- MySQL Workbench
-- ============================================

USE movies_project;

-- ============================================
-- Q1: Top 10 highest-rated movies (min. 50 ratings)
-- ============================================
SELECT m.title, ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(*) AS num_ratings
FROM movies m
JOIN ratings r ON m.movieId = r.movieId
GROUP BY m.movieId, m.title
HAVING num_ratings >= 50
ORDER BY avg_rating DESC
LIMIT 10;

-- ============================================
-- Q2: Most common tags used by viewers
-- ============================================
SELECT tag, COUNT(*) AS uses
FROM tags
GROUP BY tag
ORDER BY uses DESC
LIMIT 10;

-- ============================================
-- Q3: Average rating for Comedy movies
-- ============================================
SELECT ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(*) AS num_ratings
FROM movies m
JOIN ratings r ON m.movieId = r.movieId
WHERE m.genres LIKE '%Comedy%';

-- ============================================
-- Q4: Movies that are both Comedy and Romance
-- ============================================
SELECT title
FROM movies
WHERE genres LIKE '%Comedy%' AND genres LIKE '%Romance%';

-- ============================================
-- Q5: Most active users
-- ============================================
SELECT userId, COUNT(*) AS num_ratings, ROUND(AVG(rating), 2) AS avg_rating
FROM ratings
GROUP BY userId
ORDER BY num_ratings DESC
LIMIT 10;

-- ============================================
-- Q6: "Funny"-tagged movies and their average rating
-- ============================================
SELECT DISTINCT m.title, ROUND(AVG(r.rating) OVER (PARTITION BY m.movieId), 2) AS avg_rating
FROM tags t
JOIN movies m ON t.movieId = m.movieId
JOIN ratings r ON m.movieId = r.movieId
WHERE t.tag = 'funny';

-- ============================================
-- Q7: Movie pairs loved (5-star) by the same users (self-join)
-- ============================================
SELECT m1.title AS movie_a, m2.title AS movie_b, COUNT(*) AS users_who_loved_both
FROM ratings r1
JOIN ratings r2 ON r1.userId = r2.userId AND r1.movieId < r2.movieId
JOIN movies m1 ON r1.movieId = m1.movieId
JOIN movies m2 ON r2.movieId = m2.movieId
WHERE r1.rating = 5.0 AND r2.rating = 5.0
GROUP BY r1.movieId, r2.movieId, m1.title, m2.title
ORDER BY users_who_loved_both DESC
LIMIT 10;
