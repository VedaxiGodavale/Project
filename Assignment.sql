### Assignment

-- First --


1. Display all information in the tables EMP and DEPT. 

select * 
from employees , departments;

2. Display only the hire date and employee name for each employee. 

select hire_date, first_name
from employees;

3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title.

select concat(first_name," ",last_name) as Employee, job_id as Title 
from employees;

4. Display the hire date, name and department number for all clerks. 

select concat(first_name," ",last_name),hire_date, department_id, job_title 
from employees join jobs using(job_id)
where job_title like "%clerk";

5. Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT

select concat(first_name,',',last_name,',',hire_date,email,',',manager_id,',',department_id,',',job_id,',',salary) as OUTPUT
from employees;

6. Display the names and salaries of all employees with a salary greater than 2000. 

select concat(first_name," ",last_name), salary
from employees 
where salary > 2000;

7. Display the names and dates of employees with the column headers "Name" and "Start 
Date". 

select cooncat(first_name," ",last_name) as Name, hire_date as Startdate
from employees;

8. Display the names and hire dates of all employees in the order they were hired. 

select concat(first_name," ",last_name), hire_date
from employees
order by hire_date;

9. Display the names and salaries of all employees in reverse salary order. 

SELECT concat(first_name," ",last_name), salary
from employees
order by salary desc;

10. Display "ename" and "deptno" who are all earned commission and display salary in 
reverse order.

select concat(first_name," ",last_name), department_id, salary
from employees
where commission_pct is not null
order by salary desc;

11. Display the last name and job title of all employees who do not have a manager.

select last_name, job_title
from employees join jobs using(job_id)
where manager_id is null;

12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000.

select  last_name,job_title, salary
from employees join jobs using(job_id)
where job_title in ('salaes representative', 'stock clerk') and salary not in ('2500', '3500', '5000');
 
 
 -- Second--
 
 
 1) Display the maximum, minimum and average salary and commission earned. 
 
select avg(salary), avg(commission_pct), max(salary), max(commission_pct), min(salary), min(commission_pct)
from employees;

2) Display the department number, total salary payout and total commission payout for 
each department.

select department_id, sum(salary), sum(commission_pct)
from employees
group by department_id;

3) Display the department number and number of employees in each department. 

select department_id, count(*)
from employees
group by department_id;

4) Display the department number and total salary of employees in each department. 

select department_id, sum(salary)
from employees
group by department_id;

5) Display the employee's name who doesn't earn a commission. Order the result set 
without using the column name.

select first_name,commission_pct
from employees
where commission_pct is null
order by 1;

6) Display the employees name, department id and commission. If an Employee doesnt 
earn the commission, then display as 'No commission'. Name the columns appropriately.

select first_name, department_id,
case
when commission_pct is not null then commission_pct 
when commission_pct is null then 'no commission'
end as commission
from employees;

7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission'. Name the columns 
appropriately.

select first_name, department_id,
case
when commission_pct is not null then commission_pct * 2
when commission_pct is null then 'no commission'
end as commission
from employees;

8) Display the employees name, department id who have the first name same as another 
employee in the same department.

Select first_name, department_id
from employees
group by department_id, first_name
having count(first_name) > 1;

9) Display the sum of salaries of the employees working under each Manager. 

select manager_id, sum(salary)
from employees
group by manager_id;

10) Select the Managers name, the count of employees working under and the department 
ID of the manager.

select m.first_name,count(e.employee_id),m.department_id
from  employees e join employees m on e.manager_id = m.employee_id
group by m.employee_id;

11) Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a'.

select e.first_name,e.last_name,e.department_id,e.salary,m.first_name
from employees e join employees m on e.manager_id = m.employee_id
where e.last_name like '_a%';

12) Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id.

SELECT AVG(SALARY), DEPARTMENT_ID
FROM employees	
group by department_id
order by department_id;

13) Select the maximum salary of each department along with the department id. 

select department_id,max(salary)
from employees
group by department_id;

14) Display the commission, if not null display 10% of salary, if null display a default value 1.

select employee_id, 
case
when commission_pct is not null then salary * 0.1
when commission_pct is null then 1
end as commisssion
from employees;


-- Third --


1. Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label. 

