CREATE DATABASE MyDatabaseName;
\c MyDatabaseName;

CREATE SCHEMA MySchemaName;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price >= 0),
    Record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (UserID, FirstName, LastName, Gender, Birthdate) VALUES
(1, 'John', 'Doe', 'M', '2000-02-15'),
(2, 'Jane', 'Smith', 'F', '1995-07-10');

INSERT INTO Orders (OrderID, UserID, OrderDate) VALUES
(1, 1, '2023-01-20'),
(2, 2, '2023-02-05');

INSERT INTO Products (ProductID, Name, Price) VALUES
(1, 'Widget A', 19.99),
(2, 'Widget B', 29.99);

ALTER TABLE Users ADD COLUMN Record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE Orders ADD COLUMN Record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE Products ADD COLUMN Record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
