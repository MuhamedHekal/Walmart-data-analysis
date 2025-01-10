create table Transaction_Fact(
    TransactionID Number NOT NULL,
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
    CONSTRAINT ProductID_FK FOREIGN KEY (ProductID) REFERENCES Product_Dim(ProductID),
    CONSTRAINT DateID_FK FOREIGN KEY (DateID) REFERENCES Date_Dim(DateID),
    CONSTRAINT CustomerID_FK FOREIGN KEY (CustomerID) REFERENCES Customer_Dim(CustomerID),
    CONSTRAINT CategoryID_FK FOREIGN KEY (CategoryID) REFERENCES Category_Dim(CategoryID),
    CONSTRAINT SupplierID_FK FOREIGN KEY (SupplierID) REFERENCES Suppliers_Dim(SupplierID)
)