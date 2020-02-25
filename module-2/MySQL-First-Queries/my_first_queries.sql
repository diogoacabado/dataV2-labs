# Exercise 1
SELECT DISTINCT prime_genre
FROM app

# Exercise 2
SELECT prime_genre
FROM app
GROUP BY prime_genre
ORDER BY sum(rating_count_tot) DESC
LIMIT 1

# Exercise 3
SELECT prime_genre
FROM app
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC
LIMIT 1

# Exercise 4
SELECT prime_genre
FROM app
GROUP BY prime_genre
ORDER BY COUNT(track_name) ASC
LIMIT 1

# Exercise 5
SELECT track_name
FROM app
ORDER BY rating_count_tot DESC
LIMIT 10

# Exercise 6
SELECT track_name
FROM app
ORDER BY user_rating DESC
LIMIT 10

# Exercise 10
SELECT track_name
FROM app
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3

# Exercise 11
SELECT track_name, price
FROM app
ORDER BY rating_count_tot DESC
LIMIT 10


