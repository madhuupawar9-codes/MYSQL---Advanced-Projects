CREATE DATABASE technova_ctes;
 USE technova_ctes;
 CREATE TABLE departments ( 
 department_id INT PRIMARY KEY, 
 department_name VARCHAR(50) ); 
 CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50),
 department_id INT,
 salary DECIMAL(10,2),
 city VARCHAR(50), 
 experience_years INT,
 FOREIGN KEY (department_id) REFERENCES departments(department_id) );
 INSERT INTO departments VALUES (1, 'IT'),(2, 'HR'), (3, 'Finance'), (4, 'Sales'), (5, 'Marketing'); 
 INSERT INTO employees VALUES  (101, 'Amit',   1, 60000, 'Indore', 5),
 (102, 'Neha',   1, 45000, 'Bhopal', 3), (103, 'Rahul',  1, 35000, 'Indore', 2),
 (104, 'Priya',  2, 40000, 'Bhopal', 4), (105, 'Karan',  2, 30000, 'Indore', 1),
 (106, 'Sneha',  3, 55000, 'Nagpur', 5), (107, 'Vikas',  3, 25000, 'Bhopal', 1), 
 (108, 'Pooja',  4, 50000, 'Indore', 4), (109, 'Rohit',  4, 32000, 'Nagpur', 2), 
 (110, 'Anjali', 5, 42000, 'Bhopal', 3), (111, 'Mohit',  1, 28000, 'Nagpur', 1), 
 (112, 'Simran', 3, 48000, 'Indore', 3), (113, 'Deepak', 5, 38000, 'Indore', 2), 
 (114, 'Kavita', 2, 52000, 'Nagpur', 6), (115, 'Arjun',  4, 27000, 'Bhopal', 1); 
 -- TechNova ka HR manager simple reports banana chahta hai. 
 -- Students har question ko CTE ki help se solve karenge.
 -- 1. Un employees ko show karo jinki salary ₹ 30,000 se zyada hai.
 select version();
 with high_salary as(
 select employee_name,salary
 from employees
 where salary >30000)
 select* from  high_salary;
 -- 2. Un employees ko show karo jinki salary ₹ 40,000 se zyada hai. 
 with high_salary as(
 select employee_name,salary
 from employees
 where salary >40000)
 select* from  high_salary;
--  3. Indore mein rehne wale employees ki list CTE se nikalo. 
with indore_employees as(
 select employee_name,salary
 from employees
 where city ='Indore')
 select* from  indore_employees;
-- 4. Bhopal mein rehne wale employees ko show karo.
with bhopal_employees as(
 select employee_name,salary
 from employees
 where city ='bhopal')
 select* from  bhopal_employees;
--  5. Un employees ko find karo jinka experience 3 years se zyada hai.
with experience_years_employees as(
 select employee_name,salary
 from employees
 where experience_years> 3)
 select* from  experience_years_employees; 
--  6. Un employees ko show karo jinki salary ₹ 25,000 se ₹ 45,000 ke beech hai.
  with high_salary as(
 select employee_name,salary
 from employees
 where salary between 25000 and 45000)
 select* from  high_salary;
-- 7. IT department ke employees ko show karo.
 with it_dep_emp as(
 select *
 from employees 
  where  department_id=1)
  SELECT*,
  (SELECT department_name FROM departments where  department_id=1)
  AS department_name from  it_dep_emp;
-- 8. Un employees ko find karo jinki salary ₹ 50,000 ya usse zyada hai.
with high_salary as(
 select employee_name,salary
 from employees
 where salary >50000)
 select* from  high_salary;
 -- 9. Un employees ke naam aur salary show karo jinka experience 2 years ya usse kam hai.
 with experience_years_employees as(
 select employee_name,salary
 from employees
 where experience_years<2)
 select* from  experience_years_employees;
--  10. Employees ki salary ko descending order mein show karo, CTE ka use karke.
with high_salary as(
 select employee_name,salary
 from employees
 order by salary desc)
 select* from  high_salary;
