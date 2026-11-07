CREATE DATABASE company_db;
USE company_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    experience DECIMAL(4,1),
    target DECIMAL(10,2),
    sales_amount DECIMAL(10,2),
    working_days INT,
    total_leaves INT,
    performance_rating DECIMAL(3,1)
);

INSERT INTO employees
(first_name, last_name, department, salary, bonus, experience,
 target, sales_amount, working_days, total_leaves, performance_rating)
VALUES
('rahul', 'sharma', 'IT', 45000.75, 5000.50, 2.5, 100000, 125000.75, 250, 12, 8.5),

('amit', 'kumar', 'HR', 35000.40, 3500.75, 1.8, 80000, 75600.50, 250, 15, 7.5),

('priya', 'verma', 'Finance', 55000.85, 7000.25, 4.2, 150000, 175500.80, 250, 8, 9.2),

('neha', 'patel', 'IT', 65000.60, 8500.80, 5.5, 200000, 185000.45, 250, 10, 8.8),

('rohit', 'gupta', 'Sales', 28000.90, 2500.40, 1.2, 75000, 65000.25, 250, 20, 6.5),

('anjali', 'singh', 'Marketing', 48000.35, 4500.65, 3.5, 120000, 135000.90, 250, 9, 8.9),

('vikas', 'jain', 'IT', 72000.95, 9000.55, 6.8, 250000, 275000.65, 250, 6, 9.5),

('pooja', 'mehta', 'HR', 39000.25, 3000.30, 2.0, 90000, 95000.75, 250, 14, 7.8);

-- Level 1: Basic Numeric Functions (1–15) HR Manager ko basic numerical calculations ki reports chahiye.
 -- 1. Rahul ki salary mein agar negative value aa jaye, toh ABS() ka use karke uski absolute salary calculate karo.
 SELECT FIRST_NAME,salary,
 ABS(salary) AS POSSITIVE_DIFFERENCE
 FROM employees
 WHERE FIRST_NAME="RAHUL";
 
-- 2. Sabhi employees ki salary ka absolute value display karo.
SELECT FIRST_NAME,salary,
 ABS(salary) AS ABSOLUTE_VALUE
 FROM employees;
--  3. Rahul ki salary ko nearest integer mein round karke display karo.
SELECT FIRST_NAME,salary,
 ROUND(salary) AS POSSITIVE_DIFFERENCE
 FROM employees
 WHERE FIRST_NAME="RAHUL";
-- 4. Sabhi employees ki salary ko 2 decimal places tak round karo.
SELECT FIRST_NAME,salary,
 ROUND(salary,2) AS POSSITIVE_DIFFERENCE
 FROM employees;
-- 5. Sabhi employees ke bonus ko nearest integer mein round karo.
SELECT FIRST_NAME,bonus,
 ROUND(bonus) AS POSSITIVE_DIFFERENCE
 FROM employees;
 -- 6. Employee ki experience ko 1 decimal place tak round karo.
 SELECT FIRST_NAME,experience,
 ROUND(experience,1) AS DECIMAL_PLACE
 FROM employees;
 -- 7. Sabhi employees ki performance rating ko nearest integer mein round karo.
 SELECT FIRST_NAME,performance_rating,
 ROUND(performance_rating) AS nearest_integer
 FROM employees;
-- 8. Employee salary ko next greater integer mein convert karo using CEIL() .
 SELECT FIRST_NAME,salary,
 CEIL(salary) AS greater_integer
 FROM employees;
 -- 9. Employee bonus ko next greater integer mein convert karo using CEILING() .
 SELECT FIRST_NAME,bonus,
 CEILING(bonus) AS greater_integer
 FROM employees;
 -- 10. Sabhi employees ki salary ko lower integer mein convert karo using FLOOR() .
  SELECT FIRST_NAME,salary,
 FLOOR(salary) AS lower_integer
 FROM employees;
