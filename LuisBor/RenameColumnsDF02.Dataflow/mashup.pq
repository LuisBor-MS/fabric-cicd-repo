[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimdate_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "DateKey", DestinationColumnName = "DateKey"], [SourceColumnName = "FullDateAlternateKey", DestinationColumnName = "FullDateAlternateKey"], [SourceColumnName = "DayNumberOfWeek", DestinationColumnName = "DayNumberOfWeek"], [SourceColumnName = "EnglishDayNameOfWeek", DestinationColumnName = "EnglishDayNameOfWeek"], [SourceColumnName = "SpanishDayNameOfWeek", DestinationColumnName = "SpanishDayNameOfWeek"], [SourceColumnName = "FrenchDayNameOfWeek", DestinationColumnName = "FrenchDayNameOfWeek"], [SourceColumnName = "Day Number Of Month", DestinationColumnName = "Day Number Of Month"], [SourceColumnName = "Day Number Of Year", DestinationColumnName = "Day Number Of Year"], [SourceColumnName = "Week Number Of Year", DestinationColumnName = "Week Number Of Year"], [SourceColumnName = "Month Name", DestinationColumnName = "Month Name"], [SourceColumnName = "SpanishMonthName", DestinationColumnName = "SpanishMonthName"], [SourceColumnName = "FrenchMonthName", DestinationColumnName = "FrenchMonthName"], [SourceColumnName = "Month Number Of Year", DestinationColumnName = "Month Number Of Year"], [SourceColumnName = "Calendar Quarter", DestinationColumnName = "Calendar Quarter"], [SourceColumnName = "CalendarYear", DestinationColumnName = "CalendarYear"], [SourceColumnName = "Calendar Semester", DestinationColumnName = "Calendar Semester"], [SourceColumnName = "Fiscal Quarter", DestinationColumnName = "Fiscal Quarter"], [SourceColumnName = "Fiscal Year", DestinationColumnName = "Fiscal Year"], [SourceColumnName = "Fiscal Semester", DestinationColumnName = "Fiscal Semester"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimdate = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7afa7a75-8388-4595-a772-43fa62652d44"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimdate", ItemKind = "Table"]}[Data],
  #"Renamed columns" = Table.RenameColumns(#"Navigation 2", {{"FiscalYear", "Fiscal Year"}, {"FiscalQuarter", "Fiscal Quarter"}, {"CalendarSemester", "Calendar Semester"}, {"MonthNumberOfYear", "Month Number Of Year"}, {"CalendarQuarter", "Calendar Quarter"}, {"FiscalSemester", "Fiscal Semester"}, {"DayNumberOfMonth", "Day Number Of Month"}, {"DayNumberOfYear", "Day Number Of Year"}, {"WeekNumberOfYear", "Week Number Of Year"}, {"EnglishMonthName", "Month Name"}})
in
  #"Renamed columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimgeography_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "GeographyKey", DestinationColumnName = "GeographyKey"], [SourceColumnName = "City", DestinationColumnName = "City"], [SourceColumnName = "State Province Code", DestinationColumnName = "State Province Code"], [SourceColumnName = "State Province Name", DestinationColumnName = "State Province Name"], [SourceColumnName = "Country Region Code", DestinationColumnName = "Country Region Code"], [SourceColumnName = "Country Region Name", DestinationColumnName = "Country Region Name"], [SourceColumnName = "SpanishCountryRegionName", DestinationColumnName = "SpanishCountryRegionName"], [SourceColumnName = "FrenchCountryRegionName", DestinationColumnName = "FrenchCountryRegionName"], [SourceColumnName = "Postal Code", DestinationColumnName = "Postal Code"], [SourceColumnName = "Sales Territory Key", DestinationColumnName = "Sales Territory Key"], [SourceColumnName = "IpAddressLocator", DestinationColumnName = "IpAddressLocator"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimgeography = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7afa7a75-8388-4595-a772-43fa62652d44"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimgeography", ItemKind = "Table"]}[Data],
  #"Renamed columns" = Table.RenameColumns(#"Navigation 2", {{"StateProvinceCode", "State Province Code"}, {"StateProvinceName", "State Province Name"}, {"CountryRegionCode", "Country Region Code"}, {"EnglishCountryRegionName", "Country Region Name"}, {"PostalCode", "Postal Code"}, {"SalesTerritoryKey", "Sales Territory Key"}})
