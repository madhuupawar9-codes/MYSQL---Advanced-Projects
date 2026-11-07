CREATE DATABASE TECHNOVA_RETAIL_DB;
USE TECHNOVA_RETAIL_DB;
CREATE TABLE PRODUCTS(
P_ID INT PRIMARY KEY AUTO_INCREMENT,
P_NAME VARCHAR (100),
BRAND VARCHAR(50),
CATEGORY VARCHAR(50),
DESCRIPTION VARCHAR(50),
CITY VARCHAR(50),
PRICE DECIMAL(10,2),
DISCOUNT DECIMAL(10,2),
STOCK_QUANTITY INT,
UNITS_SOLD INT,
RATING DECIMAL(3,1),
DELIVERY_DAYS int
);
drop TABLE PRODUCTS;

INSERT INTO PRODUCTS 
(P_ID,P_NAME,BRAND,CATEGORY,DESCRIPTION,CITY,PRICE,DISCOUNT,STOCK_QUANTITY,UNITS_SOLD,RATING,DELIVERY_DAYS) 
VALUES 
(101,'Smart LED TV','Sony','Electronics','high definition display','Mumbai', 45000.00, 5000.00, 120, 45, 4.5, 3),
(102,'Denim Jeans','Levis','Fashion','cotton casual denim jeans','Delhi', 2500.00, 300.00, 250, 150, 4.2, 5),
(103,'Wireless Mouse', 'Logitech', 'Accessories', 'Ergonomic wireless ', 'Bangalore', 1200.00, 150.00, 400, 320, 4.7, 2),
(104,'Wooden Dining Table', 'HomeTown', 'Furniture','Modern 6-seater wooden','Chennai', 18000.00, 2000.00, 50, 20, 4.0, 7),
(105,'Smartphone X', 'Samsung', 'Electronics', 'smart features', 'Hyderabad', 32000.00, 4000.00, 200, 180, 4.6, 4);
   -- LEVEL - 1 - INTERMEDIATE BUSINESS ANALYSIS -- 
                    -- Q - 01 --
                    
SELECT 
    P_NAME, 
    BRAND, 
    CATEGORY,
UPPER(CONCAT_WS(" | ",P_NAME,BRAND,CATEGORY)) AS COMBINE_ ,
character_length(UPPER(CONCAT_WS(" | ",P_NAME,BRAND,CATEGORY))) AS LENGTH_
FROM PRODUCTS;
                     -- Q - 02 --
                     
SELECT 
       P_NAME,
       BRAND,
       P_ID,
CONCAT(LEFT(P_NAME,3),
       RIGHT(BRAND,3),
	   RIGHT(P_ID,2)) AS UNIQUE_PRODUCT_CODE
FROM PRODUCTS;

                      -- Q - 03 --
                      
SELECT 
        DISCOUNT,
