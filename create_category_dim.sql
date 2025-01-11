CREATE TABLE CATEGORY_DIM (
    CATEGORYID      NUMBER(10)            ,                -- Unique identifier for the CATEGORY
    CATEGORYNAME    VARCHAR2(50)  NOT NULL,                -- Name of the CATEGORY
    DESCRIPTION     CLOB                  ,                -- Description of the CATEGORY
    CONSTRAINT PK_CATEGORYID_DIM PRIMARY KEY (CATEGORYID)  -- Primary key constraint
);

