-- aggregate
create database aggregate_; 
use  aggregate_; 
-- module 1- student registration  
create table agri_stud(
stud_id int primary key,
stud_name varchar(50) unique not null,
stud_city varchar(50) not null,
stud_marks int,
stud_fees decimal(10,2)
);   
insert into agri_stud value (1,"amit","nagpur",85,12000),
(2,"aman","bhopal",90,15000),
(3,"neha","indore",45,20000),
(4,"sneha","nagpur",50,13000),
(5,"rahul","bhopal",60,18000),
(6,"rohit","indore",70,16000);
--  QURERY QUESTIONS -
select *  from  agri_stud;
select *  from  agri_stud  where stud_city ="nagpur" ;
select *  from  agri_stud  where stud_city between "bhopal" and "indore";
select *  from  agri_stud  where stud_marks>80 ;
select *  from  agri_stud  where stud_name like  "a%" ;
              
              -- module 2 - course management
create table agri_course(
course_id int primary key,
course_name varchar(50) unique not null,
course_duration varchar(50) not null,
course_fees decimal(10,2)
);                 
 insert into agri_course value (101,"full stack development","3 month",12000), (102,"data analytics","5 month",16000),
 (103,"python programming","6month",18000),
 (104,"mern stack","8 month",20000);
--  QURERY QUESTIONS -
select * from  agri_course;
select * from  agri_course where course_duration= "5 month";
select * from  agri_course where course_fees between 12000 and 20000 ;
select * from  agri_course where course_name in ( "full stack development", "data analytics") ;
select * from  agri_course where course_name  like "%data%";
 -- module 3 - student course reationship
 create table agri_enrolled(
stud_id int,
course_id int, 
primary key(stud_id,course_id),
foreign key (stud_id) references agri_stud (stud_id),
foreign key  (course_id) references agri_course (course_id)
); 
insert into agri_enrolled value (1,104),(1,101),(2,102),(2,103),(4,103),(5,103),(6,104),(3,102),(4,104);
--  QURERY QUESTIONS -
select * from agri_enrolled where course_id=101;
select * from agri_enrolled where course_id between 102 and 104;

 -- module 4 - student performance analysis
 
select sum(stud_marks) from  agri_stud; 
select avg(stud_marks ) from  agri_stud;
select max(stud_marks ) from  agri_stud;
select min(stud_marks ) from  agri_stud;
select * from  agri_stud where stud_marks>80; 
select * from  agri_stud where stud_marks between 70 and 80; 
select * from  agri_stud where stud_marks  in (75,80,90);
select avg(stud_marks ) from  agri_stud where stud_city ="nagpur" ;
select max(stud_marks ) from  agri_stud where stud_city ="bhopal" ;

 -- module 5 - fees management-- 
select sum(stud_fees) from  agri_stud; 
select avg(stud_fees) from  agri_stud; 
select *  from  agri_stud  where stud_fees>12000 ;
select *  from  agri_stud  where stud_fees in (10000,12000,15000);
select *  from  agri_stud  where stud_fees between  10000 and 15000;
select sum(stud_fees) from  agri_stud  where stud_fees =15000 ; 
-- module 6 - final management report
select *  from  agri_stud  where stud_name like  "a%" ;
select *  from  agri_stud  where stud_name like  "%ri%" ;
select *  from  agri_stud  where stud_city between "bhopal" and "nagpur" and stud_marks>75;
select sum(stud_fees ) from  agri_stud where stud_city ="indore" ;
select avg(stud_marks ) from  agri_stud where stud_marks>80 ;
select min(stud_marks)  from  agri_stud  where stud_city between "bhopal" and "nagpur";
select sum(stud_fees ) from  agri_stud where stud_marks between 70 and 95;
select sum(stud_fees ), avg(stud_marks ) from  agri_stud  where stud_city in ("nagpur","bhopal","indore") 
and stud_marks between 70 and 95 and  stud_fees between  10000 and 15000;
              -- AGRIGATE FILE COMPLETE ---
              -- aggregate 2.0 nd sheet --
              -- MODULE -1 PATIENT REGISTRATION --
