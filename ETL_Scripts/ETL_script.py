from sql_queries import *
from functions import get_data_frame, insert_data_frame
from database_connection import db_connect
import pandas as pd
print("establish walmart connection")
walmart_cursor = db_connect("walmart","walmart","freepdb1")
print("done")
print("establish walmart_star_schema connection")
walmart_star_cursor = db_connect("walmart_star_schema","walmart","freepdb1")
print("done")
###############################################
print("inserting Category dim data .....")
# Extract Category data from walmart database
df = get_data_frame(walmart_cursor, category_oper_select)
# load category data to walmart_star_schema
insert_data_frame(walmart_star_cursor, category_dim_insert, df)
print("done")

###############################################
print("inserting Customer dim data .....")
# Extract Customer data from walmart database
df = get_data_frame(walmart_cursor, customer_oper_select)
# load cateCustomergory data to walmart_star_schema
insert_data_frame(walmart_star_cursor, customer_dim_insert, df)
print("done")

###############################################
print("inserting date dim data .....")
# Extract date data from walmart database
df = get_data_frame(walmart_cursor, date_oper_select)
# Transfor date dataframe
df['start_time'] = df.ORDERDATE
df['year'] = df.ORDERDATE.dt.year
df['quarter'] = df.ORDERDATE.dt.quarter
df['month'] = df.ORDERDATE.dt.month
df['day'] = df.ORDERDATE.dt.day
df['hour'] = df.ORDERDATE.dt.hour
df['minutes'] = df.ORDERDATE.dt.minute
df= df[['start_time','year','quarter','month','day','hour','minutes']]
# load date data to walmart_star_schema
insert_data_frame(walmart_star_cursor, date_dim_insert, df)
print("done")

###############################################
print("inserting product dim data .....")
# Extract product data from walmart database
df = get_data_frame(walmart_cursor, product_oper_select)
# load product data to walmart_star_schema
insert_data_frame(walmart_star_cursor, product_dim_insert, df)
print("done")
###############################################
print("inserting supplier dim data .....")
# Extract suppliers data from walmart database
df = get_data_frame(walmart_cursor, suppliers_oper_select)
# load suppliers data to walmart_star_schema
insert_data_frame(walmart_star_cursor, suppliers_dim_insert, df)
print("done")
###############################################
print("inserting fact table data .....")
# Extract Fact data from walmart database
fact_table = get_data_frame(walmart_cursor, fact_query)
# transform fact data to get all DIMs key
# join with customer_dim
dim_df = get_data_frame(walmart_star_cursor, customer_dim_query)
fact_table = pd.merge(fact_table, dim_df[['CUSTOMERID', 'ROW_ID']], 
                      left_on='CUSTOMERID', right_on='CUSTOMERID', how='inner')
fact_table.rename(columns={"ROW_ID": "Cus_id"}, inplace=True)

# join with Category_dim
dim_df = get_data_frame(walmart_star_cursor, Category_dim_query)
fact_table = pd.merge(fact_table, dim_df[['CATEGORYID', 'ROW_ID']], 
                      left_on='CATEGORYID', right_on='CATEGORYID', how='inner')
fact_table.rename(columns={"ROW_ID": "Cat_id"}, inplace=True)

# join with Date_dim
dim_df = get_data_frame(walmart_star_cursor, date_dim_query)
fact_table = pd.merge(fact_table, dim_df[['TIME_STAMP', 'ROW_ID']], 
                      left_on='ORDERDATE', right_on='TIME_STAMP', how='inner')
fact_table.rename(columns={"ROW_ID": "Date_id"}, inplace=True)

# join with product_dim
dim_df = get_data_frame(walmart_star_cursor, product_dim_query)
fact_table = pd.merge(fact_table, dim_df[['PRODUCTID', 'ROW_ID']], 
                      left_on='PRODUCTID', right_on='PRODUCTID', how='inner')
fact_table.rename(columns={"ROW_ID": "Product_id"}, inplace=True)

# join with supplier_dim
dim_df = get_data_frame(walmart_star_cursor, suppliers_dim_query)
fact_table = pd.merge(fact_table, dim_df[['SUPPLIERID', 'ROW_ID']], 
                      left_on='SUPPLIERID', right_on='SUPPLIERID', how='inner')
fact_table.rename(columns={"ROW_ID": "supplier_id"}, inplace=True)

df = fact_table[['Product_id','Date_id','Cus_id','Cat_id','supplier_id','ORDERID','QUANTITY','UNITPRICE','TOTALAMOUNT']]
# load fact data to walmart_star_schema
insert_data_frame(walmart_star_cursor, fact_insert, df)
print("done")
###############################################