select concat(upper(substring(last_name,2,1)),lower(substring(last_name,3,3))) as surname
from employees;

2. Write a query that displays the employee first name and last name along with a "-" in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.

select concat(first_name,'-',last_name) name,hire_date
from employees;

3. Write a query to display the employee last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.

select last_name,salary,
case
when salary/2 > 10000 then salary+salary*10/100+1500
else salary+salary*11.5/100+1500
end as bonus
from employees;

4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!'

select concat()

5. Write a query that displays the employee last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees last names .

select concat(upper(left(last_name,1)),lower(right(last_name,length(last_name)-1))) 'employees last name', length(last_name) length
from employees
where first_name like "j%" or first_name like "a%" or first_name like "m%";


6. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY.

select last_name, lpad(salary,15,'$') salary
from employees;

7. Display the employee name if it is a palindrome.

select
case when first_name = reverse(first_name) then 'Palindrome'
else 'Not Palindrome'
end result
from employees;

8. Display First names of all employees with initcaps. 

select concat(upper(left(first_name,1)),lower(right(first_name,length(first_name)-1))) name
from employees;

9. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.

select substring_index(substring_index(street_address," ",2)," ",-1)
from locations;

10. Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name.

select lcase(concat(left(first_name,1), last_name , '@systechusa.com')) as 'e-mail address'
from employees;

11. Display the names and job titles of all employees with the same job as Trenna. 



12. Display the names and department name of all employees working in the same city as 
Trenna. 



13. Display the name of the employee whose salary is the lowest. 

select first_name, salary
from employees
order by salary
limit 1;

14. Display the names of all employees except the lowest paid.





-- Fourth --


1. Write a query to display the last name, department number, department name for all 
employees.

select last_name, department_id, department_name
from employees join departments using(department_id);

2. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output.

select distinct(job_id), location_id
from employees join departments using(department_id)
where department_id = 40;

3. Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission.

select last_name, department_name, location_id, city
from employees join departments using(department_id) join locations using(location_id)
where commission_pct is not null;

4. Display the employee last name and department name of all employees who have an 'a' 
in their last name.

select last_name, department_name
from employees join departments using(department_id)
where last_name like '%a%'
order by last_name;

5. Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA. 

select last_name, job_id, department_id, department_name, country_name
from employees join departments using(department_id) join locations using(location_id) join countries using(country_id)
where country_name = 'atlanta';

6. Display the employee last name and employee number along with their manager last 
name and manager number.

select e.employee_id,e.last_name,m.employee_id as Manager_id,m.last_name as man_last_name
from employees e join employees m on e.manager_id = m.employee_id;

7. Display the employee last name and employee number along with their manager last 
name and manager number (including the employees who have no manager).

select e.employee_id, e.last_name, m.employee_id as Manager_id,m.last_name as Man_last_name
from employees e left join employees m on e.manager_id = m.employee_id;

8. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee. 

select last_name, department_id
from employees
order by department_id;

9. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C).

select first_name, job_id, department_id, salary,
case
when salary >=50000 then 'A'
when salary >=30000 then 'B'
when salary <30000 then 'C'
end as grade
from employees;

10. Display the names and hire date for all employees who were hired before their 
managers along withe their manager names and hire date. Label the columns as Employee 
name, emp_hire_date,manager name,man_hire_date
 
select e.first_name as Employee_name,e.hire_date as Emp_hire_date,m.first_name as Manager_name,m.hire_date as Man_hire_date
from employees e join employees m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;
 
 
 -- Fifth --
 
 
 1. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus.

select employeeid,concat(firstname,' ',lastname) as name
from employee join contact on employee.contactid = contact.contactid join salesperson on employee.employeeid = salesperson.salespersonid
where salesperson.bonus = 2000;

2. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A.

select *
from employeeaddress join address on employeeaddress.addressid = address.addressid join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
where stateprovince.countryregioncode = 'CA';

3. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product.

select *
from product join salesorderdetail on product.productid = salesorderdetail.productid;

4. Find the subcategories that have at least two different prices less than $15.

select productsubcategory.productsubcategoryid, productcosthistory.standardcost
from product join productsubcategory on product.productsubcategoryid = productsubcategory.productsubcategoryid join productcosthistory on product.productid = productcosthistory.productid
where product.standardcost < 15 ;

