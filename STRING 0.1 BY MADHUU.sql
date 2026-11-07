CREATE DATABASE shopping_db;
 USE shopping_db;  
 CREATE TABLE products ( 
 product_id INT PRIMARY KEY AUTO_INCREMENT, 
 product_name VARCHAR(100),
 brand VARCHAR(50), 
 category VARCHAR(50),
 description VARCHAR(200),
 city VARCHAR(50)
 );
 INSERT INTO products 
 (product_name, brand, category, description, city)
 VALUES 
 ('wireless mouse', 'logitech', 'electronics', 'wireless computer mouse', 'indore'),
 ('gaming keyboard', 'redragon', 'electronics', 'mechanical gaming keyboard', 'bhopal'),
 ('smart watch', 'boat', 'accessories', 'bluetooth smart watch', 'pune'),
 ('running shoes', 'nike', 'fashion', 'comfortable running shoes', 'delhi'),
 ('laptop backpack', 'hp', 'accessories', 'waterproof laptop backpack', 'mumbai'),
 ('bluetooth speaker', 'jbl', 'electronics', 'portable bluetooth speaker', 'indore'),
 ('cotton t shirt', 'puma', 'fashion', 'premium cotton t shirt', 'bhopal'),
 ('smartphone cover', 'samsung', 'accessories', 'protective mobile cover', 'pune'),
 ('usb cable', 'anker', 'electronics', 'fast charging usb cable', 'delhi'),
 ('office chair', 'featherlite', 'furniture', 'ergonomic office chair', 'mumbai');
 -- Section 1: Basic Level (Q1–Q15) Sabse pehle basic string manipulation ki practice karo.
 -- 1. Sabhi product names ko CAPITAL LETTERS mein display karo using UPPER().
 SELECT 
 UPPER(product_name) AS product_name FROM products;
 -- 2. Sabhi brand names ko small letters mein display karo using LOWER().
 SELECT
 LOWER(brand) AS brand FROM PRODUCTS;
 -- 3. Product name aur brand ko combine karke Dono ke beech space hona chahiye. product_details column banao.
 SELECT 
 CONCAT_WS(" ",product_name,brand)AS PRODUCT_DETAILS FROM PRODUCTS;
 -- 4. Product name, brand aur category ko  separator ke saath combine karo. 
  SELECT 
 CONCAT_WS("_",product_name,brand,category)AS PRODUCT_DETAILS FROM PRODUCTS;
 -- 5. Har product name ki length bytes mein calculate karo using LENGTH().
 SELECT 
 product_name,LENGTH(product_name) AS BYTES_LENGTH FROM PRODUCTS;
 -- 6. Har product description mein total characters count karo using CHAR_LENGTH().
 SELECT 
 description,CHAR_LENGTH(description) AS CHAR_LENGTH FROM PRODUCTS;
 -- 7. Har product name ke starting ke 5 characters extract karo using SUBSTRING().
 SELECT product_name,SUBSTRING(product_name,3)AS SHORT_NAME FROM PRODUCTS;
 -- 8. Har brand name ke starting ke 3 characters extract karo using LEFT().
 SELECT product_name,LEFT(PRODUCT_NAME,3)AS FIRST_THREE_CHARACTERS FROM PRODUCTS;
 -- 9. Har product name ke last ke 4 characters extract karo using RIGHT().
  SELECT product_name,RIGHT(PRODUCT_NAME,4)AS LAST_FOUR_CHARACTERS FROM PRODUCTS;
 -- 10. Sabhi brand names ko reverse karke display karo using REVERSE().
 SELECT  product_name,REVERSE( product_name) AS REVERSE_ FROM PRODUCTS;
