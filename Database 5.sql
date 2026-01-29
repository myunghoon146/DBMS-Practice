-- 2026-01-29
Create Database SelectPractice;
Use SelectPractice;

CREATE TABLE Armor (
armorID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
armorName varchar(100) NOT NULL,
armorType INT NOT NULL,
defense INT NOT NULL DEFAULT 1,
rarity VARCHAR(20) NOT NULL,
price INT
) AUTO_INCREMENT=5000;

Select * From Armor;

-- Armor 테이블에서 armorName, defense만 알고싶어요.

Select name, defense From Armor;

-- Armor 테이블에서 defense, armorName 만 알고싶어요

Select defense, name from Armor;

-- defense가 30보다 높은 방어구들의 armorName, defense
-- 를 출력하세요.

Select defense, name from Armor where defense>30;

-- defense가 20이상 30이하인 결과들만 armorName, price 출력
Select name, price 
From Armor where defense Between 20 And 30;

-- 1. Price가 1000이상 2000이하인 armorName, defense, price를 구하세요.
-- 2. defense가 10미만이고 5이상인 모든 결과(*)를 출력하세요.
-- 3. rarity가 "Epic" 그리고 defence가 15미만인 모든 결과를 출력하세요.

Select price, name, defense From Armor where price>=1000 and price<=2000;

Select defense From Armor where defense<10 and defense>=5;

Select *
From Armor
Where rarity = "Epic" And defense<15;

-- 모든 데이터를 price가 높은 순으로 정렬해서 출력하세요.
-- 모든 데이터를 defense가 낮은 순으로 정렬해서 출력하세요.
-- armorName을 사전순으로 정렬해서 모든 데이터를 출력하세요.alter

Select * from Armor order by price Asc;

Select * from Armor order by defense Desc;

Select * From Armor order by name Asc, price Desc;


Select * From Armor order by armorType Desc;





-- rarity에 어떤 값들이 있는지 중복 제거(Distinct)해서 출력하세요.
Select Distinct rarity
From Armor;



-- rarity, defense를 중복 제거해서 출력하세요.
Select Distinct rarity, defense
From Armor


-- rarity가 Legendary, Uncommon인 모든 데이터를 출력하세요.

Select*
From Armor
where rarity="Legendary" or rarity = "Uncommon";
-- rarity가 Legendary, Uncommon, Rare인 모든 데이터를 출력하세요.

Select *
From Armor
where rarity="Legendary" or rarity="Uncommon" or rarity = "Rare";
Select* 
From Armor
Where rarity != "Common";

-- 2번째 방법 
Select * 
From Armor
Where rarity In("Legendary", "Uncommon", "Rare", "Epic");

-- 3번째 방법

Select * 
From Armor
Where rarity Not In("Common");
-- 잉 것만 빼고 다!~!!!!

-- armorType이 1, 3인 모든 데이터를 출력하세요.

Select *
From Armor
Where armorType = 1 or armorType =3;

-- armorType이 1,3,4인 모든 데이터를 출력하세요.(in 2가지 방법 사용)

Select * 
From Armor
Where armorType Not In (2);

Select 1235675;
Select "wedjfowdisjfdwi";

Select 10+20+30+40+50;

Select 10/3;
-- 반올림 	Round (데이터, 자릿수) 
-- 버림 Truncate (데이터, 자릿수)


-- 10/3을 소수점 2번째 자리까지 출력(버림)
Select Truncate(10/3, 2);
Select Truncate(10/3, 1);

Select Truncate(10/3, 0);

-- 12345.6789를 정수로 출력하세요. (버림)

Select Truncate(12345.6789, -1);

-- 통계함수 
-- Sum, Avg, Count, Max, Min, Stddev, Variance
-- price에 대해서 합계, 평균, 최대값, 최소값을 출력

Select Sum(price) as 합계, Avg(price) as 평균, Max(price) as 최대값, Min(price) as 최소값
From Armor;

-- 통계 함수 사용시 주의사항 -> 다른 일반 컬럼과 섞어쓰지 말기 

Select Avg(price), defense
From Armor;

-- 부가세 구하기 (10%)
-- price에서 부가가치세를 따로 구하세요(armorName, price, 부가가치세)
Select armorName, price, Round(Truncate(price*0.1, 0), -1) From Armor;

-- armorType이 1이고 defense가 10이상이거나 armorType이 2이고 
-- defense가 15 이상인 모든 데이터를 출력

Select * from Armor where (armorType=1 and defense>=10) or (defense>=15 and armorType=2);

Insert Into 학생(학생ID, 이름, 나이) Values (5,'김철수',16);

Insert Into 도서(책ID, 제목, 저자) Values("B001","SQL 마스터", "박민수");





INSERT INTO Armor (name, armorType, defense, rarity, price) VALUES ('Error Armor', 1, -5, 'Uncommon', -5000);

SELECT*From Armor;


