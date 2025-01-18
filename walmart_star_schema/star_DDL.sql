DROP TABLE IF EXISTS Transaction_Fact;
DROP TABLE IF EXISTS Category_Dim;
DROP TABLE IF EXISTS Suppliers_Dim;
DROP TABLE IF EXISTS Product_Dim;
DROP TABLE IF EXISTS Date_Dim;
DROP TABLE IF EXISTS Customer_Dim;
CREATE TABLE CUSTOMER_DIM (
    ROW_ID          NUMBER(10) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,  -- Unique identifier for the customer
    CustomerID      NUMBER(10) ,
    LastName        VARCHAR2(50)     NOT NULL,  -- Last name of the customer
    FirstName       VARCHAR2(50)     NOT NULL,  -- First name of the customer
    Email           VARCHAR2(100),              -- Email address of the customer
    Phone           VARCHAR2(15),               -- Phone number of the customer
    Address         VARCHAR2(255),              -- Address of the customer
    MembershipDate  DATE             NOT NULL   -- Date of membership registration
);
CREATE TABLE DATE_DIM (
    ROW_ID          NUMBER(10) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,  -- Unique identifier for the date
    TIME_STAMP      TIMESTAMP     NOT NULL,
    Year            NUMBER(4)  NOT NULL,
    Quarter         NUMBER(1)  CHECK (Quarter BETWEEN 1 AND 4),
    Month           NUMBER(2)  CHECK (Month BETWEEN 1 AND 12),
    Day             NUMBER(2)  CHECK (Day BETWEEN 1 AND 31),
    Hour            NUMBER(2)  CHECK (Hour BETWEEN 0 AND 23),
    Minute          NUMBER(2)  CHECK (Minute BETWEEN 0 AND 59)
);
CREATE TABLE PRODUCT_DIM (
    ROW_ID          NUMBER(10) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,  -- Unique identifier for the PRODUCT
    ProductID       NUMBER(10)        NOT NULL,  -- Unique identifier for the PRODUCT
    ProductName     VARCHAR2(50)      NOT NULL,  -- First name of the PRODUCT
    price           NUMBER(10, 2)     NOT NULL   -- price of the PRODUCT
);
-- Create the Suppliers table
CREATE TABLE SUPPLIERS_DIM (
    ROW_ID          NUMBER(10) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,  -- Unique identifier for the supplier
    SupplierID      NUMBER           NOT NULL, 
    SupplierName    VARCHAR2(100)    NOT NULL,  -- Name of the supplier
    ContactName     VARCHAR2(50),               -- Name of the contact person
    Phone           VARCHAR2(15),               -- Phone number of the supplier
    Email           VARCHAR2(100),              -- Email address of the supplier
    Address CLOB
);
CREATE TABLE CATEGORY_DIM (
    ROW_ID          NUMBER(10) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,  -- Unique identifier for the CATEGORY
    CATEGORYID      NUMBER(10)    NOT NULL,                -- Unique identifier for the CATEGORY
    CATEGORYNAME    VARCHAR2(50)  NOT NULL,                -- Name of the CATEGORY
    DESCRIPTION     CLOB                                   -- Description of the CATEGORY
);

create table Transaction_Fact(
    TransactionID Number GENERATED BY DEFAULT AS IDENTITY ,
    ProductID Number NOT NULL,
    DateID Number NOT NULL,
    CustomerID Number NOT NULL,
    CategoryID Number NOT NULL,
    SupplierID Number NOT NULL,
    OrderID Number NOT NULL,
    Quantity Number,
    UnitPrice NUMBER(10, 2) ,
    TotalAmount NUMBER(10, 2),
    CONSTRAINT TransactionID_PK PRIMARY KEY (TransactionID),
    CONSTRAINT ProductID_FK FOREIGN KEY (ProductID) REFERENCES Product_Dim(ROW_ID),
    CONSTRAINT DateID_FK FOREIGN KEY (DateID) REFERENCES Date_Dim(ROW_ID),
    CONSTRAINT CustomerID_FK FOREIGN KEY (CustomerID) REFERENCES Customer_Dim(ROW_ID),
    CONSTRAINT CategoryID_FK FOREIGN KEY (CategoryID) REFERENCES Category_Dim(ROW_ID),
    CONSTRAINT SupplierID_FK FOREIGN KEY (SupplierID) REFERENCES Suppliers_Dim(ROW_ID)
);