--  11. Har product name mein o character ki first position find karo using INSTR().
SELECT  product_name,INSTR( product_name,"O") AS CHARCTER_POSITION FROM PRODUCTS;
 -- 12. Sabhi product names mein a ko @ se replace karo using REPLACE().
 SELECT  product_name,REPLACE( product_name,"a","@") AS NEW_PRODUCT_NAME FROM PRODUCTS;
 -- 13. Ek sample text ' Online Shopping Store ' se starting aur ending spaces remove karo using TRIM().
 SELECT  trim(' Online Shopping Store ') AS clen_name;
 -- 14. Sabhi cities ko uppercase mein display karo.
  SELECT 
 UPPER(city) AS CITIES FROM products;
 -- 15. Product name aur city ko combine karke product_location column banao.
  SELECT 
 CONCAT(product_name,UPPER(city))AS product_location FROM products;
 -- Section 2: Intermediate Level (Q16–Q30)
 -- Ab ek hi query mein thodi complex string operations perform karo.
 -- 16. Har product ka full detail is format mein display karo:
 -- WIRELESS MOUSE - LOGITECH - ELECTRONICS
  SELECT 
 CONCAT_WS(" - ",product_name,brand, category, description, city)AS full_detail FROM products;
--  17. Har product name ke first 3 characters aur brand ke last 3 characters combine karo.
SELECT product_name,LEFT(PRODUCT_NAME,3)AS FIRST_THREE_CHARACTERS,
brand ,RIGHT(brand,3)AS LAST_three_CHARACTERS
 FROM PRODUCTS;
-- 18. Product description mein computer word ki position find karo.
select description,instr(description,"computer") as charcter_position from PRODUCTS; 
-- 19. Har product name ke first aur last character ko extract karke combine karo.
SELECT product_name,concat(LEFT(PRODUCT_NAME,1),
RIGHT(PRODUCT_NAME,1))as combine FROM PRODUCTS; 
-- 20. Sabhi product names ko uppercase mein convert karo aur unki character length bhi display karo.
 SELECT
 UPPER(product_name),char_length(product_name) AS CHARACTER_LENGTH FROM PRODUCTS;
-- 21. Product name ke first 5 characters extract karke unhe lowercase mein display karo.
SELECT product_name,lower(LEFT(PRODUCT_NAME,5))as combine FROM PRODUCTS;
-- 22. Brand name mein a ko @ se replace karo aur resulting text ko uppercase mein convert karo.
SELECT brand,upper(replace(brand,"a","@"))as convert_ FROM PRODUCTS;
-- 23. Product name aur description ko CONCAT_WS() se | separator ke saath combine karo.
SELECT 
CONCAT_WS("  ",product_name,description)AS COMBINE FROM products;
-- 24. Har product description ke last 5 characters extract karke reverse karo.
select description, reverse(right(description,5))as reverse_description  FROM products;
-- 25. Har city ke first 2 aur last 2 characters ko combine karo.
SELECT city,concat(LEFT(city,1),
RIGHT(city,1))as combine FROM PRODUCTS;
-- 26. Product name mein o ki position aur brand name ki length ek saath display karo.
SELECT  product_name,INSTR( product_name,"O")as find,brand,
LENGTH(brand) AS CHARCTER_POSITION FROM PRODUCTS;
-- 27. Har product name ko reverse karke uske first 4 characters extract karo.
 SELECT  product_name,REVERSE(LEFT(PRODUCT_NAME,4)) AS REVERSE_ FROM PRODUCTS;
-- 28. Category name ko uppercase mein convert karke uske saath product name combine karo.
SELECT
          CONCAT(" ",UPPER(category),product_name)AS COMBINE FROM PRODUCTS;
-- 29. Product description mein smart word ko intelligent se replace karo.
SELECT  description,REPLACE( description,"smart","intelligent") AS NEW__NAME FROM PRODUCTS;
-- 30. Product name, brand aur city ko ek single column mein is format mein display karo:
-- Product: Wireless Mouse | Brand: Logitech | City: Indore 
SELECT
      CONCAT_WS("/",product_name,brand , city)AS COMBINE FROM PRODUCTS;
-- Section 3: Advanced Level (Q31–Q40)
-- Ab multiple functions ko combine karke queries likho.
-- 31. Sabhi product names ko uppercase mein convert karo, phir unke first 6 characters extract karo.
select upper(product_name),left(product_name,6)as upper_characters from products;
-- 32. Har brand name ko reverse karo aur resulting string ki length calculate karo.
select reverse(brand),length(brand) as starting_length from products;
-- 33. Product description mein o character ki position find karo aur description ko uppercase mein display karo.
select description,upper(description),instr(description,"o")as position_find from products;
-- 34. Product name ke first 3 characters aur last 3 characters extract karke  se combine karo.
select product_name, concat(left(product_name,3),right(product_name,3)) as combine from products;
-- 35. Har product ka brand aur category lowercase mein convert karke ek column mein combine karo.
SELECT
          CONCAT(LOWER(BRAND),LOWER(category))AS COMBINE FROM PRODUCTS;