-- 4.  Level 2 — CTE ke result par filtering (Questions 11–20) Ab HR manager kehta hai:
 -- "Pehle ek result set banao, phir us result mein se required records filter karo." 
 -- 11. Pehle salary ₹ 30,000 se zyada wale employees nikalo, phir unmein se sirf Indore ke employees show karo.
 with high_salary as(
 select *
 from employees
 where salary >30000),
  indore_employees as(
 select *
 from high_salary
 where city ='Indore')
  select* from  indore_employees;
 -- 12. Pehle experience 2 years se zyada wale employees nikalo, phir unmein se salary ₹ 40,000 se zyada wale show karo.
 with experience_years_employees as(
 select *
 from employees
 where experience_years<2),
 high_salary as(
 select *
 from employees
 where salary >40000)
 select* from  high_salary;
 -- 13. Pehle Bhopal ke employees nikalo, phir unmein se salary ₹ 30,000 se zyada wale show karo.
  with  bhopal_employees as(
 select *
 from employees
 where city ='bhopal') ,
 high_salary as(
 select *
 from bhopal_employees
 where salary >30000)
  select* from  high_salary;  
 -- 14. Pehle IT department ke employees nikalo, phir unmein se salary ₹ 40,000 se zyada wale show karo. 
 with it_dep_emp as(
 select e.*,d.department_name
 from employees e 
 join departments d on e.department_id=d.department_id
 where  e.department_id=1),
  high_salary as(
 select *
 from  it_dep_emp
 where salary >30000)
   select* from  high_salary;
 -- 15. Pehle salary ₹ 25,000 se zyada wale employees nikalo, phir unmein se experience 3 years ya zyada wale show karo.
 with high_salary as(
 select *
 from employees
 where salary >25000),
 experience_years_employees as(
 select *
 from high_salary
 where experience_years>3)
  select* from  experience_years_employees ;
 -- 16. Pehle Nagpur ke employees nikalo, phir unmein se experience 2 years se zyada wale show karo.
  with  nagpur_employees as(
 select *
 from employees
 where city ='nagpur') ,
 experience_years_employees as(
 select *
 from nagpur_employees
 where experience_years>2)
  select* from  experience_years_employees ;
 -- 17. Pehle salary ₹ 40,000 ya usse zyada wale employees nikalo, phir unko salary ke ascending order mein show karo. 
 with high_salary as(
 select employee_name,salary
 from employees
 where salary >25000
 order by salary asc)
 select* from  high_salary;
 -- 18. Pehle experience 3 years se zyada wale employees nikalo, phir unmein se Bhopal aur Indore ke employees show karo.
 with experience_years_employees as(
 select *
 from employees
 where experience_years>3),
 bhopal_indore_emp as(
 select *
 from experience_years_employees
 where city between "bhopal" and "indore")
 select* from  bhopal_indore_emp;
 -- 19. Pehle IT aur HR department ke employees nikalo, phir unmein se salary ₹ 35,000 se zyada wale show karo.
 with it_hr_dep_emp as(
 select e.*,d.department_name
 from employees e 
 join departments d on e.department_id=d.department_id
 where  e.department_id between 1 and 2),
  high_salary as(
 select *
 from  it_hr_dep_emp
 where salary >35000)
   select* from  high_salary;
 -- 20. Pehle salary ₹ 30,000 se ₹ 55,000 ke beech wale employees nikalo, 
 -- phir unmein se sirf Indore ke employees show karo.
 with high_salary as(
 select *
 from employees
 where salary between 30000 and 55000),
 indore_employees as(
 select *
 from high_salary
 where city ='Indore')
  select* from  indore_employees; 
 -- 5. Level 3 — CTE + Aggregate Functions (Questions 21–30)
 -- Ab company ko summary reports chahiye. HR manager ko total salary, average salary,
 -- maximum salary aur employee count nikalna hai.
 -- 21. CTE ki help se company ki average salary calculate karo.
  with avg_salary as(
 (select avg(salary ) as avg_salary
 from employees ))
 select* from  avg_salary;
 -- 22. CTE ki help se company ki maximum salary find karo.
  with max_salary as(
 (select max(salary ) as max_salary
 from employees ))
 select* from  max_salary;
 -- 23. CTE ki help se company ki minimum salary find karo.
  with min_salary as(
 (select min(salary ) as min_salary
 from employees ))
 select* from  min_salary;
 -- 24. CTE ki help se company mein total employees count karo.
  with emp_count as(
 (select count(employee_id ) as emp_count
 from employees ))
 select* from  emp_count;
 -- 25. Har department ki average salary calculate karo.
 with department_avg as(
 select department_id, avg(salary ) as avg_salary
 from employees 
 group by department_id
 )
  select department_id,avg_salary from  department_avg;
  
 -- 26. Har department ki maximum salary find karo.
  with department_max as(
 select department_id, max(salary ) as max_salary
 from employees 
 group by department_id
 )
  select department_id,max_salary from  department_max;
 -- 27. Har department ki minimum salary find karo. 
 with department_min as(
 select department_id, min(salary ) as min_salary
 from employees 
 group by department_id
 )
  select department_id,min_salary from  department_min;
 -- 28. Har department mein kitne employees hain, ye calculate karo.
 with department_emp_count as(
 select department_id, count(employee_id) as emp_count
 from employees 
 group by department_id
 )
  select department_id,emp_count from  department_emp_count;
 -- 29. Har city ki average salary calculate karo.
 with city_avg_salary as(
 select city, avg(salary ) as city_avg_salary
 from employees 
 group by city
 )
  select city,city_avg_salary from  city_avg_salary;
 -- 30. Har city mein employees ki total salary calculate karo. 
 with city_total_salary as(
 select city, sum(salary ) as city_total_salary
 from employees 
 group by city
 )
  select city,city_total_salary from  city_total_salary;
 -- 6. Level 4 — CTE + Subquery Logic (Questions 31–40) Ab actual concept aata hai. 
 -- Ye wahi problems hain jinhe students subqueries aur nested queries se solve karte aaye hain.
 -- Ab inhe CTE use karke solve karna hai.
 -- 31. Company ki average salary se zyada salary wale employees find karo. 
 with high_salary as(
 select employee_name,salary
 from employees
 where  salary > 
 (select avg(salary ) as avg_salary
 from employees )
 group by employee_name,salary)
 select* from  high_salary;
 -- 32. Company ki maximum salary ke barabar salary wale employees find karo.
 with high_salary as(
 select employee_name,salary
 from employees
 where  salary =
 (select max(salary ) as max_salary
 from employees )
 group by employee_name,salary)
 select* from  high_salary;
 -- 33. Company ki minimum salary wale employees find karo.
 with high_salary as(
 select employee_name,salary
 from employees
 where  salary in
 (select min(salary ) as min_salary
 from employees )
 group by employee_name,salary)
 select* from  high_salary;