in
  #"Renamed columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimproduct_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProductKey", DestinationColumnName = "ProductKey"], [SourceColumnName = "ProductAlternateKey", DestinationColumnName = "ProductAlternateKey"], [SourceColumnName = "ProductSubcategoryKey", DestinationColumnName = "ProductSubcategoryKey"], [SourceColumnName = "Weight Unit Measure Code", DestinationColumnName = "Weight Unit Measure Code"], [SourceColumnName = "Size Unit Measure Code", DestinationColumnName = "Size Unit Measure Code"], [SourceColumnName = "Product Name", DestinationColumnName = "Product Name"], [SourceColumnName = "SpanishProductName", DestinationColumnName = "SpanishProductName"], [SourceColumnName = "FrenchProductName", DestinationColumnName = "FrenchProductName"], [SourceColumnName = "Standard Cost", DestinationColumnName = "Standard Cost"], [SourceColumnName = "FinishedGoodsFlag", DestinationColumnName = "FinishedGoodsFlag"], [SourceColumnName = "Color", DestinationColumnName = "Color"], [SourceColumnName = "SafetyStockLevel", DestinationColumnName = "SafetyStockLevel"], [SourceColumnName = "ReorderPoint", DestinationColumnName = "ReorderPoint"], [SourceColumnName = "List Price", DestinationColumnName = "List Price"], [SourceColumnName = "Size", DestinationColumnName = "Size"], [SourceColumnName = "Size Range", DestinationColumnName = "Size Range"], [SourceColumnName = "Weight", DestinationColumnName = "Weight"], [SourceColumnName = "DaysToManufacture", DestinationColumnName = "DaysToManufacture"], [SourceColumnName = "ProductLine", DestinationColumnName = "ProductLine"], [SourceColumnName = "Dealer Price", DestinationColumnName = "Dealer Price"], [SourceColumnName = "Class", DestinationColumnName = "Class"], [SourceColumnName = "Style", DestinationColumnName = "Style"], [SourceColumnName = "Model Name", DestinationColumnName = "Model Name"], [SourceColumnName = "EnglishDescription", DestinationColumnName = "EnglishDescription"], [SourceColumnName = "FrenchDescription", DestinationColumnName = "FrenchDescription"], [SourceColumnName = "ChineseDescription", DestinationColumnName = "ChineseDescription"], [SourceColumnName = "ArabicDescription", DestinationColumnName = "ArabicDescription"], [SourceColumnName = "HebrewDescription", DestinationColumnName = "HebrewDescription"], [SourceColumnName = "ThaiDescription", DestinationColumnName = "ThaiDescription"], [SourceColumnName = "GermanDescription", DestinationColumnName = "GermanDescription"], [SourceColumnName = "JapaneseDescription", DestinationColumnName = "JapaneseDescription"], [SourceColumnName = "TurkishDescription", DestinationColumnName = "TurkishDescription"], [SourceColumnName = "StartDate", DestinationColumnName = "StartDate"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "Status", DestinationColumnName = "Status"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimproduct = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7afa7a75-8388-4595-a772-43fa62652d44"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimproduct", ItemKind = "Table"]}[Data],
  #"Renamed columns" = Table.RenameColumns(#"Navigation 2", {{"WeightUnitMeasureCode", "Weight Unit Measure Code"}, {"SizeUnitMeasureCode", "Size Unit Measure Code"}, {"EnglishProductName", "Product Name"}, {"StandardCost", "Standard Cost"}, {"ListPrice", "List Price"}, {"SizeRange", "Size Range"}, {"DealerPrice", "Dealer Price"}, {"ModelName", "Model Name"}})