ROUND(DISCOUNT) AS DISCOUNT_ROUND ,ceil(DISCOUNT)  AS DISCOUNT_CEIT ,
FLOOR(DISCOUNT) AS DISCOUNT_PRICE
FROM PRODUCTS;

 -- Q - 04 --
 
 SELECT 
       DESCRIPTION,
 INSTR(DESCRIPTION,"WIRELESS") AS CHARCTER_POSITION 
 FROM PRODUCTS;
 
 -- Q - 05 -- 
 
 SELECT P_NAME,
 UPPER(REPLACE(REPLACE(REPLACE(P_NAME,"a","@"),"o",0),"e",3)) as new_name
 from products;
 
 -- Q - 06 -- 
 
 select 
        STOCK_QUANTITY,
         PRICE,
 (STOCK_QUANTITY * PRICE) as inventory_value,
 round(sqrt(STOCK_QUANTITY * PRICE),2) as sqrt_inventory_value
 from products;
 
 -- Q - 07 -- 
 
  select 
        PRICE,
        DISCOUNT,
 abs(PRICE-DISCOUNT) as difference_ ,
 sign(abs(PRICE-DISCOUNT)) as price_status
 from products;
 
  -- Q - 08 -- 
  
  select 
        P_NAME,
  left(reverse(P_NAME),5) characters_extract,
  length(left(reverse(P_NAME),5)) as length_calculate
  from products;
  
  -- Q - 09 -- 
  
  select 
        p_id,
        UNITS_SOLD,
        price,
        discount,
        (UNITS_SOLD *(price-DISCOUNT)) as total_sales_revenue ,
  round(UNITS_SOLD* (price-DISCOUNT)/1000,2) as roundedd_revenue ,
  ceil(UNITS_SOLD * price/1000)as ceil_revenue,
  truncate(UNITS_SOLD* (price-DISCOUNT)/1000,2) as truncate_revenue 
  from products;
  
  -- Q -  10 -- 
  
  select 
  reverse(concat(" buy ",P_NAME, " from ",BRAND," in ",CITY," ! "))as reversed_massage
  from products;
  
   -- Q - 11 -- 
   select 
         STOCK_QUANTITY,
         UNITS_SOLD,
   round(STOCK_QUANTITY/ nullif(UNITS_SOLD ,0),2) as ration_calculate
    from products;
    
    -- Q - 12 -- 
    
    select 
           P_ID,
           PRICE,
    round(power(PRICE * 0.12 , 2 ),2) as square_price
    from products;                                    -- dout --
    -- Q - 13 -- 
    select
    upper(left(replace(DESCRIPTION,"smart","intelligent"),20)) as midif_
     from products; 
           
	-- Q - 14 --
SELECT 
    p_id,
    MOD(p_id, 7) AS id_remainder,
    POWER(MOD(p_id, 7), 2) AS remainder_square,
    SQRT(MOD(p_id, 7)) AS remainder_sqrt
FROM products;

-- Q - 15 --
SELECT 
    p_id,
    price,
    discount,
    GREATEST(price - discount, price) AS max_amount,
    LEAST(price - discount, price) AS min_amount
FROM products;

-- Q16
SELECT 
    CONCAT(UPPER(LEFT(P_NAME, 4)), LOWER(RIGHT(P_NAME, 4)), LEFT(brand, 3)) AS custom_label
FROM products;

-- Q17
SELECT 
    p_id,
    ABS((stock_quantity * price) - (units_sold * (price - discount))) AS abs_inventory_revenue_diff
FROM products;

-- Q18
SELECT 
    p_id,
    rating,
    ROUND(SQRT(POWER(rating, 2)), 2) AS Processed_rating
FROM products;                                               -- dout --

-- Q19
SELECT 
    p_id,
    description,
    INSTR(LOWER(description), 'o') AS position_of_o,
    REVERSE(description) AS reversed_description
FROM products;

-- Q20
SELECT 
    p_id,
    (price - discount) AS final_selling_price,
    ROUND((price - discount) * 0.15, 2) AS rounded_commission,
    CEIL((price - discount) * 0.15) AS ceil_commission
FROM products;


-- Level 2 - Advanced Function Combinations (Q21-Q40)


-- Q 21
SELECT 
    p_id,
    (units_sold * (price - discount)) AS total_revenue,
    (stock_quantity * price) AS inventory_value,
    ROUND((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0), 2) AS revenue_inventory_ratio
FROM products;

-- Q22
SELECT 
    p_id,
    CEIL(ABS(price - discount) / 1000) AS ceil_val,
    FLOOR(ABS(price - discount) / 1000) AS floor_val
FROM products;

-- Q23
SELECT P_NAME,BRAND,CATEGORY,
    REPLACE(REPLACE(CONCAT_WS(' - ',P_NAME,BRAND,CATEGORY), 'a', '@'), 'o', '0') AS formatted_label
FROM products;

-- Q24
SELECT 
    p_id,
    ROUND(price * 1.12, 2) AS rounded_price,
    CEIL(price * 1.12) AS ceil_price,
    TRUNCATE(price * 1.12, 2) AS truncated_price
FROM products;

