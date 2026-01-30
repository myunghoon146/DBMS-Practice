Create Database SelectExpert;
USE SelectExpert;
CREATE TABLE Users (
userid INT NOT NULL PRIMARY KEY,
firstName VARCHAR(20),
lastName VARCHAR(40),
fullName VARCHAR(60),
fullNameUpper VARCHAR(60),
fullNameLower VARCHAR(60),
email VARCHAR(60),
mailId VARCHAR(20),
mailDomain VARCHAR(40),
phoneNoFormat CHAR(11),
phone char(13),
residentNumberNoFormat CHAR(13),
residentNumber CHAR(14),
gender TINYINT DEFAULT 0
);

Select * From Users;

-- Concat(문자열, 문자열, 숫자, 문자, 실수 등등 ...)
Select Concat("참깨빵", "순쇠고기패티두장" "치즈", "양상추", "피클", "양파", "따라따따따") AS 빅맥;

Select Concat(1,2,3,4,5,4,3,2,1);
-- Concat_Ws(값, 값, 값, 값, 값, 값) -- 각 데이터 구분기호추가 

-- firstname, lastname 붙여랑 
Select firstName, lastName, Concat(firstName, " ", lastName) as FullName
From Users;

-- FullName 란에 이렇게 합친 데이터를 업데이트하세요.alter

Select * From Users;
Start Transaction;
Update Users
Set fullName = Concat(FirstName, " ", lastName);
Select * From Users;

Commit;

-- 대문자 만들기 Upper(문자열), 소문자 만들기 Lower(문자열)

Select Upper("SuPer NaTuRal");
Select Lower("LE SSERAFIM");

-- fullName 대문자로, 소문자로 출력하기
Select Upper(fullName) AS FN,
	   Lower(FullName) As LF
From Users;
-- 이렇게 나온 친구들 fullNameUpper, fullNameLower 업데이트 
Select * From Users;       
Start Transaction;
Update Users 
set fullNameUpper = Upper(fullName) and
    fullNameLower = Lower(fullName);

