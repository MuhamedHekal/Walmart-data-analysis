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
from day_name_max;


--  total sales over the time 
SELECT 
    d.Year, d.Month, d.Day, d.Hour, 
    SUM(t.TotalAmount) AS TotalSales
FROM 
    Transaction_Fact t
JOIN 
    Date_Dim d ON t.DateID = d.ROW_ID
GROUP BY 
    d.Year, d.Month, d.Day, d.Hour
ORDER BY 
    TotalSales DESC;


-- total spent for each customer
SELECT 
    c.FirstName, c.LastName, 
    SUM(t.TotalAmount) AS TotalSpent
FROM 
    Transaction_Fact t
JOIN 
    Customer_Dim c ON t.CustomerID = c.ROW_ID
GROUP BY 
    c.FirstName, c.LastName
ORDER BY 
    TotalSpent DESC;

-- total revenue for 2 pairs
SELECT 
    p1.ProductName AS Product1, 
    p2.ProductName AS Product2, 
    SUM(t1.TotalAmount + t2.TotalAmount) AS TotalRevenue
FROM 
    Transaction_Fact t1
JOIN 
    Transaction_Fact t2 ON t1.OrderID = t2.OrderID AND t1.ProductID < t2.ProductID
JOIN 
    Product_Dim p1 ON t1.ProductID = p1.ROW_ID
JOIN 
    Product_Dim p2 ON t2.ProductID = p2.ROW_ID
GROUP BY 
    p1.ProductName, p2.ProductName
ORDER BY 
    TotalRevenue DESC;