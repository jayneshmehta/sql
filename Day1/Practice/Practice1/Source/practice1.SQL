Practice ==== > 1

CREATE TABLE countries (
    country_id int ,
    country_name varchar(60) NOT NULL,
    region_id varchar(30),
    CHECK(country_name in ('India','Italy','China')),
    unique (country_id,region_id)
);
    
insert into countries values(1,"Italy",13),(2,"india",13);
insert into countries(country_id,region_id) values(3,16);

ALTER TABLE countries MODIFY country_name varchar(50) NOT NULL DEFAULT 'N/A';
select * from countries;






Practice ==== > 2



CREATE TABLE job_history (
employee_id int,
start_date datetime default now() ,
end_date varchar(24),
job_id int,
department_id int,
unique (employee_id),
CHECK (end_date like '__/__/____')
);  
 

insert into job_history(employee_id,end_date,job_id,department_id) VALUES (1,'09/24/2013',2,2);
select * from job_history;

ALTER TABLE countries MODIFY country_name varchar(50) NOT NULL DEFAULT 'N/A';

alter table job_history  ADD
Foreign Key (job_id) REFERENCES jobs(job_id);




Practice ==== > 3



    CREATE TABLE jobs (
        job_id int,
        job_title varchar(20) default "" ,
        min_salary int default 8000,
        max_salary int default null 
    );
    
    insert into jobs(job_id,job_title) VALUES (1,"");
    select * from jobs;



-- Practice ==== > 4



CREATE TABLE jobs (
    job_id int ,
    job_title varchar(20) default "" ,
    min_salary int default 8000,
    max_salary int default null,
    primary key (job_id)
);
 
insert into jobs(job_id,job_title) VALUES (2,"Banking"),(3,"Sales"),(4,"Services");
select * from jobs;

CREATE TABLE employees (
    employee_id int ,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(20),
    phone_number int,
    hire_date date,
    job_id int,
    salary int,
    commission int,
    manager_id int,
    department_id int,
    primary key (employee_id),
    foreign key (job_id) references jobs(job_id)
);

 insert into employees values(1,"jaynesh","mehta","jaynesh@gmail.com",1234545678,'2001-02-22',1,8000,12,13,245);
 
 select * from employees;