create table agri_patient(
patient_id int primary key,
patient_name varchar(50) unique not null,
patient_city varchar(50) not null,
stud_marks int,
patient_fees decimal(10,2)
); 
drop table  agri_patient; 
insert into agri_patient value(1,"amit","nagpur",85,12000),
(2,"aman","bhopal",90,15000),
(3,"neha","indore",45,20000),
(4,"sneha","nagpur",50,13000),
(5,"rahul","bhopal",60,18000),
(6,"rohit","indore",70,16000); 
--  QURERY QUESTIONS -
select * from agri_patient;
select *  from  agri_patient  where patient_city ="nagpur" ;
select *  from  agri_patient  where patient_city between "bhopal" and "indore";
select *  from  agri_patient  where stud_marks>80 ;
select *  from  agri_patient  where patient_name like  "a%" ;
-- module 2 - DEPARTMENT management--
create table agri_deparment(
deparment_id int primary key,
deparment_name varchar(50) unique not null,
deparment_duration varchar(50) not null,
treatment_fees decimal(10,2)
);     
drop table  agri_deparment;            
 insert into agri_deparment value (101,"general medicine","3 month",12000), (102,"cardiology","5 month",16000),
 (103,"neurology","6month",18000),
 (104,"data analytics deparment ","8 month",20000);
--  QURERY QUESTIONS -
select * from  agri_deparment;
select * from  agri_deparment where deparment_duration= "5 month";
select * from  agri_deparment where treatment_fees between 12000 and 20000 ;
select * from  agri_deparment where deparment_name in ( "general medicine", "cardiology") ;
select * from  agri_deparment where deparment_name  like "%data%";
 -- module 3 - patient -deparment- reationship ---
 create table agri_patient_enrolled(
patient_id int,
deparment_id int, 
primary key(patient_id,deparment_id),
foreign key (patient_id) references agri_patient (patient_id),
foreign key  (deparment_id) references agri_deparment (deparment_id)
); 
 select * from  agri_patient_enrolled;
insert into agri_patient_enrolled value (1,104),(1,101),(2,102),(2,103),(4,103),(5,103),(6,104),(3,102),(4,104);
--  QURERY QUESTIONS -
select * from agri_patient_enrolled where deparment_id=101;
select * from agri_patient_enrolled where deparment_id between 102 and 104;
 -- module 4 - patient performance analysis --
select sum(stud_marks) from  agri_patient; 
select avg(stud_marks ) from  agri_patient;
select max(stud_marks ) from  agri_patient;
select min(stud_marks ) from  agri_patient;
select * from  agri_patient where stud_marks>80; 
select * from  agri_patient where stud_marks between 70 and 80; 
select * from  agri_patient where stud_marks  in (75,80,90);
select avg(stud_marks ) from  agri_patient where patient_city ="nagpur" ;
select max(stud_marks ) from  agri_patient where patient_city ="bhopal" ;

 -- module 5 - fees management --
select sum(patient_fees) from  agri_patient; 
select avg(patient_fees) from  agri_patient; 
select *  from  agri_patient  where patient_fees>12000 ;
select *  from  agri_patient  where patient_fees in (10000,12000,15000);
select *  from  agri_patient  where patient_fees between  10000 and 15000;
select sum(patient_fees) from  agri_patient  where patient_fees =15000 ; 
-- module 6 - final management report --
select *  from  agri_patient  where patient_name like  "a%" ;
select *  from  agri_patient  where patient_name like  "%ri%" ;
select *  from  agri_patient  where patient_city between "bhopal" and "nagpur" and stud_marks>75;
select sum(patient_fees ) from  agri_patient where patient_city ="indore" ;
select avg(stud_marks ) from  agri_patient where stud_marks>80 ;
select min(stud_marks)  from  agri_patient  where patient_city between "bhopal" and "nagpur";
select sum(patient_fees ) from  agri_patient where stud_marks between 70 and 95;
select sum(patient_fees ), avg(stud_marks ) from  agri_patient  where patient_city in ("nagpur","bhopal","indore") 
and stud_marks between 70 and 95 and  patient_fees between  10000 and 15000;
             -- AGREGATE 2.O FILE COMPALETE --
             
                              -- GROUP BY- HAVING --
