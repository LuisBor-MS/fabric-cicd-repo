# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "7afa7a75-8388-4595-a772-43fa62652d44",
# META       "default_lakehouse_name": "AIAdvWks_Lakehouse",
# META       "default_lakehouse_workspace_id": "7068e8ef-4071-4b46-9ed6-bd13210ed606",
# META       "known_lakehouses": [
# META         {
# META           "id": "7afa7a75-8388-4595-a772-43fa62652d44"
# META         }
# META       ]
# META     }
# META   }
# META }

# MARKDOWN ********************

# # AdventureWorks Sales Analysis
# This notebook demonstrates data loading, transformation, and visualization using AdventureWorks data from the Lakehouse `AIAdvWks_Lakehouse`.

# CELL ********************

# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style='whitegrid')

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Load data from Lakehouse
dimcustomer = spark.read.table("AIAdvWks_Lakehouse.dimcustomer")
factinternetsales = spark.read.table("AIAdvWks_Lakehouse.factinternetsales")
dimgeography = spark.read.table("AIAdvWks_Lakehouse.dimgeography")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Convert to pandas DataFrames
dimcustomer_pd = dimcustomer.toPandas()
factinternetsales_pd = factinternetsales.toPandas()
dimgeography_pd = dimgeography.toPandas()



# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Merge datasets on CustomerKey
sales_data = pd.merge(factinternetsales_pd, dimcustomer_pd, on='CustomerKey', how='inner')
sales_data = pd.merge(sales_data, dimgeography_pd[['GeographyKey', 'City']], on='GeographyKey', how='left')


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

