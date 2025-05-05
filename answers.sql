-- conceptual setup
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');


SELECT
    pd.OrderID,
    pd.CustomerName,
    TRIM(split_value.value) AS Product -- Trim potential spaces around comma
FROM
    ProductDetail pd
CROSS JOIN -- Or appropriate LATERAL JOIN/APPLY syntax for the specific DB
    SPLIT_STRING_TO_TABLE(pd.Products, ',') AS split_value;
