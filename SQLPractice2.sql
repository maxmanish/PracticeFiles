-- 17-Apr-2026
-- Write a SQL query to find the employee(s) who earn the SECOND LOWEST salary in the company
select employee_id from employees where salary = (select max(salary) from(
select salary from(select distinct salary from employees order by salary asc) where rownum < 3));

select employee_id from 
(select employee_id, dense_rank() over(order by salary asc) as drk from employees) where drk = 2;

-- Write a SQL query to find customers who placed orders on consecutive days
select distinct o1.customer_id from orders o1
join orders o2 
on o1.customer_id = o2.customer_id
where o1.order_date = (o2.order_date+1);

-- Write a SQL query to find users who logged in for at least 3 consecutive days
select distinct user_id from logins l1
join logins l2 on l1.user_id = l2.user_id
join logins l3 on l1.user_id = l3.user_id
where l1.login_date = (l2.login_date+1)
and l1.login_date = (l3.login_date+2);

--Identifying duplicates in a table (using groupby and having)
select * from employee group by a,b,c,d having count(*) > 1;

--Identifying duplicates in a table (using Oracle RowID pseudo column-physical row address)
select * from t1 where rowID not in (select min(rowID) from t1 group by a,b,c);

--deleting duplicates from a table (using another/secondary table)
insert into table t2 select * from t1 group by a,b,c;
drop table t1;
alter table rename t2 to t1;

--deleting duplicates from a table (using Oracle RowID pseudo column-physical row address)
delete from t1 where rowID not in (select min(rowID) from t1 group by a,b,c);

--deleting duplicates from a table (Using Window Function)
delete from (select a,b,c,d, row_number() over(partition by a,b,c,d order by e) as rn from t1) where rn > 1;

--Second highest salary from Employee table
select min(salary) from
(select salary from (select distinct salary from employee order by salary desc) where rownum < 3);

--Second highest salary from Employee table (using Window function)
select salary from
(select salary, dense_rank() over(order by salary desc) drk from employee) where drk = 2;

-- Write a SQL DDL statement to create a table payments with the following requirements
create table payments (payment_id INT primary key,
order_id INT not NULL,
payment_date DATE,
amount float(10,2) check (amount>0),
payment_mode VARCHAR(10) check (payment_mode in ('CARD', 'UPI', 'CASH')));

-- Write a SQL query to add a FOREIGN KEY constraint on order_id referencing orders(order_id)
alter table payments add constraint cons1 foreign key (order_id) REFERENCES orders(order_id);

-- Write a SQL query to delete products whose price is below the average price of all products
delete from products
where price < (select avg(price) from products);

-- Write a SQL query to modify the salary column to allow decimal values up to 2 decimal places
alter table employees modify salary decimal(10,2); --mySQL
alter table employees modify salary number(10,2); --oracle

-- Write a SQL query to update the salary by 5% for employees whose salary is less than 50,000
update employees set salary = (salary+salary*(0.05))
where salary < 50000;

-- Write a SQL query to add a constraint so that username cannot be NULL and must be unique
alter table users modify username varchar(10) not null;
alter table users add constraint uname_not_null unique (username);
