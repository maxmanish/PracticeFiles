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
create table orders (order_id INT primary key, customer_id INT NOT NULL, order_date DATE, amount INT(10) check (amount > 0));
