-- Active: 1680584800922@@radixusers3.com@3306@jaynesh_mehta4

CREATE TABLE
    Employees(
        employee_id int,
        FIRST_NAME varchar(24),
        LAST_NAME varchar(24),
        SALARY int,
        JOINING_DATE datetime,
        DEPARTMENT varchar(200),
        MANAGER_ID INT,
        primary key (employee_id)
    );

insert into Employees
values
(
        1,
        "John",
        "Abraham",
        1000000,
        cast(
            '2013-01-13 12:00:00.000' as datetime
        ),
        "Banking",
        null
    ), (
        2,
        "Michael",
        "Clarke",
        800000,
        cast(
            '2007-11-23 12.00.00' as datetime
        ),
        "Insurance",
        1
    ), (
        3,
        "Roy",
        "Thomas",
        700000,
        cast(
            '2012-02-28 12.00.00' as datetime
        ),
        "Banking",
        1
    ), (
        4,
        "Tom",
        "Jose",
        600000,
        cast(
            '2014-04-27 12.00.00' as datetime
        ),
        "Insurance",
        2
    ), (
        5,
        "Jerry",
        "Lname%",
        650000,
        cast(
            '1995-06-14 12.00.00' as datetime
        ),
        "Insurance",
        3
    ), (
        6,
        "Philip",
        "Mathew",
        750000,
        cast(
            '1997-07-23 12.00.00' as datetime
        ),
        'Services',
        3
    ), (
        7,
        "Test",
        "Name1",
        123650,
        cast(
            '1994-07-07 12.00.00' as datetime
        ),
        "Services",
        3
    ), (
        8,
        "Test",
        "Name2",
        600000,
        cast(
            '1998-11-11 12.00.00' as datetime
        ),
        "Insurance",
        2
    );

select * FROM `Employees`;

CREATE Table
    Incentives (
        EMPLOYEE_REF_ID INT,
        INCENTIVE_DATE DATE,
        INCENTIVE_AMOUNT int,
        Foreign Key (EMPLOYEE_REF_ID) REFERENCES Employees(employee_id)
    );

insert into `Incentives`
VALUES (1, '01-02-13 ', 5000), (2, '01-02-13', 3000), (3, '01-02-13', 4000), (1, '01-01-13', 4500), (2, '01-01-13', 3500);

SELECT * FROM `Incentives`;


--1. Create a Store Procedure Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table
CREATE PROCEDURE DIFFERENTIATE_DEPARTMENT() BEGIN 
	SELECT
	    FIRST_NAME,
	    LAST_NAME,
	    CASE
	        WHEN `DEPARTMENT` = 'BANKING' THEN 'Bank Dept'
	        WHEN `DEPARTMENT` = 'SERVICES' THEN 'Services Dept'
	        WHEN `DEPARTMENT` = 'Insurance' THEN 'Insurance Dept'
	        ELSE `DEPARTMENT`
	    END AS DEPARTMENT
	FROM Employees;
	END 
; 

CALL DIFFERENTIATE_DEPARTMENT();




-- 2. Select employee details from employee table if data exists in incentive table ? 

CREATE PROCEDURE EMP_EXIST_IN_incentive()
BEGIN 
SELECT * FROM `Employees`
WHERE `employee_id` 
IN(SELECT `EMPLOYEE_REF_ID` FROM`Incentives`);
END;

CALL `EMP_EXIST_IN_incentive`();

--Find Salary of the employee whose salary is more than Roy Salary 

CREATE PROCEDURE SALARY_MORE_THAN_ROY()
BEGIN
SELECT * FROM `Employees`
WHERE
`SALARY` > (SELECT `SALARY` FROM `Employees` WHERE `FIRST_NAME` = 'ROY');
END;

CALL SALARY_MORE_THAN_ROY();

-- Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount'

CREATE PROCEDURE VIEW_INSIDE_SF()
BEGIN
CREATE VIEW VIEW1 AS
SELECT A.FIRST_NAME , A.LAST_NAME , A.SALARY , A.JOINING_DATE , B.INCENTIVE_DATE, B.INCENTIVE_AMOUNT 
FROM `Employees`A
JOIN `Incentives`B 
ON A.employee_id = B.EMPLOYEE_REF_ID;
END;


SELECT * FROM `VIEW1`;

-- Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

CREATE PROCEDURE VIEW_INSIDE_SF2()
BEGIN
CREATE VIEW VIEW2 AS
SELECT A.first_name , B.INCENTIVE_AMOUNT 
FROM `Employees`A RIGHT JOIN `Incentives`B  
ON A.employee_id = B.EMPLOYEE_REF_ID
WHERE B.INCENTIVE_AMOUNT > 3000;
END;

CALL `VIEW_INSIDE_SF2`();

SET @MARKS  = 23
IF @MARKS >=20 THEN
SELECT * FROM `VIEW1`
END IF;