-- module -01 QUICKMART ONLINE STORE -- 

create database quickmart;
use quickmart;
create table mart(
order_id int primary key,
customer_name varchar(50) not null,
customer_city  varchar(50) not null,
customer_product  varchar(50) not null,
customer_category  varchar(50) not null,
customer_quantity int not null,
customer_sales  int not null,
customer_price int not null,
customer_payment_mode varchar(50) not null
);
drop table mart;
insert into mart value(1,"rahul","pandhurna","laptop","electronics",50,999,2000,"upi"),
(2,"rohit","pandhurna","tv","electronics",55,888,25000,"cash"),
(3,"rohan","bhuli","table","furniture",50,777,5000,"credit card"),
(4,"aman","bhuli","chair","furniture",45,666,50000,"debit card"),
(5,"amit","nagpur","sunshicreem","beauty",40,555,55000,"net banking"),
(6,"priya","nagpur","makekup kit","beauty",35,444,3000,"upi"),
(7,"neha","kanpur","rice","grocery",30,333,4000,"cash"),
(8,"sneha","raypur","wheat","grocery",25,222,45000,"credit card"),
(9,"nisha","raypur","jeans","clothing",20,111,5000,"debit card"),
(10,"madhu","pandhurna","tshirt","clothing",10,99,40000,"net banking");
select * from mart;
-- MODULE -1 OVERALL SALES ANALYSIS --
select count(order_id) from mart ;
select customer_product, count(customer_product) from mart group by customer_product;
select sum(customer_price) from mart group by customer_price;
select avg(customer_price) from mart group by customer_price;
select max(customer_price) from mart group by customer_price;
select min(customer_price) from mart group by customer_price;
select sum(customer_sales) , sum(customer_quantity) from mart group by customer_sales,customer_quantity;
select  avg(customer_sales),max(customer_sales) from mart;
select sum(customer_quantity),avg(customer_quantity) from mart;
select sum(customer_sales), avg(customer_sales),max(customer_sales),min(customer_sales) from mart;
-- Module -2 -CITY WISE SALES ANALSIS--
select count(customer_city) from mart group by customer_city;
select customer_city,count(customer_product) from mart group by customer_product,customer_city;
select customer_city, sum(customer_sales) from mart group by customer_city,customer_sales;
select customer_city, avg(customer_sales) from mart group by customer_city,customer_sales;
select customer_city, max(customer_sales) from mart group by customer_city,customer_sales;
select customer_city, min(customer_sales) from mart group by customer_city,customer_sales;
select customer_city, sum(order_id),sum(customer_quantity),sum(customer_sales) from mart 
group by order_id,customer_quantity,customer_sales;
select avg(customer_city),max(customer_city),min(customer_city) from mart group by customer_city;
select customer_city, count(*) from mart group by customer_city having count(*)>2;
select sum(customer_sales) from mart group by customer_sales having sum(customer_sales)>555;

                  -- HAVING + UPDATE NEW --
     -- module -11 HOSPITAL PATIENT ANALYSIS ---
