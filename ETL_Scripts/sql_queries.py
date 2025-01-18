# category queries
category_dim_insert = '''insert into category_dim (CATEGORYID, CATEGORYNAME, DESCRIPTION) values(:1, :2, :3)'''
category_oper_select ='''select CATEGORYID, CATEGORYNAME, DESCRIPTION  from Categories'''
# customer queries
customer_dim_insert = ''' insert into customer_dim (CustomerId, FirstName, LastName, Email, Phone, Address, MembershipDate) values(:1, :2, :3, :4, :5, :6, :7) '''
customer_oper_select='''select CustomerId, FirstName, LastName, Email, Phone, Address, MembershipDate from Customers'''
# date queries
date_dim_insert = '''insert into date_dim(TIME_STAMP, YEAR, QUARTER, MONTH, DAY, HOUR, MINUTE)values(:1, :2, :3, :4, :5, :6, :7)'''
date_oper_select =  '''select ORDERDATE from orders'''
#product queries
product_dim_insert = '''insert into PRODUCT_DIM(PRODUCTID,PRODUCTNAME,PRICE) values(:1, :2, :3)'''
product_oper_select ='''select PRODUCTID, PRODUCTNAME, PRICE  from products'''
#supplier queries
suppliers_dim_insert = '''insert into suppliers_dim (SupplierID, SupplierName, ContactName, Phone, Email, Address) values(:1, :2, :3, :4,:5, :6)'''
suppliers_oper_select = '''select SupplierID, SupplierName, ContactName, Phone, Email, Address from suppliers'''

#fact queries
fact_query='''SELECT c.CategoryID, p.ProductID, p.SupplierID,
                cu.CUSTOMERID, o.OrderID, od.ORDERDETAILID, o.TotalAmount,
                o.ORDERDATE, od.UNITPRICE, od.Quantity
        FROM Categories c
        JOIN Products p ON c.CategoryID = p.CategoryID
        JOIN Suppliers s ON p.SupplierID = s.SupplierID
        JOIN OrderDetails od ON p.ProductID = od.ProductID
        JOIN Orders o ON od.OrderID = o.OrderID
        JOIN Customers cu ON o.CustomerID = cu.CustomerID
        '''
fact_insert = '''
                insert into TRANSACTION_FACT(PRODUCTID, DATEID, CUSTOMERID, CATEGORYID, SUPPLIERID,
                ORDERID, QUANTITY, UNITPRICE, TOTALAMOUNT) values(:1, :2, :3, :4, :5, :6, :7, :8, :9)
'''
customer_dim_query = "SELECT  Row_ID, CustomerID FROM CUSTOMER_DIM"
Category_dim_query = "SELECT  Row_ID, CategoryID FROM Category_DIM"
date_dim_query = "SELECT  Row_ID, TIME_STAMP FROM DATE_DIM"
product_dim_query = "SELECT  Row_ID, PRODUCTID FROM PRODUCT_DIM"
suppliers_dim_query = "SELECT  Row_ID, SUPPLIERID FROM SUPPLIERS_DIM"
