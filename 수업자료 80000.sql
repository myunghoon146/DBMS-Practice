CREATE TABLE Armor (
armorID INT PRIMARY KEY,
name VARCHAR(50),
armorType VARCHAR(30),
defense INT,
rarity VARCHAR(20),
price INT
);
Use JoinTest;

CREATE TABLE Weapon (
weaponID INT PRIMARY KEY,
name VARCHAR(50),
weaponType VARCHAR(30),
attackPower INT,
criticalPer FLOAT,
speed FLOAT,
autoAttack BOOLEAN,
rarity VARCHAR(20),
price INT
);

CREATE TABLE Player (
playerID INT PRIMARY KEY,
playerName VARCHAR(50),
PlayerMaxHP INT,
PlayerMaxMP INT,
PlayerWeapon INT,
PlayerArmorHead INT,
PlayerArmorChest INT,
PlayerArmorPants INT,
PlayerArmorShoes INT,
createDate DATE,
FOREIGN KEY (PlayerWeapon) REFERENCES Weapon(weaponID)
ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (PlayerArmorHead) REFERENCES Armor(armorID)
ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (PlayerArmorChest) REFERENCES Armor(armorID)
ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (PlayerArmorPants) REFERENCES Armor(armorID)
ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (PlayerArmorShoes) REFERENCES Armor(armorID)
ON UPDATE CASCADE ON DELETE SET NULL
);
Use JoinTest;
Select * From Armor;
Select * From Weapon;
Select * From Player;


-- 각 사람들이 어떤 무기를 들고있는지 이름이 궁금합니다. 
-- 사람 이름과 무기 이름을 출력하세요. 
-- * 조인할땐 일단 * 전체 출력먼저하세요.!!!

Select Player.playerName, Weapon.name
From Player
Inner Join Weapon
On Player.playerWeapon = Weapon.weaponID;

Select P.playerName, W.price, W.name
From Player as P
Inner Join Weapon as W
On P.playerWeapon = W.weaponID;

-- 각 Player가 사용중인 무기들을 기준으로 그룹화해서 
-- 몇명이 쓰고 있는지 구하세요.

Select W.name, Count(*) As Cnt
From Player as P
Inner Join Weapon as W
On P.PlayerWeapon=W.weaponID
Group By W.name;

-- (추가예제)
-- 개수가 2개 이상만 구하고, F로 시작하는 무기이름은 출력하지마세요. 
Select W.name, Count(*) As Cnt
From Player as P
Inner Join Weapon as W
On P.PlayerWeapon=W.weaponID
Where Left(W.name,1)!="F"
Group By W.name;

-- 추가예제. cnt가 큰순으로 정렬하되, 상위 1개는 건너뛰고 
-- 상위 3개의 결과만 출력하세요.
Select W.name, Count(*) As Cnt
From Player as P
Inner Join Weapon as W
On P.PlayerWeapon=W.weaponID
Where Left(W.name,1)!="F"
Group By W.name
Having Cnt>=2
Order By Cnt Desc
Limit 3 Offset 1;


-- 각 Player별로, 머리에 어떤 것을 쓰고 있는지 궁금하네요.
-- PlayerName과 Armorhead의 name을 같이 출력하세요.

Select P.PlayerName
From Player as P
Inner Join Armor as A
On P.PlayerArmorHead=A.armorID;

-- 추가예제., 각 머리방어구별로 사용하고 있는 Player들의 
-- 평균 MaxHP, 평균 MaxMP를 구하세요. 

Select Avg(PlayerMaxHP), Avg(PlayerMaxMP)
From Player as P
Inner Join Armor as A
On P.PlayerArmorHead=A.armorID
Group By A.name;





