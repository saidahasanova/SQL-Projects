---Show minimum, average and maximum salary in last 15 years according to job id.

select min(salary), max(salary), avg(salary), job_id
from employees 
where extract(year from sysdate)- extract(year from hire_date)<= 20
group by job_id; ;


---How many employees hired after 2005 for each department?

select count(*), department_id from employees 
where hire_date> '31-dec-2005'
group by department_id;

/*
Write a query to show departments in which the difference between maximum and minimum
salary is greater than 5000.
*/
 select department_id, max(salary)- min(salary) as sal_dif
 from employees 
 group by department_id
 having max(salary)- min(salary)>=5000;
 
 /*Display salaries of employees who has not commission pact according to departments
(without using where).
*/

select department_id, 
case 
when
commission_pct is  null then salary 
else null
end as sal, listagg(first_name, ' ,') within group (order by first_name) as ad
from employees 
group by department_id, 
case 
when
commission_pct is  null then salary 
else null 
end 
;





SELECT 
    department_id,
  sum( CASE 
        WHEN commission_pct IS NULL THEN salary 
        ELSE NULL 
    END )AS total_sal
FROM 
    employees
GROUP BY 
    department_id,
    CASE 
        WHEN commission_pct IS NULL THEN salary 
        ELSE NULL 
    END;


--How many people has job id with average salary between 3000 and 7000?
select count(*)say, job_id, avg(salary)from employees 
group by job_id having avg(salary) between 3000 and 7000;

SELECT 
    COUNT(*) AS say, 
    job_id, 
    AVG(salary) AS avg_salary
FROM 
    employees
GROUP BY 
    job_id
HAVING 
    AVG(salary) BETWEEN 3000 AND 7000;
    
    
-- Find number of employees with same name.
 select COUNT(EMPLOYEE_ID) say, first_name from employees 
 group by first_name having count(EMPLOYEE_ID)>1;
 
 -- How many people with the same phone code work in departments 50 and 90?
 SELECT COUNT(*), SUBSTR(PHONE_NUMBER, 1,3) AS PHONE_CODE, DEPARTMENT_ID
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN ( 50,90) 
 GROUP BY  SUBSTR(PHONE_NUMBER, 1,3), DEPARTMENT_ID;
 



---Display departments with average number of employees more than 5 in spring and autumn.







SELECT   EXTRACT( MONTH FROM HIRE_DATE) IN ('MAR', 'APR', 'MAY') FROM EMPLOYEES;

---Display departments with number of employees more than 5 in spring and autumn.

SELECT 
    COUNT(*), DEPARTMENT_ID
FROM 
    employees
WHERE 
    EXTRACT(MONTH FROM hire_date) IN (3,4,5,9,10,11)
    GROUP BY DEPARTMENT_ID HAVING COUNT(*) >5;

/*
10.Change second letter of employees’ names with the last letter and display.
*/




SELECT SUBSTR(FIRST_NAME,1,1)||SUBSTR(FIRST_NAME,-1,1)||SUBSTR(FIRST_NAME,3,LENGTH(FIRST_NAME)-3)||SUBSTR(FIRST_NAME,2,1) AS NEW,
FIRST_NAME FROM EMPLOYEES;

-- How many employees work in departments which has maximum salary more than 5000?

SELECT COUNT(*),DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID HAVING MAX(SALARY)>5000;

----HOMEWORK 2
--Display employees who joined in the month of May.
SELECT FIRST_NAME, HIRE_DATE  FROM EMPLOYEES 
WHERE EXTRACT (MONTH FROM HIRE_DATE) = '05';

--Display employees who joined in the current year.
SELECT  FIRST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE EXTRACT (YEAR FROM HIRE_DATE) = '2007';

---Display the number of days between system date and 1st January 2011.

select  trunc(sysdate - to_date('01-01-2011', 'dd-mm-yyyy')) as dif_date
from dual;

--Display maximum salary of employees.
select max(salary) from employees;

--Display number of employees in each department.
select count(*)as numofemp , department_id from employees
group by department_id;

---Display number of employees who joined after 15th of month.
select count(*) say, hire_date from employees
where  extract(day  from hire_date) > 15
group by hire_date;


---Display average salary of employees in each department who have commission percentage. 

select count(*),round(avg(salary)),department_id from employees 
where commission_pct is not null
group by department_id; 


select department_id from employees;



---Display job ID for jobs with average salary more than 10000.
select job_id, avg(salary) from employees 
group by job_id having  avg(salary)> 10000;

/*
Display job ID, number of employees, sum of salary, and difference between the highest
salary and the lowest salary of the employees for all jobs.
*/
select job_id, count(*), sum(salary), max(salary)-min(salary) as dif
from employees
group by job_id;

---10.Display manager ID and number of employees managed by the manager.

select count(*)num_of_emp, manager_id from employees
where manager_id is not null
group by manager_id ;


huseyn 
 h u sey n 
 
 select substr('huseyn', 1,1)
  substr('huseyn', 2,1) 
  substr('huseyn', 3,3)
  substr ('huseyn',-1,1);
  
  select 
substr('huseyn', 1,1) ||
 substr('huseyn', -1,1) ||
 substr('huseyn',3, length('huseyn')-3)||
 substr ('huseyn', 2,1) from dual;

select substr ('saida', 3, length('saida')-3) from dual;
select substr('huseyn',3, length('huseyn')-3) from dual;

SELECT SUBSTR(FIRST_NAME,1,1)||
SUBSTR(FIRST_NAME,-1,1)||
SUBSTR(FIRST_NAME,3,LENGTH(FIRST_NAME)-3)||
SUBSTR(FIRST_NAME,2,1) AS NEW,
FIRST_NAME FROM EMPLOYEES;



select first_name, substr(first_name,1,1) || substr(first_name,-1,1)||
substr(first_name,3, length(first_name)-3) ||
substr(first_name, 2,1)  as newform from employees; 

