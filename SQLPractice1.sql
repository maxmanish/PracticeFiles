-- Write a SQL query to find all employees whose salary is greater than the average salary of the entire company
select emp_id, emp_name, salary
from employees where salary > (Select avg(salary) from employees);

select min(Salary) from
( select Salary from
(select distinct Salary from employees
order by Salary desc) where rownum < 3);

-- write a SQL query to find the 2nd highest salary in the company
select salary, drk from
(select salary, dense_rank() over(order by Salary desc) as drk
from employees) where drk = 2;

-- write a SQL query to find the highest salary in each department
select dept_id, max(salary)
from employees
group by dept_id;

-- write a SQL query to find employees whose salary is equal to the maximum salary in their respective department
select emp_id, emp_name, dept_id, salary
from employees e 
where salary = (select max(salary)
    from employees e1 
    where e.dept_id = e1.dept_id);

-- write a SQL query to find departments that have more than 3 employees
select dept_id, count(emp_id) as cnt
from employees
group by dept_id
having count(emp_id) > 3;

-- write a SQL query to find the department(s) with the highest average salary
select dept_id, avg(salary) from employees
group by dept_id
having avg(salary) in (
    select max(avg_sal) from (
        select avg(salary) as avg_sal from employees group by dept_id)
);

-- write a SQL query to find employees who earn more than their department’s average salary
select emp_id, salary from employees e1
where salary > (
    select avg(salary) from employees e2
    where e1.dept_id = e2.dept_id
    group by dept_id)

-- write a SQL query to find employees who have the SAME salary as someone else in the company (i.e., duplicate salaries)
select distinct e1.emp_name /*e2.emp_name*/ from employees e1
join employees e2
on e1.salary = e2.salary
and e1.emp_id <> e2.emp_id;

select emp_name from employees where salary in
(select salary from employees group by salary having count(*) > 1);

-- write a SQL query to find the employee(s) who earn the highest salary in the company
select emp_name from employees where salary = (select (max(salary) from employees));

-- Write a SQL DDL statement to create a table orders
create table orders (order_id INT primary key, customer_id INT NOT NULL, order_date DATE, amount INT check (amount > 0));

-- Write a SQL query to create a table students
create table students (student_id INT primary key, email varchar2(100) unique, 
    age int check (age>=18), created_date DATE default (CURRENT_DATE));

-- Write a SQL query to increase the price by 10% for all products belonging to the category 'Electronics'
update products set price=price*(1.1)
where category = 'Electronics';

-- Write a SQL query to find customers who have NOT placed any orders
select customer_id from customers c
left outer join orders o
on c.customer_id = o.customer_id
and o.order_id is NULL;

select customer_id from customer c
where not exists (select * from orders o where c.customer_id = o.customer_id)

-- Write a SQL query to delete all login records except the most recent login for each user
-- logins(user_id, login_date)
delete from logins l1 where login_date < 
    (select max(login_date) from logins l2 where l1.user_id = l2.user_id);

delete from logins (
    select *, row_number() over(partition by user_id order by login_date desc) as latest_login
) where latest_login > 1;

-- Write a SQL query to add a constraint (also drop the constraint) that ensures email values are UNIQUE
alter table employees add constraint unq_emp_mail unique(email); --Oracle
alter table employees add unique(email); --MySQL
alter table employees drop constraint unq_emp_mail;

-- Write a SQL query to find all orders placed in the last 7 days
select order_id from orders where order_date > (sysdate-7);

-- Write a SQL query to find customers who have placed more than one order AND whose total purchase amount is greater than 10K
select customer_id from sales group by customer_id having sum(amount) > 10000 and count(order_id) > 1;

-- Write a SQL query to find departments where every employee earns more than 50,000
select dept_id from employees group by emp_id having sum(salary) > 50000; --incorrect
select dept_id from employees group by dept_id having min(salary) > 50000; --correct

-- Write a SQL query to find customers who have placed exactly ONE order
select customer_id from orders group by customer_id having count(order_id) = 1;

-- Write a SQL query to find departments that have at least one employee but fewer than 3 employees
select dept_id from employees group by dept_id having count(emp_id) > 1 and count(emp_id) < 3;

-- Write a SQL query to find customers who placed their FIRST order in the year 2023
select customer_id from orders group by customer_id having year(min(order_date)) = '2023';

-- Write a SQL query to find employees who joined in the same hire date as at least one other employee
select emp_id from employees e1
where hire_date in (select hire_date from employees e2 group by hire_date having count(*) > 1);

select distinct emp_id from employees e1 join employees e2 on e1.hire_date = e2.hire_date
where e1.emp_id <> e2.emp_id;

-- Write a SQL query to find employees whose salary is higher than at least one other employee’s salary
select distinct emp_id from employees where salary > (select min(salary) from employees);
select e1.emp_id from employees e1 join employees e1 on e1.emp_id <> e2.emp_id and e1.salary > e2.salary;

-- Write a SQL query to find employees whose salary is higher than ALL other employees’ salaries
select distinct e1.emp_id from employees e1 where salary > ALL (select salary from employees e2 where e1.emp_id <> e2.emp_id)
select distinct emp_id from employees where salary = (Select max(salary) from employees);

-- Write a SQL query to find categories that have NO products
select category_name from products p left join categories c on p.category_id = c.category_id where p.product_id is NULL;
