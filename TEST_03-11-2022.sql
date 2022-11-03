-------------------------------------------------------------------------------------------------------------------
--											MYSQL TEST									03/11/2022 
-------------------------------------------------------------------------------------------------------------------
CREATE database ORG;	-- CREATE DATABASE

SHOW databases;			-- SHOW ALL DATABASES

USE ORG;				-- USE ORG DATABASE

-- ****************************************************************************************************************
-- ***************************************TABLE NAME WORKER *******************************************************
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

DESC WORKER;		-- describe TABLE  WORKER

-- INSERT DATA IN TABLE WORKER
insert INTO WORKER
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select * FROM WORKER;		-- TO SHOW TABLE DATA


-- *****************************************************************************************************************
-- ******************************************** TABLE NAME BONUS ***************************************************

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
SELECT * FROM BONUS;

-- ************************************************************************************************************
--  ************************************ TABLE NAME TITLE *****************************************************

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 SELECT * FROM TITLE;
 
 -- ***************************************************************************************************************
 --										|| OUESTION AND ANSWER ||
 -- ***************************************************************************************************************


-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 select 
	first_name as worker_name 
from 
	worker info;
 
 
 
 -- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select 
	upper(first_name) as upperCaseCustomerName 
from 
	worker info;




-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct 
	department 
from 
	worker;




-- Q-4. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select 
	concat(first_name ,' ' , last_name) as complete_name 
from 
	worker;



-- Q-5. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select 
	* 
from 
	worker 
order by 
	first_name asc;



-- Q-6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select 
	* 
from 
	worker 
order by
	first_name asc, 
	department desc;

-- Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select 
	* 
from 
	worker 
where 
	first_name in ('satish','vipul');


-- Q-8. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select 
	* 
from 
	worker 
where 
	first_name not in ('satish','vipul');



-- Q-9. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select 
	* 
from 
	worker 
where 
	department in ('admin');



-- Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select 
	* 
from 
	worker 
where 
	first_name like '%a%' ;

    

-- Q-11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select 
	* 
from 
	worker 
where 
	first_name like '%a' ;
    

    
-- Q-12. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select 
	* 
from 
	worker 
 where 
	first_name like '_____h' ;
    

    
-- Q-13. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select 
	* 
from 
	worker 
where
	salary < 100000 and salary > 50000;
    

    
-- Q-14. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select 
	*
from
	worker
where
	date(Joining_date) between '2014-02-01' and '2014-02-28' ;
    


-- Q-15. Write an SQL query to fetch the count of employees working in the department ‘Admin’
select 
	count(department) 
as 
	numberOfAdmin 
from 
	worker 
where department = 'admin';




-- Q-16. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select
	first_name,
    last_name
from 
	worker
where 
	salary >='50000' and salary <= '100000';



-- Q-17. Write an SQL query to fetch the no. of workers for each department in the descending order.
select 
	department, 
    count(department) 
as 
	NumberOfWorkerEachDepartment 
from 
	worker 
group by 
	department 
order by 
	NumberOfWorkerEachDepartment desc;

    
    
-- Q-18. Write an SQL query to print details of the Workers who are also Managers
SELECT 
	*
FROM 
	worker
INNER JOIN 
	title
WHERE 
	worker_id = worker_ref_id;



-- Q-19. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT 
	COUNT(worker_id),first_name 
FROM
	worker
GROUP BY 
	worker_id
HAVING 
	COUNT(worker_id) > 1;



-- Q-20. Write an SQL query to show only odd rows from a table.
SELECT 
	*
FROM 
	worker 
WHERE mod
	(worker_id,2) <> 0;
    
    

-- Q-21. Write an SQL query to show only even rows from a table.
SELECT 
	*
FROM 
	worker 
WHERE mod
	(worker_id,2) = 0;



-- Q-22. Write an SQL query to show the current date and time.
SELECT current_date(), 
current_time();



-- Q-23. Write an SQL query to show the top n (say 10) records of a table.
SELECT 
	* 
FROM 
	Worker  
LIMIT 10; 



-- Q-24. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT 
	first_name, salary 
FROM
    Worker 
ORDER BY 
	salary DESC 
LIMIT 5; 



-- Q-25. Write an SQL query to fetch the list of employees with the same salary.
SELECT 
	worker1.first_name, 
    worker1.salary
FROM 
	worker worker1
INNER JOIN 
	worker worker2 
ON 
	worker1.salary = worker2.salary AND worker1.first_name <> worker2.first_name; 



-- Q-26. Write an SQL query to show the second highest salary from a table.
SELECT 
	MAX(salary) AS second_highest_salary 
from 
	worker
WHERE 
	salary <(SELECT MAX(salary) from worker);



-- Q-27. Write an SQL query to fetch the first 50% records from a table.
SELECT 
	* 
FROM 
    worker 
WHERE 
	worker_id <= (SELECT COUNT(worker_id)/2 from worker);



-- Q-28. Write an SQL query to fetch the departments that have less than five people in it.

SELECT 
	DEPARTMENT, COUNT(Worker_id) AS 'Number of Workers' 
FROM 
    Worker 
GROUP BY 
	DEPARTMENT HAVING COUNT(WORKER_ID) < 5;



-- Q-29. Write an SQL query to show all departments along with the number of people in there.
SELECT 
	DEPARTMENT, COUNT(department) AS 'Number of Workers' 
FROM 
    Worker 
GROUP BY 
	department;



-- Q-30. Write an SQL query to show the last record from a table.
select 
	*
from 
    worker
ORDER BY 
	worker_id DESC 
LIMIT 1;



-- Q-31. Write an SQL query to fetch the first row of a table
select 
	*
from 
	worker
ORDER BY 
	worker_id 
LIMIT 1;



-- Q-32. Write an SQL query to fetch three max salaries from a table.
SELECT DISTINCT 
	salary  AS Max_salary
FROM 
	worker worker1 
WHERE 
	3 >= (SELECT COUNT(DISTINCT salary) 
FROM 
	worker worker2 
WHERE 
	worker2.salary >= worker1.salary) 
ORDER BY 
	worker1.salary DESC;



-- Q-33. Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT 
	salary  AS Max_salary
FROM 
	worker worker1 
WHERE 
	3 >= (SELECT COUNT(DISTINCT salary) 
FROM 
	worker worker2 
WHERE 
	worker2.salary <= worker1.salary) 
ORDER BY 
	worker1.salary;



-- Q-34. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT 
	department, SUM(salary)
FROM 
	worker 
GROUP BY 
	department;



-- Q-35. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT 
	first_name,salary 
from 
    worker
WHERE 
	salary = (SELECT MAX(salary) FROM worker);