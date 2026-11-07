create database cross_join;
use cross_join;
create table stud(
s_id int ,
s_name varchar (50),
city varchar (50),
status_ varchar (50) default"ACTIVE"	
);
insert into stud value (1,"sita","pandhurna","active"),(2,"rita","nagpur","active"),
(3,"gita","indore","active"),(4,"rahul","pandhurna","active"),(5,"rohit","bhopal","active");
drop table stud;
create table course(
c_id int ,
c_name varchar (50),
fee int,
status_ varchar (50) default"ACTIVE"
);
insert into course value (101,"DA",8000,"ACTIVE"),(102,"python full stack",18000,"ACTIVE"),
(103,"MERN",12000,"ACTIVE"),(104,"UI UX DESIGN",9500,"INACTIVE");
create table TIMINGS(
TIMING_ID INT PRIMARY KEY,
TIMING_NAME varchar(50)
);
insert into TIMINGS value(201,"MORNING"),(202,"AFTERNOON"),(203,"EVENING");
create table trainers(
trainers_id varchar(50),
trainers_name varchar(50),
experience_ varchar(50),
gender varchar(50)
);
insert into trainers value(301,"SURESH KUMAR","4 YEAR","MALE"),(302,"ANAYA SHARMA","2 YEAR","FEMALE"),
(303,"ROHAN","1 YEAR","MALE");
create table rooms(
room_id int primary key,
room_name varchar(50)
);
insert into rooms value(2001,"LAB 1"),(2002,"LAB 2"),(2003,"LAB 3");
create table city(
city_id int primary key,
city_name varchar(50)
);
insert into city value(501,"PANDHURNA"),(502,"NAGPUR"),(503,"INDORE"),(504,"BHOPAL");
select * from stud ;
-- PART -1 STUDENTS & COURSES --
-- O1 -- 
select *
FROM stud
cross JOIN course;
-- O2 -- 
select s.s_id,c.*
FROM stud s
cross JOIN course c;
-- O3 -- 
select COUNT(*)AS TOTAL_COMBINATIONS
FROM stud s
cross JOIN course c;
-- O4 -- 
select s.s_name ,c.c_name
FROM stud s
cross JOIN course c;
-- O5 -- 
select s.*,c.fee
FROM stud s
cross JOIN course c where c.fee>=1000;
-- O6 -- 
select s.*,c.fee
FROM stud s
cross JOIN course c where c.fee between 1000 and 2000;
-- O7 -- 
select s.*,c.c_name
FROM stud s
cross JOIN course c where c.c_name IN ( "AI","MERN");
-- O8 -- 
select c.*,s.s_id,s.s_name
FROM stud s
cross JOIN course c order by s.s_name asc;
-- O9 -- 
select s.*,c.c_name
FROM stud s
cross JOIN course c;
-- 1O -- 
select *
FROM stud s
cross JOIN course c where  s.s_id>=3;
-- PART - 2 STUDENTS & COURSES --
-- 11 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t;
-- 12 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t;
-- 13 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t
WHERE  t.TIMING_NAME ="EVENING";
-- 14 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t
WHERE  t.TIMING_NAME IN ("MORNING","EVENING");
-- 15 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t
order by s.s_name asc;
-- 16 -- 
select s.s_id, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t
where  s.s_id <5;
-- 17 -- 
select s.s_id, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t
where  s.s_id >=5;
-- 18 -- 
SELECT 
    COUNT(*) AS possible_combinations
FROM
    stud s
        CROSS JOIN
    TIMINGS t;
-- 19 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t;
-- 20 -- 
select s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t
where s.s_name like "a%";
-- PART - 3  COURSES & TRAINERS --
-- 21 -- 
select c.c_name,tr.trainers_name
FROM course c
CROSS JOIN trainers tr;
-- 22 -- 
select tr.trainers_name,c.c_name
FROM course c
CROSS JOIN trainers tr;
-- 23 --
select c.c_name,tr.trainers_name
FROM course c
CROSS JOIN trainers tr
where c.c_name="DA";
-- 24 --
select c.c_name,tr.trainers_name
FROM course c
CROSS JOIN trainers tr
where c.c_name="MERN";
-- 25 -- 
select tr.trainers_name,c.c_name
FROM course c
CROSS JOIN trainers tr;
-- 26 -- 
select tr.trainers_name,c.c_name
FROM course c
CROSS JOIN trainers tr
ORDER BY tr.trainers_name ASC;
-- 27 -- 
select c.c_name,tr.trainers_name
FROM course c
CROSS JOIN trainers tr
ORDER BY c.c_name ASC;
-- 28 -- 
select c.c_name,tr.trainers_name
FROM course c
CROSS JOIN trainers tr;
-- 29 -- 
SELECT 
    COUNT(*) AS possible_combinations