-- 11. Employee experience ko lower integer mein convert karo.
 SELECT FIRST_NAME,experience,
 FLOOR(experience) AS lower_integer
 FROM employees;
 -- 12. TRUNCATE() ka use karke sabhi employees ki salary ko 1 decimal place tak display karo.
 SELECT FIRST_NAME,salary,
 TRUNCATE(salary,1) AS decimal_place
 FROM employees;
 -- 13. Sabhi employees ke bonus ko 2 decimal places tak truncate karo.
 SELECT FIRST_NAME,salary,
 TRUNCATE(salary,2) AS decimal_place
 FROM employees;
 -- 14. MOD() ka use karke check karo ki employee ID even hai ya odd.
 
  SELECT FIRST_NAME,salary,emp_id,
 MOD(emp_id,2) AS EVEN_ODD
 FROM employees;
 
 -- 15. Employee ki working days ko 2 se divide karne ke baad remainder calculate karo.
 
 SELECT FIRST_NAME,working_days,
 MOD(working_days,2) AS EVEN_ODD
 FROM employees;
 
 -- Level 2: Intermediate Numeric Functions (16–30) Ab company ko employee salary aur
 -- sales ki detailed analysis chahiye.
 
 -- 16. Sabhi employees ki salary aur bonus ko add karke total compensation calculate karo.
 --  Result ko 2 decimal places tak round karo.
 
  SELECT FIRST_NAME,salary,BONUS,
 ROUND(salary+BONUS,2) AS total_compensation
 FROM employees;
 
 -- 17. Sabhi employees ke sales target aur actual sales ka absolute difference calculate karo.
 
  SELECT FIRST_NAME,TARGET,sales_amount,
 ABS(target-sales_amount) AS absolute_0difference
 FROM employees;
 
 -- 18. Employees ki sales achievement percentage calculate karo aur 2 decimal places tak round karo.
 
  select TARGET,SALES_AMOUNT,
 ROUND(SALES_AMOUNT/TARGET,2)*100 AS TOTL 
 FROM EMPLOYEES;
 
 -- 19. Employee ki salary ka 10% calculate karke 2 decimal places tak display karo.
 SELECT 
    FIRST_NAME,
    salary,
 ROUND(salary*0.10,2) AS TOTL 
 FROM employees;
 
 -- 20. Employee salary ko 12 se multiply karke annual salary calculate karo.
 SELECT FIRST_NAME,salary,
 salary*12 AS annual_salary
 FROM employees;
 
 -- 21. Annual salary ko nearest integer mein round karo.
 SELECT 
    FIRST_NAME,
    salary,
 ROUND(salary * 12) AS annual_salary
 FROM employees;
 
 -- 22. Sabhi employees ke experience ko 2 se multiply karo aur result ko calculate karo.CEIL() se
  SELECT 
    FIRST_NAME,
    experience,
 CEIL(experience * 2) AS EXPERIENCE_RESULT
 FROM employees;
 --  23. Employee ki performance rating ka square calculate karo using POWER() .
  SELECT 
         FIRST_NAME,
         performance_rating,
 POWER(performance_rating,2) AS rating_square
 FROM employees;
 -- 24. Employee ke experience ka square calculate karo.
 SELECT 
    FIRST_NAME,
    experience,
 POWER(experience,2 ) AS EXPERIENCE_RESULT
 FROM employees;
 -- 25. Employee ke experience ka cube calculate karo using POWER() .
  SELECT 
         FIRST_NAME,
         performance_rating,
 POWER(performance_rating,3) AS rating_CUBE
 FROM employees;
 -- 26. Sabhi employees ki performance rating ka square root calculate karo using SQRT() .
 SELECT 
         FIRST_NAME,
         performance_rating,
 SQRT(performance_rating) AS rating_square
 FROM employees;                                    -- DOUT -- 
 
 -- 27. Employee ki salary ka square root calculate karo aur 2 decimal places tak round karo.
 SELECT 
         FIRST_NAME,
         SALARY,
 ROUND(SQRT(SALARY),2) AS SALARY_square
 FROM employees; 
 -- 28. SIGN() ka use karke salary aur bonus ke difference ka sign calculate karo.
  SELECT 
       FIRST_NAME,
       salary,BONUS,
 SIGN(salary-BONUS) AS difference
 FROM employees;
 
 -- 29. SIGN() ka use karke employee ne sales target achieve kiya hai ya nahi, identify karo.
 SELECT 
       FIRST_NAME,
       salary,BONUS,
       TARGET,
       SALES_AMOUNT,       
 SIGN(SALES_AMOUNT-TARGET) AS difference
 FROM employees;
 -- 30. MOD() ka use karke employees ko 3 groups mein divide karne ke liye 
 -- employee ID ka remainder calculate karo.
 
 SELECT 
          emp_id,
          FIRST_NAME,
         salary,               
 MOD(emp_id,3) AS EVEN_ODD
 FROM employees;
-- Level 3: Business Analysis (31–45) 
-- HR Manager ko ab employee performance aur financial reports chahiye.
-- 31. Har employee ki salary aur bonus mein se maximum amount find karo using GREATEST() .

SELECT 
      FIRST_NAME,
         salary,
         BONUS,
         GREATEST(SALARY,BONUS) AS MAXIMUM_AMOUNT
          FROM employees;
