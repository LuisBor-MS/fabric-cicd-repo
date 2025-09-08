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

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
# Read the 'dimcustomer' table from the Lakehouse
df = spark.read.table("AIAdvWks_Lakehouse.dimcustomer")

# Remove duplicate rows
df_no_duplicates = df.dropDuplicates()

# Save the result to a new table named 'dimcustomerwdr'
df_no_duplicates.write.mode("overwrite").saveAsTable("AIAdvWks_Lakehouse.dimcustomerwdr")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Load the table 'dimcustomerwdr' from the Lakehouse
df = spark.read.table("AIAdvWks_Lakehouse.dimcustomerwdr")

# Display the top 10 rows
display(df.limit(10))

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


import matplotlib.pyplot as plt
import seaborn as sns

# Load the top 10 rows from the Lakehouse table and convert to pandas DataFrame
df = spark.read.table("AIAdvWks_Lakehouse.dimcustomerwdr").limit(10).toPandas()

# Create a new column combining FirstName and LastName
df["CustomerName"] = df["FirstName"].fillna('') + " " + df["LastName"].fillna('')

# Set the style for the plots
sns.set(style="whitegrid")

# Bar plot for YearlyIncome
plt.figure(figsize=(10, 6))
sns.barplot(x="CustomerName", y="YearlyIncome", data=df)
plt.title("Yearly Income of Top 10 Customers")
plt.xlabel("Customer Name")
plt.ylabel("Yearly Income")
plt.xticks(rotation=45)
display(plt.gcf())
plt.clf()


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Bar plot for NumberCarsOwned
plt.figure(figsize=(10, 6))
sns.barplot(x="CustomerName", y="NumberCarsOwned", data=df)
plt.title("Number of Cars Owned by Top 10 Customers")
plt.xlabel("Customer Name")
plt.ylabel("Number of Cars Owned")
plt.xticks(rotation=45)
display(plt.gcf())
plt.clf()



# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


import matplotlib.pyplot as plt
import seaborn as sns

# Load the top 10 rows from the Lakehouse table and convert to pandas DataFrame
df = spark.read.table("AIAdvWks_Lakehouse.dimcustomerwdr").limit(10).toPandas()

# Calculate percentage distribution of CommuteDistance
commute_counts = df["CommuteDistance"].value_counts(normalize=True) * 100
commute_df = commute_counts.reset_index()
commute_df.columns = ["CommuteDistance", "Percentage"]

# Set the style for the plot
sns.set(style="whitegrid")

# Bar plot for CommuteDistance percentage
plt.figure(figsize=(10, 6))
sns.barplot(x="CommuteDistance", y="Percentage", data=commute_df)
plt.title("Commute Distance Distribution (Percentage)")
plt.xlabel("Commute Distance")
plt.ylabel("Percentage (%)")
plt.xticks(rotation=45)
display(plt.gcf())
plt.clf()


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
