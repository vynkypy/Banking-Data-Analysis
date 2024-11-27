use bank
select * from accounts


-- What is the total number of accounts by type (e.g., Savings, Checking, Credit)?
select account_type, count(*) as Total_Accounts from accounts
group by account_type;

-- What are the minimum, maximum, and average balances within each account type?
select account_type, min(balance) as Minimum_Balacne, max(balance) as Maximum_Balance, round(avg(balance),2) as Average_Balance from accounts
group by account_type;

-- What is the average interest rate and credit limit for each account type?
select account_type, round(avg(interest_rate),2) as Avg_interest, round(avg(credit_limit),2) as Avg_Credit from accounts
group by account_type;


-- Which accounts have a balance of over $10,000? Provide the associated customer details and account types.
select account_number,account_type, balance, credit_limit from accounts
where balance > 10000;


-- What is the distribution of credit limits among active accounts?
select c.customer_status, min(a.credit_limit) as Min_credit_limit, max(a.credit_limit) as Max_credit_limit from accounts a
join customers c on a.customer_id = c.customer_id
group by c.customer_status
having c.customer_status = 'Active';