-- Q25
SELECT 
    p_id,
    (stock_quantity * price * 0.15) AS insurance_amount,
    SQRT(stock_quantity * price * 0.15) AS insurance_sqrt
FROM products;

-- Q26
SELECT p_name,brand,
    UPPER(REVERSE(CONCAT(LEFT(p_name, 3),
    RIGHT(brand, 3)))) AS code_string
FROM products;

-- Q27
SELECT 
    p_id,
    units_sold,
    price,
    discount,
    stock_quantity,
    SIGN((units_sold * (price - discount)) - (stock_quantity * price)) AS performance_indicator
FROM products;

-- Q28
SELECT 
    p_id,
    ROUND(SQRT(price - discount), 2) AS rounded_sqrt_price,
    TRUNCATE(SQRT(price - discount), 2) AS truncated_sqrt_price
FROM products;

-- Q29
SELECT 
    p_id,
    MOD(p_id, 3) AS remainder_value,
    (p_id * MOD(p_id, 3)) AS multiplied_value
FROM products;

-- Q30
SELECT 
    CONCAT_WS(' - ', p_name, brand, city) AS product_label,
    LENGTH(CONCAT_WS(' - ', p_name, brand, city)) AS label_length,
    REVERSE(CONCAT_WS(' - ', p_name, brand, city)) AS reversed_label
FROM products;

-- Q31
SELECT 
    p_id,
    price,
    discount,
    stock_quantity,
    GREATEST(price, discount, (stock_quantity * price)) AS max_val,
    LEAST(price, discount, (stock_quantity * price)) AS min_val
FROM products;

-- Q - 32 --
SELECT 
    p_id,
    units_sold,
    price,
    discount,
    FLOOR((units_sold * (price - discount)) * 0.10) AS lower_commission_integer
FROM products;

-- Q33
SELECT 
    p_id,
    description,
    INSTR(LOWER(description), 'computer') AS pos_computer,
    INSTR(LOWER(description), 'wireless') AS pos_wireless,
    INSTR(LOWER(description), 'smart') AS pos_smart
FROM products;

-- Q34
SELECT 
    p_id,
    price,
    discount,
    POWER(price - (price - discount), 2) AS diff_square,
    SQRT(ABS(price - (price - discount))) AS diff_sqrt
FROM products;

-- Q35
SELECT 
    p_id,
    units_sold,
    price,
    discount,
    ROUND((units_sold * (price - discount)) / 100, 2) AS rounded_val,
    CEIL((units_sold * (price - discount)) / 100) AS ceil_val,
    FLOOR((units_sold * (price - discount)) / 100) AS floor_val,
    TRUNCATE((units_sold * (price - discount)) / 100, 2) AS truncated_val
FROM products;

-- Q36
SELECT 
    CONCAT(p_name, ' ', brand) AS short_id,
    LENGTH(CONCAT(p_name, ' ', brand)) AS id_length,
    REVERSE(CONCAT(p_name, ' ', brand)) AS reversed_short_id
FROM products;

-- Q37
SELECT 
    p_id,
    stock_quantity,
    units_sold,
    MOD(stock_quantity + units_sold, 5) AS remainder_val,
    POWER(MOD(stock_quantity + units_sold, 5), 2) AS remainder_square
FROM products;

-- Q - 38 --
SELECT 
    p_id,
    price,
    discount,
    GREATEST(price, (price - discount), discount) AS max_amount,
    LEAST(price, (price - discount), discount) AS min_amount
FROM products;

-- Q - 39 -- 
SELECT 
    p_id,
    rating,
    delivery_days,
    ROUND(SQRT(rating * delivery_days), 2) AS rating_delivery_sqrt
FROM products;

-- Q - 40 --

SELECT 
     p_name,
     category,
     city,
    CONCAT(LEFT(p_name, 3), LEFT(category, 2), RIGHT(city, 3)) AS location_code
FROM products;


-- Level 3 - Business Intelligence Challenges (Q41-Q60)

-- Q - 41 --

