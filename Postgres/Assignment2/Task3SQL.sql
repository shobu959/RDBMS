SELECT * FROm employee;

SELECT * FROm department;

--// cortesian product
SELECT *
FROM employee e ,department dept
WHERE e.did=dept.did;

--// get all emp names and location of dept.
SELECT e.name,dept.location
FROM employee e ,department dept
WHERE e.did=dept.did;

SELECT *
FROM employee AS emp ,department dept
WHERE emp.did=dept.did AND dept.location = 'Bangalore';
INSERT INTO department (did,dname,location) VALUES(3,'HR','Delhi');

SELECT *
FROM employee AS emp ,department dept
WHERE emp.did=dept.did;

--//ISO syntax
--//Inner Join
SELECT *
FROM employee AS emp
INNER JOIN department dept
ON emp.did=dept.did;

--// Left Join
SELECT *
FROM employee emp
LEFT JOIN department dept
ON emp.did=dept.did;

--// Right Join
SELECT *
FROM employee emp
RIGHT JOIN department dept
ON emp.did=dept.did;

--// Full outer join
SELECT *
FROM employee emp
FULL OUTER JOIN department dept
ON emp.did=dept.did;

--// Natural join
SELECT *
FROM employee emp
NATURAL JOIN department dept;

--// UNION operator
SELECT * FROM employee where salary <=200
UNION
SELECT * FROM employee where salary >=400