-- 2026-01-30 금요일 방특
CREATE TABLE Armor (
armorID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
armorName varchar(100) NOT NULL,
armorType INT NOT NULL,
defense INT NOT NULL DEFAULT 1,
rarity VARCHAR(20) NOT NULL,
price INT
) AUTO_INCREMENT=5000;

Select * From Armor;
use SelectPractice;

Insert Into Armor(armorName, armorType, defense, rarity, price) 
Values ('Diamond Helmet', 1, 24, 'Uncommon', 1045);

Insert Into Armor(armorName, armorType, defense, rarity, price)
Values('Diamond Chestplate', 2, 21, 'Common', 1421);


Create Table Test(id int); 
Select * From Test;

Insert Into Test(id) Values(1);

Select*From Test;
Rollback;

Start Transaction;
Insert Into Test(id) Values(2);

Select*From Test;

Rollback;


Insert Into Test(id) Values(3);
Select * From Test;

Rollback;

Update armor set rarity = 'Legend' where rarity = 'Legendary';

SET SQL_SAFE_UPDATES = 0;
Select * From Armor;
Select * From Armor;
Update armor set rarity ="Uncom" Where rarity = "Uncommon";
commit;

Select * From Armor;

-- 백업하는 방법
-- 테이블 우클릭 -> Table Data Export Wizard



-- price가 1000 이하 그리고 armorType 1,2 
Delete From Armor Where price<=1000 And armorType In(1,2);
Select * From Armor;

-- armorID가 5010~5019인 데이터를 모두 삭제
Delete From Armor Where armorID Between 5010 And 5019;

Select * From Armor;