-- 32. Har employee ki salary aur bonus mein se minimum amount find karo using LEAST() .
SELECT 
      FIRST_NAME,
         salary,
         BONUS,
         LEAST(SALARY,BONUS) AS MINIMUM_AMOUNT
          FROM employees;
-- 33. Sabhi employees ke sales target aur sales amount mein se maximum value find karo.
SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         GREATEST(TARGET,SALES_AMOUNT) AS MAXIMUM_AMOUNT
          FROM employees;
-- 34. Sabhi employees ke sales target aur sales amount mein se minimum value find karo.
SELECT 
      FIRST_NAME,
       TARGET,
       SALES_AMOUNT,
         LEAST(TARGET,SALES_AMOUNT) AS MINIMUM_AMOUNT
          FROM employees;
-- 35. Salary, bonus aur performance rating ko value find karo.
 -- GREATEST() se compare karke maximum 
 SELECT 
      FIRST_NAME,
      SALARY,
      BONUS,
      performance_rating,
GREATEST(SALARY,BONUS,performance_rating) AS MAXIMUM_AMOUNT
          FROM employees;
-- 36. Salary, bonus aur performance rating ko LEAST() se compare karke minimum value find karo.
SELECT 
      FIRST_NAME,
      SALARY,
      BONUS,
      performance_rating,
LEAST(SALARY,BONUS,performance_rating) AS MINIMUM_VALUE
          FROM employees;
--  37. Har employee ka actual sales target difference calculate karo aur result ko 
-- 2 decimal places tak round karo.
SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         ROUND(TARGET-SALES_AMOUNT,2) AS difference_calculate
          FROM employees;

--  38. Employee ki sales achievement percentage calculate karo aur next greater integer display karo.
--  CEIL() ka use karke 
SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         CEIL((TARGET/SALES_AMOUNT)*100) AS difference_calculate
          FROM employees;
                              
-- 39. Employee ki sales achievement percentage calculate karo aur FLOOR()
--  ka use karke lower integer display karo.
SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         FLOOR(TARGET/SALES_AMOUNT)*100 AS difference_calculate
          FROM employees;
--  40. Employee ki sales achievement percentage ko TRUNCATE() se 1 decimal place tak display karo.
SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         TRUNCATE((TARGET/SALES_AMOUNT)*100,1) AS difference_calculate
          FROM employees;
-- 41. Har employee ki annual salary calculate karo aur GREATEST() ka use karke annual salary aur
--  bonus mein se maximum amount display karo.
 SELECT 
      FIRST_NAME,
      SALARY,
      BONUS,
GREATEST(SALARY,BONUS*12) AS MAXIMUM_AMOUNT
          FROM employees;
--  42. Har employee ki salary ka 15% bonus calculate karo aur usko 2 decimal places tak round karo.
SELECT 
      FIRST_NAME,
      SALARY,
    GREATEST(SALARY,2) * 15 AS BONUS_CALCULATE
          FROM employees;
--  43. Har employee ki salary mein 10% increment add karke revised salary calculate karo.
SELECT 
      FIRST_NAME,
      SALARY,
    GREATEST(SALARY)*0.10 AS BONUS_CALCULATE
          FROM employees;
--  44. Revised salary ko CEIL() ka use karke next greater integer mein convert karo.
 SELECT 
      FIRST_NAME,
      SALARY,
      CEIL(SALARY) AS MAXIMUM_AMOUNT
          FROM employees;
-- 45. Employee ke working days aur total leaves ka difference calculate karo using ABS() .
 SELECT FIRST_NAME,working_days,total_leaves,
 ABS(working_days-total_leaves) AS difference_calculate
 FROM employees;
--  Level 4: Logical Thinking & Function Combinations (46–60) 
-- Ab HR Manager ko multiple numeric functions combine karke reports chahiye.

--  46. Employee ki salary aur bonus ka total calculate karo.
-- Uske baad ROUND() se 2 decimal places tak result display karo.

 SELECT 
      FIRST_NAME,
      SALARY,
      BONUS,
ROUND(SALARY+BONUS,2) AS result_display
          FROM employees;
-- 47. Employee ki sales aur target ka difference calculate karo.
--  Uske baad ABS() aur ROUND() dono ka use karo.

SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         ROUND(ABS(SALES_AMOUNT - TARGET)) AS difference_calculate
          FROM employees; 
-- 48. Sales achievement percentage calculate karo aur karke result display karo.
-- ROUND() aur CEIL() dono ka use

SELECT 
      FIRST_NAME,
         TARGET,
         SALES_AMOUNT,
         ROUND(CEIL(TARGET/SALES_AMOUNT)) AS result_display
          FROM employees; 
          
