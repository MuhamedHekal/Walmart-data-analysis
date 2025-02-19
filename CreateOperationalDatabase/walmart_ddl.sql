-- Create the Categories table
CREATE TABLE Categories (
    CategoryID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    CategoryName VARCHAR2(50) NOT NULL,
    Description CLOB
);

-- Create the Suppliers table
CREATE TABLE Suppliers (
    SupplierID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    SupplierName VARCHAR2(100) NOT NULL,
    ContactName VARCHAR2(50),
    Phone VARCHAR2(15),
    Email VARCHAR2(100),
    Address CLOB
);

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(30),
    Address CLOB,
    MembershipDate DATE NOT NULL
);

-- Create the Products table
CREATE TABLE Products (
    ProductID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    ProductName VARCHAR2(100) NOT NULL,
    CategoryID NUMBER NOT NULL,
    SupplierID NUMBER NOT NULL,
    Price NUMBER(10, 2) NOT NULL,
    StockQuantity NUMBER NOT NULL,
    ReorderLevel NUMBER NOT NULL,
    CONSTRAINT fk_products_category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    CONSTRAINT fk_products_supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    OrderDate TIMESTAMP NOT NULL,
    TotalAmount NUMBER(10, 2) NOT NULL,
    PaymentMethod VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    OrderID NUMBER NOT NULL,
    ProductID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL,
    UnitPrice NUMBER(10, 2) NOT NULL,
    Discount NUMBER(5, 2),
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_orderdetails_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create the Inventory table
CREATE TABLE Inventory (
    InventoryID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    ProductID NUMBER NOT NULL,
    Location VARCHAR2(50) NOT NULL,
    StockQuantity NUMBER NOT NULL,
    LastRestocked DATE,
    CONSTRAINT fk_inventory_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    OrderID NUMBER NOT NULL,
    PaymentDate TIMESTAMP NOT NULL,
    PaymentMethod VARCHAR2(20) NOT NULL,
    Amount NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_transactions_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
