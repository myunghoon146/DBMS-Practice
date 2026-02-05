Create Database NullTest;
CREATE TABLE Employee_Null (
employeeName VARCHAR(50),
department VARCHAR(50),
title VARCHAR(20),
salary INT,
email VARCHAR(100),
phone VARCHAR(20),
gender CHAR(1),
bonus INT,
joinDate DATE);
Use NullTest;
Select * From Employee_Null;


Set SQL_SAFE_UPDATES=0;
SET GLOBAL local_infile = 1;	-- Infile 설정 켜기
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NullPractice.csv'
INTO TABLE Employee_Null
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(employeeName,@department,title,@salary,@email,@phone,@gender,@bonus,@joinDate)
SET
department = NULLIF(@department,''),
salary = NULLIF(@salary,''),
email = NULLIF(@email,''),
phone = NULLIF(@phone,''),
gender = NULLIF(@gender,''),
bonus = NULLIF(@bonus,''),
joinDate = str_to_date(@joinDate, '%Y-%m-%d');

Select * From Employee_Null;

-- 전체 행 개수를 구하세요.
-- employeeName의 개수를 구하세요. 
-- department의 행 개수를 구하세요.
-- salary의 행 개수를 구하세요.

Select Count(*) From Employee_Null;

Select Count(employeeName) From Employee_Null;

Select Count(department) From Employee_Null;

Select Count(salary) from Employee_Null;

-- 급여가 없는 사람 이름을 구하세요.
Select employeeName
From Employee_Null
Where salary Is Null;

-- IFNull 
-- email이 없는 친구들은 "default@naver.com"으로 설정

Select email, IFNull(email,"default@naver.com") 
From employee_Null
Where email is Null; 

Start Transaction;
Update Employee_Null Set email = "default@naver.com"
Where email is Null;

Select email
From Employee_Null;
