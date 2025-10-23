🧠 End-to-End Data Analytics Project with Python & SQL

This project demonstrates an end-to-end data analytics workflow — from data ingestion to data cleaning, database integration, and SQL-based business insights.

The goal of this project is to simulate a real-world analytics pipeline where raw data is obtained via an API, processed in Python, stored in a relational database, and queried to answer business-driven questions.

📊 Project Overview

Tech Stack:

Python (Data processing & cleaning)

Pandas (Data wrangling)

PostgreSQL (Database)

Supabase (Cloud-hosted Postgres instance)

Kaggle API (Dataset retrieval)

SQL (Business insights & reporting)


⚙️ Workflow Summary

Data Collection: Retrieved the dataset using the Kaggle API.

Data Processing & Cleaning (Python): Used Pandas for data wrangling and transformation.

Handled missing values, corrected data types, and standardized column names.

Data Loading: Loaded the cleaned dataset into a PostgreSQL database hosted on Supabase.

Created and managed database tables using psycopg2 and SQL scripts.

Data Analysis (SQL): Wrote SQL queries to extract insights and answer key business questions.



💡 Business Questions Answered

1. Top 10 highest revenue-generating products

2. Top 5 highest selling products in each region — by quantity, then by revenue

3. Month-over-month growth comparison for 2022 and 2023 sales (e.g., Jan 2022 vs Jan 2023)

4. For each category, which month had the highest sales by revenue?

5. Which sub-category had the highest profit growth in 2023 compared to 2022?



🚀 How to Run the Project
1. Clone the repository
git clone https://github.com/Margaret-Mwangi/SQL-Python-Projects.git
cd SQL-Python-Projects

2. Set up environment variables

Create a .env file based on .env.example and fill in your credentials:

database_user=<your_postgres_db_username>
password=<your_postgres_db_password>
host=<your_superbase_host>
port=<database_port>
dbname=<your_database_name>

3. Install dependencies
pip install -r requirements.txt

4. Run the pipeline
python orders data analysis.ipynb

5. Execute SQL queries

Connect to your Supabase PostgreSQL instance using any SQL client and run queries from orders_analysis.sql.

📈 Insights & Results

All SQL queries provide key business insights such as:

Product performance by sales and revenue

Regional demand patterns

Year-over-year and month-over-month sales growth trends

Category and sub-category profitability analysis

🧠 Key Learnings

How to use Kaggle API for automated data retrieval

Data cleaning and transformation with Pandas

Setting up and interacting with PostgreSQL on Supabase

Writing analytical SQL queries for real-world business use cases

Using .env files for secure credential management

🏁 Next Steps

Potential improvements:

Automate the pipeline with Airflow or Prefect

Build dashboards in Power BI or Tableau

Add dbt for modular SQL transformations

🧑‍💻 Author

Margaret Mwangi
💼 Aspiring Data Engineer | Passionate about Analytics, SQL, and Cloud Data Solutions
📫 LinkedIn
 | GitHub