--  49. Employee experience ka square calculate karo aur
--  uske result ko ROUND() se 2 decimal places tak display karo.

SELECT 
    FIRST_NAME,
    experience,
 ROUND(POWER(experience,2 ),2) AS EXPERIENCE_RESULT
 FROM employees;

-- 50. Employee performance rating ka square root calculate karo aur ROUND() se 
-- 2 decimal places tak display karo.

SELECT 
    FIRST_NAME,
    performance_rating,
 ROUND(POWER(performance_rating,2 ),2) AS EXPERIENCE_RESULT
 FROM employees;
-- 51. Employee salary ko 1000 se divide karo aur CEIL() ka use karke result display karo.

SELECT 
      FIRST_NAME,
      SALARY,
     CEIL(SALARY/1000) AS result_display
          FROM employees;
-- 52. Employee salary ko 1000 se divide karo aur FLOOR() ka use karke result display karo.
SELECT 
      FIRST_NAME,
      SALARY,
     FLOOR(SALARY/1000) AS result_display
          FROM employees;
-- 53. Employee salary ko 1000 se divide karo aur TRUNCATE() se 2 decimal places tak result display karo.
SELECT 
      FIRST_NAME,
      SALARY,
     TRUNCATE(SALARY/1000,2) AS result_display
          FROM employees;
-- 54. Employee ID ka MOD() calculate karo aur us result ka karo. POWER() se square calculate KARO
 SELECT 
          emp_id,
          FIRST_NAME,
         salary,               
 POWER(MOD(emp_id,2),2) AS EVEN_ODD
 FROM employees;
 
-- 55. Employee ID ka square calculate karo aur uska square root calculate karke display karo.
SELECT 
          emp_id,
          FIRST_NAME,
         salary,               
 POWER(emp_id,2) AS DISPLAY_
 FROM employees;
--  56. Employee ki salary aur bonus ka difference calculate karo aur SIGN() se result ka sign identify karo.

-- 57. Employee ki sales target achievement ka difference calculate karo aur SIGN() se target status identify karo.

-- 58. Employee ki salary, bonus aur annual salary mein se maximum value find karo using GREATEST() .

SELECT 
      FIRST_NAME,
      SALARY,
      BONUS,
GREATEST(SALARY*12,BONUS) AS MAXIMUM_AMOUNT
          FROM employees;
 -- 59. Employee ki salary, bonus aur annual salary mein se minimum value find karo using LEAST() .
 SELECT 
      FIRST_NAME,
      SALARY,
      BONUS,
LEAST(SALARY*12,BONUS) AS MINIMUM_AMOUNT
          FROM employees;
 -- 60. Employee ki salary ka 10% calculate karo, usko karo ki result positive hai ya negative.
 -- ROUND() karo aur SIGN() se check 

select salary ,bonus,
sign(round((salary*0.10),2)) as calculate_result
 from employees;

-- Level 5: Real-World Company Challenges (61–75) 
-- Ab aapko TechNova Solutions ke Senior Data Analyst ke tasks solve karne hain. 
-- 61. Company ke sabhi employees ko randomly select karne ke liye RAND() ka use karke employees ki complete 
-- list random order mein display karo.

SELECT *
FROM employees
ORDER BY RAND();

 -- 62. RAND() ka use karke company ke kisi ek random employee ko select karo.
 
 SELECT *
FROM employees
ORDER BY RAND()
limit 1;
 
 -- 63. RAND() aur FLOOR() ka use karke 1 se 100 ke beech random integer generate karo. 
 
 SELECT FLOOR(RAND() * 100) + 1 AS RandomNumber;

--  64. RAND() ka use karke har employee ko random performance score generate karke display karo. 

select
    emp_id, 
    first_name, 
    RAND() AS performance_score
FROM 
    employees;


--  65. Har employee ki salary mein random 1 se 1000 tak amount add karke revised salary calculate karo.

SELECT 
    emp_id, 
    first_name, 
    salary,
    FLOOR(1 + (RAND() * 1000)) AS random_bonus,
    (salary + FLOOR(1 + (RAND() * 1000))) AS revised_salary
FROM employees;


--  66. Employee ki salary aur bonus ka total calculate karo. Phir GREATEST() aur LEAST() ka 
-- use karke salary aur bonus mein se maximum aur minimum amount display karo. 

select salary,bonus,
abs(salary+bonus) as total_salary,
GREATEST(salary,bonus) AS highest_amount,
LEAST(salary,bonus) as minimum_amount
FROM employees;


--  67. Employee ki sales achievement percentage calculate karo. Result ko ROUND() ,
--  CEIL() aur FLOOR() ke through ek hi query mein display karo.

