Basic:

Q1: Retrieve the total number of orders placed.

SELECT COUNT(*) AS total_orders FROM orders;

Q2: Calculate the total revenue generated from pizza sales.

SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_sales FROM order_details JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id;

Q3: Identify the highest-priced pizza.

SELECT pizza_types.name, pizzas.price FROM pizza_types JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id ORDER BY pizzas.price DESC LIMIT 1;

Q4: Identify the most common pizza size ordered.

SELECT pizzas.size, COUNT(order_details.order_details_id)  as total_order FROM pizzas JOIN order_details ON pizzas.pizza_id = order_details.pizza_id GROUP BY pizzas.size ORDER BY total_order DESC LIMIT 1;

Q5: List the top 5 most ordered pizza types along with their quantities.

SELECT pizza_types.name, SUM(order_details.quantity) AS total_quantity FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id GROUP BY pizza_types.name ORDER BY total_quantity DESC LIMIT 5;

Intermediate:

Q- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT pizza_types.category, SUM(order_details.quantity) AS total_quantity FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id GROUP BY pizza_types.category ORDER BY total_quantity DESC;


Q- Determine the distribution of orders by hour of the day.

SELECT HOUR(orders.time) AS order_hour, COUNT(order_id) AS total_orders FROM orders GROUP BY HOUR(orders.time) ORDER BY HOUR(orders.time) DESC;



Q- Join relevant tables to find the category-wise distribution of pizzas.

SELECT category, COUNT(NAME) AS total_pizza FROM pizza_types GROUP BY category;



Q- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT AVG(qty) as avg_pizzas_per_day FROM 
(SELECT orders.date, SUM(order_details.quantity) AS qty FROM orders JOIN order_details ON orders.order_id = order_details.order_id GROUP BY orders.date) AS order_quantity;


Q- Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_types.name, ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue FROM pizza_types JOIN pizzas  ON pizza_types.pizza_type_id = pizzas.pizza_type_id 
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id GROUP BY pizza_types.name ORDER BY revenue DESC LIMIT 3;


Advanced:

Calculate the percentage contribution of each pizza type to total revenue.


SELECT pizza_types.category, ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_sales FROM order_details JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id) * 100, 2)  AS revenue FROM pizza_types JOIN pizzas  ON pizza_types.pizza_type_id = pizzas.pizza_type_id 
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id GROUP BY pizza_types.category ORDER BY revenue DESC;



Analyze the cumulative revenue generated over time.


SELECT DATE, SUM(revenue) OVER(ORDER BY DATE) AS cum_revenue FROM (SELECT orders.date, SUM(order_details.quantity * pizzas.price) AS revenue FROM order_details JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id 
JOIN orders ON orders.order_id = order_details.order_id 
GROUP BY orders.date) AS sales;


Determine the top 3 most ordered pizza types based on revenue for each pizza category. 


SELECT NAME, category, revenue, rn FROM 
(SELECT category, NAME, revenue, RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rn FROM (SELECT pizza_types.category, pizza_types.name, SUM((order_details.quantity) * pizzas.price) AS revenue FROM pizza_types JOIN pizzas 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.category, pizza_types.name) AS cat_revenue) AS cat_revenue_rank WHERE rn <= 3;