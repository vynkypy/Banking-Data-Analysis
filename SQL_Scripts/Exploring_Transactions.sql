use bank

select * from transactions

-- What is the date range of transactions in the transactions table?
select date(min(transaction_date)) as Min_date, date(max(transaction_date)) as Max_date from transactions


-- How many transactions are recorded in total, and what is the average transaction amount for credits and debits?
select transaction_type, count(transaction_id) as total_transactions, round(avg(transaction_amount),2) as amount from transactions
group by transaction_type;


-- What are the minimum and maximum transaction amounts, and which accounts do they involve?
select a.account_type, min(t.transaction_amount) as min_amount, max(t.transaction_amount) as max_amount from transactions t 
join accounts a on t.account_number = a.account_number
group by a.account_type;


-- Identify high-value transactions (e.g., above $5,000). How many of these transactions occurred within the last six months?
select account_number, transaction_amount, count(datediff(curdate(), transaction_date)) as total_transaction_in_6_months from transactions
where  datediff(curdate(), transaction_date) < 182
group by account_number, transaction_amount
having transaction_amount > 5000


-- What are the most common transaction types? Calculate the average amount per transaction type.
select transaction_type, count(transaction_type) as total_transactions, round(avg(transaction_amount),2) as avg_amount from transactions
group by transaction_type
order by total_transactions desc

-- What is the monthly transaction volume and total amount for credits and debits?
select transaction_type, month(transaction_date) as months, count(transaction_id) as total_transactions from transactions
group by transaction_type, months
order by transaction_type asc