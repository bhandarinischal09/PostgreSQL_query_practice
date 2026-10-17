🏥 Hospital Data Analysis using POSTGRESQL
📌 Project Overview

The Hospital Data Analysis project uses SQL to analyze hospital data and extract meaningful insights about patient counts, hospital departments, doctors, medical expenses, and patient admission and discharge records.

The project demonstrates how SQL aggregate functions, grouping, sorting, and date calculations can be used to answer practical healthcare data analysis questions.

🎯 Project Objectives
1.Calculate the total number of patients across all hospitals.
2.Analyze the average number of doctors available in each hospital.
3.Identify the top three departments with the highest patient counts.
4.Find hospitals with the highest medical expenses.
5.Calculate average medical expenses per patient stay day for each hospital.
6.Identify the longest patient stay.
7.Analyze patient counts across different cities.
8.Calculate the average length of stay in each department.
9.Identify the department with the lowest patient count.
10.Analyze monthly medical expenses.

📂 Project Structure
Hospital_Analysis/
│
├── Hospital_datas.csv
├── Hospital_queries.sql
└── README.md

📊 Dataset Description

File: Hospital_datas.csv

🔍 SQL Concepts Used
SELECT and FROM
SUM() and AVG()
MAX()
GROUP BY
ORDER BY
LIMIT
Date arithmetic and date calculations
DATE_TRUNC()
Aggregate-based analysis

📈 Key Analysis Areas
Patient Analysis: Calculate total patients and compare patient counts across departments and locations.
Hospital Performance: Analyze doctor availability and medical expenses.
Patient Stay Analysis: Calculate the length of stay using admission and discharge dates.
Financial Analysis: Calculate expenses per stay day and monthly medical expenses.
Department Analysis: Identify departments with the highest and lowest patient counts.

🚀 How to Run the Project
Install PostgreSQL and open pgAdmin or another PostgreSQL client.
Create a database for the project.
Create the aspatal table using the SQL script.
Import Hospital_datas.csv into the table, ensuring the column names and data types match.
Open Hospital_queries.sql.
Execute the queries to explore the hospital data and review the results.


💡 Project Outcome

This project demonstrates the application of SQL in healthcare data analysis. It helps identify patient distribution, hospital resource availability, length of stay, and medical expense patterns.

Note: The findings depend on the contents and quality of the supplied dataset. This project is intended for SQL learning and analytical practice.

👤 Author
Nischal Bhandari
Created as a SQL data analysis project for learning and practicing PostgreSQL.
