CREATE TABLE Employees(
employee_id int ,
FIRST_NAME varchar(24),
LAST_NAME varchar(24),
SALARY int,
JOINING_DATE datetime,
DEPARTMENT varchar(200),
primary key (employee_id)
);
 
insert into Employees values(0,"John", "Abraham", 1000000, cast('2013-01-13 12:00:00.000' as  datetime), "Banking"),
(2, "Michael", "Clarke", 800000,  cast('01-01-13 12.00.00' as  datetime),"Insurance"),
(3, "Roy","Thomas" ,700000,  cast('01-01-13 12.00.00' as  datetime), "Banking"),
(4, "Tom","Jose" ,600000,  cast('01-01-13 12.00.00' as  datetime), "Insurance"),
(5, "Jerry","Lname%", 650000,  cast('01-01-13 12.00.00' as  datetime), "Insurance"),
(6, "Philip","Mathew" ,750000,  cast('01-01-13 12.00.00' as  datetime),'Services' ),
(7, "Test", "Name1", 123650,  cast('01-01-13 12.00.00' as  datetime), "Services" ),
(8, "Test","Name2" , 600000,  cast('01-01-13 12.00.00' as  datetime),"Insurance");

CREATE table emp1(
select FIRST_NAME as F_Name , LENGTH(FIRST_NAME) as LENGTH from Employees
where FIRST_NAME like 'J%' or FIRST_NAME like 'A%' or FIRST_NAME like 'M%');

select * from emp1



select * from emp1
order by F_Name asc

SELECT FIRST_NAME, LAST_NAME FROM Employees WHERE INSTR(LAST_NAME,'M') > 2;

SELECT FIRST_NAME,
LPAD(salary, 10, '$') SALARY from Employees;

select substring(FIRST_NAME,LENGTH(FIRST_NAME)-3,4) FROM Employees;
    
SELECT FIRST_NAME, LAST_NAME FROM Employees WHERE INSTR(LAST_NAME,'M') > 2;

 
SELECT REPLACE(PHONE_NO, 124, 999) FROM Employees; 

SELECT concat((YEAR(CURRENT_DATE())-YEAR(JOINING_DATE)),"Y") AS YEARS FROM Employees;

SELECT FIRST_NAME , JOINING_DATE FROM Employees 
WHERE JOINING_DATE  BETWEEN '1987-06-01' AND '1987-07-30';

SELECT DATE_FORMAT(current_date(),"%h %p %M %D %Y");

SELECT FIRST_NAME , LAST_NAME FROM Employees 
WHERE MONTH(JOINING_DATE) = "05" ;     

SELECT FIRST_NAME ,employee_id,date_add(JOINING_DATE,interval 1 MONTH) AS F_SALARY
FROM Employees;

SELECT FIRST_NAME , JOINING_DATE, 
(SELECT concat((YEAR(CURRENT_DATE())-YEAR(JOINING_DATE)),"Y"))
 as EXPERIENCE
FROM Employees;


SELECT FIRST_NAME,employee_id,(SELECT SALARY/12 AS M_SALARY) ,RANK() OVER(ORDER BY (SALARY/12) DESC)MYRANK FROM Employees;


with cte1(`FirstName`,`Salary`,ranks) as
(SELECT `First_Name`,`Salary`,DENSE_RANK() over(ORDER BY `Salary` desc) DESE_RANKs  from `Employees`)
select * from cte1 where ranks = 4
;

select salary from  ROW_NUMBER over (order by `SALARY` )ROW_numbers from `Employees`  ; 

SELECT * FROM(SELECT `FIRST_NAME`,`SALARY`,ROW_NUMBER() OVER (ORDER BY SALARY DESC)AS RA_NK from `Employees`) AS dev
WHERE RA_NK = 4;