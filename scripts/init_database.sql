
/*===============================================================
Create  Database and Schemas
===============================================================

Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
  within the database: bronze, silver, gold. 
  
  Warning:
     Running the script will drop the entire 'DataWarehouse' database if it exists.
	 All data in the database will be permanently deleted. Proceed with caution and 
	 ensure you have proper backups before running the script.
  */



use master;
Go

-- Drop and recreate the Datawarehouse database

if Exists(select 1 from sys.databases where name='DataWarehouse')
begin
Alter Database DataWarehouse Set Single_User with Rollback Immediate;
Drop Database DataWarehouse;
end
Go

-- Create the DataWarehouse database
Create Database DataWarehouse;
GO

use DataWarehouse;
Go

-- Create Schemas
Create Schema bronze;
Go

Create Schema silver;
Go

Create Schema gold;
Go