FROM course c
CROSS JOIN trainers tr;
-- 30 -- 
select c.c_id,tr.experience_
FROM course c
CROSS JOIN trainers tr
WHERE tr.experience_>=2 ;
-- PART - 4 STUDENTS , COURSES & TIMINGS --
-- 31 --
select s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t;
-- 32 --
select s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
where t.TIMING_NAME="EVENING" ;
-- 33 --
select s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
where c.c_name="DA" ;
-- 34 --
select s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
where c.c_name IN("DA","MERN") 
AND t.TIMING_NAME="MORNING";
-- 35 --
select s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t;
-- 36 --
select count(*) AS TOTAL_COMBINATIONS
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t;
-- 37 --
select s.s_id,s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
where s.s_id<=10 ;
-- 38 --
select s.s_id,s.s_name,c.c_name,t.TIMING_NAME,c.fee 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
where c.fee<=15000 ;
-- 39 -- 
select s.s_id,s.s_name,c.c_name,t.TIMING_NAME,c.fee 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
where t.TIMING_NAME="EVENING" and c.fee between 10000 and 20000 ;
-- 40 -- 
select s.s_name,c.c_name,t.TIMING_NAME 
FROM stud s
CROSS JOIN course c
CROSS JOIN TIMINGS t
order by  s.s_name asc;
-- PART -5 ROOMS & TIMINGS --
-- 41 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t;
-- 42 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t;
-- 43 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
where r.room_name ="LAB 1" ;
-- 44 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
WHERE t.TIMING_NAME ="EVENING";
-- 45 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
WHERE t.TIMING_NAME IN ("EVENING","MORNING");
-- 46 -- 
select count(*) AS TOTAL_COMBINATIONS
FROM rooms r
cross join TIMINGS t;
-- 47 -- 
select r.room_id,r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
order by r.room_id asc;
-- 48 -- 
select t.TIMING_id,r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
order by t.TIMING_id asc;
-- 49 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
where r.room_name in("LAB 1","LAB 2");
-- 50 -- 
select r.room_name,t.TIMING_NAME 
FROM rooms r
cross join TIMINGS t
where t.TIMING_NAME ="AFTERNOON";
-- PART - 6 COURSES & ROOMS --
-- 51-- 
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r; 
-- 52--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r; 
-- 53--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r
WHERE c.c_name="DA";
-- 54--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r
WHERE c.c_name="MERN";
-- 55--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r;
-- 56 --
select c.c_name,r.room_name,c.fee
FROM course c
CROSS JOIN rooms r
WHERE c.fee<=12000;
-- 57--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r
where r.room_name in ("LAB 1","LAB 2")  ;
-- 58--
select count(*) as total_combinations
FROM course c
CROSS JOIN rooms r;
-- 59--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r
order by c.c_name asc;
-- 60--
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r
order by r.room_name asc;
-- PART - 7 TRAINERS & TIMINGS --
-- 61 --
select tr.trainers_name,t.TIMING_NAME 
FROM trainers tr
cross join TIMINGS t;
-- 62 --
select tr.trainers_name,t.TIMING_NAME 
FROM trainers tr
cross join TIMINGS t;
-- 63 --
select tr.trainers_name,t.TIMING_NAME 
FROM trainers tr
cross join TIMINGS t
WHERE t.TIMING_NAME="EVENING";
-- 64 --
select tr.trainers_name,t.TIMING_NAME 
FROM trainers tr
cross join TIMINGS t
WHERE t.TIMING_NAME="MORNING";
-- 65 --
select tr.trainers_name,t.TIMING_NAME 
FROM trainers tr
cross join TIMINGS t
WHERE t.TIMING_NAME between "EVENING"AND "MORNING";
-- 66 --
select count(*) AS  total_combinations
FROM trainers tr
cross join TIMINGS t;
-- 67 --
select tr.trainers_name,t.TIMING_NAME,tr.experience_
FROM trainers tr
cross join TIMINGS t
WHERE tr.experience_ >="2 YEAR";



-- PART - 14  Business Scenario Questions --
 -- 131 --  
select  s.s_name, t.TIMING_NAME 
FROM stud s
cross join TIMINGS t;
-- 132 --
select c.c_name,r.room_name
FROM course c
CROSS JOIN rooms r; 
-- 133 -- 
select tr.trainers_name,c.c_name
FROM trainers tr
CROSS JOIN course c;
-- 134 -- 
select tr.trainers_name,t.TIMING_NAME 
FROM trainers tr
cross join TIMINGS t;
-- 135 -- 
select c.c_name,ci.city_name
FROM course c
cross join city ci;
-- 136 -- 
select ci.city_name,t.TIMING_NAME 
from city ci
cross join TIMINGS t;
-- 137 -- 
select ci.city_name, c.c_name,tr.trainers_name
from city ci
cross join course c
cross join trainers tr;
-- 138 -- 
select ci.city_name,tr.trainers_name ,r.room_name
from city ci
cross join trainers tr
cross join rooms r;
-- 139 -- 
select s.s_name, c.c_name ,r.room_name
from stud s
cross join course c
cross join rooms r;
-- 140 -- 
select s.s_name, c.c_name,tr.trainers_name ,r.room_name
from stud s
cross join course c
cross join trainers tr
cross join rooms r;
-- PART - 15  Business Scenario Questions --
-- 141 -- 
select 20*5 as total_combinations
from stud s
cross join course c;
-- 142 -- 
select 10*4 as total_combinations;
-- 143 -- 
select 8*3 as room_combinations;
-- 144 -- 
select 6*5 as total_combinations;
-- 145 -- 
select 10*5*3 as total_combinations;
-- 146 -- 
select 4*6*3 as total_combinations;
-- 147 -- 
select 10*5*3*2 as total_combinations;
-- 148 -- 
select s.s_name, c.c_name,tr.trainers_name ,r.room_name,t.TIMING_NAME
from stud s
cross join course c
cross join trainers tr
cross join rooms r
cross join TIMINGS t;
-- 149 -- 
select s.s_name, c.c_name,c.fee
from stud s
cross join course c
where c.fee<15000
order by s.s_name asc;
-- 150 -- 
select s.s_name, c.c_name,tr.trainers_name ,r.room_name,t.TIMING_NAME
from stud s
cross join course c
cross join trainers tr
cross join rooms r
cross join TIMINGS t
where s.status_= "ACTIVE"
and c.status_= "ACTIVE"
and tr.experience_ >="2 YEAR"
and r.room_name in("LAB 1","LAB 2")
and t.TIMING_NAME="EVENING"
ORDER BY s.s_name ASC;
-- CROSS JOIN FILE COMPLETE --







