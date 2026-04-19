-- 18-Apr-2026
-- Write a SQL query to find the department(s) that have the SAME average salary as at least one other department
SELECT dept_id FROM employees GROUP BY dept_id
HAVING AVG(salary) IN (SELECT AVG(salary) FROM employees GROUP BY dept_id HAVING COUNT(*) > 1);

-- Write a SQL query to find customers whose MAX order amount is strictly less than their TOTAL order amount
select customer_id from orders group by customer_id
having max(amount) < sum(amount);

-- Write a SQL query to find departments where the difference between the highest and lowest salary is greater than 50,000
select dept_id from employees
group by dept_id
having (max(salary) - min(salary)) > 50000;

-- Write a SQL query to find customers who placed orders in two different months in the same year
select customer_id from orders
group by customer_id, year(order_date)
having count(distinct month(order_date)) >= 2;

-- Write a SQL query to find departments where the average salary is greater than the overall company average salary
select dept_id from employees
group by dept_id
having avg(salary) > (select avg(salary) from employees);

-- Write a SQL query to find customers whose total order amount is greater than the total order amount of at least one other customer
select customer_id from orders group by customer_id
having sum(amount) > 
select min(sum_amt)
(select sum(amount) as sum_amt from orders group by customer_id);

-- Write a SQL query to find customers who have placed more than one order
select c.customer_id from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id
having count(o.order_id) > 1;

-- Write a SQL query to find customers who have placed NO orders
select customer_id from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is NULL;

-- Write a SQL query to find departments that have NO employees
select dept_id from departments d
left join employees e on d.dept_id = e.dept_id
where e.emp_id is NULL;

-- Write a SQL query to find employees who belong to a department named 'IT'
select emp_id from employees e
join departments d on e.dept_id = d.dept_id
where d.dept_name = 'IT';

-- Write a SQL query to find employees whose manager’s name starts with the letter 'A'
select emp_id from employees e
join employees m
on e.manager_id = m.emp_id
where m.emp_name like 'A%';

-- Write a SQL query to find pairs of employees who have the SAME salary, but are NOT the same employee
select e1.emp_id, e2.emp_id from employees e1
join employees e2
on e1.salary = e2.salary
where e1.emp_id <> e2.emp_id;

-- Write a SQL query to find customers who placed orders on consecutive days
SELECT DISTINCT o.customer_id
FROM orders o
JOIN orders o1
ON o.customer_id = o1.customer_id
AND o.order_date = o1.order_date + 1;

-- Write a SQL query to find employee(s) who earn the highest salary in EACH department (use JOINs, not window functions)
select emp_id from employees e
join (select max(salary) maxsal, dept_id from employees group by dept_id) ms
on e.dept_id = ms.dept_id
where e.salary = ms.maxsal;