5. A. Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name.
B. Display the employee id and employee name of employees who do not have manager.

select e.employeeid,contact.contactid,contact.firstname
from employee e join employee m on e.managerid = m.employeeid join contact on contact.contactid;

select *
from employee e join employee m on e.managerid = m.employeeid
where m.managerid is null;

6. A. Display the names of all products of a particular subcategory 15 and the names of their 
vendors.
B. Find the products that have more than one vendor. 

select productid, vendorid
from productvendor
where ;

7. Find all the customers who do not belong to any store.

select customer.customerid
from customer left join store on customer.customerid = store.customerid
where store.customerid is null;

8. Find sales prices of product 718 that are less than the list price recommended for that 
product.



9. Display product number, description and sales of each product in the year 2001.



10. Build the logic on the above question to extract sales for each category by year. Fetch 
Product Name, Sales_2001, Sales_2002, Sales_2003.



 -- Sixth --
 
 
1. Write a query to display the last name and hire date of any employee in the same 
department as SALES. 
 
 select last_name, hire_date
 from employees join departments using(department_id)
 where department_name = 'sales';
 
 2. Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary.
 
 select employee_id, last_name, salary
 from employees
 where salary >(select avg(salary)from employees)
 order by salary asc;
 
 3. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains 'u'.

 select employee_id, last_name, department_id
 from employees
 where last_name like '%u%'
 order by department_id;
 
 4. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA.

 select last_name, department_id, job_id
 from employees join departments using(department_id) join locations using(location_id) join countries using(country_id)
 where country_name = 'atlanta';
 
 5. Display the last name and salary of every employee who reports to FILLMORE.
 
 
 
 6. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department.

 select last_name, department_id, job_id
 from employees join departments using(department_id)
 where department_name = 'operations';
 
 7. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name.

 select employee_id, last_name, salary,department_id
 from employees 
 where last_name like '%u%' and salary > (select avg(salary) from employees)
 order by department_id;
 
 8. Display the names of all employees whose job title is the same as anyone in the sales 
dept. 

 select first_name,job_id
 from employees join jobs using (job_id)
 where job_title = "sales_%";
 
 9. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise.

 select employee_id, salary,
 case
 when department_id = 10 then '5%'
 when department_id = 20 then '10%'
 when department_id = 30 then '5%'
 when department_id = 40 then '15%'
 when department_id = 50 then '15%'
 when department_id = 60 then 'none'
 end as raise
 from employees;
 
 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries.
 select last_name, salary
 from employees
 order by salary desc
 limit 3;
 
11. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column .

 select first_name, salary,
 case
 when commission_pct is not null then commission_pct
 when commission_pct is null then 'O'
 end as commission
 from employees;
 
 12. Display the Managers (name) with top three salaries along with their salaries and 
department information.
 
 select m.employee_id,m.first_name, m.salary,m.department_id
 from employees e join employees m on e.manager_id = m.employee_id
 group by m.employee_id
 order by salary desc
 limit 3;
 
 
 -- seventh --
 
 1) Find the date difference between the hire date and resignation_date for all the 
employees. Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date
1 1/1/2000 7/10/2013
2 4/12/2003 3/8/2017
3 22/9/2012 21/6/2015
4 13/4/2015 NULL
5 03/06/2016 NULL
6 08/08/2017 NULL
7 13/11/2016 NULL
 
create table emp_date (emp_id int , hire_date date , resignation_date date);
insert into emp_date (emp_id, hire_date, resignation_date)
values('1', '2000-1-1', '2013-10-7'),
('2', '2003-12-4', '2017-8-3'),
('3', '2012-9-22', '2015-6-21');
insert into emp_date (emp_id, hire_date)
values ('4', '2015-4-13'), ('5', '2016-6-3'), ('6', '2017-8-8'), ('7', '2016-11-13');




2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)


3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)


4) Display the count of days in the previous quarter 


5) Fetch the previous Quarter's second week's first day's date


6) Fetch the financial year's 15th week dates (Format: Mon DD YYYY)


7) Find out the date that corresponds to the last Saturday of January, 2015 using with 
clause. 