create database hospital_;
use hospital_;
create table P_(
P_id int primary key,
P_name varchar(50) not null,
P_dep varchar(50) not null,
P_dr varchar(50) not null,
P_treatment varchar(50) not null,
P_age int not null,
P_treatment_cost int not null,
P_pay_mode varchar(50) not null
);
insert into P_ value (101,"rahul","cardiology","dr_ankit","mri",20,1000,"upi"),
(102,"rohan","neurology","dr_pawar","mri",18,1500,"cash"),
(103,"amit","gynecology","dr_sirt","mri",25,1000,"credit card"),
(104,"aman","oethopedics","dr_aayush","mri",30,1200,"debit card"),
(105,"priya","cardiology","dr_ankit","mri",40,1400,"net banking"),
(106,"sneha","neurology","dr_pawar","mri",50,1500,"upi"),
(107,"neha","gynecology","dr_sirt","mri",55,1600,"cash"),
(108,"raj","oethopedics","dr_aayush","mri",45,2000,"cash"),
(109,"rohit","cardiology","dr_ruhani","mri",35,1900,"credit card"),
(110,"nisha","neurology","dr_suraj","mri",38,1800,"debit card"),
(111,"yogi","gynecology","dr_radhika","mri",52,1600,"net banking"),
(112,"madhu","oethopedics","dr_piyush","mri",42,1500,"upi"),
(113,"sakshi","cardiology","dr_ruhani","mri",32,1200,"cash"),
(114,"aman","neurology","dr_suraj","mri",22,1000,"cash"),
(115,"amit","gynecology","dr_radhika","mri",27,800,"upi"),
(116,"pratik","oethopedics","dr_piyush","mri",29,1000,"net banking");
select * from P_;
select count(P_id) from P_ group by P_id ;
select count(P_treatment) from P_ group by P_treatment ;
select avg(P_treatment) from P_ group by P_treatment ;
select P_treatment_cost,max(P_treatment_cost) from P_ group by P_treatment_cost ;-- dout
select P_treatment_cost,min(P_treatment_cost) from P_ group by P_treatment_cost ;-- dout
select P_id,count(P_id) from P_ group by P_id ;
select P_treatment_cost,avg(P_treatment_cost) from P_ group by P_treatment_cost ;-- dout
select P_dep,sum(P_id) from P_ group by P_dep;
select P_dep,count(P_treatment) from P_ group by P_dep;
select P_dep,avg(P_treatment_cost) from P_ group by P_dep;
select P_dep,max(P_treatment_cost) from P_ group by P_dep;
select P_dep,min(P_treatment_cost) from P_ group by P_dep;
select P_dr,count(P_id) from P_ group by P_dr;
select P_dr,count(P_treatment) from P_ group by P_dr;
select P_dr,count(P_treatment) from P_ group by P_dr having count(P_treatment)>1;
select P_dep,sum(P_treatment_cost) from P_ group by P_dep 
having sum(P_treatment_cost)>1000;
select P_dep,avg(P_treatment_cost) from P_ group by P_dep 
having avg(P_treatment_cost)>1000;
select P_dr,avg(P_treatment_cost) from P_ group by P_dr
having avg(P_treatment_cost)>1400;

select P_dep, sum(P_treatment_cost) from P_ where P_pay_mode = 'cash' group by P_dep;

select P_dep, sum(P_treatment_cost) from P_ group by P_dep;
select city, sum(P_treatment_cost) from P_ where P_pay_mode = 'upi' group by city;
alter table P_ add city varchar(50);
update P_ set city = 'pandhurna' where P_id in (114,115,116);
select * from P_;
select P_dep, avg(P_treatment_cost) from P_  group by P_dep having avg(P_treatment_cost)>1400 ;
select city, count(P_id) from P_ where P_age>40 group by city;

