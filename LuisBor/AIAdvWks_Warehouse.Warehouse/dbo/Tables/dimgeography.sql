CREATE TABLE [dbo].[dimgeography] (

	[GeographyKey] int NULL, 
	[City] varchar(8000) NULL, 
	[State Province Code] varchar(8000) NULL, 
	[State Province Name] varchar(8000) NULL, 
	[Country Region Code] varchar(8000) NULL, 
	[Country Region Name] varchar(8000) NULL, 
	[SpanishCountryRegionName] varchar(8000) NULL, 
	[FrenchCountryRegionName] varchar(8000) NULL, 
	[Postal Code] varchar(8000) NULL, 
	[Sales Territory Key] int NULL, 
	[IpAddressLocator] varchar(8000) NULL
);