--  36. Product name mein a ko @ se aur o ko 0 se replace karo.
SELECT product_name,replace(product_name,"a","@")as replace_ ,replace(product_name,"o","0")as replace_ FROM PRODUCTS;
-- 37. Product name ko reverse karke uppercase mein display karo.
select product_name,reverse(upper(product_name))as display from products;
-- 38. City aur category ko combine karo, phir resulting string ki character length calculate karo.
select char_length(concat(city,category)) as combine from products;
-- 39. Har product description ke first 10 characters extract karo aur unhe uppercase mein convert karo.
 select description ,upper(left(description,10)) as convet_ from products; 
-- 40. Product name, brand aur category ko combine karke complete product label banao.
-- Saare text uppercase mein hone chahiye.
select upper(concat_ws(" ",product_name,brand,category)) as product_label from products;

-- Section 4: Real-World Challenges (Q41–Q50)
--  Ye questions real-world database development ke scenarios par based hain.
-- 41. Company chahti hai ki har product ka ek short product code generate ho. 
-- Product name ke first 3 characters aur brand ke first 2 characters combine karke code banao.
select product_name,brand,concat(left(product_name,3),left(brand,2)) as short_name from products;
-- 42. Marketing team ko sabhi products ke liye ek promotional label chahiye.
-- Format hona chahiye: BUY WIRELESS MOUSE FROM LOGITECH 
 SELECT 
 UPPER(CONCAT_WS(product_name," BUY ",brand))AS PRODUCT_DETAILS FROM PRODUCTS;
-- 43. Company ko product descriptions mein INSTR() se uski position find karo.
--  wireless word search karna hai.
SELECT description,INSTR(description,"WIRELESS") AS POSITION_FIND FROM PRODUCTS;
-- 44. Product name aur brand ko combine karo. Combined string ko reverse karke display karo.
SELECT PRODUCT_NAME,BRAND , CONCAT(REVERSE(PRODUCT_NAME),REVERSE(BRAND))AS REVE_NAME FROM PRODUCTS;
-- 45. Sabhi product names ke first 4 characters uppercase aur last 4 characters lowercase mein display karo.
SELECT PRODUCT_NAME,UPPER(LEFT(PRODUCT_NAME,4)),LOWER(RIGHT(PRODUCT_NAME,4)) AS DISPLAY FROM PRODUCTS;
-- 46. Company ko city-wise product labels generate karne hain.
--  Format: INDORE | ELECTRONICS | WIRELESS MOUSE
SELECT CITY,BRAND,PRODUCT_NAME,
UPPER(CONCAT_WS( " | ",CITY,BRAND,PRODUCT_NAME) )AS PROD_LEBL FROM PRODUCTS;
-- 47. Har product description mein o character ko 0 se replace karo aur 
-- resulting description ki length calculate karo.
SELECT 
REPLACE(description,"o",0),length(description) as starting_length from products;
-- 48. Ek product summary generate karo jisme product name, brand aur description ho.
--  Inke beech ** separator use karo.
 SELECT 
 CONCAT_WS(" ** ",product_name,brand,description)AS PRODUCT_SUMMARY FROM PRODUCTS;
-- 49. Har product ka first character, last character aur brand ke first character ko combine karke 
-- ek unique-looking short label banao. 
SELECT 
CONCAT(LEFT(product_name,1),RIGHT(product_name,1),LEFT(BRAND,1))AS COMBINE_UNIQUE FROM PRODUCTS;
-- 50. Ek complete product information column banao jisme product name uppercase,
-- brand lowercase, category uppercase aur city lowercase ho.
-- Sabhi details ko separator se combine karo.
SELECT 
CONCAT(UPPER(product_name),LOWER(BRAND),UPPER(CATEGORY),LOWER(CITY))AS COMBINE FROM PRODUCTS;
                   -- STRING  FILE COMPLETED -- 