// Sub query or nested query
SELECT *
FROM employee
SELECT *
FROM department

// list all employees working in Bangalore
SELECT *
FROM employee emp, department dept
WHERE emp.did=dept.did AND dept.location = 'Bangalore'
SELECT *
FROM employee emp
WHERE emp.did =  (SELECT dept.did FROM department dept where dept.dname = 'T&D')

// get all emp having salary > avg sal of the his department
SELECT AVG(salary) as avg_salary
FROM employee
SELECT SUM(salary) as avg_salary
FROM employee
SELECT COUNT(*) as avg_salary
FROM employee
SELECT *
FROM employee emp
WHERE emp.salary >= (SELECT AVG(salary) FROM employee emp2 WHERE emp2.did = emp.did);

//GROUP By
SELECT did , COUNT(*) AS no_emp
FROM employee
GROUP BY did

// total emp in each dept using group By
SELECT emp.did ,dept.dname, COUNT(*) AS no_emp
FROM employee emp, department dept
WHERE emp.did=dept.did
GROUP BY emp.did,dept.dname

// select group having count >1
SELECT emp.did ,dept.dname, COUNT(*) AS total_emp
FROM employee emp, department dept
WHERE emp.did=dept.did
GROUP BY emp.did,dept.dname
HAVING COUNT(*) >= 1
ORDER BY emp.did