select count(P_dep), count(P_id),avg(P_treatment_cost),max(P_treatment_cost),min(P_treatment_cost) 
from P_ where P_treatment_cost between 5000 and 20000 and P_pay_mode = "upi" or "credit card"  
group by P_dep ;
alter table P_ add city varchar(50);
update P_ set P_treatment_cost = 5000 where P_id in (103,106,109);
select * from P_;
-- Module -12 SCHOOL STUDENT PERFORMANCE ANALYSIS --
create table stud(
s_id int primary key,
s_name varchar (50),
s_city varchar (50),
s_class varchar (50),
s_sect varchar (50),
s_sub varchar (50),
s_marks int,
s_att varchar (50), 
s_exam varchar (50)
);
insert into stud value (1,"rahul","pandhurna","12th","a_sect","bio",50,"70%","regular"),
(2,"rohan","pandhurna","12th","a_sect","bio",60,"75%","regular"),
(3,"rohit","pandhurna","12th","a_sect","bio",75,"60%","regular"),
(4,"aman","pandhurna","12th","a_sect","bio",80,"80%","regular"),
(5,"amit","pandhurna","12th","a_sect","bio",85,"90%","regular"),
(6,"ajay","pandhurna","12th","a_sect","bio",90,"70%","regular"),
(7,"aakash","pandhurna","12th","a_sect","bio",95,"78%","regular"),
(8,"vikash","pandhurna","12th","a_sect","bio",92,"80%","regular"),
(9,"vijay","pandhurna","12th","a_sect","bio",88,"60%","regular"),
(10,"vihan","pandhurna","12th","b_sect","bio",72,"74%","regular"),
(11,"priya","pandhurna","12th","b_sect","maths",60,"70%","regular"),
(12,"aditi","pandhurna","12th","b_sect","maths",50,"80%","regular"),
(13,"aaru","pandhurna","12th","b_sect","maths",65,"90%","regular"),
(14,"aarti","pandhurna","12th","b_sect","maths",70,"75%","regular"),
(15,"yogi","pandhurna","12th","b_sect","maths",80,"88%","regular"),
(16,"nisha","pandhurna","12th","b_sect","maths",75,"60%","regular"),
(17,"nidhi","pandhurna","12th","b_sect","maths",85,"70%","regular"),
(18,"ruhi","pandhurna","12th","b_sect","maths",90,"88%","regular"),
(19,"wani","pandhurna","12th","b_sect","maths",93,"65%","regular"),
(20,"rani","pandhurna","12th","b_sect","maths",74,"78%","regular");
select * from stud ;
select count(s_id) from stud group by s_id;
select sum(s_marks) from stud group by s_marks;
select avg(s_marks) from stud group by s_marks;
select max(s_class) from stud group by s_class;
select min(s_class) from stud group by s_class;
select s_sect,count(s_sect) from stud group by s_sect;
select s_sect,sum(s_marks) from stud group by s_sect;
select s_sect,avg(s_marks) from stud group by s_sect;
update stud set s_exam = "appear"  where s_id in (3,6,19,20);
select * from stud;
select count(s_sub) from stud group by s_sub;
select avg(s_sub) from stud group by s_sub;
select max(s_sub) from stud group by s_sub;
select min(s_sub) from stud group by s_sub;
select count(s_class) from stud group by s_class having s_class>11 ;
select s_sub , avg(s_marks) from stud group by s_sub having avg(s_marks) >70 ;
select s_sub , avg(s_marks) from stud group by s_sub having avg(s_marks) < 60 ;
select s_class , max(s_marks) from stud group by s_class having max(s_marks) >90 ;
select s_class,s_marks, count(s_class) , max(s_marks) from stud group by s_class ,s_marks having count(s_class)and max(s_marks) >50 ;
select s_class,s_att ,avg(s_class) , max(s_att) from stud group by s_class,s_att having max(s_att) >"75% ";
select s_id,avg(s_marks) from stud where s_sub="maths" group by s_id ;
select s_sub,sum(s_marks) from stud  group by s_sub,s_marks having sum(s_marks) ;
select s_sub,sum(s_marks) from stud where s_sub= "maths" or s_sub= "bio" group by s_sub ;
select s_id,count(s_id),avg(s_marks) from stud group by s_id,s_marks having count(s_id)>9 or avg(s_marks)>70;
select s_marks,s_sub  from stud where s_marks in (60,100)and s_sub= "maths" or s_sub= "bio" group by s_sub,s_marks ;
select s_id,s_marks,s_att, count( s_id),avg(s_marks), max(s_marks), min(s_marks),sum(s_att) from stud
where s_sub in ("maths" ,"bio")and s_marks between 60 and 100
group by s_id,s_marks,s_att 
having count( s_id)>10 and avg(s_marks)>70  or sum(s_att)>75;
-- Module - 13 bank analysis
create table abc_bank(
t_id int primary key,
c_name varchar(50),
city varchar(50),
a_t varchar(50),
t_t varchar(50),
amount int,
pay_mode varchar(50),
branch varchar(50)
);
insert into abc_bank value(91,"rahul","pandhurna","saving","deposit",1050000,"upi","pandhurna"),
(92,"rohan","pandhurna","currunt","deposit",2500,"card","pandhurna"),
(93,"rohit","pandhurna","saving","wd",5000000,"upi","pandhurna"),
(94,"ruhi","pandhurna","currunt","wd",60000,"card","pandhurna"),
(95,"aman","pandhurna","saving","deposit",70000,"upi","pandhurna"),
(96,"amit","pandhurna","currunt","wd",80000,"card","pandhurna"),
(97,"aaru","pandhurna","saving","wd",1050000,"upi","pandhurna"),
(98,"priya","pandhurna","currunt","deposit",1010000,"card","pandhurna"),
(99,"sneha","pandhurna","saving","wd",25000,"upi","pandhurna"),
(100,"vikash","pandhurna","currunt","wd",4500,"card","pandhurna");
select * from abc_bank;
select t_id,count(t_id) from abc_bank group by t_id;
select amount  ,count(amount)from abc_bank group by amount; 
select amount  ,avg(amount)from abc_bank group by amount; 
select amount  ,max(amount)from abc_bank group by amount; 
select amount  ,min(amount)from abc_bank group by amount; 
select city ,count(city)from abc_bank group by city; 
select city ,count(amount)from abc_bank group by city,amount; 
select city ,avg(amount)from abc_bank group by city,amount; 
select branch ,count(t_id)from abc_bank group by branch,t_id; 
select branch ,max(t_id)from abc_bank group by branch,t_id; 
select a_t,count(t_id)from abc_bank group by a_t;
select amount,sum(a_t)from abc_bank group by amount;
select a_t,sum(amount) from abc_bank group by a_t,amount;
select t_t,sum(amount) from abc_bank where t_t in("deposit","wd") group by t_t;
select pay_mode, count(t_id) from abc_bank group by pay_mode; 
select pay_mode, sum(t_id) from abc_bank group by pay_mode;
select branch, count(t_id) from abc_bank group by branch having count(t_id)>5; 
select city, sum(amount) from abc_bank group by city having sum(amount)>100000; 
select t_id, sum(amount) from abc_bank group by t_id having sum(amount)>20000;
 select city, sum(amount) from abc_bank where pay_mode="upi" group by city;