SELECT 
    p_id,
    units_sold,
    price,
    discount,
    (units_sold * (price - discount)) AS monthly_revenue,
    (units_sold * (price - discount) * 12) AS annual_revenue,
    CEIL((units_sold * (price - discount) * 12) / 1000) AS ceil_annual_k,
    FLOOR((units_sold * (price - discount) * 12) / 1000) AS floor_annual_k,
    ROUND((units_sold * (price - discount) * 12) / 1000, 2) AS round_annual_k
FROM products;

-- Q - 42 --
SELECT 
    p_id,
    stock_quantity,
    price,
    units_sold,
    ROUND(ABS((stock_quantity * price) - (units_sold * (price - discount))) /
    NULLIF(stock_quantity * price, 0) * 100, 2) AS percentage_diff
FROM products;

-- Q - 43 --
SELECT 
    p_id,
    price,
    discount,
    ROUND(price / NULLIF(discount, 0), 2) AS price_discount_ratio
FROM products;

-- Q - 44 --
SELECT 
    p_id,
    units_sold,
    price,
    discount,
    stock_quantity,
    ROUND((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0), 2) AS round_score,
    CEIL((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0)) AS ceil_score
FROM products;

-- Q - 45 --

SELECT 
       description,
    UPPER(REVERSE(REPLACE(REPLACE(REPLACE(description, 'o', '0'), 'i', '1'), 'a', '@'))) AS clean_description
FROM products;

-- Q - 46 --

SELECT 
    p_id,
    units_sold,
    price,
    discount,
    (units_sold * (price - discount)) AS total_revenue,
    SQRT((units_sold * (price - discount)) * 0.20) AS sqrt_tax_amount
FROM products;

-- Q - 47 --

SELECT 
    p_id,
    price,
    discount,
    stock_quantity,
    MOD(ABS((price - discount) - (stock_quantity * price)), 100) AS mod_difference
FROM products;

-- Q - 48 --

SELECT 
    p_id,
    MOD(POWER(p_id, 2), 10) AS remainder_val,
    SQRT(MOD(POWER(p_id, 2), 10)) AS sqrt_remainder
FROM products;

-- Q - 49 --

SELECT 
    p_id,
    units_sold,
    price,
    discount,
    stock_quantity,
    GREATEST((units_sold * (price - discount)), (stock_quantity * price)) AS max_val,
    LEAST((units_sold * (price - discount)), (stock_quantity * price)) AS min_val,
    ABS((units_sold * (price - discount)) - (stock_quantity * price)) AS difference_val
FROM products;

-- Q - 50 --

SELECT 
    p_name,
    brand,
    CONCAT(p_name, ' ', brand) AS combined_name,
    INSTR(LOWER(CONCAT(p_name, ' ', brand)), 'o') AS first_o_pos,
    LENGTH(CONCAT(p_name, ' ', brand)) AS total_length
FROM products;

-- Q - 51 --

SELECT 
    p_id,
    stock_quantity,
    units_sold,
    ROUND(POWER(stock_quantity / NULLIF(units_sold, 0), 2), 2) AS stock_to_sales_square
FROM products;

-- Q - 52 --

SELECT 
    p_id,
    price,
    GREATEST(price * 1.18, price) AS max_price,
    LEAST(price * 1.18, price) AS min_price
FROM products;

-- Q - 53 --

SELECT 
    p_id,
    units_sold,
    price,
    discount,
    CEIL((units_sold * (price - discount)) * 0.05) AS ceil_mkt_exp,
    FLOOR((units_sold * (price - discount)) * 0.05) AS floor_mkt_exp
FROM products;

-- Q - 54 --

SELECT 
    p_id,
    stock_quantity,
    price,
    SQRT((stock_quantity * price) / 500) AS sqrt_inventory_div,
    POWER((stock_quantity * price) / 500, 2) AS square_inventory_div
FROM products;

-- Q - 55 --

SELECT 
      p_name,
      brand,
    CONCAT(UPPER(LEFT(REVERSE(p_name), 4)), RIGHT(brand, 4)) AS processed_string
FROM products;

-- Q - 56 --