--  34. Company ki average salary se kam salary wale employees find karo.
with high_salary as(
 select employee_name,salary
 from employees
 where  salary < 
 (select avg(salary ) as avg_salary
 from employees )
 group by employee_name,salary)
 select* from  high_salary; 
-- 35. IT department ki average salary se zyada salary wale IT employees find karo.
with  it_dep_emp as(
 select e.*,d.department_name
 from employees e 
 join departments d on e.department_id=d.department_id
 where  e.department_id=1),
 high_salary as(
 select *
 from it_dep_emp
 where  salary > 
 (select avg(salary ) as avg_salary
 from employees )
 )
 select* from  high_salary;
 
-- 36. Apne department ki average salary se zyada salary wale employees find karo.

 with department_avg as(
 select employee_name,salary,department_name
 from employees 
 join departments  on employees.department_id = departments.department_id
 where  salary >                                                                       
 (select avg(salary ) from employees  )
  )
  select * from  department_avg;       

  -- 37. Company ki average salary se zyada salary wale employees ke naam, salary aur experience show karo.
  
with high_salary as(
 select employee_name,salary,experience_years
 from employees
 where  salary >
 (select avg(salary ) as avg_salary
 from employees )
 group by employee_name,salary,experience_years
 )
 select* from  high_salary;
 
