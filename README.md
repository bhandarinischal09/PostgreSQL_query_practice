📚 Online Bookstore Analysis using SQL
📌 Project Overview

The Online Bookstore Analysis project uses SQL and PostgreSQL to analyze book inventory, customer information, and order transactions.

The project focuses on understanding book sales, revenue generation, customer purchasing behavior, genre performance, and remaining inventory through basic and advanced SQL queries.

🎯 Project Objectives
Retrieve books by genre and publication year.
Identify customers from specific countries.
Filter orders by date and total order amount.
Calculate the total stock of books available.
Identify the most expensive and lowest-stock books.
Calculate total revenue generated from orders.
Analyze the total quantity of books sold by genre and author.
Identify customers who placed multiple orders.
Find the most frequently ordered book.
Identify the top three most expensive Fantasy books.
Determine which cities have customers with high-value orders.
Identify customers who spent the most.
Calculate the estimated remaining stock after fulfilling orders.


📊 Dataset Description

The project uses three CSV files representing the main components of an online bookstore.

1. Books.csv

Contains information about books available in the bookstore.

Column	Description
Book_ID	Unique identifier for each book
Title	Title of the book
Author	Book author
Genre	Book genre
Published_Year	Year of publication
Price	Price of the book
Stock	Available stock quantity
2. Customers.csv

Contains customer information.

Column	Description
Customer_ID	Unique customer identifier
Name	Customer name
Email	Customer email address
Phone	Customer phone number
City	Customer city
Country	Customer country
3. Orders.csv

Contains order transaction details.

Column	Description
Order_ID	Unique order identifier
Customer_ID	Customer who placed the order
Book_ID	Book included in the order
Order_Date	Date of the order
Quantity	Number of books ordered
Total_Amount	Total amount recorded for the order
🛠️ Tools and Technologies
PostgreSQL — Database creation and management
SQL — Data querying and analysis
CSV — Data import and storage
🔍 SQL Concepts Used
SELECT and WHERE
DISTINCT
SUM(), AVG(), MIN(), and MAX()
COUNT()
GROUP BY and HAVING
ORDER BY and LIMIT
Subqueries
INNER JOIN and LEFT JOIN
IN operator
COALESCE()
Primary keys and foreign keys
Aggregate functions and inventory calculations
📈 Key Analysis Areas
Book Inventory Analysis: Analyze total stock, lowest-stock books, and estimated remaining inventory.
Sales Analysis: Calculate total revenue and quantity sold by genre and author.
Customer Analysis: Identify repeat customers and customers with the highest recorded spending.
Genre Analysis: Explore available genres, Fantasy book prices, and the most expensive books.
Order Analysis: Filter orders by date, quantity, and order amount.
Popular Books: Identify the most frequently ordered books using order counts.


🚀 How to Run the Project
Install PostgreSQL and open pgAdmin or another PostgreSQL client.
Execute 14 - PROJECT.sql to create the database tables and run the analysis queries.
Import Books.csv into the Books table.
Import Customers.csv into the Customers table.
Import Orders.csv into the Orders table after the referenced customer and book records are available.
Ensure the CSV column order, headers, and data types match the table definitions.
Run the SQL queries to explore the results.

Important: If your SQL script contains DROP TABLE statements, execute the table creation and import steps in the correct order. Dropping and recreating tables removes their existing data.

💡 Project Outcome

This project demonstrates how SQL can be used to analyze an online bookstore's sales, customer activity, book popularity, and inventory.

It provides practical experience with joins, subqueries, aggregation, filtering, and relational database design.

Note: Remaining-stock calculations assume that the recorded orders should be deducted from the current stock. If Stock already represents current inventory, subtracting historical orders again may not reflect actual inventory.

👤 Author

Created as a SQL data analysis project for learning and practicing PostgreSQL.