SELECT 
    p_id,
    units_sold,
    price,
    discount,
    ROUND(POWER((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0), 2), 2) AS square_ratio,
    ROUND(SQRT((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0)), 2) AS sqrt_ratio
FROM products;

-- Q - 57 --

SELECT 
    p_id,
    units_sold,
    stock_quantity,
    ABS(units_sold - stock_quantity) / NULLIF(stock_quantity, 0) * 100 AS percentage_difference,
    SIGN(units_sold - stock_quantity) AS performance_sign
FROM products;

-- Q - 58 --

SELECT 
    p_id,
    price, 
    discount,
    stock_quantity,
    GREATEST(price, discount, (price - discount), (stock_quantity * price)) AS max_financial_val,
    LEAST(price, discount, (price - discount), (stock_quantity * price)) AS min_financial_val
FROM products;

-- Q - 59 --

SELECT 
    p_id,
    price,
    discount,
    ROUND((price - discount) * 0.10, 2) AS rounded_commission,
    SIGN(ROUND((price - discount) * 0.10, 2)) AS commission_sign
FROM products;

-- Q - 60 --

SELECT 
    p_name,
    brand,
    category,
    city,
    CONCAT_WS(' | ', UPPER(p_name), LOWER(brand), UPPER(category), LOWER(city)) AS full_info_label
FROM products;


-- Level 4 - Complex SQL Problem Solving (Q61-Q80)


-- Q - 61 --

SELECT 
    p_id,
    ROUND(units_sold / NULLIF(stock_quantity, 0), 2) AS round_turnover_ratio,
    CEIL(units_sold / NULLIF(stock_quantity, 0)) AS ceil_turnover_ratio
FROM products;

-- Q - 62 --

SELECT 
    p_id,
    (units_sold * (price - discount)) AS sales_revenue,
    (units_sold * (price - discount)) - ((units_sold * (price - discount)) * 0.12) - 
    ((units_sold * (price - discount)) * 0.05) AS net_revenue
FROM products;

-- Q - 63 --
SELECT 
    p_id,
    ROUND(((price - discount) * stock_quantity) / 1000, 2) AS rounded_value,
    CEIL(((price - discount) * stock_quantity) / 1000) AS ceil_value,
    TRUNCATE(((price - discount) * stock_quantity) / 1000, 2) AS truncated_value
FROM products;

-- Q - 64 --

SELECT 
    CONCAT(LEFT(p_name, 3),
    RIGHT(brand, 2),
    ROUND(SQRT(p_id), 2)) AS product_label
FROM products;

-- Q - 65 --
SELECT 
    p_id,
    (stock_quantity * price * 0.10) AS insurance_amount,
    (stock_quantity * price) - (stock_quantity * price * 0.10) AS remaining_inventory_value
FROM products;

-- Q - 66 --

SELECT 
    p_id,
    POWER((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0), 2) AS square_ratio,
    SQRT((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0)) AS sqrt_ratio
FROM products;

-- Q - 67 --

SELECT 
    p_id,
    ROUND((price - discount) / 1000, 2) AS round_value,
    CEIL((price - discount) / 1000) AS ceil_value,
    FLOOR((price - discount) / 1000) AS floor_value,
    TRUNCATE((price - discount) / 1000, 2) AS truncate_value
FROM products;

-- Q - 68 --

SELECT 
    p_id,
    INSTR(LOWER(description), 'wireless') AS positions_wireless,
    INSTR(LOWER(description), 'smart') AS positions_smart,
    INSTR(LOWER(description), 'computer') AS positions_computer,
    LENGTH(description) AS description_length
FROM products;

-- Q - 69 --
SELECT 
    p_id,
    ABS((price - discount) * 2) AS abs_value,
    SIGN((price - discount) * 2) AS sign_value
FROM products;

-- Q - 70 --

SELECT 
    p_id,
    (units_sold * (price - discount)) AS monthly_revenue,
    (units_sold * (price - discount) * 12) AS annual_revenue,
    (units_sold * (price - discount) * 12) / 12 AS calculated_monthly_revenue
