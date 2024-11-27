-- Analyze Customer Behavior

use bank;

select * from customers;
select * from accounts;
select * from transactions;

-- Combine customer and account data to view each customer’s account status, type, and balance.
select c.customer_id, c.name, c.customer_status, a.account_type, a.balance, a.credit_limit
from customers c join accounts a using(customer_id);

-- Combine customer, account, and transaction data to create a comprehensive view of customer transactions.
select c.name, a.account_number, t.transaction_date 
from customers c join accounts a using(customer_id)
join transactions t using(account_number);

-- Identify the top 5 customers with the highest transaction amounts. What types of transactions do they most frequently make?
select c.name, max(t.transaction_amount) as max_amount, t.transaction_type
from customers c join accounts a using(customer_id)
join transactions t using(account_number)
group by c.name, t.transaction_type 
order by max_amount desc
limit 5;

-- What are the least and most frequent transaction types associated with active customers?
select c.name, c.customer_status, t.transaction_type, t.transaction_amount
from customers c join accounts a using(customer_id)
join transactions t using(account_number)
where t.transaction_amount = (select max(transaction_amount) from transactions) or
t.transaction_amount = (select min(transaction_amount) from transactions);

-- Who are the top 5 customers with the highest total balances? Include account types and average transaction amounts.
select c.name, a.account_type, round(sum(a.balance),2) as total_balance, round(avg(t.transaction_amount),2) as avg_transaction
from customers c join accounts a using(customer_id)
join transactions t using(account_number)
group by c.name, a.account_type 
order by total_balance desc
limit 5;


-- Find customers with overdrawn accounts (negative balance) and list their recent transaction history.
select c.name, a.balance, t.transaction_date, t.transaction_amount, t.transaction_type from customers c
join accounts a using(customer_id)
join transactions t using (account_number)
where t.transaction_amount < 0;


