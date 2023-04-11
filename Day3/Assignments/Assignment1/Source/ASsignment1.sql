--Table Name : Employee EMPLOYEE_ID FIRST_NAME LAST_NAME SALARY JOINING_DATE DEPARTMENT MANAGER_ID
-- Active: 1680584800922@@radixusers3.com@3306@jaynesh_mehta2
CREATE TABLE Employees(
employee_id int ,
FIRST_NAME varchar(24),
LAST_NAME varchar(24),
SALARY int,
JOINING_DATE datetime,
DEPARTMENT varchar(200),
MANAGER_ID INT,
primary key (employee_id)
);

 insert into Employees values(1,"John", "Abraham", 1000000, cast('2013-01-13 12:00:00.000' as  datetime), "Banking",null),
(2, "Michael", "Clarke", 800000,  cast('2007-11-23 12.00.00' as  datetime),"Insurance",1),
(3, "Roy","Thomas" ,700000,  cast('2012-02-28 12.00.00' as  datetime), "Banking",1),
(4, "Tom","Jose" ,600000,  cast('2014-04-27 12.00.00' as  datetime), "Insurance",2),
(5, "Jerry","Lname%", 650000,  cast('1995-06-14 12.00.00' as  datetime), "Insurance",3),
(6, "Philip","Mathew" ,750000,  cast('1997-07-23 12.00.00' as  datetime),'Services',3),
(7, "Test", "Name1", 123650,  cast('1994-07-07 12.00.00' as  datetime), "Services",3),
(8, "Test","Name2" , 600000,  cast('1998-11-11 12.00.00' as  datetime),"Insurance",2);

--Table Name : Incentives EMPLOYEE_REF_ID INCENTIVE_DATE INCENTIVE_AMOUNT
CREATE Table Incentives
(EMPLOYEE_REF_ID INT ,
 INCENTIVE_DATE DATE ,
 INCENTIVE_AMOUNT int,
 Foreign Key (EMPLOYEE_REF_ID) REFERENCES Employees(employee_id)
  );
insert into `Incentives` VALUES
 (1,'01-02-13 ', 5000),
 (2, '01-02-13',3000),
 (3, '01-02-13', 4000),
 (1, '01-01-13' ,4500),
 (2, '01-01-13', 3500);


select count(employee_id), `DEPARTMENT` from `Employees` GROUP BY `DEPARTMENT`;
select employee_id,`FIRST_NAME`,SALARY, max(ABS(DATEDIFF(`INCENTIVE_DATE`,`JOINING_DATE`))) AS DIFFERNCE
from `Employees` RIGHT JOIN `Incentives` 
on Employees.employee_id = Incentives.`EMPLOYEE_REF_ID` 
GROUP BY employee_id;

SELECT *, ABS(DATEDIFF(`INCENTIVE_DATE`,`JOINING_DATE`)) AS DIFFERNCE
FROM `Employees` A RIGHT JOIN B.Incentives 
ON A.employee_id = B.`EMPLOYEE_REF_ID`;


--3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives.
SELECT FIRST_NAME , INCENTIVE_AMOUNT FROM 
`Employees` RIGHT JOIN  `Incentives`
ON  employee_id = `EMPLOYEE_REF_ID` 
WHERE INCENTIVE_AMOUNT > 3000;

SELECT A.FIRST_NAME AS EMPLOYEE_NAME , B.FIRST_NAME AS MANAGER_NAME FROM `Employees` A , `Employees` B
WHERE B.employee_id = A.`MANAGER_ID`;

-- Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives. 

SELECT A.FIRST_NAME,IFNULL(INCENTIVE_AMOUNT,0) FROM `Employees`A 
LEFT JOIN `Incentives` B  ON B.`EMPLOYEE_REF_ID`= A.`employee_id`  
;

SELECT SUM(SALARY) AS TOTAL_SALARY,DEPARTMENT FROM `Employees`
GROUP BY `DEPARTMENT`
ORDER BY TOTAL_SALARY DESC;

SELECT MAX(SALARY) AS MAX_SALARY ,`DEPARTMENT` FROM `Employees`
GROUP BY `DEPARTMENT`
ORDER BY MAX_SALARY ;

SELECT MIN(SALARY) AS MIN_SALARY ,`DEPARTMENT` FROM `Employees`
GROUP BY `DEPARTMENT`
ORDER BY MIN_SALARY ;

SELECT SUM(SALARY) AS TOTAL_SALARY,DEPARTMENT FROM `Employees`
GROUP BY `DEPARTMENT`
HAVING
TOTAL_SALARY > 800000
ORDER BY TOTAL_SALARY ;