FROM products;

-- Q - 71 --

SELECT 
    REVERSE(REPLACE(REPLACE(REPLACE(CONCAT(product_name, brand), 'a', '@'), 'e', '3'), 'o', '0'))
    AS masked_reversed_string
FROM products;

-- Q - 72 --

SELECT 
    p_id,
    SQRT((stock_quantity * price) + (units_sold * (price - discount))) AS sum_sqrt,
    POWER((stock_quantity * price) + (units_sold * (price - discount)), 2) AS sum_square
FROM products;

-- Q - 73 --

SELECT 
    p_id,
    MOD((price - discount) * units_sold, 7) AS mod_7_remainder
FROM products;

-- Q - 74 --

SELECT 
    p_id,
    GREATEST(price, discount, (stock_quantity * price), (units_sold * (price - discount))) AS max_value,
    LEAST(price, discount, (stock_quantity * price), (units_sold * (price - discount))) AS min_value,
    ABS(GREATEST(price, discount, (stock_quantity * price), (units_sold * (price - discount))) - 
        LEAST(price, discount, (stock_quantity * price), (units_sold * (price - discount)))) AS absolute_difference
FROM products;

-- Q - 75 --

SELECT 
    p_id,
    ROUND((stock_quantity / NULLIF(stock_quantity + units_sold, 0)) * 100, 2) AS rounded_availability,
    CEIL((stock_quantity / NULLIF(stock_quantity + units_sold, 0)) * 100) AS ceil_availability,
    FLOOR((stock_quantity / NULLIF(stock_quantity + units_sold, 0)) * 100) AS floor_availability
FROM products;

-- Q - 76 --

SELECT 
    p_id,
    GREATEST((units_sold * (price - discount) * 0.15), (stock_quantity * price)) AS greatest_value,
    LEAST((units_sold * (price - discount) * 0.15), (stock_quantity * price)) AS least_value
FROM products;

-- Q - 77 --
SELECT 
    p_id,
    ROUND(SQRT(price * 1.10), 2) AS rounded_sqrt,
    TRUNCATE(SQRT(price * 1.10), 2) AS truncated_sqrt
FROM products;

-- Q - 78 --

SELECT 
    CONCAT_WS('-', p_name, brand, city) AS unique_label,
    LENGTH(CONCAT_WS('-', p_name, brand, city)) AS label_length,
    REVERSE(CONCAT_WS('-', p_name, brand, city)) AS reversed_label
FROM products;

-- Q - 79 --

SELECT 
    p_id,
    ROUND(POWER((stock_quantity * price) / NULLIF(units_sold * (price - discount), 0), 2), 2) AS rounded_square_ratio,
    CEIL(POWER((stock_quantity * price) / NULLIF(units_sold * (price - discount), 0), 2)) AS ceil_square_ratio
FROM products;

-- Q - 80 -- 
SELECT 
    p_id,
    ROUND((price * rating * units_sold) / NULLIF(stock_quantity, 0), 2) AS performance_score
FROM products;


-- Level 5 - Senior Data Analyst Challenges (Q81-Q100)


-- Q - 81 -- 

SELECT 
    p_id,
    p_name,
    (stock_quantity * price) AS inventory_value,
    RAND() AS random_order
FROM products
ORDER BY random_order;

-- Q - 82 --
SELECT 
    p_id,
    FLOOR(1 + (RAND() * 1000)) AS random_promo_amount,
    price - FLOOR(1 + (RAND() * 1000)) AS revised_price
FROM products;

-- Q - 83 --

SELECT 
    p_id,
    ROUND(RAND() * 100, 2) AS random_discount_pct,
    ROUND(price * (1 - (RAND())), 2) AS round_discounted_price,
    CEIL(price * (1 - (RAND()))) AS ceil_discounted_price,
    FLOOR(price * (1 - (RAND()))) AS floor_discounted_price
FROM products;

-- Q - 84 --

