[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimgeography_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "GeographyKey", DestinationColumnName = "GeographyKey"], [SourceColumnName = "City", DestinationColumnName = "City"], [SourceColumnName = "State Province Code", DestinationColumnName = "State Province Code"], [SourceColumnName = "State Province Name", DestinationColumnName = "State Province Name"], [SourceColumnName = "Country Region Code", DestinationColumnName = "Country Region Code"], [SourceColumnName = "Country Region Name", DestinationColumnName = "Country Region Name"], [SourceColumnName = "SpanishCountryRegionName", DestinationColumnName = "SpanishCountryRegionName"], [SourceColumnName = "FrenchCountryRegionName", DestinationColumnName = "FrenchCountryRegionName"], [SourceColumnName = "Postal Code", DestinationColumnName = "Postal Code"], [SourceColumnName = "Sales Territory Key", DestinationColumnName = "Sales Territory Key"], [SourceColumnName = "IpAddressLocator", DestinationColumnName = "IpAddressLocator"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared dimgeography = let
  Source = Fabric.Warehouse(null),
  Navigation = Source{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  #"Navigation 1" = Navigation{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "dimgeography"]}[Data],
  #"Remove duplicates" = Table.Distinct(#"Navigation 2", {"GeographyKey"})
in
  #"Remove duplicates";
shared dimgeography_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7068e8ef-4071-4b46-9ed6-bd13210ed606"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "9c1d3800-7998-4d5f-b0fc-634d04693c20"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "dimgeography"]}[Data]
in
  TableNavigation;
