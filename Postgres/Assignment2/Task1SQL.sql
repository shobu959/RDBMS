// DDL
create table employee(
id int,
    name varchar(50)not null,
    salary numeric(7,2),
    primary key(id)
);
CREATE TABLE department(
did serial primary key,
dname varchar(50) unique not null,
    location varchar(50)
);
DROP TABLE department;
ALTER TABLE employee add
            did int;
ALTER TABLE employee add foreign key(did) references department(did);
//drop constraint by name
ALTER TABLE employee drop constraint employee_did_fkey;
// add FK on delete cascade
ALTER TABLE employee add foreign key(did) references department(did) ON DELETE CASCADE;
ALTER TABLE employee add foreign key(did) references department(did) ON DELETE  SET NULL;
INSERT INTO employee (id,name,salary) VALUES(1,'name 1',100.0);
INSERT INTO employee (id,name,salary) VALUES(4,'name 4',200.0),
                                            (5,'name 5',300.0);
// violate name colum constraint not null
INSERT INTO employee (id,name,salary) VALUES(5,NULL,500.0);
// violate salary colum
INSERT INTO employee (id,name,salary) VALUES(6,'name 6','abcd');
INSERT INTO employee (id,name,salary) VALUES(6,'name 6',123456.78);
//correction
INSERT INTO employee (id,name,salary) VALUES(6,'name 6',12345.67);
SELECT * FROM employee;
SELECT * FROM department;
// insert emp with dept info
INSERT INTO employee (id,name,salary,did) VALUES(7,'name 7',700.0,1);
INSERT INTO employee (id,name,salary,did) VALUES(8,'name 8',800.0,1);
INSERT INTO department (did,dname,location) VALUES(1,'R&D','location1');
DELETE FROM department WHERE did = 1;
DELETE FROM employee WHERE id =7;







