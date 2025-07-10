USE sakila;

/*. 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados*/ 

SELECT DISTINCT title
FROM film;

/* . 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".*/ 


SELECT  title, rating
FROM film
WHERE rating= "PG-13"; 

/* . 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
descripción*/ 

SELECT title, `description`
FROM film
WHERE title LIKE "%Amazing%" OR `description` LIKE "%Amazing%"; 

/*4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos*/ 

SELECT title, `length`
FROM film 
WHERE `length`> 120; 


/*5. Recupera los nombres de todos los actores*/

SELECT first_name, last_name
FROM actor;  

/* 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido*/ 

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%Gibson%"; 

/* 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20*/ 


SELECT actor_id, first_name, last_name
FROM actor 
WHERE actor_id >= 10 AND actor_id <= 20; 

/* 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación*/

SELECT title, rating
FROM film
WHERE title != "R" AND rating != "PG-13";

/* 9.Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento*/ 

SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;


/* 10.cuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su.
nombre y apellido junto con la cantidad de películas alquiladas.*/ 

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_peliculas_alquiladas
FROM customer AS c
INNER JOIN rental AS r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres*/ 

SELECT c.name AS categoria, COUNT(r.rental_id) AS total_pelis
FROM category AS c
INNER JOIN film_category AS fc 
ON c.category_id = fc.category_id
INNER JOIN film AS f 
ON fc.film_id = f.film_id
INNER JOIN inventory AS i 
ON f.film_id = i.film_id
INNER JOIN rental AS r 
ON i.inventory_id = r.inventory_id
GROUP BY c.name;
-- Hemos tenido que hacer joins para llegar desde category hasta rental ya que ambas tamblas no se comunican entre si (haciendo caminitos).

/* 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración*/ 

SELECT rating AS clasificacion, AVG(length) AS promedio_duracion 
FROM film 
GROUP BY rating; 

/* 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love*/ 

SELECT a.first_name AS nombre, a.last_name, f.title AS titulo 
FROM film AS f
INNER JOIN film_actor AS fa 
ON f.film_id = fa.film_id
INNER JOIN actor AS a 
ON a.actor_id = fa.actor_id 
WHERE title = "Indian Love"; 

/* 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción*/ 

SELECT title, `description`
FROM film
WHERE `description` LIKE "%DOG&" OR `description` LIKE "%CAT"; 
-- NO HUBO RESULTADOS. 

/* Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor */ 

SELECT *
FROM film_actor 

SELECT * 
FROM actor 
SELECT *
FROM film_actor; 


SELECT * 
FROM film;
SELECT * 
FROM ACTOR;


SELECT *
from rental;
SELECT *
from inventory;
SELECT *
from customer;
SELECT *
from category;