select branch, sum(amount) from abc_bank where t_t="deposit" group by branch;
select a_t,amount,count(t_t) from abc_bank where amount >70000 group by a_t,amount;
select branch,t_id,sum(amount) from abc_bank group by branch,t_id having (t_id)>92 and sum(amount)=5000000;
select branch,count(t_t),sum(amount),avg(amount),max(amount),min(amount) from abc_bank  where amount in (5000,100000) and 
 pay_mode in ("upi","card") group by branch having sum(amount)>1000000;

-- Module -14 vehicle service center
create table service(
s_id int primary key,
c_name varchar (50),
city varchar(50),
v_t varchar (50),
s_t varchar (50),
mechanic varchar (50),
s_cost int,
pay_m varchar (50)
);

insert into service value (61,"rohan","nagpur","car","business","aayush",2000,"upi"),
(62,"rahul","pandhurna","bike","repair","piyush",3000,"card"),
(63,"rohit","nagpur","car","business","aayush",4000,"upi"),
(64,"ruhani","pandhurna","bike","repair","piyush",10000,"cash"),
(65,"rani","nagpur","car","business","aayush",5000,"card"),
(66,"wani","pune","bike","repair","piyush",2000,"upi"),
(67,"priya","pune","car","business","aayush",5000,"cash"),
(68,"ajay","bhopal","bike","repair","piyush",7000,"card"),
(69,"aman","bhopal","car","business","aayush",8001,"upi"),
(70,"amit","bhopal","bike","repair","piyush",11000,"cash");
 select * from service;
 select s_id, count(s_id) from service group by s_id;
 select s_id, sum(s_id) from service group by s_id;
