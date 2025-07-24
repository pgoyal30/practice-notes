CREATE DATABASE data_analysis_course;
USE data_analysis_course;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT,
    city VARCHAR(100),
    created_at DATE
);

INSERT INTO users (name, email, age, city, created_at) VALUES
('Alice', 'alice@example.com', 25, 'New York', '2024-06-01'),
('Bob', 'bob@example.com', 30, 'Los Angeles', '2024-06-05'),
('Charlie', 'charlie@example.com', 35, 'Chicago', '2024-06-10'),
('Diana', 'diana@example.com', 28, 'Houston', '2024-06-15'),
('Eve', 'eve@example.com', 22, 'Phoenix', '2024-06-20'),
('Frank', 'frank@example.com', 27, 'Philadelphia', '2024-06-25'),
('Grace', 'grace@example.com', 32, 'San Antonio', '2024-06-30'),
('Hank', 'hank@example.com', 40, 'San Diego', '2024-07-01'),
('Ivy', 'ivy@example.com', 29, 'Dallas', '2024-07-05'),
('Jack', 'jack@example.com', 31, 'San Jose', '2024-07-08');

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    status VARCHAR(50),
    created_at DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (user_id, amount, status, created_at) VALUES
(1, 250.00, 'Completed', '2024-06-10'),
(2, 450.00, 'Completed', '2024-06-12'),
(3, 300.00, 'Pending', '2024-06-14'),
(4, 150.00, 'Completed', '2024-06-18'),
(5, 500.00, 'Cancelled', '2024-06-22'),
(6, 350.00, 'Completed', '2024-06-26'),
(7, 600.00, 'Completed', '2024-07-01'),
(8, 200.00, 'Pending', '2024-07-03'),
(9, 700.00, 'Completed', '2024-07-06'),
(10, 400.00, 'Completed', '2024-07-08'),
(1, 100.00, 'Completed', '2024-07-09'),
(2, 150.00, 'Completed', '2024-07-10'),
(3, 200.00, 'Cancelled', '2024-07-11');




Q1: Get all users.


SELECT * FROM users;


Q2: Get the name and email of users who live in 'Delhi'.


SELECT name, email FROM users WHERE city = 'Delhi'; 


Q3: Count total users.


SELECT COUNT(*) AS total_users FROM users;



Q4: Get users who have placed orders.


SELECT * FROM users
WHERE id IN (SELECT user_id FROM orders);

Q5: Get users who have never placed an order.


SELECT * FROM users
WHERE id NOT IN (SELECT user_id FROM orders);



Q6: Create a view for active users (age < 35).


CREATE VIEW active_users AS
SELECT * FROM users WHERE age < 35;


Q7: Get data from the view.


SELECT * FROM active_users;


Q8: Create an index on the city column.


CREATE INDEX idx_city ON users(city);


Q9: Insert a new order using a transaction.


START TRANSACTION;

INSERT INTO orders (user_id, amount, order_date)
VALUES (1, 1500, NOW());

COMMIT;


Q10: Create a stored procedure to get all users.


DELIMITER //

CREATE PROCEDURE showAllUsers()
BEGIN
   SELECT * FROM users;
END //

DELIMITER ;

CALL showAllUsers();

Q11: Get user by ID using input parameter.


DELIMITER //

CREATE PROCEDURE getUserById(IN uid INT)
BEGIN
   SELECT * FROM users WHERE id = uid;
END //

DELIMITER ;

CALL getUserById(3);



Q12: Check user age category.


DELIMITER //

CREATE PROCEDURE checkUserAge(IN uid INT)
BEGIN
   DECLARE userAge INT;

   SELECT age INTO userAge FROM users WHERE id = uid;

   IF userAge >= 18 THEN
       SELECT 'Adult' AS category;
   ELSE
       SELECT 'Minor' AS category;
   END IF;
END //

DELIMITER ;

CALL checkUserAge(2);


Q13: Rank users based on amount spent.


SELECT u.id, u.name, SUM(o.amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.amount) DESC) AS spend_rank
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;


Q14: Find total number of orders by each user.


SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id;


Q15: Get average order amount for each user.


SELECT user_id, AVG(amount) AS avg_order
FROM orders
GROUP BY user_id;





