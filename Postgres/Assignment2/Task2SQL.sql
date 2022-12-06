-- //single record query  using PK
SELECT * FROM employee;
select * from department d ;
insert into tab
--// multi record query
select * from employee e where salary <=100;
--// get all emp who belong to dept 2
SELECT name AS Employee_Name FROM employee
WHERE did = 2;
--// get all emp from dept 2 having sal > 200
select * from employee e where did = 2 and salary > 200;

SELECT name,salary FROM employee
WHERE did =2 AND salary > 200;

SELECT * FROM employee
WHERE did =2 OR salary < 200;
--// IN
SELECT * FROM employee
WHERE id IN (3,5,8,9);

--//LIKE
SELECT * FROM employee
WHERE name = 'name 1';

SELECT * FROM employee
WHERE name LIKE 'name%';

--// BETWEEN
SELECT * FROm employee
WHERE salary >=100 AND salary<= 400;

SELECT * FROm employee
WHERE salary BETWEEN 99 AND 299;

SELECT * FROm employee
WHERE salary IN (99,300);

--// IS NULL
--// find all emp who does not belong to any dept?

SELECT * FROM employee
WHERE did IS NULL;

INSERT INTO employee (id,name,salary) VALUES(8,'name 8',800.0);
INSERT INTO employee (id,name,salary) VALUES(4,'name 4',400.0);
INSERT INTO employee (id,name,salary,did) VALUES(5,'name 5',100.0,2);

--//NOT
SELECT * FROM employee
WHERE NOT did IS NULL;

SELECT * FROm employee
WHERE salary NOT IN (99,300);

SELECT * FROm employee
WHERE salary NOT BETWEEN 99 AND 299;

--//ORDER BY clause
SELECT *
FROM employee
ORDER BY name ASC ;

SELECT *
FROM employee
ORDER BY salary  DESC;

--// order by salary and did
SELECT *
FROM employee
ORDER BY salary ASC,did DESC;

SELECT *
FROM employee
ORDER BY id ASC;

--// UPDATE
--// Update emp name of id to "new name"

SELECT *
FROM employee
WHERE id =1;

UPDATE  employee SET name = 'new name1'
WHERE id =1;

--//update emp id 5 sal = 150
UPDATE  employee SET salary = 150
WHERE id =5;

--//DELETE
DELETE FROM employee
WHERE id =5;


raghu gowda
  4:11 PM
Task on SQL:
Create suitable attributes and constraints for Tables a) Product [price should be > 0] b) Category
Create a Master child relation to the above table by creating foreign key [Product refers to the Category table by category_Id].
Write SQL queries to insert [at least 5 records ], select ,  update & delete records.
Write queries for the following:
select all products having price between 500 to 1000.
select all products having name like 'mobile'.
select all products order them by name / price / expiry date in ASC / DESC.
select all products having name like 'laptop' AND  price between 25000 to 50000.