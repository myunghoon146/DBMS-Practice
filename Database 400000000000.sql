-- 2026-02-05
-- * 대성쓰, Armor2개 조인, 연속 조인 진행 필요
-- OuterJoin 진행 해야함.

-- 사용자가 착용중인 신발 뭐 신고 있는지 이름이 궁금해요!!! 이름 + 장비이름(신발)
Use JoinTest;
Select * From Armor;
Select * From Player;
Select * From Weapon;

Select *
From Player P
Inner Join Armor A
On P.playerArmorShoes= A.armorID;

Select *
From Player;
-- playerArmorHead, playerArmorChest의 장비이름과 사람 이름 같이 출력 



-- 사람 이름 + 무기 이름 + 머리 방어구이름 + 신발방어구 이름

Select P.playerName, W.name, A.name, A2.name
From Player P
Inner Join Weapon W
On P.PlayerWeapon = W.weaponID
Inner Join Armor A
On P.PlayerArmorHead = A.armorID
Inner Join Armor A2
On P.PlayerArmorShoes = A2.armorID;


Select 고객.이름, 주문.주문금액 
From 고객 Left Outer Join 주문 On
From 주문 right Outer Join 고객 On;



Select 직원.이름, 부서.부서명 
From 직원 
Right Outer Join 부서 on 직원.부서ID = 부서.부서ID;

Select 학생.이름, 수업.수업명 From 학생
Left Outer Join 수강 On 학생.학생ID = 수강.학생ID;


Select*From Armor;
Select * From Weapon;
Select * From Player;

-- 모든 무기에 대해 "한번도 사용안된" 무기 이름만 출력하세요

Select *
From Weapon W
Left Outer Join Player P
On W.weaponID = P.playerWeapon
Where P.playerID Is Null
Order By P.playerID Desc;



select Sum (col1) + sum(col3) + sum(col5) As Result from Test;

Select IFNull(급여, "미정")
From 직원;

Select NVL(급여, "미정")
From 직원;

Coalesce(값,값,값,값)
-- 왼쪽부터 쭉 돌아가며 null 아닌거 출력하고 끝
Coalesce(핸드폰번호, 집전화번호, 비상연락처, "확인필요") From 회원 

Select Coalesce(닉네임, 사용자명, "익명") From 회원






