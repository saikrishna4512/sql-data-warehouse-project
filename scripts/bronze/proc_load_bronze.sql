/* 
==============================================================================================
Stored Procedure : Load Bronze Layer (Source -> Bronze)
==============================================================================================
Script Purpose:

 This stored procedure loads data into the 'bronze' schema from external CSV files.
 It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters: None

This stored procedure doesnt accept any parameters or return any values.

Sample Execution: 
       Exec bronze.load_bronze;
==============================================================================================
*/

Create or alter procedure bronze.load_bronze
as
begin
   Declare @start_time datetime, @end_time datetime, @batch_start_time Datetime, @batch_end_time Datetime;
   begin Try

            SET @batch_start_time=GETDATE();
             PRINT '=============================================================';
             PRINT 'Loading Bronze Layer';
			 PRINT '=============================================================';


			 PRINT '--------------------------------------------------------------';
			 PRINT 'LOADING CRM Tables';
			 PRINT '--------------------------------------------------------------';


			 Set @start_time=GETDATE();

			 PRINT '>> Truncating Table: bronze.crm_cust_info';
             Truncate Table bronze.crm_cust_info


			 PRINT '>> Inserting data into: bronze.crm_cust_info';
             BULK INSERT bronze.crm_cust_info
              FROM 'datasets/source_crm/cust_info.csv'
              WITH (
               FIRSTROW=2,
               FIELDTERMINATOR= ',',
               TABLOCK
              )
			  	 Set @end_time=GETDATE();
				 Print '>> Load Duration: ' + cast(Datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
				 print '>>------------------'
			
             
			 	 Set @start_time=GETDATE();
             PRINT '>> Truncating Table: bronze.crm_prd_info';
             Truncate Table bronze.crm_prd_info

			 PRINT '>> Inserting data into: bronze.crm_prd_info';
             BULK INSERT bronze.crm_prd_info
              FROM 'datasets/source_crm/prd_info.csv'
              WITH (
               FIRSTROW=2,
               FIELDTERMINATOR= ',',
               TABLOCK
              )
               	 Set @end_time=GETDATE();
				 Print '>> Load Duration: ' + cast(Datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
				 print '>>------------------'
			
				 	 Set @start_time=GETDATE();
			  PRINT '>> Truncating Table: bronze.crm_sales_details';
              Truncate Table bronze.crm_sales_details

			   PRINT '>> Inserting data into: bronze.crm_sales_details';
             BULK INSERT bronze.crm_sales_details
              FROM 'datasets/source_crm/sales_details.csv'
              WITH (
               FIRSTROW=2,
               FIELDTERMINATOR= ',',
               TABLOCK
              )
			   Set @end_time=GETDATE();
				 Print '>> Load Duration: ' + cast(Datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
				 print '>>------------------'
             
			 PRINT '--------------------------------------------------------------';
			 PRINT 'LOADING ERP Tables';
			 PRINT '--------------------------------------------------------------';

			 	 Set @start_time=GETDATE();
               PRINT '>> Truncating Table: bronze.erp_cust_az12';
              Truncate Table bronze.erp_cust_az12

            PRINT '>> Inserting data into: bronze.erp_cust_az12';
             BULK INSERT bronze.erp_cust_az12
              FROM 'datasets/source_erp/CUST_AZ12.csv'
              WITH (
               FIRSTROW=2,
               FIELDTERMINATOR= ',',
               TABLOCK
              )
			  		   Set @end_time=GETDATE();
				 Print '>> Load Duration: ' + cast(Datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
				 print '>>------------------'


              	 Set @start_time=GETDATE();
                 PRINT '>> Truncating Table: bronze.erp_loc_a101';
             Truncate Table bronze.erp_loc_a101

			 PRINT '>> Inserting data into: bronze.erp_loc_a101';
             BULK INSERT bronze.erp_loc_a101
              FROM 'datasets/source_erp/LOC_A101.csv'
              WITH (
               FIRSTROW=2,
               FIELDTERMINATOR= ',',
               TABLOCK
              )
             		   Set @end_time=GETDATE();
				 Print '>> Load Duration: ' + cast(Datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
				 print '>>------------------'


				   	 Set @start_time=GETDATE();
			  PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
              Truncate Table bronze.erp_px_cat_g1v2

			  PRINT '>> Inserting data into: bronze.erp_px_cat_g1v2';
             BULK INSERT bronze.erp_px_cat_g1v2
              FROM 'datasets/source_erp/PX_CAT_G1V2.csv'
              WITH (
               FIRSTROW=2,
               FIELDTERMINATOR= ',',
               TABLOCK
              )
			    Set @end_time=GETDATE();
				 Print '>> Load Duration: ' + cast(Datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
				 print '>>------------------'

				SET @batch_end_time=GETDATE();

				print '=========================================='
				print 'Loading Bronze Layer is Completed';
				Print 'Total Load Duration: '+ Cast(DateDiff(Second, @batch_start_time, @batch_end_time) as nvarchar) + ' seconds';
				print '============================================'

			  end try
			  begin catch
			  Print '==================================='
			  print 'Error occured during bronze layer'
			  print 'Error Message'  + cast(Error_Message() as nvarchar);
			  print 'Error Number'   + cast(Error_Number() as nvarchar);
			  print 'Error Staate'   + cast(Error_State() as nvarchar);
			  print '================================='
			  end catch



 end
 go
