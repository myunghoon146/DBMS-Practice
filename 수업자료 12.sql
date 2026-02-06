-- 2026-02-06
-- NULL 진도 - 데이터는 다 넣어졌죠?? 

Use NullTest;
Select*From employee_null;

-- IFNULL(값또는 필드, 널이면이거실행)
-- email 비어있거나 Null이면 default@naver.com
-- update en set email ==""
-- where email= "default@naver.com";

SET SQL_SAFE_UPDATES=0;

Select *
From employee_null
Where email Is Null or email = "";

-- 빈칸 검색하기
Select * 
From employee_null
Where email = "";

Select *
From employee_null
Where email Is Null or email = "";
Start Transaction;
Update employee_null Set email = "default@naver.com"
Where email Is Null or email = "";

Select*From employee_null;
Commit;

-- IFNULL(값또는 필드, 널이면 이거)
-- salary가 없으면 2500 아니면 있는거 출력하세요. 

Select IFNull(salary, 2500) As Salary
From employee_null;

Select NullIf(10,10);

Select NullIf(title, "Assistant") AS Title
From employee_null;
Start Transaction;
Update employee_null Set title="Fire" Where title Is Null;

Select * From employee_null;
Commit;

-- 그럼 한번에는 어떻게 하는데??
Start Transaction;
Update employee_null Set title = IfNull(NullIf(title, "Assistant"),"Fire");

Update employee_null Set title = If(NullIf(title, "Assistant") Is Null, "Fire",title);

Select * From employee_null;

-- 급여계산 
Select * From employee_null;


Select Coalesce(salary+bonus, salary, bonus, 50) As salbonus
From employee_null;

-- -----------------------------------------
use JoinTest;

-- 4개 테이블 순서주의!!!
-- Customer -> Payment, Coupon, Review 

Create Table Customer ( -- > Customer.csv
customerId Int Primary Key,
customerName Varchar(50),
email Varchar(100),
joinDate Date
);

Create Table Payment ( -- > Payment.csv
paymentId Int Primary Key,
customerId Int,
amount Int,
paymentDate Date,
Foreign Key (customerId)
References Customer(customerId)
);

Create Table Coupon ( -- > Coupon.csv
couponId Int Primary Key,
customerId Int,
couponCode Varchar(30),
discount Int,
Foreign Key (customerId)
References Customer(customerId)
);

Create Table Review ( -- > Review.csv
reviewId Int Primary Key,
customerId Int,
product Varchar(50),
rating Int,
Foreign Key (customerId)
References Customer(customerId)
);

Use JoinTest;

Select C.customerName, P.amount
From Customer C
Left Outer Join Payment P On C.customerID = P.customerID;


Select C.customerID, count(paymentID)
From Customer C
inner join Payment P
On C.customerID = P.customerID 
Group By C.customerID;

Select * From Payment Order By CustomerID Asc;

-- Customer, Review, Coupon 
-- 쿠폰이 없는 고객들에게 쿠폰을 주려고 합니다. 
-- 한번도 쿠폰을 받지 못한 고객 이름을 출력하세요.

Select customerName
From Customer C
Left Outer Join Coupon CP
On C.customerID = CP.customerID
Where couponId is Null;


Select customerName
From Customer C
Left Outer Join Coupon CP
On C.customerID = CP.customerID
Where couponId is Null;

-- (추가예제) 그러면, 쿠폰을 한번이라도 받은 적이 있는 사람은 몇명일까요?alter
Select C.customerID
From Customer C
Left Outer Join Coupon CP
On C.customerID = CP.customerID
Where couponId is Not Null;
Group By C.customerID;


-- "모든" 고객들 중에서 결제를 한 적은 없는데 쿠폰은 있는 회원을 구하세요.
-- 당장 영업팀에 리스트 넘겨야 겠습니다.

Select C.customerID, C.customerName, CP.couponID, CP.customerID
From Customer
Where P.paymentID is Null;


Select * 
From Customer C
left Outer Join Payment P
On C.customerID = P.customerID
Left Outer Join Coupon CP
On c.customerID = CP.customerID
Where P.paymentID IS NULL And CP.couponID is not null
Group By C.customerID;


-- 심화 숙제 
-- 결제한 적도 없고, 쿠폰도 없고, 근데 리뷰는 남긴 사람은???
-- 이사람들은 좀 확인을 해봐야 겠습니다. 몇명인지 구하세요. 

-- 쿠폰을 여러 개 가지고있는 고객들을 출력하세요. 
-- 외부조인(이거로)? 내부조인? 

Select C.customerName, Count(*)
From Customer C
Left Outer Join Coupon CP 
On C.customerID=CP.customerID
Where CP.couponId Is NOt Null
Group By C.customerID
Having Count(*) >=2;

-- (추가예제)를 개수가 많은 순으로 구하고, 최대 3명까지만 촐력하세요.alter
Select C.customerName, Count(*)
From Customer C
Left Outer Join Coupon CP 
On C.customerID=CP.customerID
Where CP.couponId Is Not Null
Group By C.customerID
Having Count(*) >=2
Order By Count(*) Desc
Limit 3;

-- (추가예제)를 개수가 많은 순으로 구하고, 최대 3명까지만 출력하세요. 
-- (추추가예제) 만약 개수가 같은 경우, 가입일이 빠른 사람을 우선순위로ㅓ!!

-- Customer 테이블이랑 Payment 테이블 조인할래용