-- 38. Un departments ko find karo jinki average salary company ki overall average salary se zyada hai.
with department_avg as(
 select employee_name,salary,department_name,avg(salary )as company_avg_salary
 from employees 
 join departments  on employees.department_id = departments.department_id
 where  salary >                                                                       
 (select avg(salary ) from employees  )
 group by employee_name,salary,department_name
  )
  select * from  department_avg;  
-- 39. Un employees ko find karo jinki salary company ki second-highest distinct salary ke barabar hai.
with com_salary as(
select distinct salary from employees 
order by salary desc limit 1)
select * from employees  where salary =
(select * from com_salary);

-- 40. Un employees ko find karo jinki salary unke department ki maximum salary ke barabar hai.
with max_sal as (
select employee_name,salary,department_id
from   employees
where salary = 
( select  max(salary )  from employees where department_id=department_id  ))
   select * from  max_sal;
-- 7. Level 5 — Multiple CTEs (Questions 41–50) Ab TechNova ka senior analyst complex reports banata hai.
--  Ek query mein multiple CTEs use karne hain.
-- 41. Ek CTE mein high-salary employees aur doosre CTE mein experienced employees nikalo. 
-- Dono conditions satisfy karne wale employees show karo: salary ₹ 40,000 se zyada aur experience 3 years se zyada.
 with high_salary as(
 select employee_name,salary,experience_years
 from employees
 where salary > 40000 ),
 experience_employees as(
 select employee_name,salary,experience_years
 from high_salary
 where experience_years > 3
 )
  select* from  experience_employees ;
  
-- 42. Ek CTE mein department-wise average salary aur doosre mein department-wise employee count nikalo. 
-- Dono ko combine karke report banao.
with department_avg as(
 select department_id, avg(salary ) as avg_salary
 from employees 
 group by department_id
 ), 
 emp_count as(
 (select department_id,count(*) as emp_count
 from employees 
 group by department_id))
 select* from  emp_count;

--  43. Ek CTE mein city-wise average salary aur doosre mein city-wise employee count nikalo.
-- Dono results ko combine karo.
 with city_avg_salary as(
 select city, avg(salary ) as city_avg_salary
 from employees 
 group by city
 ),
 emp_count as(
 (select city,count(*) as emp_count
 from employees 
 group by city))
 select* from  emp_count;
-- 44. Ek CTE mein department-wise maximum salary nikalo aur doosre mein minimum salary.
-- Har department ki dono values show karo.
 with department_max as(
 select department_id, max(salary) as max_salary,
 min(salary) as min_salary
 from employees 
 group by department_id
 )
 select * from  department_max;
-- 45. Ek CTE mein IT employees aur doosre mein HR employees nikalo.
--  Dono departments ke employees ko ek result mein combine karo.
with it_hr_dep_emp as(
 select e.*,d.department_name
 from employees e 
 join departments d on e.department_id=d.department_id
 where  e.department_id between 1 and 2)
 select * from it_hr_dep_emp;
-- 46. Ek CTE mein company ki average salary aur doosre mein high-salary employees nikalo.
-- High-salary employees ke saath company average bhi show karo.
 with high_salary as(
 select employee_name
 from employees 
 where salary > (select avg(salary) from employees)
 )
 select*,(select avg(salary) from employees) as comp_avg_sal from  high_salary;
 
