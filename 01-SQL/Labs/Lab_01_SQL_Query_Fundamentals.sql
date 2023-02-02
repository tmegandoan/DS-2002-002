-- ------------------------------------------------------------------
-- 0). First, How Many Rows are in the Products Table?
-- ------------------------------------------------------------------
SELECT * FROM products;

SELECT COUNT('id')	AS Num_Products
FROM products;

-- ------------------------------------------------------------------
-- 1). Product Name and Unit/Quantity
-- ------------------------------------------------------------------
SELECT product_name
	, quantity_per_unit
FROM products;

-- ------------------------------------------------------------------
-- 2). Product ID and Name of Current Products
-- ------------------------------------------------------------------
SELECT product_name, id AS product_ID
FROM products
WHERE discontinued <> 1;

-- ------------------------------------------------------------------
-- 3). Product ID and Name of Discontinued Products
-- ------------------------------------------------------------------
SELECT product_name, id AS product_ID
FROM products
WHERE discontinued <> 0;

-- ------------------------------------------------------------------
-- 4). Name & List Price of Most & Least Expensive Products
-- ------------------------------------------------------------------
SELECT product_name
	,list_price
FROM  products
WHERE list_price = (SELECT MIN(list_price) FROM products)
OR list_price = (SELECT MAX(list_price) FROM products);

-- ------------------------------------------------------------------
-- 5). Product ID, Name & List Price Costing Less Than $20
-- ------------------------------------------------------------------
SELECT id, product_name, list_price
FROM products
WHERE list_price < 20;

-- ------------------------------------------------------------------
-- 6). Product ID, Name & List Price Costing Between $15 and $20
-- ------------------------------------------------------------------

SELECT id, product_name, list_price
FROM products
WHERE list_price BETWEEN 15 AND 20;

-- ------------------------------------------------------------------
-- 7). Product Name & List Price Costing Above Average List Price
-- ------------------------------------------------------------------
SELECT product_name, list_price
FROM products
WHERE list_price > (SELECT AVG(list_price) FROM products);

-- ------------------------------------------------------------------
-- 8). Product Name & List Price of 10 Most Expensive Products
-- ------------------------------------------------------------------
SELECT product_name, list_price
FROM products
ORDER BY list_price DESC
LIMIT 10;

-- ------------------------------------------------------------------ 
-- 9). Count of Current and Discontinued Products 
-- ------------------------------------------------------------------
SELECT discontinued, COUNT(*)
FROM products
GROUP BY discontinued;

-- ------------------------------------------------------------------
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order. 
-- ------------------------------------------------------------------
SELECT product_name
, reorder_level AS units_in_stock 
, target_level AS units_on_order
FROM products;
WHERE reorder_level < target_level;


-- ------------------------------------------------------------------
-- EXTRA CREDIT -----------------------------------------------------
-- ------------------------------------------------------------------


-- ------------------------------------------------------------------
-- 11). Products with Supplier Company & Address Info
-- ------------------------------------------------------------------
SELECT p.product_name
, p.list_price
, p.category
, s.address
, s.company
, s.city
, s.state_province
, s.zip_postal_code
FROM northwind.suppliers s
INNER JOIN northwind.products p
on s.id = p.supplier_ids
-- ------------------------------------------------------------------
-- 12). Number of Products per Category With Less Than 5 Units
-- ------------------------------------------------------------------
SELECT category
	, COUNT(*) as units_in_stock
FROM products 
GROUP BY category
HAVING units_in_stock < 5;

-- ------------------------------------------------------------------
-- 13). Number of Products per Category Priced Less Than $20.00

SELECT category, list_price
FROM products
WHERE list_price < 20;

-- ------------------------------------------------------------------
