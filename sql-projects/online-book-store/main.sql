-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM books WHERE LOWER(genre) = "fiction";


-- 2) Find books published after the year 1950:
SELECT * FROM books WHERE published_year > 1950;

-- 3) List all customers from the Canada:
SELECT * FROM customers WHERE LOWER(country) = "canada";


-- 4) Show orders placed in November 2023:


SELECT * FROM orders WHERE MONTH(order_date) = 11 AND YEAR(order_date) = 2023;

SELECT * FROM orders WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';


-- 5) Retrieve the total stock of books available:

SELECT SUM(stock) AS total_stock FROM books;

-- 6) Find the details of the most expensive book:
SELECT * FROM books ORDER BY price DESC LIMIT 1;


-- 7) Show all orders who ordered more than 1 quantity of a book:
SELECT * FROM orders WHERE quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM orders WHERE total_amount > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT(Genre) AS  genres FROM books;


-- 10) Find the book with the lowest stock:
SELECT * FROM books ORDER BY books.stock ASC LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS total_revenue FROM orders;


-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
SELECT books.genre, sum(orders.quantity) AS total_sold FROM orders INNER JOIN books ON orders.book_id = books.book_id GROUP BY (genre);


-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(price) AS average_price FROM books WHERE genre = 'fantasy';

-- 3) List customers who have placed at least 2 orders:

SELECT customers.customer_id, customers.name, count(quantity) AS order_count FROM customers INNER JOIN orders ON customers.Customer_ID = orders.Customer_ID  GROUP BY orders.Customer_ID HAVING order_count > 2;


-- 4) Find the most frequently ordered book:

SELECT books.book_ID, books.Title, COUNT(orders.Order_ID) AS total_order  FROM orders JOIN books ON orders.book_id = books.book_id GROUP BY orders.Book_ID ORDER BY total_order DESC;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books WHERE books.Genre = "Fantasy" ORDER BY price DESC LIMIT 3;


-- 6) Retrieve the total quantity of books sold by each author:
SELECT books.Author, SUM(orders.Quantity) AS total_sold_qty FROM orders JOIN books ON orders.Book_ID = books.Book_ID GROUP BY books.Author;



-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT(customers.City) FROM orders JOIN customers ON orders.Customer_ID = customers.Customer_ID WHERE total_amount > 30;


-- 8) Find the customer who spent the most on orders:
SELECT customers.Customer_ID, customers.Name, SUM(orders.Total_Amount) AS total_spent  FROM orders JOIN customers ON orders.Customer_ID = customers.Customer_ID GROUP BY customers.Customer_ID ORDER BY total_spent DESC LIMIT 1;


--9) Calculate the stock remaining after fulfilling all orders:
SELECT books.Book_ID, books.Title, books.Stock, COALESCE(SUM(orders.Quantity), 0) AS total_qty_sold, (books.Stock - COALESCE(SUM(orders.Quantity), 0)) as remaining_qty FROM books LEFT JOIN orders ON books.Book_ID = orders.Book_ID GROUP BY books.Book_ID;