-- 47. Ek CTE mein department-wise average salary nikalo.
 -- Doosre CTE mein un departments ko filter karo jinki average salary ₹ 40,000 se zyada hai.
 -- Final report mein department name aur average salary show karo. 
 with dept_avg_sal as(
 select 
          department_name,
          avg(salary)as avg_sal
 from employees 
 join departments  
 on employees.department_id = departments.department_id
 group by departments. department_name
 ),
 final_deppartment_report as( 
 select 
  department_name,
  avg_sal 
 from dept_avg_sal 
 where avg_sal > 40000
 )
 select department_name,avg_sal  from final_deppartment_report; 
 
 
 -- 48. Ek CTE mein 3 years ya zyada experience wale employees nikalo.
 -- Doosre CTE mein un departments ka employee count nikalo.
 -- Experienced employees aur department count ko combine karke report banao.
  with experience_years_employees as(
 select 
		employee_name,
	    salary,
		experience_years,
		department_id
 from employees
 where experience_years> 3
 )
,dept_emp_count as(
 select 
         experience_years, 
         count(*) as emp_count
         from experience_years_employees
         group by experience_years
 )
 select * from dept_emp_count;
 -- 49. Ek CTE mein salary ranking ke liye DENSE_RANK() use karo.
 -- Doosre CTE mein top 2 salary ranks wale employees filter karo.
 
 
 -- 50. Teen CTEs banao: department-wise average salary, department-wise employee count aur department-wise maximum salary.
 -- Final report mein department name, average salary, employee count aur maximum salary show karo.
 
 with department_avg_sal as(
 select 
      department_id, avg(salary) as avg_salary
 from employees 
 group by department_id
 ), 
 dept_emp_count as(
 select 
        department_id,count(*) as emp_count
 from employees 
 group by department_id
 ),
 department_max_sal as(
 select 
        department_id, max(salary) as max_salary
 from employees 
 group by department_id
 )
 select m.department_id,
		a.avg_salary,
        c.emp_count,
        m.max_salary
        from department_max_sal m
        left join department_avg_sal a
        on m.department_id=a.department_id
        left join dept_emp_count c on m.department_id=c.department_id;
 
-- Level 6 — CTE + JOIN + Filtering (Questions 51–60)
-- TechNova ka HR manager ab employee records ko department details ke saath combine karke reports banana chahta hai.
                      -- 51. --
-- 51. Ek CTE banao jisme salary ₹35,000 se zyada wale employees hon.
 -- Final result mein employee name, salary aur department name show karo.
with high_sal_emp as(
select employee_name, salary,department_name
from employees   
inner join departments  
on employees.department_id = departments.department_id
where salary > 35000
group by 
        employee_name, 
       salary,
       department_name      
)
select * from high_sal_emp;
      
-- 52. Ek CTE mein 3 years ya usse zyada experience wale employees nikalo. 
-- Unke naam, experience aur department name show karo.
with experience_emp as(
select employee_name, experience_years,department_name
from employees   
inner join departments  
on employees.department_id = departments.department_id
where experience_years> 3
group by 
        employee_name, 
       experience_years,
       department_name      
)
select * from experience_emp;
-- 53. Ek CTE mein Indore ke employees nikalo. 
-- Final result mein unka naam, salary aur department name show karo.
with indore_emp as(
select employee_name, salary,department_name
from employees   
inner join departments  
on employees.department_id = departments.department_id
where city ="indore"
group by 
        employee_name, salary, department_name      
)
select * from indore_emp;
-- 54. Ek CTE mein department-wise average salary calculate karo. 
-- Final result mein har employee ki salary aur uske department ki average salary show karo.
 
 with department_avg_sal as(
 select 
      department_id, avg(salary) as avg_salary
 from employees 
 group by department_id
 )
 select e.department_id,
 e.salary as emp_salary,
 d.avg_salary as dept_avg_salary
 from employees  e 
 join department_avg_sal d 
 on e.department_id=d.department_id;
 
