create database pizaproject;
use pizaproject;

-- Retrieve the total number of orders placed.
select count(order_id) from orders;

-- Calculate the total revenue generated from pizza sales.
select sum(quantity*price) as total_revenue from order_details as od inner join pizza as p
on od.pizza_id=p.pizza_id;


-- Identify the highest-priced pizza.
select p.pizza_id,pt.name as pizza_name,size,price 
from pizza as p inner join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
order by price desc
limit 1;

-- Identify the most common pizza size ordered.
select p.size,sum(quantity) as total_quantity
from order_details od inner join pizza p on od.pizza_id=p.pizza_id
group by p.size
order by total_quantity desc
limit 1;

-- List the top 5 most ordered pizza types along with their quantities.
select pt.name as pizza_type,sum(quantity) as total_quantity
from order_details as od inner join pizza as p
on od.pizza_id=p.pizza_id
inner join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
group by pt.name
order by total_quantity desc
limit 5;

-- To display the unique records in each table and count.
-- order_details unique records
select * from order_details
union 
select * from order_details;
-- count of unique records
select count(*) as unique_records_count
from(select * from order_details
union 
select * from order_details) as unique_table;

-- orders unique records
select * from orders
union 
select * from orders;
-- count of unique records
select count(*) as unique_records_count
from(select * from orders
union 
select * from orders) as unique_table;

-- pizza unique records
select * from pizza
union 
select * from pizza;
-- count of unique records
select count(*) as unique_records_count
from(select * from pizza
union 
select * from pizza) as unique_table;

-- pizza_types unique records
select * from pizza_types
union 
select * from pizza_types;
-- count of unique records
select count(*) as unique_records_count
from(select * from pizza_types
union 
select * from pizza_types) as unique_table;

-- To display the null values in each column and each table.
-- order_details table
select *
from order_details
where order_details_id is null;

SELECT * 
FROM order_details
WHERE order_id IS NULL;

SELECT * 
FROM order_details
WHERE Pizza_id IS NULL;

SELECT * 
FROM order_details
WHERE quantity IS NULL;

-- orders table
SELECT * 
FROM orders
WHERE order_id IS NULL;

SELECT * 
FROM orders
WHERE date IS NULL;

SELECT * 
FROM orders
WHERE time IS NULL;

-- pizza table
SELECT * 
FROM pizza
WHERE Pizza_id IS NULL;

SELECT * 
FROM pizza
WHERE Pizza_type_id IS NULL;

SELECT * 
FROM pizza
WHERE size IS NULL;

SELECT * 
FROM pizza
WHERE price IS NULL;

-- pizza_types table
SELECT * 
FROM pizza_types
WHERE Pizza_type_id IS NULL;

SELECT * 
FROM pizza_types
WHERE name IS NULL;

SELECT * 
FROM pizza_types
WHERE category IS NULL;

SELECT * 
FROM pizza_types
WHERE ingredients IS NULL;

-- Join the necessary tables to find the total quantity of each pizza category ordered
select category ,sum(quantity) as total_quantity
from order_details as od inner join pizza as p
on od.pizza_id=p.pizza_id
inner join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
group by category;

-- Determine the distribution of orders by hour of the day.
select hour(time) as hour,sum(quantity) as total_quantity
from order_details as od inner join orders as o
on od.order_id=o.order_id
group by hour
order by hour;

-- Join relevant tables to find the category-wise distribution of pizza.
select category ,sum(quantity) as total_quantity
from order_details as od inner join pizza as p
on od.pizza_id=p.pizza_id
inner join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
group by category;

-- **Group the orders by date and calculate the average number of daily pizzas.
select date,avg(total_quantity)
from(select date,sum(quantity) as total_quantity
from order_details as od inner join orders as o
on od.order_id=o.order_id
group by date) as daily_pizzas
group by date;

-- Determine the top 3 most ordered pizza types based on revenue.
select pt.name as pizza_type,sum(quantity*price) as total_revenue
from order_details as od inner join pizza as p
on od.pizza_id=p.pizza_id
inner join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
group by pizza_type
order by total_revenue desc
limit 3;


