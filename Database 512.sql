CREATE TABLE Gun (
GunID INT PRIMARY KEY,
GunName VARCHAR(50),
GunType VARCHAR(20), -- 총의 분류(자동소총, 단발소총, 기관총 등)
Caliber VARCHAR(20), -- 총알의 크기
Damage INT, -- 파괴력
Magazine INT, -- 탄창크기
Weight DECIMAL(4,2), -- 무게
FireRate INT, -- 1분당 몇발?
FireMode VARCHAR(20), -- 한발씩? 자동? 반자동? 볼트액션?
Price INT, -- 가격
GunTier VARCHAR(20) -- 커먼, 언커먼, 레어, 에픽 등
);
Use SelectExpert;
Select*From Gun;

Select GunType, Count(*) As Cnt
From Gun
Group By GunType;

-- Caliber별로 각각 몇개씩인지
-- Magazine 별로 각각 몇개씩인지
-- FireMode별로 각각 몇개씩인지 구하세요. 

Select Caliber, Count(*)
From Gun
Group By Caliber;

Select Magazine, Count(*)
From Gun
Group By Magazine
Having Count(*)>=2;

Select Firemode, Count(*) as CNT
From Gun
Group By Firemode
Having CNT>=2;
-- (추가예제) 개수가 너무 적은건 뺍시다. 개수가 2개 이상만 구하세요.
-- (추가예제) Magazine이 100인 너무 이상치(이상한 값)인 것 같습니다. Magazine이 100인건 빼세용.
Select Magazine, Count(*) as CNT
From Gun
Where Magazine!= 100
Group By Magazine
Having Cnt>=2;

-- Cnt "개"라는 문자를 붙이고, Cnt를 기준으로 내림차순 정렬하세요. 

Select Magazine, Concat(Count(*),"개") as Cnt
From Gun
Where Magazine!=100
Group By Magazine
Having Cnt>=2
Order By Count(*) Desc;

-- price 평균도 같이 구하되 소수점이 1자리가 나올 수 있게 반올림!!!!

Select Price, Round(Avg(Price),1) As AvgPrice
From Gun;


-- Uncommon은 빼고, Count의 개수가 4개 이하 조건을 추가하세요. 

Select GunTier, Count(*) as Cnt
From Gun
Where Guntier != "Uncommon"
Group By GunTier
Having Cnt<=4;

-- Gun테이블에서 Magazine별로 개수+개, price평균을 


Select FireMode, Count(*)
From Gun
Group By FireMode;

-- Firemode의 글자 수가 5개 이하인 데이터들에 대해서, 전체 개수가 
-- 2개 이상인 데이터들만 구하세요.

Select FireMode, Count(*) as CNT
From Gun
Where char_length(Firemode)<=5
Group By Firemode;
Having CNT>=2;


-- FireMode으,ㅣ 글자 수가 

Select FireMode, Count(*) as Cnt
From Gun
Where Char_Length(FireMode)<=5
Group By FireMode
Having Cnt>=2;

-- price 의 최대값과 최소값을 추가하고, Firemode 기준으로 오름차순 정렬
-- price의 최대값과 최소값은 10의 자리에서 버림하세요.

Select Firemode, Count(*) As Cnt,
				Truncate(Max(price), -2) As MaxPrice,
                Truncate(Min(price), -2) As MinPrice
From Gun 
Where Char_Length(FireMode)<=5
Group By FireMode
Having Cnt>=2
Order by FireMode Asc;
                

Select Caliber, Count(*) As Cnt,
				Truncate(Avg(Price),0) as AvgPrice,
                Truncate(Avg(Weight),0) As AvgWeight
From Gun
Where InStr(Caliber,".")
Group By Caliber;

-- 데이터 개수가 2개 이상이, Weight의 평균이 2이하인 결과만 추출
Select Caliber, Count(*) As Cnt,
				Truncate(Avg(Price),0) as AvgPrice,
                Truncate(Avg(Weight),0) As AvgWeight
From Gun
Where InStr(Caliber,".")
Group By Caliber
Having Cnt>=2 and AvgWeight<=2;


Select*From Gun;
-- Weight를 1의 단위로 그룹화해서 damage의 평균을 구하세요.
Select Weight, Truncate(weight,1), Avg(damage) As AvgDMg
From Gun
Group By Truncate(weight,1);


Select Truncate(Damage/20, 0)*20 As R, Count(*)
From Gun
Group By Truncate(Damage/20, 0)*20;

-- Price를 500을 기준으로 나눠서 각 개수를 구하세요.

Select Price, Price=500, 
Count From Gun
From Gun;



Select*From Gun; 
-- GunType과 Firemode별로 총기류가 몇정씩 있는지 개수를 구하세요.
-- 이때, 1개짜리 그룹은 나오지 않게 해주시고
-- 개수가 많은 순으로 오름차순. 만약 개수가 같다면, GunType으로 
-- 사전순으로 정렬해서 출력하세요.

Select GunType, Firemode, Count(*) As Cnt
From Gun
Group By GunType and Firemode
Having Cnt>1
Order By Cnt Desc, GunType Asc;

-- Limit x: x행만 출력(위 기준)
-- 가장 가장 마지막에 실행됨(Order By보다 나중)
-- offset과 ㄱ타이 사용 가능(알아오기 숙제)

<숙제>
Group By 모든 문제 풀기
offset의 역할 알아오기


Select*From Gun;
-- GunTier를 기준으로 Damage의 평균을 구한 후
-- 가장 평균이 높은 그룹 하나만 출력하세요.

Select GunTier, Avg(Damage) As AvgDmg
From Gun
Group By GunTier
Order By AvgDmg Desc
Limit 1;

-- (추가예제). 2등이 서운해합니다. 2등만 구합시다.
Select GunTier, Avg(Damage) As AvgDmg
From Gun
Group By GunTier
Order By AvgDmg Desc
Limit 1 Offset 1;