select  avg(s_cost) from service group by s_cost;
select  max(s_cost) from service group by s_cost;
select  min(s_cost) from service group by s_cost;
select city, count(s_id) from service group by city;
select city, sum(s_id) from service group by city;
select city, avg(s_id) from service group by city;
select v_t, count(s_id) from service group by v_t;
select v_t, sum(s_id) from service group by v_t;
select v_t, avg(s_id) from service group by v_t;
select s_t, count(s_id) from service group by s_t;
select s_t, sum(s_id) from service group by s_t;
select mechanic, count(v_t) from service group by mechanic;
select mechanic, count(s_id) from service group by mechanic;
select mechanic, count(s_id) from service group by mechanic having count(s_id)>4 ;
select s_t,count(s_cost) from service group by s_t having count(s_cost)> 1000;
select v_t ,avg(s_cost) from service group by v_t having avg(s_cost)>3000;
select city,s_cost from service group by city,s_cost having s_cost>2000;
select mechanic,s_id from service group by mechanic,s_id having s_id>5;
select city,count(s_id),sum(s_cost),avg(s_cost),max(s_cost),min(s_cost) from service 
group by city having count(s_id)>2 and sum(s_cost)>5000;
-- HAVING +UPDATE NEW FILE COMPLETE --
-- HAVING +GROUP BY 2.O --
-- Quick bite DELIVERY ANALYSIS 
create table delivery(
O_id int ,
C_N varchar(50),
City varchar(50),
Restaurant varchar(50),
f_category varchar(50),
f_quant int,
O_V int,
pay varchar(50),
O_S varchar(50),
C_AGE int
);
drop table delivery;
insert into delivery value (101,"rahul","pandhurna","meet &eat","pizza",100,1000,"upi","completed",20),
(102,"rohit","bhuli","onelife","burger",20,2000,"card","delivered",21),
(103,"aman","pandhurna","afc","biryani",15,3000,"net banking","completed",22),
(104,"amit","bhuli","kfc","chinese",40,400,"upi","cancelled",40),
(105,"aaru","pandhurna","chaihoush","pizza",50,600,"card","completed",45),
(106,"aditi","bhuli","awosome","burger",60,800,"net banking","delivered",18),
(107,"aanu","pandhurna","elven","biryani",70,900,"upi","completed",25),
(108,"vivek","bhuli","sukun","chinese",80,450,"card","delivered",30),
(109,"vebhav","pandhurna","quick bite","pizza",90,4000,"cash","completed",35),
(110,"aadi","bhuli","momomiya","burger",75,1500,"upi","delivered",28);
insert into delivery value (109,"vebhav","pandhurna","quick bite","burger",50,5000,"cash","completed",35);

select * from delivery;
select count(O_id)  from delivery group by o_id;
select sum(f_quant)  from delivery group by  f_quant;
select sum(O_id)  from delivery group by o_id;
select avg(O_v)  from delivery group by o_v;
select o_id, max(O_v)  from delivery group by o_id;
select o_id, min(O_v)  from delivery group by o_id;
select o_id, O_S  from delivery group by o_id,O_S having O_S="completed";
select o_id, O_S  from delivery group by o_id,O_S having O_S="cancelled";
select o_id, pay  from delivery group by o_id,pay having pay in("upi","card");
select  pay ,avg(o_v) from delivery group by pay,o_v having avg(o_v) in(500,2000);
select City,count(City) from delivery group by City;
select City,sum(f_quant) from delivery group by City;
select City,sum(o_id) from delivery group by City;
select City,avg(o_v) from delivery group by City;
select City,max(o_v) from delivery group by City;
select City,min(o_v) from delivery group by City;
select City,O_S from delivery group by City,O_S having O_S="completed";
select City,pay ,count(O_id) from delivery group by City,pay having  pay in("upi","card");
select City,C_AGE,count(O_id) from delivery where  C_AGE between 20 and 40 group by City,C_AGE;
select City, avg(o_v) from delivery  group by City having avg(o_v)>1000;
select count(f_category) from delivery  group by  f_category;
select f_category,sum(f_quant) from delivery  group by f_category;
select f_category,count(O_id) from delivery  group by  f_category;
select f_category,avg(o_v) from delivery  group by  f_category;
select f_category,avg(o_v) from delivery  group by  f_category having f_category in ("pizza","burger","biryani") ;
select f_category,avg(o_v) from delivery where (o_v) in (1500,2000) group by  f_category;
select f_category,O_S,max(o_v),min(o_v) from delivery group by f_category ,O_S having O_S ="completed"; 
select  f_category,pay,count(f_quant) from delivery group by f_category ,pay having  pay in("upi","card");                                                                                                                                                                                                                  
select  f_category, C_AGE,count(f_quant),avg(o_v) from delivery group by f_category , C_AGE having  C_AGE  in(25,40);                                                                                                                                                                                                                  
select  f_category,count(O_id)from delivery group by f_category having count(O_id) >1;
select City,sum(o_v) from delivery group by City having sum(o_v)>5000 ;
select f_category,avg(o_v) from delivery group by f_category having avg(o_v)>2000 ;
select City,sum(f_quant) from delivery group by City having sum(f_quant)>100 ;
select Restaurant ,count(O_id)from delivery group by Restaurant having count(O_id) >1 ;
select Restaurant ,sum(o_v)from delivery group by Restaurant having sum(o_v) >5000;
select City ,O_S,count(O_id),sum(o_v) ,avg(o_v) from  delivery group by City,O_S
having O_S ="completed" and count(O_id) >1 and sum(o_v)>5000;
select pay,Restaurant,count(O_id),count(f_quant),sum(o_v) from  delivery group by pay,Restaurant 
having  pay in("upi","card")and count(O_id)=1 and sum(o_v)>1000;
select  f_category,count(O_id),avg(o_v),max(o_v) from delivery group by f_category
 having count(O_id)>2 and avg(o_v)>2000;
