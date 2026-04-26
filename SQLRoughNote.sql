
-- Write a SQL query to find customers who placed orders in BOTH 2023 and 2024, but NOT in any other year
select distinct o1.customer_id from orders o1
join orders o2 on o1.customer_id = o2.customer_id
where YEAR(o1.order_date) = 2023
and YEAR(o2.order_date) = 2024
and o1.customer_id not in (select customer_id from orders where YEAR(order_date) not in (2023,2024));
