# E-commerce Orders Analytics (MySQL + Power BI)

A relational data model and interactive dashboard analyzing e-commerce orders.

## Data Model
4 tables: Customer_Details, Product_Details, Orders, Order_Items (junction table linking orders to products, since one order can contain multiple products).


## SQL Highlights
- Multi-table JOINs (up to 4 tables chained) connecting customers → orders → order items → products
- Revenue calculated as Quantity × Price, aggregated per order/customer
- Foreign keys enforcing referential integrity

## DAX Measures
- `Total_Revenue` — SUMX + RELATED() to calculate revenue across related tables
- `Total_Orders` — DISTINCTCOUNT, avoiding overcounting from multi-item orders
- `Average_Order_Value` — DIVIDE with safe zero-division handling

## Dashboard
KPI cards, best-seller chart, customer spend table, category-revenue donut chart, category slicer.

![Dashboard Screenshot](./dashboard_screenshot.png)

## Key Design Decision
A junction table (Order_Items) was used instead of fixed "Product1, Product2..." columns, since an order can contain any number of products — fixed columns would either waste space or break for large orders.
