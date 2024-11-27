select * from customers;

-- What is the total number of customers? Break down by customer status (e.g., Active, Inactive, Closed).
select customer_status, count(customer_id) as total_customers from customers
group by customer_status
union
select 'total' , count(customer_id) as total_customers from customers ;


-- What is the age range of customers, and what is the average age?
select name, (year(now()) - Year(date_of_birth)) as age from customers
where (year(now()) - Year(date_of_birth)) = (select min(year(now()) - Year(date_of_birth)) as age from customers)
or (year(now()) - Year(date_of_birth)) =  (select max(year(now()) - Year(date_of_birth)) as age from customers)
order by age;

-- Alternate way
SELECT 
    MIN(YEAR(CURDATE()) - YEAR(date_of_birth)) AS min_age,
    MAX(YEAR(CURDATE()) - YEAR(date_of_birth)) AS max_age,
    AVG(YEAR(CURDATE()) - YEAR(date_of_birth)) AS avg_age
FROM customers;


-- How many customers opened accounts in each year (e.g., find the number of accounts opened per year)?
select year(account_open_date) as Open_date, count(customer_id) as Total_accounts from customers
group by year(account_open_date)
order by year(account_open_date) desc;


-- What are the most common customer statuses and the average account duration for each?
select customer_status, count(customer_id) as Total_customers,
	round(avg(datediff(curdate(), account_open_date)/365),2) as Duration from customers
group by customer_status;