-- 55. Ek CTE mein department-wise employee count nikalo. 
-- Sirf un employees ko show karo jo aise departments mein kaam karte hain jahan 3 ya usse zyada employees hain.
with department_emp_count as(
 select 
      department_id, count(*) as emp_count
 from employees 
  group by department_id
 )
  select department_id,emp_count from department_emp_count where emp_count >=3 ;
 
-- 56. Ek CTE mein department-wise maximum salary nikalo. 
-- Employee name, department name aur maximum salary show karo.
with department_max_sal as(
 select 
	department_id, max(salary) as max_salary
from employees   
group by  department_id
 )
 select e.employee_name, d.department_name,m.max_salary 
 from employees e 
 join departments  d
on e.department_id = d.department_id
 join department_max_sal m
 on e.department_id= m.department_id ;
 
-- 57. Ek CTE mein department-wise average salary nikalo.
 -- Un employees ko show karo jinki salary apne department ki average salary se kam hai.
with dept_avg_sal as(
select department_id, avg(salary) as avg_salary
 from employees 
 group by department_id
 )
 select e.employee_name,e.salary ,d.avg_salary
 from employees e
 join dept_avg_sal d
 on e.department_id=d.department_id
 where e.salary<d.avg_salary;
-- 58. Ek CTE mein har department ki total salary calculate karo. 
-- Final result mein department name aur total salary descending order mein show karo.
with dept_total_sal as(
select d.department_id,d.department_name, sum(salary) as total_salary
 from employees e
 join departments d
 on e.department_id=d.department_id
 group by department_id
 order by sum(salary) desc
 )
 select * from dept_total_sal;
-- 59. Ek CTE mein Nagpur ke employees nikalo aur unhe departments table ke 
-- saath JOIN karke department-wise employee details show karo.
with  nagpur_employees as(
 select *
 from employees 
  where city ='nagpur'
 )
 select * from nagpur_employees n
 join departments d
 on n.department_id=d.department_id;

-- 60. Ek CTE mein un departments ko nikalo jahan average salary ₹40,000 se zyada hai.
 -- Final result mein un departments ke sabhi employees show karo.
 with dept_avg_sal as( 
 select   department_id,avg(salary)avg_sal 
 from employees
 group by department_id
 having avg(salary) > 40000
 )
 select employee_id,employee_name,d.department_id,das.avg_sal 
 from dept_avg_sal das
 join departments d
 on das.department_id=d.department_id
 join employees e 
 on e.department_id=d.department_id;
-- Level 7 — CTE + GROUP BY + HAVING (Questions 61–70)
-- Ab company ko department-wise aur city-wise performance reports banani hain.

-- 61. Ek CTE ki help se un departments ko find karo jahan total salary ₹1,00,000 se zyada hai.
with total_sal as(
select d.department_id,sum(salary) as total_salary
from employees e
left join departments d
on e.department_id=d.department_id
group by d.department_id
having sum(salary)>100000
)
select* from total_sal;

-- 62. Ek CTE mein department-wise employee count nikalo. 
-- Sirf un departments ko show karo jahan 2 se zyada employees hain.

with department_emp_count as(
 select 
      department_id, count(*) as emp_count
 from employees 
  group by department_id
  having emp_count >2
 )
  select department_id,emp_count from department_emp_count ;
-- 63. Ek CTE mein city-wise average salary calculate karo. 
-- Sirf un cities ko show karo jahan average salary ₹40,000 se zyada hai.
with city_avg_sal as(
 select 
      city, avg(salary) as avg_sal
 from employees 
  group by city
  having avg_sal > 40000
 )
 select * from city_avg_sal ;
-- 64. Ek CTE mein department-wise total salary aur employee count calculate karo. 
-- Sirf un departments ko show karo jahan total salary ₹1,00,000 se zyada aur employee count 2 se zyada hai.
with total_sal as(
select 
	d.department_id,
    sum(salary) as total_salary,
    count(*) as emp_count
from employees e
left join departments d
on e.department_id = d.department_id
group by d.department_id
having sum(salary)>100000 
and emp_count >2
)
select* from total_sal;

