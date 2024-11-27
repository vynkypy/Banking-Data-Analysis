create database bank;

use bank;

CREATE TABLE customers (
    customer_id CHAR(36) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    date_of_birth DATE,
    account_open_date DATE,
    customer_status VARCHAR(10)
);

CREATE TABLE accounts (
    customer_id CHAR(36),
    account_number VARCHAR(34) UNIQUE,
    account_type VARCHAR(20),
    balance DECIMAL(15 , 2 ),
    interest_rate  DECIMAL(15 , 2 ),
    cretdit_limit  DECIMAL(15 , 2 ),
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

CREATE TABLE transactions (
    transaction_id CHAR(36) PRIMARY KEY,
    account_number CHAR(34),
    transaction_date TIMESTAMP,
    transaction_type VARCHAR(10),
    amount DECIMAL(15 , 2 ),
    description VARCHAR(255),
	merchant VARCHAR(255),
    FOREIGN KEY (account_number)
        REFERENCES accounts (account_number)
);


