-- 2026-01-28


-- 테이블 지우기 
-- Drop 지울 타입
Create Table student(
id int Primary Key,
name Varchar(50) Not Null,
phone Varchar(50),
birthday Date
);

SELECT * FROM student

-- Alter(Alternative)
-- 컬럼 추가하기 
-- Alter Table 테이블이름 (Column) 컬럼이름 자료형 제약조건;
-- 제약조건??
-- Not Null => 비면 안돼!!! 꼭 입력해야 할 때
-- Unique => 중복불가 => 같은 값 못들어감
-- Default ? => 입력 안하면 자동으로 ? 세팅됨
-- 마케팅동의 -> 동의안함(0)
-- After 컬럼명 => 컬럼 넣을 때 얘 뒤에 들어감 
-- * Auto_Increment: 값 입력 안하면 자동 증가 
-- 조건: 기본키 또는 Unique여야함. 딱한개만 가능.

-- Age 컬럼 넣기 -> 정수 (소수 X)
Alter Table student Add Column age Int NOT NULL;
-- status > 죽었니 살았니 필수 X
-- 기본값은 죽었다. 
Alter Table student Add Status Varchar(10) Default;
Select * From Student;

-- hp -> 정수형, 기본값 100, 비면 안됨.
Alter Table student Add Column hp Int Default 100 Not Null;

Select*From student;

-- mp -> 정수, 기본값 200, 비어도 됨.

Alter Table student Add Column mp Int Default 200 Not Null;
Select*From student;

-- 추가문제. grade라는 컬럼을 추가하세요.
-- 딱한글자만 들어갈 예정(char 쓰면됨), 비면 안되고 기본값 "A"

Alter Table student Add Column grade char Default "A" Not Null;
Select*From student;
-- 추가문제 2. point라는 컬럼을 추가. 정수형이고 기본값 10000. 벼도됨.
Alter Table student Add Column point Int Default 10000 Not Null;
Select*From student;
-- 추가문제 3.address라는 컬럼을 추가. 최대 100글자, 기본값없음, 벼도됨. 
Alter Table student Add Column address Varchar(100);
Select*From student;

-- 뭔가 일부 지우기 Alter + Drop
-- 문법: Ater Table 테이블 이름 Drop 지울 타입 (지울놈);
-- 지울타입? -> Primary Key, Foreign Key, Column...
ALTER Table student drop hp;
Select*From student;

-- Show Create Table 테이블 이름; 테이블 구조보기 

Show Create Table student;
-- 이제 진짜 지우자
Alter Table student Drop Primary Key;
Alter Table student Add Primary Key(id);
Select*From student;
Alter Table student Add Unique(id);
Select*From student;
Show Create Table student;

-- 컬럼을 추가 수정 제거할 때, 항상 행 전체 확인함.
Alter Table student Add Unique(hp);
Drop Table Products;
CREATE TABLE products (
id INT,
name VARCHAR(100),
price DECIMAL(10, 2),
category VARCHAR(50),
createdDate DATE );

Select*From products;
-- ID컬럼에 Primary key 추가 
-- name에 Unique 추가
-- Password 컬럼을 추가하고, Unique 추가alter

Alter Table products Add Unique(name);
Alter Table products Add Column password Varchar(50);
Alter Table products Add Unique(password);

Select*From products;

Show Create Table products;
-- ID Primary 키 추가
-- Category, Password Varchar 30으로 조정ㄹ
-- createDate Date -> DateTime으로 변경
Alter Table products Modify id int Auto_Increment;
Select * From products;
Insert Into products(name,price,category)
Values("CuteBoy",100,"Human");

Select*From products;

Alter Table Products Modify 
	category Varchar (50) Not Null;
Show Create Table products;
Alter Table products Modify category Varchar(30);
Show Create Table products;













