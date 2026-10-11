select *
 from `academy`.`default`.`bright_coffee_shop`limit 100;


  --When did we start collecting this data, and when last did we collect the last record
  SELECT MIN(transaction_date) AS start_dt,
         MAX(transaction_date) AS last_dt
  FROM `academy`.`default`.`bright_coffee_shop`;

  --What are business hours of the shop?
  SELECT MIN(transaction_time) AS Opening_time,
         MAX(transaction_time) AS Closing_time
  FROM `academy`.`default`.`bright_coffee_shop`;

  --How many different products are we selling in total ?
  SELECT COUNT(DISTINCT product_id)AS number_of_prducts
  FROM `academy`.`default`.`bright_coffee_shop`;
  
  --How many products are we selling per store?
  SELECT COUNT(DISTINCT product_id) AS number_of_prducts
  FROM `academy`.`default`.`bright_coffee_shop`
  GROUP BY store_location;

  ---Which store accumulated most of the revenue in the month of june?
  SELECT store_location, SUM(transaction_qty * CAST(replace(unit_price, ',', '.') AS DOUBLE)) AS total_revenue
  FROM `academy`.`default`.`bright_coffee_shop`
  WHERE transaction_date BETWEEN '2022-06-01' AND '2022-06-30'
  GROUP BY store_location


  --which product sold most in in the month of may and june?
  SELECT product_id, product_category, product_type, `product_detail,`,
SUM(transaction_qty * CAST(replace(unit_price, ',', '.') AS DOUBLE)) AS total_revenue
  FROM `academy`.`default`.`bright_coffee_shop`
  

  -- Which store is selling 79 products?
  SELECT store_location, COUNT(DISTINCT product_id) AS number_of_prducts
  FROM `academy`.`default`.`bright_coffee_shop`
  GROUP BY store_location
  HAVING COUNT(DISTINCT product_id) = 79;

  -- which product Astoria is not selling which other stores are selling?
  SELECT product_id, product_category, product_type, `product_detail,`
  FROM `academy`.`default`.`bright_coffee_shop`
  WHERE store_location != 'Astoria';

  
  --What is the total revenue per store?
  SELECT 
SUM(transaction_qty * CAST(replace(unit_price, ',', '.') AS DOUBLE)) AS total_revenue
  FROM `academy`.`default`.`bright_coffee_shop`
  GROUP BY store_location;

  --which store perform the best?
  SELECT store_location,
SUM(transaction_qty * CAST(replace(unit_price, ',', '.') AS DOUBLE)) AS total_revenue
  FROM `academy`.`default`.`bright_coffee_shop`
  GROUP BY store_location
  ORDER BY total_revenue DESC;

  --what are the different product category we have?
  SELECT DISTINCT product_category,product_type,`product_detail,`
  FROM `academy`.`default`.`bright_coffee_shop`
  WHERE product_category IN ('coffee')
  ORDER BY product_type;

  
--how many store are there?
SELECT COUNT(DISTINCT store_id) AS number_of_stores
  FROM `academy`.`default`.`bright_coffee_shop`;
  

--WHAT ARE THE NAMES OF STORES WE 
SELECT DISTINCT store_location
  FROM `academy`.`default`.`bright_coffee_shop`;

  Select distinct product_Id
  FROM `academy`.`default`.`bright_coffee_shop`;

    --how many transaction each store has?
  SELECT store_location, COUNT(DISTINCT transaction_id) AS number_of_transactions
  FROM `academy`.`default`.`bright_coffee_shop`
  GROUP BY store_location
  ORDER BY number_of_transactions DESC

  --what is the total revenue of all stores combined?
  SELECT SUM(transaction_qty * CAST(replace(unit_price, ',', '.') AS DOUBLE)) AS total_revenue
  FROM `academy`.`default`.`bright_coffee_shop`