-- 65. Ek CTE mein har department ka average experience calculate karo. 
-- Departments ko average experience ke descending order mein show karo.
with dept_avg_exp as(
 select 
      department_id, avg(experience_years) as avg_experience_years
 from employees 
  group by department_id
  order by  avg(experience_years) desc
 )
 select* from dept_avg_exp;
-- 66. Ek CTE mein city-wise maximum salary calculate karo. Har city ki maximum salary show karo.
with city_max_sal as(
 select 
	city, max(salary) as max_salary
from employees e  
group by  city
 )
 select* from city_max_sal;
-- 67. Ek CTE mein department-wise minimum aur maximum salary calculate karo. 
-- Final result mein salary difference bhi show karo.
with department_diff_sal as(
 select 
	department_id, min(salary) as min_salary,
    max(salary) as max_salary
from employees   
group by  department_id
 ) 
 select department_id,abs(min_salary-max_salary) as salary_difference
 from department_diff_sal;
-- 68. Ek CTE mein city-wise employee count nikalo. 
-- Sirf un cities ko show karo jahan kam se kam 4 employees hain.
with city_emp as(
select 
	    city,count(*) as emp_count
from employees 
group by city
having  count(*)  <= 4
)
select* from city_emp;

-- 69. Ek CTE mein department-wise average salary aur average experience calculate karo.
 -- Sirf un departments ko show karo jahan average salary ₹35,000 se zyada aur average experience 3 years se zyada hai.
with dept_avg_sal_exp as(
 select 
      department_id, avg(salary) as avg_sal,
      avg(experience_years) as avg_experience_years
 from employees 
  group by department_id
  having  avg(salary) > 35000
   and avg(experience_years) > 3
 )
 select* from dept_avg_sal_exp;
-- 70. Ek CTE mein department-wise total salary calculate karo. 
-- Departments ko total salary ke basis par descending order mein rank karo.
 with dept_total as(
 select 
     department_id,
      sum(salary) as total_sal 
 from employees 
 group by department_id
 order by sum(salary) desc
 )
 select * from dept_total;
 
-- Level 8 — Advanced CTE + Subquery Logic (Questions 71–80)
-- Ab senior data analyst ko aisi reports chahiye jahan ek result doosre result par depend karta hai.

-- 71. Ek CTE mein company ki average salary calculate karo. 
-- Doosre CTE mein un employees ko nikalo jinki salary company average se zyada hai.
-- Final result mein employee name, salary aur department name show karo.
with  company_avg as (
    select 
			avg(salary) as avg_sal 
	from employees
),
above_avg_sal as (
select 
      e.employee_id,
      e.employee_name,
      e.salary,
      e.department_id
from employees e
 join company_avg ca
where e.salary>ca.avg_sal
)
select 
       aae.employee_id,
       aae.employee_name,
       aae.salary,
	   d.department_name
from above_avg_sal aae
left join departments d
on aae.department_id = d.department_id;

-- 72. Ek CTE mein department-wise average salary nikalo. 
-- Doosre CTE mein un employees ko find karo jinki salary apne department ki average salary se zyada hai.
with dept_avg_sal as( 
 select  
      department_id,
      avg(salary) as avg_sal 
 from employees e
 group by department_id
 ),
avg_sal_emp as(
select * from employees e
where salary >
(select avg_sal  from  dept_avg_sal das
where das.department_id=e.department_id )
)
select 
       ase.employee_id,
       ase.employee_name,
       ase.salary,
	   d.department_name
from avg_sal_emp ase
left join departments d
on ase.department_id = d.department_id;
 
-- 73. Ek CTE mein company ki second-highest distinct salary find karo.
 -- Doosre CTE mein us salary ko earn karne wale sabhi employees show karo.
