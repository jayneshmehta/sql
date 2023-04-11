-- Active: 1680584800922@@radixusers3.com@3306@jaynesh_mehta3


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


CREATE VIEW Bank_Dept AS 
SELECT * FROM Employees 
WHERE DEPARTMENT = "BANKING";

select * from `Bank_Dept`;

CREATE View Insurance_Dept AS
SELECT * FROM `Employees`
WHERE `DEPARTMENT` = 'Insurance';

SELECT * FROM Insurance_Dept;


CREATE VIEW Services_Dept AS 
SELECT * FROM `Employees`
WHERE `DEPARTMENT` = 'Services';

SELECT * FROM `Services_Dept`;

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

SELECT * FROM `Incentives`;
SELECT * FROM `Employees`
WHERE EXISTS (SELECT EMPLOYEE_REF_ID FROM `Incentives` WHERE Employees.employee_id = Incentives.`EMPLOYEE_REF_ID` );


CREATE VIEW SALARY_GREATER_ROY AS
SELECT * FROM `Employees`
WHERE `SALARY` > (SELECT `SALARY` FROM `Employees` WHERE `FIRST_NAME` = 'ROY');

SELECT * FROM `SALARY_GREATER_ROY`;

CREATE VIEW NEW_VIEW AS
SELECT A.FIRST_NAME,A.LAST_NAME,A.SALARY,A.JOINING_DATE,B.INCENTIVE_DATE,B.INCENTIVE_AMOUNT
FROM `Employees`A INNER JOIN Incentives B 
ON  A.`employee_id` = B.`EMPLOYEE_REF_ID`;

SELECT * FROM `NEW_VIEW`;

CREATE VIEW GREATERTHAN3000 AS
SELECT A.FIRST_NAME, B.INCENTIVE_AMOUNT FROM `Employees`A
RIGHT JOIN `Incentives` B ON A.`employee_id` = B.`EMPLOYEE_REF_ID`
WHERE B.`INCENTIVE_AMOUNT`>3000;

SELECT * FROM `Employees`;

ALTER TABLE Employees
ADD COLUMN LOCATION VARCHAR(70);

CREATE VIEW LOCATION_LONDON AS
select `FIRST_NAME`,`Last_NAME`,`DEPARTMENT` ,`LOCATION`,
CASE 
    WHEN DEPARTMENT = 'Banking' THEN  1
    WHEN DEPARTMENT = 'Insurance' THEN  2
    WHEN DEPARTMENT = 'Services' THEN  3
    ELSE 0  
    END AS `DEPARTMENT_NO`
FROM `Employees`
WHERE `LOCATION` = "LONDON"
;
SELECT * FROM `LOCATION_LONDON`;

CREATE VIEW DEPARTMENT_WIDTH AS
SELECT `DEPARTMENT`, COUNT(*) AS NO_OF_EMP FROM Employees
GROUP BY `DEPARTMENT`;

SELECT * FROM `DEPARTMENT_WIDTH`;

CREATE TABLE job_history (
employee_id int,
start_date  datetime,
end_date datetime,
job_id int,
department_id int,
unique (employee_id)
);  

 

insert into job_history VALUES 
(2,'2003/05/15','2017/02/10',2,30),
(3,'1997/06/11','2021/03/10',4,90),
(4,'1994/03/21','2002/05/10',3,20),
(5,'2003/09/09','2021/07/10',6,90);
select * from job_history;

CREATE VIEW DIFFERENCE_JOB_HISTORY AS
SELECT employee_id,department_id,ABS(DATEDIFF(start_date,end_date)) AS DIFFERENCE FROM job_history
WHERE department_id = 90
;
SELECT * FROM `DIFFERENCE_JOB_HISTORY`;

SELECT MANAGER_ID,
CASE 
 WHEN DEPARTMENT = 'Banking' THEN 1
 WHEN DEPARTMENT = 'Insurance' THEN 2
 WHEN DEPARTMENT = 'Services' THEN 3
 ELSE 0
 END AS `MANAGER_IDS`,
 LOCATION    
 FROM `Employees`A
 SELF JOIN `Employees`B ON MANAGER_IDS = A.employee_id   
 ;




 SELECT `MANAGER_ID`AS `TEMP_MANAGER_ID`,
 (SELECT `FIRST_NAME` FROM `Employees` WHERE employee_id = `TEMP_MANAGER_ID`),
 (SELECT DEPARTMENT FROM `Employees` WHERE employee_id = `TEMP_MANAGER_ID`) ,
 (SELECT LOCATION FROM `Employees` WHERE employee_id = `TEMP_MANAGER_ID`) 
 FROM `Employees`
 GROUP BY `MANAGER_ID`;

SELECT DEPARTMENT,FIRST_NAME,LAST_NAME,JOINING_DATE,SALARY ,
ABS(DATEDIFF(CURRENT_DATE(),`JOINING_DATE`)) AS EXPERIENCE FROM `Employees`;
WHERE EXPERIENCE > 5475; 
