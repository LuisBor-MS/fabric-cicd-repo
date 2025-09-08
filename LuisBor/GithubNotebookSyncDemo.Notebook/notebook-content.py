# Fabric notebook source

# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.17.3
# ---

# %% [markdown]
# # AdventureWorks Sales Analysis
# This notebook demonstrates data loading, transformation, and visualization using AdventureWorks data from the Lakehouse `AIAdvWks_Lakehouse`.

# %%
# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style='whitegrid')

# %%
# Load data from Lakehouse
dimcustomer = spark.read.table("AIAdvWks_Lakehouse.dimcustomer")
factinternetsales = spark.read.table("AIAdvWks_Lakehouse.factinternetsales")
dimgeography = spark.read.table("AIAdvWks_Lakehouse.dimgeography")


# %%
# Convert to pandas DataFrames
dimcustomer_pd = dimcustomer.toPandas()
factinternetsales_pd = factinternetsales.toPandas()
dimgeography_pd = dimgeography.toPandas()



# %%
# Merge datasets on CustomerKey
sales_data = pd.merge(factinternetsales_pd, dimcustomer_pd, on='CustomerKey', how='inner')
sales_data = pd.merge(sales_data, dimgeography_pd[['GeographyKey', 'City']], on='GeographyKey', how='left')


# %%
# Sales by City
city_sales = sales_data.groupby('City')['SalesAmount'].sum().reset_index()
city_sales = city_sales.sort_values(by='SalesAmount', ascending=False)
plt.figure(figsize=(12, 6))
sns.barplot(data=city_sales, x='City', y='SalesAmount', palette='viridis')
plt.title('Total Sales by City')
plt.xlabel('City')
plt.ylabel('Sales Amount')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# %%
# Sales by Gender
gender_sales = sales_data.groupby('Gender')['SalesAmount'].sum().reset_index()
plt.figure(figsize=(6, 4))
sns.barplot(data=gender_sales, x='Gender', y='SalesAmount', palette='pastel')
plt.title('Total Sales by Gender')
plt.xlabel('Gender')
plt.ylabel('Sales Amount')
plt.tight_layout()
plt.show()

# %%
# Yearly Sales Trend
sales_data['OrderYear'] = pd.to_datetime(sales_data['OrderDate']).dt.year
yearly_sales = sales_data.groupby('OrderYear')['SalesAmount'].sum().reset_index()
plt.figure(figsize=(8, 5))
sns.lineplot(data=yearly_sales, x='OrderYear', y='SalesAmount', marker='o', color='coral')
plt.title('Yearly Sales Trend')
plt.xlabel('Year')
plt.ylabel('Sales Amount')
plt.tight_layout()
plt.show()
