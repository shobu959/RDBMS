--Write SQL queries to demonstrate Equi Join, Left Join, Right Join and Full Join on Product and Category tables.
--Write queries for the following:
--Get all products under category 'mobile'
--Get name of category and count of products in each category
--Get all products which does not belong to 'mobile' category
--Get the category which has highest / lowest number of products
--Increase the price of all products under only 'mobile' category by 3%
--Decrease the price of all products under only 'laptop' category by 5%

SELECT * FROM product p ;

SELECT * FROM category c ;

INSERT INTO public.product (id,"name",category_key,price,no_of_product)
	VALUES (2,'freeze',4,15000,8);

INSERT INTO public.product (id,"name",category_key,price,no_of_product)
	VALUES (3,'del',2,55000,2);
	
INSERT INTO public.product (id,"name",category_key,price,no_of_product)
	VALUES (4,'FZ',3,136000,2);

--NATURAL JOIN
SELECT * FROM product p NATURAL JOIN category c ;


--LEFT JOIN
SELECT * FROM product p LEFT JOIN category c ON p.id =c.id ;

--RIGHT JOIN
SELECT * FROM product p RIGHT JOIN category c ON p.id =c.id ;

--FULL OUTER JOIN
SELECT * FROM product p FULL OUTER JOIN category c ON p.id =c.id ;

--INNER JOIN
SELECT * FROM product p INNER JOIN category c ON p.id =c.id ;

--Get all products under category 'mobile'
SELECT * from product p where category_key = (SELECT id from category c where c.category='mobile');

--Get name of category and count of products in each category
SELECT c.category,p.no_of_product  from product p LEFT JOIN category c ON p.id =c.id ;

--Get all products which does not belong to 'mobile' category
SELECT * from product p where category_key IN  (SELECT id from category c where c.category NOT IN ('mobile'));

--Get the category which has highest / lowest number of products
SELECT c.category FROM category c WHERE c.id IN (SELECT p2.category_key from product p2 WHERE p2.no_of_product = (SELECT min(p.no_of_product) from product p));
SELECT c.category FROM category c WHERE c.id IN (SELECT p2.category_key from product p2 WHERE p2.no_of_product = (SELECT max(p.no_of_product) from product p));


--Increase the price of all products under only 'mobile' category by 3%

--Decrease the price of all products under only 'laptop' category by 5%


