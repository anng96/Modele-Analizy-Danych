USE [WideWorldImportersDW]
GO

	DROP VIEW IF EXISTS [olap].[vFactStockHolding]
	DROP VIEW IF EXISTS [olap].[vFactSale]
	DROP VIEW IF EXISTS [olap].[vFactOrder]
	DROP VIEW IF EXISTS [olap].[vFactTransaction]
	DROP VIEW IF EXISTS [olap].[vFactPurchase]
	DROP VIEW IF EXISTS [olap].[vDimensionCustomer]
	DROP VIEW IF EXISTS [olap].[vDimensionCity]
	DROP VIEW IF EXISTS [olap].[vDimensionDate]
	DROP VIEW IF EXISTS [olap].[vDimensionEmployee]
	DROP VIEW IF EXISTS [olap].[vDimensionPaymentMethod]
	DROP VIEW IF EXISTS [olap].[vDimensionStockItem]
	DROP VIEW IF EXISTS [olap].[vDimensionSupplier]
	DROP VIEW IF EXISTS [olap].[vDimensionTransactionType]
	GO

	DROP SCHEMA IF EXISTS [olap]
	GO

	CREATE SCHEMA [olap]
	GO

		CREATE VIEW [olap].[vFactStockHolding]
		AS
		SELECT 
			[Stock Holding Key]
		,	[Stock Item Key]
		,	[Quantity On Hand]
		,	[Bin Location]
		,	[Last Stocktake Quantity]
		,	[Last Cost Price]
		,	[Reorder Level]
		,	[Target Stock Level]
		,	[Lineage Key]
		FROM [Fact].[Stock Holding]
		GO

		CREATE VIEW [olap].[vFactSale]
		AS
		SELECT 
			[Sale Key]
		,	[City Key]
		,	[Customer Key]
		,	[Bill To Customer Key]
		,	[Stock Item Key]
		,	[Invoice Date Key]
		,	[Delivery Date Key]
		,	[Salesperson Key]
		,	[WWI Invoice ID]
		,	[Description]
		,	[Package]
		,	[Quantity]
		,	[Unit Price]
		,	[Tax Rate]
		,	[Total Excluding Tax]
		,	[Tax Amount]
		,	[Profit]
		,	[Total Including Tax]
		,	[Total Dry Items]
		,	[Total Chiller Items]
		,	[Lineage Key]
		FROM [Fact].[Sale]
		GO

	CREATE VIEW [olap].[vFactOrder]
		AS
		SELECT 
			[Order Key]
		,	[City Key]
		,	[Customer Key]
		,	[Stock Item Key]
		,	[Order Date Key]
		,	[Picked Date Key]
		,	[Salesperson Key]
		,	[Picker Key]
		,	[WWI Order ID]
		,	[WWI Backorder ID]
		,	[Description]
		,	[Package]
		,	[Quantity]
		,	[Unit Price]
		,	[Tax Rate]
		,	[Total Excluding Tax]
		,	[Tax Amount]
		,	[Total Including Tax]
		,	[Lineage Key]
		FROM [Fact].[Order]
		GO

		CREATE VIEW [olap].[vFactTransaction]
		AS
		SELECT 
			[Transaction Key]
		,	[Date Key]
		,	[Customer Key]
		,	[Bill To Customer Key]
		,	[Supplier Key]
		,	[Transaction Type Key]
		,	[Payment Method Key]
		,	[WWI Customer Transaction ID]
		,	[WWI Supplier Transaction ID]
		,	[WWI Invoice ID]
		,	[WWI Purchase Order ID]
		,	[Supplier Invoice Number]
		,	[Total Excluding Tax]
		,	[Tax Amount]
		,	[Total Including Tax]
		,	[Outstanding Balance]
		,	[Is Finalized]
		,	[Lineage Key]
		FROM [Fact].[Transaction]
		GO

		CREATE VIEW [olap].[vFactPurchase]
		AS
		SELECT 
			[Purchase Key]
		,	[Date Key]
		,	[Supplier Key]
		,	[Stock Item Key]
		,	[WWI Purchase Order ID]
		,	[Ordered Outers]
		,	[Ordered Quantity]
		,	[Received Outers]
		,	[Package]
		,	[Is Order Finalized]
		,	[Lineage Key]
		FROM [Fact].[Purchase]
		GO

		CREATE VIEW [olap].[vDimensionCustomer]
		AS
		SELECT 
			[Customer Key]
		,	[WWI Customer ID]
		,	[Customer]
		,	[Bill To Customer]
		,	[Category]
		,	[Buying Group]
		,	[Primary Contact]
		,	[Postal Code]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[Customer]
		GO

		CREATE VIEW [olap].[vDimensionCity]
		AS
		SELECT 
			[City Key]
		,	[WWI City ID]
		,	[City]
		,	[State Province]
		,	[Country]
		,	[Continent]
		,	[Sales Territory]
		,	[Region]
		,	[Subregion]
		,	[Location]
		,	[Latest Recorded Population]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[City]
		GO

		CREATE VIEW [olap].[vDimensionDate]
		AS
		SELECT 
			[Date]
		,	[Day Number]
		,	[Day]
		,	[Month]
		,	[Short Month]
		,	[Calendar Month Number]
		,	[Calendar Month Label]
		,	[Calendar Year]
		,	[Calendar Year Label]
		,	[Fiscal Month Number]
		,	[Fiscal Month Label]
		,	[Fiscal Year]
		,	[Fiscal Year Label]
		,	[ISO Week Number]
		FROM [Dimension].[Date]
		GO

		CREATE VIEW [olap].[vDimensionEmployee]
		AS
		SELECT 
			[Employee Key]
		,	[WWI Employee ID]
		,	[Employee]
		,	[Preferred Name]
		,	[Is Salesperson]
		,	[Photo]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[Employee]
		GO

		CREATE VIEW [olap].[vDimensionPaymentMethod]
		AS
		SELECT 
			[Payment Method Key]
		,	[WWI Payment Method ID]
		,	[Payment Method]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[Payment Method]
		GO

		CREATE VIEW [olap].[vDimensionStockItem]
		AS
		SELECT 
			[Stock Item Key]
		,	[WWI Stock Item ID]
		,	[Stock Item]
		,	[Color]
		,	[Selling Package]
		,	[Buying Package]
		,	[Brand]
		,	[Size]
		,	[Lead Time Days]
		,	[Quantity Per Outer]
		,	[Is Chiller Stock]
		,	[Barcode]
		,	[Tax Rate]
		,	[Unit Price]
		,	[Recommended Retail Price]
		,	[Typical Weight Per Unit]
		,	[Photo]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[Stock Item]
		GO

		CREATE VIEW [olap].[vDimensionSupplier]
		AS
		SELECT 
			[Supplier Key]
		,	[WWI Supplier ID]
		,	[Supplier]
		,	[Category]
		,	[Primary Contact]
		,	[Supplier Reference]
		,	[Payment Days]
		,	[Postal Code]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[Supplier]
		GO

		CREATE VIEW [olap].[vDimensionTransactionType]
		AS
		SELECT 
			[Transaction Type Key]
	    ,	[WWI Transaction Type ID]
		,	[Transaction Type]
		,	[Valid From]
		,	[Valid To]
		,	[Lineage Key]
		FROM [Dimension].[Transaction Type]
		GO