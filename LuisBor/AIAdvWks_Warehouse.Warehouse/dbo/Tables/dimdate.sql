CREATE TABLE [dbo].[dimdate] (

	[DateKey] int NULL, 
	[FullDateAlternateKey] date NULL, 
	[DayNumberOfWeek] smallint NULL, 
	[EnglishDayNameOfWeek] varchar(8000) NULL, 
	[SpanishDayNameOfWeek] varchar(8000) NULL, 
	[FrenchDayNameOfWeek] varchar(8000) NULL, 
	[Day Number Of Month] smallint NULL, 
	[Day Number Of Year] smallint NULL, 
	[Week Number Of Year] smallint NULL, 
	[Month Name] varchar(8000) NULL, 
	[SpanishMonthName] varchar(8000) NULL, 
	[FrenchMonthName] varchar(8000) NULL, 
	[Month Number Of Year] smallint NULL, 
	[Calendar Quarter] smallint NULL, 
	[CalendarYear] smallint NULL, 
	[Calendar Semester] smallint NULL, 
	[Fiscal Quarter] smallint NULL, 
	[Fiscal Year] smallint NULL, 
	[Fiscal Semester] smallint NULL
);