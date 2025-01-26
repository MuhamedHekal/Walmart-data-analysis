--What are the top-selling products in each category?
with topproduct as (
   select cd.categoryname,
          pd.productname,
          sum(f.totalamount) as totalamount
     from transaction_fact f,
          category_dim cd,
          product_dim pd
    where f.categoryid = cd.row_id
      and f.productid = pd.row_id
    group by cd.categoryname,
             pd.productname
)
select distinct categoryname,
                first_value(productname)
                over(partition by categoryname
                     order by totalamount desc
                ) as topsellingproduct,
                first_value(totalamount)
                over(partition by categoryname
                     order by totalamount desc
                ) as totalamount
  from topproduct;


--• How do purchasing patterns change based on time or customer demographics?
with countproduct as (
   select to_char(
      dd.time_stamp,
      'dd-mm-yyyy'
   ) as "date",
          to_char(
             dd.time_stamp,
             'day'
          ) as day_name,
          pd.productname,
          f.totalamount,
          count(pd.productname)
          over(partition by to_char(
             dd.time_stamp,
             'dd-mm-yyyy'
          )) as highest_product
     from transaction_fact f,
          product_dim pd,
          date_dim dd
    where f.dateid = dd.row_id
      and f.productid = pd.row_id
),maximunproduct as (
   select distinct "date",
                   day_name,
                   first_value(productname)
                   over(partition by "date"
                        order by highest_product desc
                   ) as maximun
     from countproduct
),day_name_max as (
   select distinct day_name,
                   maximun as prodcut_name,
                   count(maximun)
                   over(partition by day_name,
                                     maximun) as how_many_time
     from maximunproduct
)
select distinct day_name,
                first_value(prodcut_name)
                over(partition by day_name
                     order by how_many_time desc
                ) as hight_product,
                first_value(how_many_time)
                over(partition by day_name
                     order by how_many_time desc
                ) as purchase_count
  from day_name_max;


--  total sales over the time 
select d.year,
       d.month,
       d.day,
       d.hour,
       sum(t.totalamount) as totalsales
  from transaction_fact t
  join date_dim d
on t.dateid = d.row_id
 group by d.year,
          d.month,
          d.day,
          d.hour
 order by totalsales desc;


-- total spent for each customer
select c.firstname,
       c.lastname,
       sum(t.totalamount) as totalspent
  from transaction_fact t
  join customer_dim c
on t.customerid = c.row_id
 group by c.firstname,
          c.lastname
 order by totalspent desc;

-- total revenue for 2 pairs
select p1.productname as product1,
       p2.productname as product2,
       sum(t1.totalamount + t2.totalamount) as totalrevenue
  from transaction_fact t1
  join transaction_fact t2
on t1.orderid = t2.orderid
   and t1.productid < t2.productid
  join product_dim p1
on t1.productid = p1.row_id
  join product_dim p2
on t2.productid = p2.row_id
 group by p1.productname,
          p2.productname
 order by totalrevenue desc;