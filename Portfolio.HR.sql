use HR_Database;

-- Creating a table
Create table hrdata(
emp_no int Primary Key,
gender varchar(50) Not Null,
marital_status varchar(50),
age_band varchar(50),
age int,
department varchar(50),
education varchar(50),
education_field varchar(50),
job_role varchar(50),
business_travel varchar(50),
employee_count int,
attrition varchar(50),
attrition_label varchar(50),
job_satisfaction int,
active_employee int
);

select * from hrdata;

select sum(employee_count) from hrdata;


-- Retrieving the total employee from specified field
select sum(employee_count) as Employee_Count from hrdata
-- where education='High School';
-- where department ='R&D';
where education_field ='Medical';


-- Retrieving the count of employees who has left the company
select count(Attrition) from Hrdata
-- where attrition= 'Yes' and education ='Doctoral Degree';
-- where attrition= 'Yes' and department = 'R&D' and education_field='Medical' and Education='High School';
-- where attrition='No';
 where Attrition='Yes' and Business_travel='Travel_Rarely';
 
 
 
 select Round(((select count(attrition) from hrdata where attrition='Yes')/ sum(employee_count))*100,2) from hrdata;
select Round(((select count(attrition) from hrdata where attrition='Yes'and department='Sales')/ sum(employee_count))*100,2) from hrdata
where department='Sales';

select sum(employee_count)-(select count(attrition) from hrdata where attrition='Yes') from hrdata;
select sum(employee_count)-(select count(attrition) from hrdata where attrition='Yes' and gender='Male') from hrdata 
where gender='Male';

select round(avg(age), 0) as avg_age from hrdata;
 
select count(attrition), gender from hrdata
where attrition='Yes' and education='High School'
group by gender
-- having gender='Male'
order by gender desc;

select department, count(attrition),
round((cast(count(attrition) as decimal)/ (select count(attrition) from hrdata where attrition='Yes'))*100,2)
from hrdata
where attrition='Yes'
group by department
order by count(attrition) desc;

-- OR
select department, count(attrition),
round((count(attrition)/ (select count(attrition) from hrdata where attrition='Yes' and gender='Female'))*100,2)
from hrdata
where attrition='Yes' and gender='Female'
group by department
order by count(attrition);

select count(attrition) from hrdata where attrition='Yes';
select count(attrition) from hrdata;

select age, sum(employee_count) from hrdata
-- where gender='Female'
where department='R&D'
group by age
order by age;

select education_field, count(attrition) from hrdata
where attrition='Yes' and department='Sales'
group by education_field
order by count(attrition) desc;

select age_band, gender, count(attrition),
round((count(attrition)/(select count(attrition) from hrdata where attrition='Yes'))*100,2)
 from hrdata
where attrition='Yes'
group by age_band, gender
order by age_band, gender;

-- OR
select age_band, gender, count(attrition),
round((cast(count(attrition) as decimal)/(select count(attrition) from hrdata where attrition='Yes'))*100,2)
 from hrdata
where attrition='Yes'
group by age_band, gender
order by age_band, gender;

SELECT
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS one,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS two,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS three,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS four,
    sum(employee_count)
FROM hrdata
GROUP BY job_role
ORDER BY job_role desc;

select age_band, gender, sum(employee_count) from hrdata
group by age_band, gender
order by age_band, gender desc;