SELECT 
    CONCAT(LEFT(p_name, 3),
    LEFT(brand, 3),
    LEFT(category, 3), 
    MOD(p_id, 10)) AS generated_product_code
FROM products;

-- Q - 85 --

SELECT 
    p_id,
    (units_sold * (price - discount)) AS total_revenue,
    (units_sold * (price - discount)) * 0.10 AS commission_amount,
    (units_sold * (price - discount)) * 0.18 AS tax_amount,
    (units_sold * (price - discount)) - ((units_sold * (price - discount)) * 0.10) - 
    ((units_sold * (price - discount)) * 0.18) AS net_revenue
FROM products;

-- Q - 86 --

SELECT 
    p_id,
    GREATEST((stock_quantity * price), (units_sold * (price - discount)), (price - discount)) AS max_value,
    LEAST((stock_quantity * price), (units_sold * (price - discount)), (price - discount)) AS min_value
FROM products;

-- Q - 87 --

SELECT 
    p_id,
    POWER(units_sold / NULLIF(stock_quantity, 0), 2) AS square_ratio,
    SQRT(units_sold / NULLIF(stock_quantity, 0)) AS sqrt_ratio,
    ROUND(units_sold / NULLIF(stock_quantity, 0), 2) AS round_ratio
FROM products;

-- Q - 88 --

SELECT 
    p_id,
    INSTR(LOWER(description), 'a') AS position_a,
    INSTR(LOWER(description), 'e') AS position_e,
    INSTR(LOWER(description), 'i') AS position_i,
    INSTR(LOWER(description), 'o') AS position_o,
    LENGTH(description) AS total_length,
    REVERSE(description) AS reversed_description
FROM products;

-- Q - 89 --

SELECT 
    p_id,
    ROUND((price * 1.10) * 0.95, 2) AS revised_final_price
FROM products;

-- Q - 90 --

SELECT 
    p_id,
    CEIL(ABS((units_sold * (price - discount)) - (stock_quantity * price)) / 1000) AS ceil_value,
    FLOOR(ABS((units_sold * (price - discount)) - (stock_quantity * price)) / 1000) AS floor_value,
    TRUNCATE(ABS((units_sold * (price - discount)) - (stock_quantity * price)) / 1000, 2) AS truncated_value
FROM products;

-- Q - 91 --
SELECT 
    p_id,
    ROUND((stock_quantity - units_sold) / NULLIF(stock_quantity + units_sold, 0), 2) AS risk_score,
    SIGN((stock_quantity - units_sold) / NULLIF(stock_quantity + units_sold, 0)) AS risk_status
FROM products;

-- Q - 92 --

SELECT 
    p_id,
    GREATEST((units_sold * (price - discount) * 0.10), (stock_quantity * price)) AS max_value,
    LEAST((units_sold * (price - discount) * 0.10), (stock_quantity * price)) AS min_value
FROM products;

-- Q - 93 --

SELECT 
    REPLACE(REPLACE(REPLACE(CONCAT_WS(' | ', product_name, brand, city, category), 'a', '@'), 'o', '0'), 'e', '3') 
    AS formatted_report_label
FROM products;

-- Q94
SELECT 
    p_id,
    ROUND(SQRT(price) * 100, 2) AS rounded_value,
    CEIL(SQRT(price) * 100) AS ceil_value,
    FLOOR(SQRT(price) * 100) AS floor_value
FROM products;

-- Q - 95 --

SELECT 
    p_id,
    (units_sold * (price - discount) * 12) AS annual_revenue,
    (units_sold * (price - discount) * 12) * 0.12 AS commission_amount,
    (units_sold * (price - discount) * 12) * 0.18 AS tax_amount,
    (units_sold * (price - discount) * 12) - ((units_sold * (price - discount) * 12) * 0.30) 
    AS net_annual_revenue
FROM products;

-- Q - 96 --
SELECT 
    p_id,
    ROUND(((stock_quantity * price) / NULLIF(units_sold * (price - discount), 0)) * 100, 2) AS rounded_pct,
    CEIL(((stock_quantity * price) / NULLIF(units_sold * (price - discount), 0)) * 100) AS ceil_pct,
    FLOOR(((stock_quantity * price) / NULLIF(units_sold * (price - discount), 0)) * 100) AS floor_pct
