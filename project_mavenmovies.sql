use mavenmovies; -- Database

-- 1. Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name.

SELECT CONCAT(first_name, last_name) AS FullName,
LENGTH(CONCAT(first_name, last_name)) AS length_FullName
FROM actor 
LIMIT 10;

-- 2. List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.

SELECT CONCAT(first_name, last_name) AS FullName,
LENGTH(CONCAT(first_name, last_name)) AS length_FullName, awards
FROM actor_award
WHERE awards = "Oscar";

-- 3. Find the actors who have acted in the film ‘Frost Head’.

SELECT CONCAT(first_name,' ',last_name) actors, f.title
FROM actor a 
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.title = "Frost Head";

-- 4. Pull all the films acted by the actor ‘Will Wilson’.

SELECT f.title, concat(first_name,' ',last_name) FullName 
FROM actor a 
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE concat(first_name,last_name) = 'WillWilson';

-- 5. Pull all the films which were rented and return in the month of May.

SELECT f.title ,rental_date, return_date 
FROM rental r 
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE monthname(rental_date) = 'may' AND monthname(return_date) = 'may';

-- 6. Pull all the films with ‘Comedy’ category.

SELECT f.* ,c.name
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name LIKE 'comedy';