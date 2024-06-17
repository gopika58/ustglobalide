-- Create Worker table
CREATE TABLE Worker (
    WORKER_ID INT IDENTITY(1,1) PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- Insert data into Worker table
INSERT INTO Worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
    ('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
    ('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
    ('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
    ('Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
    ('Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
    ('Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
    ('Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
    ('Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

-- Create Bonus table
CREATE TABLE Bonus (
    BONUS_ID INT IDENTITY(1,1) PRIMARY KEY,
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

-- Insert data into Bonus table
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES
    (1, 5000, '2020-02-16'),
    (2, 3000, '2011-06-16'),
    (3, 4000, '2020-02-16'),
    (1, 4500, '2020-02-16'),
    (2, 3500, '2011-06-16');

-- Create Title table
CREATE TABLE Title (
    TITLE_ID INT IDENTITY(1,1) PRIMARY KEY,
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

-- Insert data into Title table
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
    (1, 'Manager', '2016-02-20 00:00:00'),
    (2, 'Executive', '2016-06-11 00:00:00'),
    (8, 'Executive', '2016-06-11 00:00:00'),
    (5, 'Manager', '2016-06-11 00:00:00'),
    (4, 'Asst. Manager', '2016-06-11 00:00:00'),
    (7, 'Executive', '2016-06-11 00:00:00'),
    (6, 'Lead', '2016-06-11 00:00:00'),
    (3, 'Lead', '2016-06-11 00:00:00');


	SELECT UPPER(first_name) from Worker
	select DISTINCT(department) from worker
	SELECT LEFT(first_name,3) from Worker
	select PATINDEX('%a%',first_name) from	worker where first_name='Amitabh'
	select Distinct(department),len(department) from worker
	select * from Worker order by FIRST_NAME asc,
	 DEPARTMENT desc
	 select* from Worker where FIRST_NAME='vipul' or FIRST_NAME='Satish'
	 select* from Worker where FIRST_NAME like '%a%'
	 select* from Worker where FIRST_NAME like'_____h'
	 select* from Worker where SALARY>100000 and SALARY<500000
	 select* from worker where  MONTH(joining_date)='2'and year(joining_date)='2014'

	 select count(first_name) from Worker where department='admin'
	 select* from Title
	 select count(first_name) tcount,DEPARTMENT from Worker group by DEPARTMENT order by tcount desc
	 select * from Worker w inner join Title t on w.WORKER_ID=t.WORKER_REF_ID where t.WORKER_TITLE='manager' 

	 select* ,count(*)  from Title group by TITLE_ID,WORKER_REF_ID,WORKER_TITLE,AFFECTED_from having count(*)>1
	 select* from Bonus

	 select* from worker w  inner join Bonus b on w.WORKER_ID=b.WORKER_REF_ID 
       select* from worker where worker_id not in(select worker_ref_id from bonus )
select* top(2) from worker order by salary desc