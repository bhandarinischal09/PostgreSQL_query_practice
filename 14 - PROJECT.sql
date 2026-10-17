CREATE DATABASE OnlineBookstore;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) RETRIVE ALL BOOKS IN 'FICTION' GENRE :

SELECT * FROM Books
WHERE genre = 'Fiction';


-- 2) Find Books Published After the year 1950 :
SELECT * FROM Books
WHERE published_year > 1950;

-- 3) List all the customers from 'CANADA' :

SELECT * FROM customers
WHERE country = 'Canada';

-- 4) SHOW ORDER PLACED IN NOVEMBER 2023 :

SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';


-- 5) RETRIEVE THE TOTAL STOCKS OF BOOKS AVAILABLE :
SELECT SUM(stock) AS Total_stocks
FROM BOOKS;


-- 6) DETAILS OF MOST EXP BOOKS :

SELECT *
FROM Books
WHERE price = (SELECT MAX(price) FROM BOOKS);


-- 7) SHOW ALL CUSTOMERS WHO ORDERED MORE THAN 1 QUANTITY OF BOOKS :


SELECT * FROM Customers
WHERE customer_id IN (SELECT customer_id
					 FROM Orders
				     WHERE quantity > 1);

					 
-- 8) RETRIEVE ALL ORDERS WHERE TOTAL PRICE > 20$ :

SELECT * FROM Orders
WHERE total_amount > 20;


-- 9) List all genres available in the Books Table :

SELECT genre
FROM Books 
GROUP by genre ;

OR 

SELECT DISTINCT genre FROM Books;

-- 10) FIND THE BOOKS WITH LOWEST STOCK :
SELECT * FROM BOOKS
WHERE stock IN ( SELECT MIN(stock)
				 FROM BOOKS 
);


-- 11) Calculate the Total Revenue generated from all orders

SELECT SUM(total_amount) AS Total_Revenue
FROM Orders;


-- ADVANCED QUESTIONS :
-- 1) RETRIEVE TOTAL NUMBER OF BOOKS SOLD FOR EACH GENRE :

SELECT b.genre,
	   SUM(o.quantity) as Total_Sold
FROM Books b
JOIN Orders o
ON
b.book_id = o.book_id
GROUP BY b.genre
ORDER BY Total_Sold DESC;


-- 2) Find AVG price of books in 'Fantasy' Genre :

SELECT AVG(price) FROM BOOKS
WHERE genre = 'Fantasy';


-- 3) List customers who have placed at least 2 Orders :

SELECT c.name,
	   o.customer_id,
	   COUNT(o.order_id) AS Total_Orders
FROM customers c
JOIN orders o
ON
c.customer_id = o.customer_id 
GROUP BY o.customer_id,c.name
HAVING COUNT(o.order_id)  > 1
ORDER BY Total_Orders;


-- 4) Find the Most Frequently Ordered Book :
SELECT b.title,
	   o.book_id,
	   COUNT(o.order_id)
FROM Books b
JOIN Orders o
ON
b.book_id = o.book_id
GROUP BY o.book_id,b.title
ORDER BY COUNT(o.order_id) DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT book_id,title,genre,price
FROM Books
WHERE genre = 'Fantasy' ORDER BY price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author :

SELECT b.author AS author_name,
       SUM(o.quantity) AS total_Sold
FROM Books b
JOIN Orders o
ON
b.book_id = o.book_id
GROUP BY b.author
ORDER BY SUM(o.quantity) DESC;

-- 7) Select the cities where customers spent over 30$ are located :


SELECT c.city AS cities,
	   o.total_amount AS Spent_Price
FROM customers c
JOIN Orders o
ON
c.customer_id = o.customer_id
WHERE  o.total_amount > 30;


-- 8) Find the customers who spent the most on orders :

SELECT c.name AS c_name,
       c.customer_id,
       SUM(o.total_amount) AS Spent
FROM customers c
JOIN orders o
ON
c.customer_id = o.customer_id
GROUP BY  c.customer_id,c.name
ORDER BY SUM(o.total_amount) DESC LIMIT 1;


-- 9) Calculate the stock remaining after fulfilling all orders :

	 
SELECT b.book_id,b.title,
        b.stock AS Before_Stock,
		COALESCE(SUM(o.quantity),0) AS Ordered_Stock,
	   b.stock - COALESCE(SUM(o.quantity),0) AS Leftover_Stock
FROM books b
LEFT JOIN Orders o
ON 
b.book_id = o.book_id
GROUP BY b.book_id ORDER BY b.book_id;

