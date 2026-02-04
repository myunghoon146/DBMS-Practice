Create Database JoinTest;
Use JoinTest;



CREATE TABLE Departments (
departmentID INT PRIMARY KEY,
departmentName VARCHAR(50)
);


CREATE TABLE Students (
studentID INT PRIMARY KEY,
studentName VARCHAR(30),
departmentID INT,
Constraint fkStuDepID Foreign Key(departmentID) References Departments(departmentID)
On Delete Set Null
On Update Cascade
);

Select * From Departments;
Select * From Students;

Start Transaction;

Insert Into Students(studentID, studentName, DepartmentID) 
Values(2000, "kds", 100);

Select * From Students;

Rollback;

Delete From Students Where studentID=2000;

Select * From Students;

Start Transaction;

Select * From Departments;
Start Transaction;

Update Departments Set departmentID = 3000
Where departmentID =100;

Select * From Departments;

Select * From Students;

Show Create Table Students;

Start Transaction;

Delete From Departments Where departmentID = 100;
Select * From Departments;

Rollback;

Select * From Students Join Departments;

Select * 
From Students, Departments 
Where Students.departmentID = Departments.departmentID
Order By studentID Asc;

-- 같은 이름의 컬럼이 있으면 테이블 이름 반드시 명시 필요: 테.컬

Select*
From Students
Join Departments
On Students.departmentID = Departments.departmentID;



