CREATE TABLE PRODUCT_DIM (
    ProductID      NUMBER(10)                ,         -- Unique identifier for the PRODUCT
    ProductName    VARCHAR2(50)      NOT NULL,         -- First name of the PRODUCT
    price          NUMBER(10, 2)     NOT NULL,         -- price of the PRODUCT
    CONSTRAINT PK_PRODUCT_DIM PRIMARY KEY (ProductID)  -- Primary key constraint
);

