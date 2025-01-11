CREATE TABLE CUSTOMER_DIM (
    CustomerID      NUMBER(10),                         -- Unique identifier for the customer
    FirstName       VARCHAR2(50)      NOT NULL,         -- First name of the customer
    LastName        VARCHAR2(50)      NOT NULL,         -- Last name of the customer
    Email           VARCHAR2(100),                      -- Email address of the customer
    Phone           VARCHAR2(15),                       -- Phone number of the customer
    Address         VARCHAR2(255),                      -- Address of the customer
    MembershipDate  DATE              NOT NULL,         -- Date of membership registration
    CONSTRAINT PK_CUSTOMER_DIM PRIMARY KEY (CustomerID) -- Primary key constraint
);