FROM products;

-- Q - 97 --
SELECT 
    p_id,
    MOD(SQRT(POWER(product_id, 2)), 5) AS remainder_value
FROM products;

-- Q - 98 --

SELECT 
    p_id,
    GREATEST(price, (price - discount), (price * 1.10), (stock_quantity * price)) AS max_value,
    LEAST(price, (price - discount), (price * 1.10), (stock_quantity * price)) AS min_value,
    ABS(GREATEST(price, (price - discount), (price * 1.10), (stock_quantity * price)) - 
        LEAST(price, (price - discount), (price * 1.10), (stock_quantity * price))) AS abs_spread
FROM products;

-- Q - 99 --
SELECT 
    p_id,
    ROUND(price - discount, 2) AS final_selling_price,
    ROUND(units_sold * (price - discount), 2) AS total_sales_revenue,
    ROUND(stock_quantity * price, 2) AS total_inventory_value,
    ROUND((units_sold * (price - discount)) * 0.10, 2) AS commission_amount,
    ROUND((units_sold * (price - discount)) * 0.18, 2) AS tax_amount,
    ROUND((units_sold * (price - discount)) - ((units_sold * (price - discount)) * 0.28), 2) AS net_revenue,
    ROUND((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0), 2) AS revenue_inventory_ratio,
    ABS((units_sold * (price - discount)) - (stock_quantity * price)) AS revenue_difference,
    SIGN((units_sold * (price - discount)) - (stock_quantity * price)) AS performance_status,
    ROUND((units_sold * (price - discount)) - ((units_sold * (price - discount)) * 0.28), 0) AS rounded_net_revenue,
    SQRT(stock_quantity * price) AS sqrt_inventory_value,
    GREATEST((units_sold * (price - discount)), (stock_quantity * price)) AS max_financial_value,
    LEAST((units_sold * (price - discount)), (stock_quantity * price)) AS min_financial_value
FROM products;

-- Q - 100 --
SELECT 
    p_id AS "Product_ID",
    UPPER(p_name) AS "Product_Name",
    CONCAT(LEFT(p_name, 3), RIGHT(brand, 3)) AS "Product_Code",
    UPPER(brand) AS "Brand",
    UPPER(category) AS "Category",
    UPPER(city) AS "City",
    price AS "Original_Price",
    ROUND(discount, 2) AS "Discount_Amount",
    ROUND(price - discount, 2) AS "Final Selling Price",
    CEIL(price * 1.10) AS "Revised Price",
    ROUND(units_sold * (price - discount), 2) AS "Total Sales Revenue",
    ROUND(stock_quantity * price, 2) AS "Inventory Value",
    ROUND((units_sold * (price - discount)) * 0.10, 2) AS "Commission",
    ROUND((units_sold * (price - discount)) * 0.18, 2) AS "Tax",
    ROUND((units_sold * (price - discount)) - ((units_sold * (price - discount)) * 0.28), 2) AS "Net Revenue",
    ROUND(((units_sold * (price - discount)) / NULLIF(stock_quantity * price, 0)) * 100, 2) AS "Sales Achievement",
    ABS((units_sold * (price - discount)) - (stock_quantity * price)) AS "Inventory Difference",
    SIGN((units_sold * (price - discount)) - (stock_quantity * price)) AS "Performance Status",
    SQRT(units_sold * (price - discount)) AS "Revenue Square Root",
    POWER(units_sold * (price - discount), 2) AS "Revenue Square",
    GREATEST((units_sold * (price - discount)), (stock_quantity * price)) AS "Maximum Amount",
    LEAST((units_sold * (price - discount)), (stock_quantity * price)) AS "Minimum Amount",
    MOD(p_id, 7) AS "Product ID Remainder",
    UPPER(REPLACE(description, 'a', '@')) AS "Product Description"
FROM products;
     