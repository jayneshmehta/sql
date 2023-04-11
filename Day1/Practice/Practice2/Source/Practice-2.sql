   
-- Practice ======> 1

CREATE TABLE jobs (
job_id int,
job_title varchar(20) default "" ,
min_salary int default 8000,
max_salary int default null ,
primary key (job_id)
);
 
insert into jobs(job_id,job_title) VALUES (1,"");
select * from jobs;

CREATE TABLE job_history (
employee_id int,
start_date datetime default now() ,
end_date varchar(24),
job_id int,
department_id int,
unique (employee_id),
CHECK (end_date like '__/__/____')
);
 

insert into job_history(employee_id,end_date,job_id,department_id) VALUES (3,'09/24/2013',3,2);
select * from job_history;

ALTER TABLE job_history
ADD CONSTRAINT fk_job_id
FOREIGN KEY (job_id) REFERENCES jobs(job_id);


-- practice ======> 2


ALTER TABLE job_history
DROP CONSTRAINT fk_job_id;

insert into job_history(employee_id,end_date,job_id,department_id) VALUES (2,'09/24/2013',2,2);
select * from job_history;


-- Practice =======> 3

create DATABASE jaynesh_mehta;

use jaynesh_mehta;

CREATE TABLE job_history (
employee_id int,
start_date datetime default now() ,
end_date varchar(24),
job_id int,
department_id int,
unique (employee_id),
CHECK (end_date like '__/__/____')
);
 

insert into job_history(employee_id,end_date,job_id,department_id) VALUES (1,'09/24/2013',1,2);
select * from job_history;

alter table job_history add (location varchar(200)); 

insert into job_history(employee_id,end_date,job_id,department_id,location) VALUES (2,'09/24/2013',2,2,"delhi");
select * from job_history;
