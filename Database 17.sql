CREATE TABLE Armor (
armorID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
armorName varchar(100) NOT NULL,
armorType INT NOT NULL,
defense INT NOT NULL DEFAULT 1,
rarity VARCHAR(20) NOT NULL,
price INT
) AUTO_INCREMENT=5000;
Use SelectPractice;

Select * From Armor;

update Armor set defense = defense+5 where armorType In(2,3);

SET SQL_SAFE_UPDATES = 0;

-- defense가 30 이상이고 rarity가 Rare 또는 Epic인
-- 데이터들에 대해 defense를 20만큼 줄이시오, price도 50 줄이세요.

update Armor set defense = defense-20, price = price - 50 where defense>=30 And rarity in("Rare","Epic");

Select*From Armor;

-- salePrice(int, default=0) 열을 추가 후,
-- 기존의 price 가격에서 10% 할인된 가격으로 적용하되, 
-- 1의 자리는 0이 되도록 반올림하세요. 

Alter Table Armor Add Column salePrice Int Default 0;

Select * From Armor;

Start Transaction;
Select price, Round(price*0.9, -1) 
From Armor;

Update Armor Set salePrice = Round(price*0.9);
Rollback;
Commit;