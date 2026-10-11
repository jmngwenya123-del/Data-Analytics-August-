SELECT *
FROM academy.default.bright_coffee_shop;

---big code-- 
--Sales Matrics--

SELECT  transaction_date,
MONTHNAME(transaction_date) as month_name,
DAYNAME(transaction_date) as day_name, 
COUNT(transaction_id) AS number_of_sales,
SUM(transaction_qty)AS units_sold,
COUNT(DISTINCT product_id) AS unique_products,
COUNT(store_id)AS number_of_stores,
SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DOUBLE))AS revenue,

CASE
   WHEN DAYNAME(transaction_date) IN ('Sat', 'Sun') THEN 'weekend'
   WHEN DAYNAME(transaction_date) IN ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') THEN 'weekday'
   END AS day_classification,

CASE
    WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '06:00:00' AND '11:59:59' THEN '01.Morning'
    WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '17:59:59' THEN '02.Afternoon'
    WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '18:00:00' AND '23:59:59' THEN '03.Evening'
    END AS time_classification,

store_location,
product_category,
product_type,
`product_detail,`
FROM academy.default.bright_coffee_shop
GROUP BY ALL;







