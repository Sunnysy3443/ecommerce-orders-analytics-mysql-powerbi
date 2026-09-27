CREATE DATABASE IF NOT EXISTS Ecommerce_Analytics;
USE Ecommerce_Analytics;

CREATE TABLE Customer_Details(
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(50),
Customer_Number Varchar(10),
Customer_Email_ID VARCHAR(50)
);

CREATE TABLE Product_Details(
Product_ID INT PRIMARY KEY,
Product_Name VARCHAR(50),
Product_Category VARCHAR(50),
Product_Price INT
);

ALTER TABLE Product_Details MODIFY Product_Price DECIMAL(10,2);

CREATE TABLE Orders(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Ordered_Time DATE,
FOREIGN KEY (Customer_ID) REFERENCES Customer_Details(Customer_ID)
);

CREATE TABLE Order_Items(
Order_Item_ID INT PRIMARY KEY,
Order_ID INT,
Product_ID INT,
Order_Quantity INT,
FOREIGN KEY (Order_ID) REFERENCES Orders (Order_ID),
FOREIGN KEY (Product_ID) REFERENCES Product_Details (Product_ID)
);

INSERT INTO Customer_Details VALUES
(1, 'Aarav Sharma', 9876543210, 'aarav@email.com'),
(2, 'Priya Mehta', 9123456780, 'priya@email.com'),
(3, 'Rohan Gupta', 9988776655, 'rohan@email.com'),
(4, 'Sneha Verma', 9871234560, 'sneha@email.com');

INSERT INTO Product_Details VALUES
(1,	'Laptop Bag', 'Accessories', 899.00),
(2,	'Wireless Mouse', 'Electronics', 499.99),
(3,	'Phone Case','Accessories',	299.00),
(4,	'Bluetooth Earphones', 'Electronics', 1499.00),
(5,	'Power Bank', 'Electronics', 1299.50);

INSERT INTO Orders VALUES
(101, 1, '2026-01-10'),
(102, 2, '2026-02-15'),
(103, 1, '2026-03-05'),
(104, 3, '2026-03-20');

INSERT INTO Order_Items VALUES
(1,	101, 1, 1),
(2,	101, 2, 2),
(3,	102, 3,	1),
(4,	102, 4,	1),
(5,	102, 5,	1),
(6,	103, 2,	1),
(7,	104, 4,	3);

SELECT Order_ID, SUM(Order_Quantity * Product_Price) AS Total_Order_Value
FROM Order_Items
JOIN Product_Details ON Order_Items.Product_ID = Product_Details.Product_ID
GROUP BY Order_ID;

SELECT Customer_Name,
SUM(Order_Quantity * Product_Price) AS ToTal_Spent
FROM Customer_Details 
JOIN Orders ON Customer_Details.Customer_ID = Orders.Customer_ID
JOIN Order_Items ON Orders.Order_ID = Order_Items.Order_ID
JOIN Product_Details ON Order_Items.Product_ID = Product_Details.Product_ID
GROUP BY Customer_Name;

SELECT Product_Name, SUM(Order_Quantity) AS Total_Quantity_Sold
FROM Order_items
JOIN Product_Details ON Product_Details.Product_ID = Order_Items.Product_ID
GROUP BY Product_Name
ORDER BY Total_Quantity_Sold DESC;