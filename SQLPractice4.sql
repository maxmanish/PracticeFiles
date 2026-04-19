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
