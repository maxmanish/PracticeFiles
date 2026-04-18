-- Write a SQL query to find the department(s) that have the SAME average salary as at least one other department
SELECT dept_id FROM employees GROUP BY dept_id
HAVING AVG(salary) IN (SELECT AVG(salary) FROM employees GROUP BY dept_id HAVING COUNT(*) > 1);

-- Write a SQL query to find customers whose MAX order amount is strictly less than their TOTAL order amount
select customer_id from orders group by customer_id
having max(amount) < sum(amount);
