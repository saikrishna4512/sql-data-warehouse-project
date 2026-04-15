# 📊 Data Warehouse and Analytics Project

## 📌 Overview

This project demonstrates a **modern data warehousing solution** using a **Medallion Architecture (Bronze, Silver, Gold layers)** implemented in SQL Server.

The goal of this project is to transform raw CRM and ERP data into **clean, structured, and analytics-ready datasets** that support business intelligence and reporting.

---

## 🏗️ Architecture

The project follows a **Medallion Architecture**:

* **Bronze Layer** → Raw data ingestion from source systems
* **Silver Layer** → Data cleaning, transformation, and standardization
* **Gold Layer** → Business-ready analytical views (star-schema style)

```
Source (CSV Files)
        ↓
Bronze Layer (Raw Tables)
        ↓
Silver Layer (Cleaned Tables)
        ↓
Gold Layer (Analytical Views)
```

---

## 📂 Project Structure

```
datasets/
    source_crm/
    source_erp/

docs/
    (architecture diagrams / screenshots)

scripts/
    init_database.sql

    bronze/
        ddl_bronze.SQL
        proc_load_bronze.sql

    silver/
        ddl_silver.sql
        proc_load_silver.sql

    gold/
        ddl_gold.sql

tests/
    quality_checks_silver.sql
    quality_checks_gold.sql
```

---

## 🧱 Data Layers

### 🥉 Bronze Layer (Raw Data)

* Stores raw data from CRM and ERP systems
* Data is ingested using `BULK INSERT`
* No transformations applied
* Used as the source of truth

---

### 🥈 Silver Layer (Cleaned Data)

* Applies data cleaning and transformations:

  * Data type standardization
  * Null handling
  * Deduplication
  * Data enrichment
* Prepares data for analytics

---

### 🥇 Gold Layer (Analytics Layer)

The Gold layer contains **business-ready views** designed for reporting and analysis.

**Available Views:**

* `gold.dim_customers` → Customer dimension
* `gold.dim_products` → Product dimension
* `gold.fact_sales` → Sales fact table

These views enable:

* Customer analysis
* Product performance tracking
* Sales trend analysis

---

## 🚀 How to Run This Project

### 📌 Prerequisites

* SQL Server (or Azure SQL Server)
* SQL Server Management Studio (SSMS)
* Access to CSV files in `/datasets` folder

---

### 🧱 Step 1: Initialize Database

Run:

```
scripts/init_database.sql
```

This will:

* Create `DataWarehouse` database
* Create schemas: `bronze`, `silver`, `gold`

---

### 🥉 Step 2: Create Bronze Layer

Run:

```
scripts/bronze/ddl_bronze.SQL
```

Then:

```
scripts/bronze/proc_load_bronze.sql
```

---

### ⚠️ Step 3: Update File Paths (IMPORTANT)

Before loading data, update file paths inside:

```
scripts/bronze/proc_load_bronze.sql
```

Replace local paths like:

```
D:\...\cust_info.csv
```

With your local dataset paths:

```
datasets/source_crm/
datasets/source_erp/
```

---

### ▶️ Step 4: Load Bronze Data

```
EXEC bronze.load_bronze;
```

---

### 🥈 Step 5: Create Silver Layer

Run:

```
scripts/silver/ddl_silver.sql
```

Then:

```
scripts/silver/proc_load_silver.sql
```

---

### ▶️ Step 6: Load Silver Data

```
EXEC silver.load_silver;
```

---

### 🥇 Step 7: Create Gold Layer

Run:

```
scripts/gold/ddl_gold.sql
```

---

### ✅ Step 8: Run Data Quality Checks

Run:

```
tests/quality_checks_silver.sql
tests/quality_checks_gold.sql
```

---

### 📊 Query Final Data

```
SELECT * FROM gold.fact_sales;
SELECT * FROM gold.dim_customers;
SELECT * FROM gold.dim_products;
```

---

## ✅ Data Quality Checks

The project includes validation scripts to ensure:

* No duplicate records in dimensions
* Valid relationships between fact and dimensions
* Data consistency after transformations

---

## 📊 Use Cases

This warehouse supports:

* Sales performance analysis
* Customer segmentation
* Product performance tracking
* Business reporting

---

## ⚠️ Limitations

* Uses **full refresh (truncate and load)** instead of incremental loading
* File paths must be manually updated before execution
* Limited dimensional model (no date/store dimensions yet)

---

## 🚀 Future Enhancements

* Add **incremental loading (CDC / watermark-based)**
* Add **dim_date and additional dimensions**
* Parameterize file paths for portability
* Integrate with **Azure Data Factory / Databricks**
* Build **Power BI dashboards** on top of Gold layer
* Add automated data validation framework

---

## 🧑‍💻 Author

**Sai Krishna Reddy Kaithi**
Aspiring Data Engineer | SQL | Azure | Databricks

LinkedIn: https://www.linkedin.com/in/sai-krishna-reddy-k-14008b27a/

This project is published for learning and portfolio purposes.
---

## ⭐ Final Note

This project is part of a **data engineering portfolio**, demonstrating:

* Data warehousing concepts
* ETL pipeline design
* Data modeling (star schema)
* Data quality validation

---
