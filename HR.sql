-- Creating a database

create database HR;
use HR;

-- Creating a table

create table HR(id char(10) PRIMARY KEY,
				first_name char(200),
                last_name char(200),
                birthdate char(10),
                gender char(200),
                race char(200),
                department char(200),
                jobtitle char(200),
                location char(200),
                hire_date char(10),
                termdate char(200),
                location_city char(200),
                location_state char(200));

-- Cleaning the data

SET SQL_SAFE_UPDATES = 0;
update HR set birthdate = str_to_date(birthdate, "%m/%d/%Y");
update HR set hire_date = str_to_date(hire_date, "%m/%d/%Y");
update HR set termdate = date(str_to_date(termdate, "%Y-%m-%d %H:%i:%s UTC"))
where termdate is not null and termdate != '';
update HR set termdate = null where termdate = '';
SET SQL_SAFE_UPDATES = 1;

-- Get the basic understanding of the scale of table and which values it contains

select count(*) as rows_num from HR;
select count(*) as column_sum from information_schema.columns where table_name = 'HR';
select distinct gender from HR;
select distinct race from HR;
select distinct department from HR;
select distinct jobtitle from HR;
select distinct location from HR;
select distinct location_city from HR;
select distinct location_state from HR;

-- Adding currently hired column

alter table HR add currently_hired char(10) after termdate;
update HR
set currently_hired = case 
when year(curdate()) - year(termdate) >= 0 then 'False'
else 'True'
end;

-- How many people currently wotk at the company

select count(*) as current_num_emp from HR
where currently_hired = 'True';

-- How many people currently wotk at each of the departments

select department, count(*) as current_num_emp from HR
where currently_hired = 'True'
group by department
order by current_num_emp desc;

-- Adding age column

alter table HR add age int(3) after birthdate;
update HR
set age = timestampdiff(year, birthdate, curdate());

-- What is the average age of employees

select round(avg(age), 3) as avg_age from HR
where currently_hired = 'True';

-- What is the average age of employees by department

select department, round(avg(age), 1) as avg_age from HR
where currently_hired = 'True'
group by department
order by avg_age desc;

-- Finding the gender disproportion

select gender, count(*), round(count(*) / (select count(*) from HR where currently_hired = 'True') * 100, 2) 
as gender_percentage from HR
where currently_hired = 'True'
group by gender;

-- Finding how many people work in each state

select location_state, count(*) as num_employees from HR
where currently_hired = 'True'
group by location_state
order by num_employees desc;

-- Grouping the previous calculation by city

select location_state, location_city, count(*) as num_employees from HR
where currently_hired = 'True'
group by location_state, location_city
order by num_employees desc;

-- How many people work remotely

select location, count(*) num_remote_workers, round(count(*) / (select count(*) from HR where currently_hired = 'True') 
* 100, 2) as perc_remote_workers from HR
where location = 'remote' and currently_hired = 'True';

-- How many people of each race are there and their proportion

select race, count(*) num_race, round(count(*) / (select count(*) from HR where currently_hired = 'True') 
* 100, 2) as race_perc from HR
where currently_hired = 'True'
group by race
order by race_perc desc;

-- Adding length of service column
alter table HR add service_length int(3) after hire_date;
update HR
set service_length = case
when timestampdiff(year, termdate, curdate()) > 0 then timestampdiff(year, hire_date, termdate)
else timestampdiff(year, hire_date, curdate())
end;

-- What is the average length of service of employees
select round(avg(service_length), 1) as avg_service_length from HR;

-- What is the average length of service of employees by department
select department, round(avg(service_length), 1) as avg_service_length from HR
group by department
order by avg_service_length desc;

-- Just calling first 100 rows of the table when checking the previous scripts
select * from HR limit 100;


