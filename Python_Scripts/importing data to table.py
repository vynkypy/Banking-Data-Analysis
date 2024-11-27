import pandas as pd
from sqlalchemy import create_engine

# 1. Define your MySQL connection parameters
username = 'root'  # Your MySQL username
password = 'admin'  # Your MySQL password
database = 'bank'  # The database name
host = 'localhost'  # MySQL server host (use 'localhost' or your server IP)

# 2. Create a connection to the MySQL database using SQLAlchemy
engine = create_engine(f'mysql+pymysql://{username}:{password}@{host}/{database}')

# 3. Read the CSV file using pandas
csv_file_path = r"C:\Users\Aventior\Desktop\LB\JOB SWITCH PREP\Daily Python Codes\Banking Project\transactions.csv" # Specify the path to your CSV file
df = pd.read_csv(csv_file_path)

# 4. Load data into the MySQL table
# Specify the table name in the database you want to load the data into
table_name = 'transactions'

# Insert the data into the table (use 'replace' to replace existing data, 'append' to add new rows)
df.to_sql(table_name, con=engine, index=False, if_exists='replace')  # Or use 'append' instead of 'replace'

print(f"Data from {csv_file_path} has been loaded into the {table_name} table successfully.")
