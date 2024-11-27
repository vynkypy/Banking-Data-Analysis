# Banking-Data-Analysis
A project analyzing synthetic banking data generated with Python. It explores customer demographics, account details, and transaction trends via SQL. Includes data generation scripts, SQL queries for insights, and documentation. Key features: customer behavior analysis, high-value transactions, and account performance metrics.


Overview:
This project demonstrates the power of SQL and Python for exploring and analyzing banking datasets. The project covers:

Generating synthetic banking data (customer profiles, account details, and transactions).
Exploring customer demographics, account types, balances, and transaction histories.
Identifying trends and insights such as high-value transactions, overdrawn accounts, and customer behavior.

Key Features:
Data Generation: A Python script (Banking-dummy-data.py) to create synthetic datasets for customers, accounts, and transactions.
SQL Queries: Scripts to load, explore, and analyze the data, organized by category (customers, accounts, transactions, and advanced behavior analysis).
Documentation: A guide to the business questions addressed, including key insights and actionable recommendations.

Getting Started:
Clone the Repository:

git clone https://github.com/vynkypy/Banking-Data-Analysis.git
cd Banking-Data-Analysis

Generate Data:
Run the Banking-dummy-data.py script to create the datasets (customers.csv, accounts.csv, transactions.csv).

Set Up the Database:
Use create_tables.sql to create the database schema.
Use importing_data.sql to load the data into the database.

Run Analysis:
Use the SQL scripts in the SQL Scripts folder to explore and analyze the data.

Analysis Highlights:
  Customer Insights:
  Total customers categorized by status (Active, Inactive, Closed).
  Age distribution and account activity trends.
  Account Analysis:
  Distribution of balances by account type.
  Credit limit and interest rate trends.
  Transaction Trends:
  High-value transactions and transaction types.
  Monthly transaction volumes and customer behavior.

Dependencies:
Python: Required for data generation. Libraries used:
Faker
Pandas
SQL: Any SQL-compliant database (e.g., MySQL, PostgreSQL) to execute the analysis queries.

Contributing:
Feel free to submit issues, suggest features, or contribute new queries and improvements through pull requests.