SELECT
    first_name,
    target,
    sales_amount,
    ROUND(sales_amount * 100, 2)
    AS achievement_percentage,
    CEIL(sales_amount * 100) AS SALES_DETAILS,
    floor(sales_amount * 100) as minimum_salary
FROM employees;


--  68. Employee ki salary ka square root calculate karo. Uske baad result ko TRUNCATE() aur ROUND()  
-- dono se display karo. 

SELECT 
    salary,
    SQRT(salary) AS original_sqrt,
    TRUNCATE(SQRT(salary), 2) AS truncated_sqrt,
    ROUND(SQRT(salary), 2) AS rounded_sqrt
FROM 
    employees;


--  69. Employee ke experience ka square aur cube calculate karo. Dono results ko 2 decimal places tak round karo.

SELECT
    first_name,
    experience,
    POWER(experience, 2) AS experience_square,
    round(POWER(experience,3),2) as experience_cube
FROM employees;

--  70. Employee ke sales amount aur target ka difference calculate karo. 
-- ABS() aur ka use karke difference aur target status dono display karo. SIGN()

 SELECT
    first_name,
    target,
    sales_amount,
   abs(target - sales_amount) AS target_difference,
    SIGN(sales_amount - target) AS target_status
FROM employees;

 -- 71. Employee ki annual salary calculate karo. Phir annual salary ko 1000 se divide karke CEIL() , 
 -- FLOOR() aur TRUNCATE() se results display karo. 
 
 SELECT 
    (salary * 12) AS annual_salary,
    CEIL((salary * 12) / 1000) AS ceil_result,
    FLOOR((salary * 12) / 1000) AS floor_result,
    TRUNCATE((salary * 12) / 1000, 0) AS truncate_result
FROM employees;

 
 -- 72. Company ke har employee ka salary-to-bonus ratio calculate karo aur result ko 2 decimal places tak round karo.
 
 SELECT 
    emp_id, 
    first_name, salary,
    last_name, bonus,
    ROUND(salary /bonus, 2) AS salary_to_bonus_ratio
FROM 
    employees;
    
    
 -- 73. Har employee ke working days aur leaves ka ratio calculate karo aur 2 decimal places tak round karo.
 
 SELECT 
    emp_id, 
     salary,working_days,
     bonus,total_leaves,
    ROUND(working_days /total_leaves, 2) AS working_days_to_leaves_ratio
FROM 
    employees;
 
 
 -- 74. Har employee ki salary, bonus, sales target aur actual sales ko compare karke maximum aur
 -- minimum value ek hi query mein display karo using GREATEST() and LEAST()
 
 SELECT 
    emp_id,
    first_name,
    salary,
    bonus,
    target,
    sales_amount,
    GREATEST(salary, bonus, target, sales_amount) AS maximum_value,
    LEAST(salary, bonus, target,sales_amount) AS minimum_value
FROM employees;

 
 
 -- 75. Final Challenge – Employee Performance Report
 -- HR Manager ko ek complete employee performance report chahiye.
 -- Ek single SQL query likho jo following columns display kare:
--  Employee ID 
-- Employee Name 
 -- Department Salary
 -- Rounded Salary
 -- Annual Salary 
 -- Total Compensation (Salary + Bonus) 
 -- Sales Achievement Percentage
 -- Sales Difference using ABS() 
 -- Target Status using SIGN()
 -- Experience Square using POWER()
 -- Performance Rating Square Root using SQRT()
 -- Maximum Amount using GREATEST()
 -- Minimum Amount using LEAST()
 -- Employee ID Remainder using MOD()
 
 SELECT 
    -- Employee ID aur Name
    emp_id AS "Employee ID",
    first_name AS "Employee Name",
    salary AS "Department Salary",
    ROUND(salary, 2) AS "Rounded Salary",
    (salary * 12) AS "Annual Salary",
    (salary + bonus) AS "Total Compensation", 
    ((sales_amount / target) * 100) AS "Sales Achievement Percentage", 
    ABS(sales_amount - target) AS "Sales Difference",
    SIGN(sales_amount - target) AS "Target Status",
    POWER(experience, 2) AS "Experience Square",
    SQRT(performance_rating) AS "Performance Rating Square Root",
    GREATEST(salary, sales_amount, bonus) AS "Maximum Amount",
    LEAST(salary, sales_amount, bonus) AS "Minimum Amount",
    MOD(emp_id, 2) AS "Employee ID Remainder"
FROM 
    employees;
 
             -- NEMERIC FUNCTION FILE COMPLETE -- 