in
  #"Renamed columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimsalesterritory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SalesTerritoryKey", DestinationColumnName = "SalesTerritoryKey"], [SourceColumnName = "SalesTerritoryAlternateKey", DestinationColumnName = "SalesTerritoryAlternateKey"], [SourceColumnName = "SalesTerritoryRegion", DestinationColumnName = "SalesTerritoryRegion"], [SourceColumnName = "SalesTerritoryCountry", DestinationColumnName = "SalesTerritoryCountry"], [SourceColumnName = "SalesTerritoryGroup", DestinationColumnName = "SalesTerritoryGroup"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimsalesterritory = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7afa7a75-8388-4595-a772-43fa62652d44"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "dimsalesterritory", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "factinternetsales_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProductKey", DestinationColumnName = "ProductKey"], [SourceColumnName = "OrderDateKey", DestinationColumnName = "OrderDateKey"], [SourceColumnName = "DueDateKey", DestinationColumnName = "DueDateKey"], [SourceColumnName = "ShipDateKey", DestinationColumnName = "ShipDateKey"], [SourceColumnName = "CustomerKey", DestinationColumnName = "CustomerKey"], [SourceColumnName = "PromotionKey", DestinationColumnName = "PromotionKey"], [SourceColumnName = "CurrencyKey", DestinationColumnName = "CurrencyKey"], [SourceColumnName = "SalesTerritoryKey", DestinationColumnName = "SalesTerritoryKey"], [SourceColumnName = "Sales Order Number", DestinationColumnName = "Sales Order Number"], [SourceColumnName = "Sales Order Line Number", DestinationColumnName = "Sales Order Line Number"], [SourceColumnName = "RevisionNumber", DestinationColumnName = "RevisionNumber"], [SourceColumnName = "Order Quantity", DestinationColumnName = "Order Quantity"], [SourceColumnName = "Unit Price", DestinationColumnName = "Unit Price"], [SourceColumnName = "Extended Amount", DestinationColumnName = "Extended Amount"], [SourceColumnName = "UnitPrice Discount Pct", DestinationColumnName = "UnitPrice Discount Pct"], [SourceColumnName = "Discount Amount", DestinationColumnName = "Discount Amount"], [SourceColumnName = "Product Standard Cost", DestinationColumnName = "Product Standard Cost"], [SourceColumnName = "Total Product Cost", DestinationColumnName = "Total Product Cost"], [SourceColumnName = "Sales Amount", DestinationColumnName = "Sales Amount"], [SourceColumnName = "Tax Amt", DestinationColumnName = "Tax Amt"], [SourceColumnName = "Freight", DestinationColumnName = "Freight"], [SourceColumnName = "CarrierTrackingNumber", DestinationColumnName = "CarrierTrackingNumber"], [SourceColumnName = "CustomerPONumber", DestinationColumnName = "CustomerPONumber"], [SourceColumnName = "Order Date", DestinationColumnName = "Order Date"], [SourceColumnName = "Due Date", DestinationColumnName = "Due Date"], [SourceColumnName = "Ship Date", DestinationColumnName = "Ship Date"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared factinternetsales = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7afa7a75-8388-4595-a772-43fa62652d44"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "factinternetsales", ItemKind = "Table"]}[Data],
  #"Renamed columns" = Table.RenameColumns(#"Navigation 2", {{"SalesOrderNumber", "Sales Order Number"}, {"SalesOrderLineNumber", "Sales Order Line Number"}, {"OrderQuantity", "Order Quantity"}, {"UnitPrice", "Unit Price"}, {"ExtendedAmount", "Extended Amount"}, {"UnitPriceDiscountPct", "UnitPrice Discount Pct"}, {"DiscountAmount", "Discount Amount"}, {"ProductStandardCost", "Product Standard Cost"}, {"TotalProductCost", "Total Product Cost"}, {"SalesAmount", "Sales Amount"}, {"TaxAmt", "Tax Amt"}, {"OrderDate", "Order Date"}, {"DueDate", "Due Date"}, {"ShipDate", "Ship Date"}})
in
  #"Renamed columns";
shared dimdate_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "dimdate"]}[Data]
in
  TableNavigation;
shared dimgeography_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "dimgeography"]}[Data]
in
  TableNavigation;
shared dimproduct_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "dimproduct"]}[Data]
in
  TableNavigation;
shared dimsalesterritory_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "dimsalesterritory"]}[Data]
in
  TableNavigation;
shared factinternetsales_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "factinternetsales"]}[Data]
in
  TableNavigation;