select City ,count(O_id),avg(o_v)from delivery group by City
 having count(O_id)>2 and avg(o_v)>1500;
select pay, O_S ,count(O_id),sum(o_v),avg(o_v) from delivery group by pay , O_S 
having O_S in ("completed","delivered") and sum(o_v)>2000;
select f_category, City,sum(f_quant),count(O_id) from delivery group by f_category,City
having f_category in ("pizza","burger","biryani") and count(O_id)>2 and sum(f_quant)>25;
select pay,City,avg(o_v) from delivery group by pay,City
having pay in ("upi","card","net banking") and sum(o_v)>2000 and avg(o_v)>1500;
select Restaurant ,O_S,o_v ,count(O_id),max(o_v),min(o_v)  from delivery group by Restaurant ,O_S,o_v
having O_S="completed" and o_v between 500 and 2000 and count(O_id)=1 and o_v>500;
select C_AGE,f_category ,count(O_id),sum(f_quant),count(o_v),avg(o_v)from delivery group by C_AGE,f_category
having C_AGE  in (15,45) and f_category in ("pizza","burger","chinese") and sum(f_quant)>20 and avg(o_v)>500;
select pay,O_S,City,count(O_id),count(o_v),avg(o_v) from delivery group by pay,City,O_S
having pay!="cash" and O_S!="cancelled" and count(O_id)=1 and avg(o_v)>1000;
select O_S,pay,o_v,C_AGE,count(O_id),sum(f_quant),avg(o_v) from delivery group by O_S,pay,o_v,C_AGE
having O_S="completed" and pay in ("upi","card") and o_v in (1000,2000) and C_AGE in (20,40)
 and count(O_id)=1 and sum(f_quant)>25 and avg(o_v)>500;
select Restaurant,f_category,pay,O_S,o_v,count(O_id),count(f_quant),sum(o_v),max(o_v),min(o_v)
from delivery group by Restaurant,f_category,pay,O_S,o_v
having f_category in ("pizza","burger","biryani") and pay in ("upi","card") and o_v in (400,5000) 
and O_S in ("completed","delivered")  and count(O_id)=1 and max(o_v)>500;

select C_AGE,f_quant,City,o_v,pay,O_S,count(O_id),count(f_quant),sum(o_v),avg(o_v) 
from delivery group by C_AGE,f_quant,City,o_v,pay,O_S
having C_AGE in (20,40) and f_quant in (15,50) and o_v in (400,5000) and pay!="cash" and O_S!="cancelled" 
and count(O_id)=1 and count(f_quant)>50 and avg(o_v)>1000; 

select f_category,pay,o_v,f_quant,C_AGE,count(O_id),City
from delivery group by pay,f_category,o_v,f_quant,C_AGE,City
having pay in ("upi","card","net banking") and f_category in ("pizza","burger","biryani","chinese")
and o_v in (400,5000) and f_quant in (15,50) and C_AGE in (20,40) and f_quant in (2,8)  
and pay!="cash" ;
-- HAVING +GROUP BY 2.O  FILE COMPLETE --





