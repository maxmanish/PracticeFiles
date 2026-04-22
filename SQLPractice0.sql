-- 4-Apr-26
--Identifying duplicates in a table (using groupby and having)
select a,b,c, count(*) from table1 group by a,b,c having count(*) > 1;

--Identifying duplicates in a table (using Oracle RowID pseudo column-physical row address)
select rowID, a,b,c from table1 where rowID not in (SELECT MIN(ROWID) FROM table1 GROUP BY a, b, c);
--------------------------------------------------------------------------------------------------------
--deleting duplicates from a table (using another/secondary table)
insert into table2 select a,b,c from table1 group by a,b,c;
drop table1;
Alter table table2 rename to table1;

--deleting duplicates from a table (using Oracle RowID pseudo column-physical row address)
DELETE FROM table1 WHERE ROWID NOT IN (SELECT MIN(ROWID) FROM table1 GROUP BY a, b, c);

--deleting duplicates from a table (Using WINDOW Function)
delete from (select *, row_number() over (partition by a,b,c,d) as rn from table1) where rn >1; -- Option #1 (Oracle)
with abc as (select *, row_number() over (partition by a,b,c,d) as rn from table1) -- Option #2 (SQL Server)
delete from abc where rn > 1;
--------------------------------------------------------------------------------------------------------
--Second highest salary from Employee table using MAX
SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);

--Second highest salary from Employee table using ROWNUM
SELECT MIN(salary) FROM (SELECT salary FROM (SELECT DISTINCT salary FROM employee ORDER BY salary DESC) WHERE ROWNUM < 3);

--Second highest salary from Employee table (using WINDOW function)
select salary from (select salary, dense_rank() over(order by salary desc) drk from employee) where drk = 2; -- Option #1 (Oracle)
with abc as (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) drk FROM employee) -- Option #2 (SQL Server)
SELECT salary FROM abc WHERE drk = 2;
--------------------------------------------------------------------------------------------------------
--SQL for total Salary paid/expense for each department where the total departmental salary is greater than 500
Select Department, Sum(Salary) from Employee group by Department having Sum(Salary) > 500;
--Total salary department wise with department with highest total salary at the top
Select Department, Sum(Salary) as Sum_of_salary from Employee group by Department order by Sum(Salary) desc;

--SQL Query to remove leading/trailing characters(or spaces) from a column in a table
UPDATE table_name SET column_name = TRIM(column_name);
UPDATE table_name SET column_name = TRIM('#' FROM column_name);

--Creating Tables
Create table tab1 (name(varchar2(10)), ID(number(5)), email(varchar2(10))) values ('a',5,'b');
Insert into tab1 values ('a',5,'b');
Insert into tab1 (name, email, address, ID) values ('a','b','c',3); --if the number of columns to insert data is less than total columns

--Create a table from another table
Create table table2 as select * from table1 where <condition>;
Create table table2 (c1,c2,c3) as select c1,c2,c3 from table1 where <condition>;
create table t1 as select * from t2 where 1=2; --no data copy

-- #Inserting data into an existing table
Insert into tab1 values (a,b,c);
Insert into tab1 (c1,c2,c3) values (2,3,'abc')

-- #DUAL table
Select 2*2 from DUAL;

Select distinct * from table1;

-- #Sequence Creation
Create Seq seq1
minvalue 1
maxvalue 10
start with 1
increment by 1
chache 20

-- Data / Database Testing:
-- Schema validation (attribute names, datatypes, size, table structure etc)
-- Data validation (transformation logic, record count, duplication, redundant data, unnecessary spaces/characters)
-- Data Integrity validation (Referential integrity, PK-FK relationship)
-- Data constraints/rules validation (Default, Check, Not NULL)

-- #EXISTS CLAUSE-delete data from a table based on data in another table (EXISTS clause)
delete from tab1 where exists (select * from tab2 where tab1.abc = tab2.abc and tab2.x = "xyz");
delete from address where exists (select name from customer c where c.addID = ad.ID and c.name = 'Ivan');

-- #Update syntax
update tab1 set colname = "value"
-- Aggregate functions, groupby and Having clause are usually used together

-- IN Clause (sub-query)
select account from tab1 where month = "April" and account in (select account from tab1 where month = "March");

-- #DB LINKS
Create database link linkname
connect to linkname username identified by password

-- #JOINS
select t1.name, t2.address from table1 t1 join table2 t2 on tab1.addID = tab2.addID;
SELECT e.emp_name, d.dept_name FROM employees e INNER JOIN departments d ON e.dept_id = d.dept_id;
select e.ename, d.deptname from employee e left join dept d on e.deptid = d.deptid;
select e.ename, d.dname from employee e right jon dept d on e.deptid = d.deptid;

--SELF JOIN Example
SELECT e.emp_name AS employee, m.emp_name AS manager FROM employees e JOIN employees m ON e.manager_id = m.emp_id;
--Employees with no managers
SELECT e.emp_name AS employee, m.emp_name AS manager FROM employees e LEFT JOIN employees m ON e.manager_id = m.emp_id where e.manager_id is NULL;
SELECT m.emp_name AS manager FROM employees m WHERE NOT EXISTS (SELECT 1 FROM employees e WHERE e.manager_id = m.emp_id);
--Managers with no employees
SELECT e.emp_name AS employee, m.emp_name AS manager FROM employees e RIGHT JOIN employees m ON e.manager_id = m.emp_id where e.emp_id is NULL;

-- CROSS Join (Gives cartesian product of all combinations)
SELECT c.color, s.size FROM colors c CROSS JOIN sizes s;
