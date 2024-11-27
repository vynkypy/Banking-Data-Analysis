import pandas as pd
from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()

# Set up lists to hold data
customer_profiles = []
bank_transactions = []
account_info = []

# A set to keep track of unique emails
email_set = set()

# Number of records
num_customers = 200  # Number of customers
num_transactions = 1000  # Total number of transactions

# Generate customer profiles
for _ in range(num_customers):
    customer_id = fake.unique.uuid4()
    full_name = fake.name()
    first_name, last_name = full_name.split(' ', 1)  # Split into first and last name
    email_base = f"{first_name.lower()}.{last_name.lower()}@gmail.com"  # Base email

    # Ensure the email is unique
    email = email_base
    counter = 1
    while email in email_set:
        email = f"{first_name.lower()}.{last_name.lower()}{counter}@gmail.com"
        counter += 1

    # Add email to the set of used emails
    email_set.add(email)

    profile = {
        'customer_id': customer_id,
        'name': full_name,
        'email': email,
        'phone': fake.phone_number(),
        'address': fake.address(),
        'date_of_birth': fake.date_of_birth(minimum_age=18, maximum_age=90),
        'account_open_date': fake.date_between(start_date='-10y', end_date='today'),
        'customer_status': random.choice(['Active', 'Inactive', 'Closed']),
    }
    customer_profiles.append(profile)

# Generate account information for each customer
for profile in customer_profiles:
    account = {
        'customer_id': profile['customer_id'],
        'account_number': fake.unique.iban(),
        'account_type': random.choice(['Savings', 'Checking', 'Credit']),
        'balance': round(random.uniform(500.0, 50000.0), 2),
        'interest_rate': round(random.uniform(0.01, 5.0), 2),
        'credit_limit': round(random.uniform(1000.0, 20000.0), 2) if profile['customer_status'] != 'Closed' else 0.0,
    }
    account_info.append(account)

# Generate bank transactions
for _ in range(num_transactions):
    transaction = {
        'transaction_id': fake.unique.uuid4(),
        'account_number': random.choice(account_info)['account_number'],
        'transaction_date': fake.date_time_between(start_date='-2y', end_date='now'),
        'transaction_amount': round(random.uniform(-5000.0, 10000.0), 2),
        'transaction_type': random.choice(['Credit', 'Debit']),
        'transaction_description': fake.sentence(nb_words=5),
        'merchant': fake.company(),
    }
    bank_transactions.append(transaction)

# Convert lists to pandas DataFrames
df_customers = pd.DataFrame(customer_profiles)
df_accounts = pd.DataFrame(account_info)
df_transactions = pd.DataFrame(bank_transactions)

# Save to CSV files with UTF-8 encoding
df_customers.to_csv('customers.csv', index=False, encoding='utf-8')
df_accounts.to_csv('accounts.csv', index=False, encoding='utf-8')
df_transactions.to_csv('transactions.csv', index=False, encoding='utf-8')

print("Datasets generated and saved as customers.csv, accounts.csv, and transactions.csv.")
