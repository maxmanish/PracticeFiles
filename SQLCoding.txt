#Identifying duplicates in a table
select a,b,c, count(*) from table1 group by a,b,c having count(*) > 1;

#deleting duplicates from a table (using Oracle RowID pseudo column-physical row address)
DELETE FROM table1 WHERE ROWID NOT IN ( SELECT MIN(ROWID) FROM table1 GROUP BY a, b, c);

#deleting duplicates from a table (Using Window Function)
with abc as (select *, row_number() over (partition by email, name order by ID) as rn from table1);
delete from abc where rn > 1;

#deleting duplicates from a table (using another/secondary table)
insert into table2 select a,b,c from table1 group by a,b,c;
drop table1;
Alter table table2 rename to table1;


#Second highest salary from Employee table
SELECT MIN(salary) 
FROM (SELECT salary FROM (SELECT DISTINCT salary FROM employee ORDER BY salary DESC) WHERE ROWNUM < 3);

#Second highest salary from Employee table (using Window function)
SELECT salary FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) rn FROM employee) WHERE rnk = 2;

#Second highest salary from Employee table
SELECT MAX(salary)
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);

#Creating Tables
Create table tab1 (name(varchar2), ID(number), email(varchar2)) values (a,b,c,3,4,5);
Insert into tab1 values ('a','b','c',3,4,5);
Insert into tab1 (name, email, address, ID) values ('a','b','c',3);

#Create a table from another table
Create table table2 as select * from table1 where <condition>;
Create table table2 (c1,c2,c3) as select c1,c2,c3 from table1 where <condition>;

#Inserting data into an existing table
Insert into tab1 values (a,b,c);
Insert into tab1 (c1,c2,c3) values (2,3,'abc')

#DUAL table
Select 2*2 from DUAL;

Select distinct * from table1;

#Sequence Creation
Create Seq seq1
minvalue 1
maxvalue 10
start with 1
increment by 1
chache 20

DataBase Testing:
Schema validation (attribute names, datatypes, size, table structure etc)
Data validation (transformation logic, record count, duplication, redundant data, unnecessary spaces etc)
Data Integrity validation (Referential integrity, PK-FK relationship)
Data constraints/rules validation (Default, not NUL, check)

#EXISTS CLAUSE-delete data from a table based on data in another table (EXISTS clause)
delete from tab1 where exists (select * from tab2 where tab1.abc = tab2.abc and tab2.x = "xyz")
delete from address ad where exists (select name from customer c where c.addID = ad.ID and c.name = 'Ivan')

#Update syntax
update tab1 set colname = "value"

Aggregate functions, groupby and Having clause are usually used together

select account from tab1 where month = "April" and account in (select account from tab1 where month = "March");

#DB LINKS
Create database link linkname
connect to linkname username identified by password

#JOINS
select t1.name, t2.address from table1 t1 join table2 t2 on tab1.addID = tab2.addID;
SELECT e.emp_name, d.dept_name FROM employees e INNER JOIN departments d ON e.dept_id = d.dept_id;
select e.ename, d.deptname from employee e left join dept d on e.deptid = d.deptid;
select e.ename, d.dname from employee e right jon dept d on e.deptid = d.deptid;

#SELF JOIN Example
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employees e LEFT JOIN employees m ON e.manager_id = m.emp_id;
