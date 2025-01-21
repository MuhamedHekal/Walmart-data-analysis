--What are the top-selling products in each category?
with TOPPRDUCT as (select cd.CATEGORYNAME, pd.PRODUCTNAME , f.TOTALAMOUNT,
Dense_Rank()OVER(PARTITION by f.CATEGORYID order by f.TOTALAMOUNT) as rank
from TRANSACTION_FACT f, CATEGORY_DIM cd , PRODUCT_DIM pd 
WHERE f.CATEGORYID = cd.ROW_ID and f.PRODUCTID = pd.row_id)
SELECT CATEGORYNAME, PRODUCTNAME, TOTALAMOUNT from TOPPRDUCT
where rank =1;


--• How do purchasing patterns change based on time or customer demographics?
with CountProduct as (select to_char(dd.TIME_STAMP,'dd-mm-yyyy') as "date",
    to_char(dd.TIME_STAMP,'day') as day_name, pd.PRODUCTNAME, f.TOTALAMOUNT, 
    count(pd.PRODUCTNAME)over(PARTITION by to_char(dd.TIME_STAMP,'dd-mm-yyyy')) as highest_product
from Transaction_fact f , PRODUCT_DIM pd , DATE_DIM dd
where f.DATEID = dd.row_id and f.PRODUCTID = pd.row_id),
MaximunProduct as (SELECT distinct "date",day_name,
        First_value(PRODUCTNAME)over(partition by "date" order by highest_product DESC ) as maximun
from CountProduct),
day_name_max as(
    select distinct day_name,maximun as prodcut_name,  count(maximun)over(PARTITION by day_name, maximun) as how_many_time
    from MaximunProduct
    )
select distinct day_name, First_value(prodcut_name)over(partition by day_name order by how_many_time DESC) as hight_product
,First_value(how_many_time)over(partition by day_name order by how_many_time DESC) as purchase_count
from day_name_max
