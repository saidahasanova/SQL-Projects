select * from employees where department_id in (50,60,70,80)  order by department_id desc;


select  job_title, maxsalary- minsalary as salarydiffererece where max salary between 12000 and 18000

Write a query in SQL to display the full name (first name and last name), hire date, commission
percentage, email and telephone separated by '-', and salary for those employees whose salary
is above 11000 and make the result set in a descending order by the full name.

select first_name||' '||last_name  as full_name,hire_date, commission_pct, email||'-'||phone_number 
from employees where salary > 11000 order  by 1 desc;

Write a query in SQL to display the first and last name, and salary for those employees whose first
name is ending with the letter “m” and they have been hired before June 5th, 2010.

select first_name, last_name, salary from employees where first_name like '%m' and hire_date< '05-jun-2010';

select * from departments where department_id= 20;

select manager_id, salary from employees where (phone_number like
'515%' or phone_number like '590%') and hire_date > '01-jan-2003' order by  hire_date, salary;

select first_name, last_name from employees where hire_date not between  '31-dec-2006' and '01-jan-2007';

select first_name, last_name , hire_date from employees where hire_date  like '%2007%' or hire_date  like '%-JAN%';
 select hire_date from employees;

select * from employees where hire_date > '31-DEC-07' or salary < 10000;

/*HOMEWORK
Display first name and last name as full name, salary, commission pct, and hire date for employees
with salary less than 10000.
*/
select first_name ||' '|| last_name as full_name, salary, commission_pct, hire_date from employees where
salary< 10000 order by salary desc;

--Display city names (without repeated names) in ascending order from locations table.
select * from locations;
select distinct city  from locations order by city;

/* Display the first name, hire date and job ID of the employees who is either IT Programmer or Sales
Manager, and hired between 2002 and 2005.*/

SELECT FIRST_NAME, HIRE_DATE, JOB_ID  FROM EMPLOYEES WHERE (JOB_ID ='IT_PROG' OR JOB_ID= 'SA_MAN') AND HIRE_DATE
BETWEEN '01-JAN-2002' AND '01-JAN-2005';



SELECT HIRE_DATE, JOB_ID FROM EMPLOYEES;



SELECT FIRST_NAME, HIRE_DATE, JOB_ID  FROM EMPLOYEES WHERE  (HIRE_DATE
LIKE '%2002' AND JOB_ID LIKE '%2005') OR ( JOB_ID LIKE 'IT%OG' OR JOB_ID LIKE 'SA%AN');

/*Display details of the employees where commission percentage is null and salary in the range 5000
to 10000 and department id is 30*/

select * from employees where commission_pct is null and salary between 3000 and 10000  and department_id = 30;

--Display employees who joined after 1st January 2008.
select * from employees where hire_date> '01-jan-2008';

--Display details of employees with ID 150, 160 or 170.
 select * from employees where manager_id in(120, 160,170);

-- Display employees where the first name or last name starts with S.
select * from employees where first_name like 'S%' or last_name like 'S%';
select first_name, last_name from employees where lower (first_name) like 's%' or lower (last_name) like 's%';

--Display the length of first name for employees where last name contain character ‘b’ after 3rd  position.

select length(first_name),first_name,last_name from employees where last_name like '___b%';

