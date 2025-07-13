USE DataWareHouse
GO
/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
if OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
BEGIN
	DROP TABLE bronze.erp_cust_az12
	PRINT('dropping table bronze.erp_cust_az12...')
END
PRINT('Creating table bronze.erp_cust_az12...')
CREATE TABLE  bronze.erp_cust_az12
(
    CID		NVARCHAR(50) ,    
    BDATE	DATE,
    GEN		NVARCHAR(50), 
)
GO
if OBJECT_ID('bronze.erp_loc_a101','U') IS NOT NULL
BEGIN
	DROP TABLE bronze.erp_loc_a101
	PRINT('Dropping table bronze.erp_loc_a101... ')
END
GO
PRINT('Creating table bronze.erp_loc_a101...')
CREATE TABLE  bronze.erp_loc_a101
(
	CID		NVARCHAR(50),
	CNTRY	NVARCHAR(50),
)
GO
if OBJECT_ID('bronze.px_cat_g1v2','U') IS NOT NULL
BEGIN
	DROP TABLE bronze.px_cat_g1v2
	PRINT('Dropping table bronze.px_cat_g1v2... ')
END
GO
PRINT('Creating table bronze.px_cat_g1v2...')
CREATE TABLE  bronze.px_cat_g1v2
(
	ID			NVARCHAR(50),
	CAT			NVARCHAR(50),
	SUBCAT		NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
)
GO
USE DataWareHouse
GO
if OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
BEGIN
	DROP TABLE bronze.crm_cust_info
	PRINT('dropping table bronze.crm_cust_info...')
END
PRINT('Creating table bronze.crm_cust_info...')
CREATE TABLE  bronze.crm_cust_info
(
    cst_id				INT  ,                 -- Unique customer ID
    cst_key				NVARCHAR(100) ,       -- Unique key (GUID)
    cst_firstname		NVARCHAR(100) ,-- Customer first name
    cst_lastname		NVARCHAR(100),   -- Customer last name
    cst_marital_status	NVARCHAR(100),   -- Marital status (e.g., 'S', 'M', etc.)
    cst_gndr			NVARCHAR(100),             -- Gender (e.g., 'M', 'F')
    cst_create_date		DATE          -- Creation Time
)
GO
if OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
BEGIN
	DROP TABLE bronze.crm_prd_info
	PRINT('Dropping table bronze.crm_prd_info... ')
END
GO
PRINT('Creating table bronze.crm_prd_info...')
CREATE TABLE  bronze.crm_prd_info
(
	prd_id			INT,
	prd_key			NVARCHAR(50),
	prd_nm			NVARCHAR(50),
	prd_cost		INT,
	prd_line		NVARCHAR(50),
	prd_start_dt	DATETIME,
	prd_end_dt		DATETIME

)
GO
if OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
BEGIN
	DROP TABLE bronze.crm_sales_details
	PRINT('Dropping table bronze.crm_sales_details... ')
END
GO
PRINT('Creating table bronze.crm_sales_details...')
CREATE TABLE  bronze.crm_sales_details
(
	sls_ord_num		NVARCHAR(50),
	sls_prd_key		NVARCHAR(50),
	sls_cust_id		INT,
	sls_order_dt	INT,
	sls_ship_dt		INT,
	sls_due_dt		INT,
	sls_sales		INT,
	sls_quantity	INT,
	sls_price		INT
)
GO

