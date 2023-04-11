CREATE TABLE
    Employees(
        employee_id int,
        FIRST_NAME varchar(24),
        LAST_NAME varchar(24),
        SALARY int,
        JOINING_DATE datetime,
        DEPARTMENT varchar(200),
        primary key (employee_id)
    );

insert into Employees
values
(
        0,
        "John",
        "Abraham",
        1000000,
        cast(
            '2013-01-13 12:00:00.000' as datetime
        ),
        "Banking"
    ), (
        2,
        "Michael",
        "Clarke",
        800000,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        "Insurance"
    ), (
        3,
        "Roy",
        "Thomas",
        700000,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        "Banking"
    ), (
        4,
        "Tom",
        "Jose",
        600000,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        "Insurance"
    ), (
        5,
        "Jerry",
        "Lname%",
        650000,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        "Insurance"
    ), (
        6,
        "Philip",
        "Mathew",
        750000,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        'Services'
    ), (
        7,
        "Test",
        "Name1",
        123650,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        "Services"
    ), (
        8,
        "Test",
        "Name2",
        600000,
        cast(
            '01-01-13 12.00.00' as datetime
        ),
        "Insurance"
    );

select * from Employees;

select FIRST_NAME as Employee_Name from Employees;

select FIRST_NAME , LAST_NAME from Employees;

select *
from Employees
where
    FIRST_NAME = "Roy"
    or FIRST_NAME = "John";

select * from Employees where FIRST_NAME like "j%";

select * from Employees where FIRST_NAME like "%o%";

select * from Employees where SALARY > 50000 and SALARY< 700000;

SELECT DISTINCT DEPARTMENT FROM Employees;

SELECT SALARY
FROM Employees
group by (SALARY)
order by (SALARY) desc
limit 2;

select avg(salary)
from Employees as AvgSalary
where
    SALARY > 50000
    and SALARY < 800000;

select * from Employees WHERE LOCATE('%', LAST_NAME);

CREATE table incentive(
        select
            FIRST_NAME as FIRST_NAME, (SALARY * 0.10) as Incentive
        from Employees
    );

select * from  (select
            FIRST_NAME as FIRST_NAME, (SALARY * 0.10) as Incentive
        from Employees)
     as incentive where Incentive >= 100000;

CREATE TABLE
    Employee (
        EmployeeID decimal(6, 0) NOT NULL DEFAULT '0',
        FirstName varchar(20) DEFAULT NULL,
        LastName varchar(25) NOT NULL,
        Email varchar(25) NOT NULL,
        PhoneNumber varchar(20) DEFAULT NULL,
        HireDate date NOT NULL,
        JobId varchar(10) NOT NULL,
        Salary decimal(8, 2) DEFAULT NULL,
        CommissionPct decimal(2, 2) DEFAULT NULL,
        ManagerID decimal(6, 0) DEFAULT NULL,
        DepartmentID decimal(4, 0) DEFAULT NULL,
        CONSTRAINT pkEmployeeID PRIMARY KEY (EmployeeID),
        CONSTRAINT ukEmail UNIQUE (Email)
    );

INSERT INTO Employee
VALUES (
        100,
        'Steven',
        'King',
        'SKING',
        '515.123.4567',
        '1987-06-17',
        'AD_PRES',
        24000.00,
        0.00,
        0,
        90
    ), (
        101,
        'Neena',
        'Kochhar',
        'NKOCHHAR',
        '515.123.4568',
        '1987-06-18',
        'AD_VP',
        17000.00,
        0.00,
        100,
        90
    ), (
        102,
        'Lex',
        'De Haan',
        'LDEHAAN',
        '515.123.4569',
        '1987-06-19',
        'AD_VP',
        17000.00,
        0.00,
        100,
        90
    ), (
        103,
        'Alexander',
        'Hunold',
        'AHUNOLD',
        '590.423.4567',
        '1987-06-20',
        'IT_PROG',
        9000.00,
        0.00,
        102,
        60
    ), (
        104,
        'Bruce',
        'Ernst',
        'BERNST',
        '590.423.4568',
        '1987-06-21',
        'IT_PROG',
        6000.00,
        0.00,
        103,
        60
    );