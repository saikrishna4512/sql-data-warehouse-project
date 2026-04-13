USE [DataWarehouse]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==============================================================================================
Stored Procedure : Load Bronze Layer (Source -> Bronze)
==============================================================================================
Script Purpose:

This stored procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
 - Truncates the bronze tables before loading data
 - Uses BULK INSERT to load data from CSV files into bronze tables

Parameters: None

This stored procedure does not accept any parameters and does not return any values.

Sample Execution:
    EXEC bronze.load_bronze;
==============================================================================================
*/

ALTER PROCEDURE [bronze].[load_bronze]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @start_time       DATETIME,
            @end_time         DATETIME,
            @batch_start_time DATETIME,
            @batch_end_time   DATETIME,
            @crm_path         NVARCHAR(500),
            @erp_path         NVARCHAR(500),
            @sql              NVARCHAR(MAX);

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        /* 
           Update these two paths based on your local machine
        */
        SET @crm_path = 'D:\Azure Portfolio Projects\SQL Data Warehousing Project\Data\Crm\';
        SET @erp_path = 'D:\Azure Portfolio Projects\SQL Data Warehousing Project\Data\ERP\';

        PRINT '=============================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=============================================================';

        PRINT '--------------------------------------------------------------';
        PRINT 'LOADING CRM TABLES';
        PRINT '--------------------------------------------------------------';

        /* =========================
           CRM: bronze.crm_cust_info
           ========================= */
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting data into: bronze.crm_cust_info';
        SET @sql = '
            BULK INSERT bronze.crm_cust_info
            FROM ''' + @crm_path + 'cust_info.csv''
            WITH (
                FIRSTROW = 2,
                FIELDTERMINATOR = '','',
                TABLOCK
            );';
        EXEC sp_executesql @sql;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '>>------------------';

        /* ========================
           CRM: bronze.crm_prd_info
           ======================== */
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting data into: bronze.crm_prd_info';
        SET @sql = '
            BULK INSERT bronze.crm_prd_info
            FROM ''' + @crm_path + 'prd_info.csv''
            WITH (
                FIRSTROW = 2,
                FIELDTERMINATOR = '','',
                TABLOCK
            );';
        EXEC sp_executesql @sql;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '>>------------------';

        /* =============================
           CRM: bronze.crm_sales_details
           ============================= */
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting data into: bronze.crm_sales_details';
        SET @sql = '
            BULK INSERT bronze.crm_sales_details
            FROM ''' + @crm_path + 'sales_details.csv''
            WITH (
                FIRSTROW = 2,
                FIELDTERMINATOR = '','',
                TABLOCK
            );';
        EXEC sp_executesql @sql;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '>>------------------';

        PRINT '--------------------------------------------------------------';
        PRINT 'LOADING ERP TABLES';
        PRINT '--------------------------------------------------------------';

        /* ========================
           ERP: bronze.erp_cust_az12
           ======================== */
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting data into: bronze.erp_cust_az12';
        SET @sql = '
            BULK INSERT bronze.erp_cust_az12
            FROM ''' + @erp_path + 'CUST_AZ12.csv''
            WITH (
                FIRSTROW = 2,
                FIELDTERMINATOR = '','',
                TABLOCK
            );';
        EXEC sp_executesql @sql;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '>>------------------';

        /* =======================
           ERP: bronze.erp_loc_a101
           ======================= */
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting data into: bronze.erp_loc_a101';
        SET @sql = '
            BULK INSERT bronze.erp_loc_a101
            FROM ''' + @erp_path + 'LOC_A101.csv''
            WITH (
                FIRSTROW = 2,
                FIELDTERMINATOR = '','',
                TABLOCK
            );';
        EXEC sp_executesql @sql;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '>>------------------';

        /* ==========================
           ERP: bronze.erp_px_cat_g1v2
           ========================== */
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting data into: bronze.erp_px_cat_g1v2';
        SET @sql = '
            BULK INSERT bronze.erp_px_cat_g1v2
            FROM ''' + @erp_path + 'PX_CAT_G1V2.csv''
            WITH (
                FIRSTROW = 2,
                FIELDTERMINATOR = '','',
                TABLOCK
            );';
        EXEC sp_executesql @sql;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '>>------------------';

        SET @batch_end_time = GETDATE();

        PRINT '=============================================';
        PRINT 'Loading Bronze Layer Completed';
        PRINT 'Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR(20)) + ' seconds';
        PRINT '=============================================';
    END TRY
    BEGIN CATCH
        PRINT '=============================================';
        PRINT 'Error occurred during Bronze layer load';
        PRINT 'Error Message: ' + CAST(ERROR_MESSAGE() AS NVARCHAR(4000));
        PRINT 'Error Number : ' + CAST(ERROR_NUMBER() AS NVARCHAR(20));
        PRINT 'Error State  : ' + CAST(ERROR_STATE() AS NVARCHAR(20));
        PRINT '=============================================';

        THROW;
    END CATCH
END
GO