with com_salary as(
select distinct salary 
from employees 
order by salary desc limit 2
),
second_highest as(
select salary
from com_salary
order by salary asc limit 1
)
select * from employees  
where salary = (select * from second_highest);
-- 74. DENSE_RANK() ka use karke employees ko salary ke basis par rank do. 
-- CTE ki help se third-highest distinct salary wale employees find karo.

-- 75. Ek CTE mein department-wise maximum salary nikalo. 
-- Doosre CTE mein un employees ko show karo jo apne department ke highest-paid employees hain.
with dept_max_sal as(
select department_id,
 max(salary) as max_salary
 from employees 
 group by department_id
 ),
 highest_paid_emp as (
 (select e.employee_name,e.salary,e.department_id
from employees e 
join dept_max_sal dms
on e.department_id=dms.department_id
and e.salary=dms.max_salary)
)
 (select  hpe.employee_name,hpe.salary,d.department_name
 from highest_paid_emp hpe
 left join  departments d
 on hpe.department_id=d.department_id);
-- 76. Ek CTE mein department-wise average salary calculate karo. 
-- Doosre CTE mein un departments ko filter karo jinki average salary company ki average salary se kam hai.
with dept_avg_sal as( 
 select  
      department_id,
      avg(salary) as avg_sal 
 from employees e
 group by department_id
 ),
comp_avg_sal_ as(
select * from employees e
where salary <
(select avg_sal  from  dept_avg_sal das
where das.department_id=e.department_id )
)
select 
       cas.employee_id,
       cas.employee_name,
       cas.salary,
	   d.department_name
from comp_avg_sal_ cas
left join departments d
on cas.department_id = d.department_id;
 
-- 77. Teen CTEs banao:
-- Pehla: department-wise average salary.
-- Doosra: department-wise maximum salary.
-- Teesra: department-wise employee count.
 --  Final report mein department name, average salary, 
  --  maximum salary aur employee count show karo.
with dept_avg_sal as( 
 select  
      department_id,
      avg(salary) as avg_sal 
 from employees e
 group by department_id
 ),
dept_max_sal as(
select department_id,
 max(salary) as max_salary
 from employees 
 group by department_id
 ),
  department_emp_count as(
 select 
      department_id, count(employee_id) as emp_count
 from employees 
  group by department_id
 )
  select 
  d.department_name,
  a.avg_sal,
  m.max_salary,
  c.emp_count 
  from departments d 
  left join dept_avg_sal a
  on d.department_id=a.department_id
  left join dept_max_sal m
  on d.department_id=m.department_id
  left join department_emp_count c
  on d.department_id=c.department_id;
  
-- 78. Ek CTE mein employees ko experience ke basis par classify karo:
-- - 5 ya zyada years: Senior
-- - 3–4 years: Mid-Level
-- - 0–2 years: Junior
 --   Final result mein employee name,experience aur category show karo.
with classified_emp as(
 select employee_id,employee_name,experience_years,
    case 
    when experience_years >=5 then "senior"
    when experience_years between 3 and 4 then "mid-level"
    when experience_years between 0 and 2  then "junior"
    end as category 
 from employees 
 )
  select employee_id,employee_name,experience_years,category from classified_emp;
-- 79. Ek CTE mein har department ke employees ki salary ko DENSE_RANK() se rank karo.
 -- Final result mein har department ke top 2 salary ranks wale employees show karo.

-- 80. Ek CTE mein city-wise average salary nikalo aur doosre CTE mein company ki overall average salary calculate karo.
 -- Final result mein sirf un cities ko show karo jinki average salary company average se zyada hai.-
 with comp_overall_avg as (
 select 
  avg(salary)  as comp_avg_sal
 from employees
  ),
  city_avg_sal as(
 select 
	city, avg(salary) as city_avg_salary
from employees e  
group by  city
 ) 
  select city,city_avg_salary from city_avg_sal
  where city_avg_salary>(select comp_avg_sal from comp_overall_avg) ;
             -- CTES FILE COMPLETE --
