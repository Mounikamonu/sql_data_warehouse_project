/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE load_bronze
AS
BEGIN
	BEGIN TRY
		DECLARE @start_time       datetime,
				@end_time         datetime,
				@batch_start_time datetime,
				@batch_end_time   datetime

		SET @batch_start_time  = GETDATE()

		PRINT REPLICATE('=',50)
		PRINT 'LOADING BRONZE LAYER'
		PRINT REPLICATE('=',50)

		PRINT REPLICATE('-',50)
		PRINT 'LOADING CRM TABLES'
		PRINT REPLICATE('-',50)
	    
		SET @start_time  = GETDATE()
		PRINT '>> Truncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info

		PRINT '>> Inserting Data Into : bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM
		'C:\Users\User\OneDrive\Documents\SQL Server Management Studio\DataWareHousing_Scripts\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH
		(
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		)
		SET @end_time  = GETDATE()
		PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+ ' seconds'
		PRINT REPLICATE('-',20)


		SET @start_time  = GETDATE()
		PRINT '>> Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info

		PRINT '>> Inserting Data Into : bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM
		'C:\Users\User\OneDrive\Documents\SQL Server Management Studio\DataWareHousing_Scripts\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH
		(
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		)
		SET @end_time  = GETDATE()
		PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+ ' seconds'
		PRINT REPLICATE('-',20)


		SET @start_time  = GETDATE()
		PRINT '>> Truncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details

		PRINT '>> Inserting Data Into : bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM
		'C:\Users\User\OneDrive\Documents\SQL Server Management Studio\DataWareHousing_Scripts\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH
		(
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		)
		SET @end_time  = GETDATE()
	    PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+ ' seconds'
		PRINT REPLICATE('-',20)


		PRINT REPLICATE('-',50)
		PRINT 'LOADING ERP TABLES'
		PRINT REPLICATE('-',50)

		SET @start_time  = GETDATE()

		PRINT '>> Truncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12

		PRINT '>> Inserting Data Into : bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM
		'C:\Users\User\OneDrive\Documents\SQL Server Management Studio\DataWareHousing_Scripts\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH
		(
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		)
		SET @end_time  = GETDATE()
		PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR)+ ' seconds'
		PRINT REPLICATE('-',20)


		SET @start_time  = GETDATE()

		PRINT '>> Truncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101

		PRINT '>> Inserting Data Into : bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM
		'C:\Users\User\OneDrive\Documents\SQL Server Management Studio\DataWareHousing_Scripts\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH
		(
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		)
		SET @end_time  = GETDATE()
		PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + ' seconds'
		PRINT REPLICATE('-',20)


		SET @start_time  = GETDATE()
		PRINT '>> Truncating Table: bronze.px_cat_g1v2'
		TRUNCATE TABLE bronze.px_cat_g1v2

		PRINT '>> Inserting Data Into : bronze.px_cat_g1v2'
		BULK INSERT bronze.px_cat_g1v2
		FROM
		'C:\Users\User\OneDrive\Documents\SQL Server Management Studio\DataWareHousing_Scripts\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH
		(
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		)
		SET @end_time  = GETDATE()
		PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + ' seconds'
		PRINT REPLICATE('-',20)



		SET @batch_end_time  = GETDATE()

		PRINT replicate('=',50)
		PRINT 'Loading Bronze Layer is Completed'
		PRINT '  -  Total Loading Duration :' + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS VARCHAR) + ' seconds'
		PRINT replicate('=',50)

	END TRY
	BEGIN CATCH
	PRINT replicate('=',50)
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
	PRINT 'Error Message: '+ ERROR_MESSAGE()
	PRINT 'Error No: '+ CAST(ERROR_NUMBER() AS VARCHAR)
	PRINT 'Error State: '+ CAST(ERROR_STATE() AS VARCHAR)

	PRINT replicate('=',50)


	END CATCH
END
GO
