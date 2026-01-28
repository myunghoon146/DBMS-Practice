CREATE TABLE alterDropExercise(
id Int PRIMARY KEY Auto_Increment,
userPid Int Not Null UNIQUE,
name VARCHAR(30) NOT Null,
signupDate DATE COMMENT '가입날짜',
phoneNumber Varchar(30) UNIQUE,
address Varchar(100),
grade CHAR(1),
status TINYINT DEFAULT 0);

Select * From alterDropExercise;

Alter Table alterDropExercise Drop Column signupDate;

Select * From alterDropExercise;

Alter Table alterDropExercise Drop Column grade;

Select * From alterDropExercise;

Alter Table alterDropExercise Drop Index phoneNumber;

Select * From alterDropExercise;

Alter Table alterDropExercise Drop Primary Key;

-- 에러 발생!!! > ~~~~~ auto column: Auto_Increment 제거!
-- Auto_Increment: Primary key, Unique 중 하나 필요

Alter Table alterDropExercise Modify Id int;
Show Create Table alterDropExercise;

Drop Tables student;