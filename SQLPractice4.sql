-- 19-Apr-2026
-- Write a SQL query to find orders that were placed but NEVER returned
select order_id from orders o
left join returns r on o.order_id = r.order_id
where r.return_id is NULL;

-- Write a SQL query to find all departments and the number of employees in each department, including departments that have ZERO employees
select d.dept_id, x.num_emp from departments d
left join (select count(e.emp_id) as num_emp, e.dept_id from employees e group by e.dept_id) x
on d.dept_id = x.dept_id;

-- Write a SQL query to find employees who do NOT belong to any department OR belong to a department that does not exist in the departments table
select emp_id from employees e
left join departments d on e.dept_id = d.dept_id
where d.dept_id is NULL;

select e.emp_id from employees e
where (e.dept_id is NULL or e.dept_id not in (select dept_id from departments WHERE dept_id IS NOT NULL));

-- Write a SQL query to find customers who have placed orders, but ALL of their orders were placed in the same year
select c.customer_name from customers c
join (select o.customer_id from orders o group by o.customer_id having count(distinct YEAR(o.order_date)) = 1) x
on c.customer_id = x.customer_id;

-- Write a SQL query to find orders that have been placed but have NO payment recorded yet
select o.order_id from orders o
left join payments p on o.order_id = p.order_id
where p.payment_id is NULL;

-- Write a SQL query to find pairs of employees who belong to the SAME department, but ensure that each pair is returned only once (no mirror duplicates like (A,B) and (B,A))
select e1.emp_id, e2.emp_id from employees e1
join employees e2
on e1.dept_id = e2.dept_id
where e1.emp_id < e2.emp_id;

-- Write a SQL query to find employees whose salary is greater than their department’s average salary but is NOT the highest salary in the entire company
select s1.emp_id, s1.salary from employees s1
join (select avg(salary) as avg_sal, dept_id from employees group by dept_id) s2
on s1.dept_id = s2.dept_id
where s1.salary > s2.avg_sal
and s1.salary < (select max(salary) from employees);

-- Write a SQL query to find customers who placed orders in consecutive months (e.g., Jan & Feb, Feb & Mar, etc.), regardless of year
SELECT DISTINCT o1.customer_id
FROM orders o1
JOIN orders o2 ON o1.customer_id = o2.customer_id
AND ((YEAR(o1.order_date) = YEAR(o2.order_date) AND MONTH(o1.order_date) = MONTH(o2.order_date) + 1)
OR (YEAR(o1.order_date) = YEAR(o2.order_date) + 1 AND MONTH(o1.order_date) = 1 AND MONTH(o2.order_date) = 12));

-- Write a SQL query to find departments where all employees earn more than 50,000 AND the department has at least 3 employees
select dept_id from employees --where salary>50000 --(incorrect) this will just filter away the main evidence that should actually disqualify the department
group by dept_id having count(emp_id) > 3 and min(salary)>50000;

-- orders(order_id, customer_id, order_date, amount)
-- Write a SQL query to find customers who have placed more than one order, but NEVER placed two orders on the same day
select distinct customer_id from orders
group by customer_id
having count(order_id) > 1
and customer_id not in (select customer_id from orders group by customer_id, order_date having count(order_id) > 1);

SELECT customer_id
FROM orders o
GROUP BY customer_id
HAVING COUNT(order_id) > 1
AND NOT EXISTS (
SELECT 1 FROM orders x
WHERE x.customer_id = o.customer_id
GROUP BY x.order_date HAVING COUNT(x.order_id) > 1);

-- employees(emp_id, emp_name, dept_id, salary)
-- Write a SQL query to find employees who: earn more than at least one other employee in their department, AND earn less than the maximum salary in their department
select emp_id from employees e1
join (select max(salary) as max_sal, dept_id from employees group by dept_id) e2
on e1.dept_id = e2.dept_id
where e1.salary < e2.max_sal
and e1.salary > (select min(salary) from employees e3 where e1.dept_id = e3.dept_id);


select emp_id from employees e1
where e1.salary > (select min(salary) from employees e3 where e1.dept_id = e3.dept_id)
and e1.salary < (select max(salary) from employees e3 where e1.dept_id = e3.dept_id);
