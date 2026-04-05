SQL Data Warehouse & Analytics Project
Project Overview

This project demonstrates the design and implementation of a SQL-based Data Warehouse for analytical reporting and business intelligence. The project includes data ingestion, staging, ETL transformation, dimensional modeling using a Star Schema, and analytics reporting using SQL and Power BI.

The objective of this project is to transform raw data into a structured format that supports business analysis and decision-making.

This project was planned and tracked using Notion for task management, documentation, and project workflow tracking.

Business Problem

Organizations generate large amounts of raw data, but this data is often not structured for analytics. This project builds a centralized Data Warehouse to analyze:

Sales performance
Customer purchasing behavior
Product performance
Store performance
Monthly and yearly sales trends

This enables business users to make data-driven decisions using dashboards and reports.

Data Warehouse Architecture

The project follows a layered Data Warehouse architecture:

Source Data (CSV Files)
        ↓
Staging Layer
        ↓
ETL (Data Cleaning & Transformation)
        ↓
Data Warehouse (Star Schema)
        ↓
Analytics Queries
        ↓
Power BI Dashboard
Data Model – Star Schema
Fact Table

fact_sales

date_id
customer_id
product_id
store_id
quantity
sales_amount
Dimension Tables
dim_customer
dim_product
dim_store
dim_date

The Star Schema model improves query performance and simplifies reporting.

ETL Process

The ETL pipeline performs the following steps:

Load raw CSV data into staging tables
Clean and validate data
Remove duplicates and handle missing values
Transform data into structured format
Load dimension tables
Load fact table with foreign key relationships
Run analytical queries for reporting
Analytics & Reporting

The warehouse supports the following analytics:

Total Sales
Sales by Month
Sales by Product
Sales by Store
Top Customers by Revenue
Top Products by Sales
Revenue Trends Over Time

These analytics are visualized using Power BI dashboards.

Project Planning & Documentation

Project planning, task tracking, and documentation were managed using Notion. The Notion workspace included:

Project roadmap
Task tracking
Architecture planning
Data model design
ETL workflow planning
Dashboard planning
Documentation notes

This helped simulate a real-world data engineering project workflow.

Project Structure
sql-data-warehouse-project/
│
├── data/                  # Raw CSV data files
├── staging/               # Staging table scripts
├── warehouse/             # Fact and Dimension table scripts
├── etl/                   # ETL scripts
├── analytics/             # Analytical SQL queries
├── dashboards/            # Power BI dashboard screenshots
├── docs/                  # Architecture and Star Schema diagrams
└── README.md
Tools & Technologies Used
SQL Server / PostgreSQL
SQL (ETL & Data Transformation)
Power BI
Draw.io (Architecture Diagram)
Notion (Project Planning)
GitHub (Version Control)
CSV Files
Key Data Engineering Concepts Used
Data Warehousing
ETL Pipeline
Star Schema
Fact and Dimension Tables
Data Cleaning and Transformation
Analytical Queries
Dashboard Reporting
Project Documentation and Planning
Future Improvements
Slowly Changing Dimensions (SCD)
Incremental ETL Loading
Index Optimization
Stored Procedures for ETL Automation
Cloud Data Warehouse (Azure Synapse / Snowflake)
Related Data Engineering Projects

This project is part of a Data Engineering portfolio that also includes:

Databricks Medallion Architecture Pipeline (PySpark + Delta Lake)
Azure Driver Behaviour Analytics Pipeline (ADF + Databricks + Synapse + Power BI)
Author

Sai Krishna Reddy Kaithi
Vancouver, Canada
Aspiring Data Engineer | Azure | Databricks | SQL | ETL | Power BI
