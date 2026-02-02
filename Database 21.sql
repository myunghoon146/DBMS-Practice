-- 2026-02-02
-- 글자수 세기
-- char_length(문자열) -> 문자 개수 
-- length(문자열) -> 바이트 기준길이 (한글 영어 크기 다름)
Select char_length("안녕 123 abc");
Select Length("안녕 123 abc");

-- 한글은 한 글자당 3바이트. 나머지는 1바이트씩.

-- Left, Right(문자열, 개수)
Select Left("ABCDFEFGHIJKL",5);
Select Right("ABCDEFGHIJKL",5);

-- 함수 이뿌게 잘 만드는법
-- (괄효 열었으면 한칸 띄우기)
-- , 콤마 했으면 한칸 띄우기

Select Char_length(Right(Left("ABCDEFGHIJKL",5),3))


-- inStr(문자열, "찾을놈") -> 찾을 놈이 몇번째(없으면 0)
Select Instr("ABCDE","D"); -- D는 4번째 있음.

Use SelectExpert;

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

Use SelectExpert;
Select*From Users;

Select firstName, lastname
From Users
Where char_length(firstName)>=5;

-- firstName과 lastName의 글자개수를 합쳐서 10이하인
-- 사람들만 모두 출력


Select*
From Users
Where char_length(firstName)+char_length(lastName)<=10;\

Select firstName + lastName From Users;


-- firstName에서 왼쪽 2글자, lastName 오른쪽 3글자를 
-- concat으로 합쳐서 출력하긔~~~~~~~~

Select Concat(Left(firstName,2), Right(lastName, 3)) As R
From Users;

-- email에서 gmail을 찾고, 몇번째에 있는지 출력하세용(각각)


Select email, InStr(email,"gmail") As R
From Users;

Select email, InStr(email, "hotmail") As R
From Users
Where Instr(email, "hotmail") !=0;

Select email, InStr(email, ".com") As R
From Users;

-- 추가 예저 > .com의 위치가 18이상인 결과만 구하세요.



Where email, Instr(email, ".com") >= 18;


Select email, InStr(email, "@") As R
From Users;

Select email, Instr(email,"@")-char_length(email) as R
From Users;


-- 전체길이 -@의 위치를 통해서 뒷부분의 길이만큼 Right로 추출하세요. 
-- @의 위치를 이용해서 Left로 앞부분만 구하세요.

Select Char_Length(email)-instr()


