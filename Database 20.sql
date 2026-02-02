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

-- SubStr(문자열, 몇번째부터, 몇개를)
-- 문자열에서 몇번째부터 몇개를 추출
Select SubStr("ABCDEFG", 2, 3) As R;

-- 깜짝 퀴즈: SubStr("ABCDEFGH", 4, 3) 은 뭐가나오나요?

Select Substr("ABCDEFGH", 4, 3) As R;
Select Substr("ABCDEFGH", 5, 9999) As R;
Select Substr("ABCDEFGH", 5, 4) As R;
Select Substr("ABCDEFGH",1,1) as R;

Select SubStr("ABCDEFGH", 2, Instr("ABC", "C"));

-- 핸드폰 번호가 있는 phoneNoFormat에서
-- 전화번호 앞자리, 중간자리(4), 뒷자리(4)를 재주껏 추출핫에ㅛ.alter
Select Substr("01075862953", 4,4);

Select Substr("01075862953", 8, 4);

Select Left(phoneNoFormat,3) as Front,
		Substr(phoneNoFormat, 4, 4) As Mid,
        Right(phoneNoFormat, 4) As End
From Users;

-- 이상하게 (left, right만 사용)
Select Right(PhoneNoFormat, 4) As End,
		Right(Left(phoneNoFormat, 7),4) As Mid,
        Left(phoneNoFormat, 4) As Frot
From Users;

-- SubStr만 사용하기
Select SubStr(PhoneNoFormat, 1, 3) as Front,
subStr(phoneNoFormat, 4, 4) as Middle,
subStr(phoneNoFormat, 8, 4) as End
From Users;

-- 반복하기 Repeat 

Select Repeat("시공조아",99);


Select Left(firstname, 1) As R
From Users;

Select Right(firstName, 1) As R
From Users;

-- firstname첫글자 + ***** + firstname 끝글자

Select concat(Left(firstname, 1) + Repeat('*',5) + Right(firstName,1)) As R
From Users;

-- IF 문 사용
-- IF(조건식, 조건식이 맞으면 여기, 조건식이 틀리면 여기) -> 둘중하나 값
Select*From Users;

-- email에서 yahoo가 있을경우, "야호", 아니면 "-"를 출력하세요. 

Select IF(Instr(email, "yahoo")=0, "-", "야~~호")
From Users;

-- email에서 gmail이 있으면 "꾸글", "-"
-- email길이가 20이상이면 "너무길어" 아니면 "너무 짧아" 출력
-- Firstname의 첫글자가 "R"이면 "R씨", 아니면 "-" 출력

Select IF(Instr(email,"gmail"), "꾸글", "-")
From Users;

Select IF(char_length(email)>=20, "너무길어", "너무짧아")
From Users;

Select IF(Instr(firstName, "R"), "R씨", "-")
From Users;


-- 999999-1111111
Select IF(SubStr(residentNumberNoFormat, 8, 1)=1, "남자", "여자") As MI6
From Users;

-- 중첩 IF
-- 이런거도 가능 IF( 조건식, IF(조건식, 참 거짓), 거짓인 경우 
-- 이런거도 가능 IF( 조건식, 참인경우ㅡ, IF(조건식, 참, 거짓))
-- IF(조건식, IF(조건식, 참, 거짓), IF(조건식, 참, 거짓))

-- userID가 50이상인 경우, userID가 75이상이면 "A", 아니면 "B"
-- userID가 50이상이 아닌 경우 userID가 25이상이면 "C", 아니면 "D"

Select IF(char_length(userID)>=50,IF(char_length(userID)>=75,"A","B")or IF(char_length(userID)>=25, "C", "D"))
From Users;

