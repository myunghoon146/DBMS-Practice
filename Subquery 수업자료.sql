SET GLOBAL local_infile = 1; 
Create Database SubQuery;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Player_Large.csv'
INTO TABLE Player
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

Create Table Player (
playerId Int Primary Key,
playerName Varchar(50),
level Int,
JoinDate Date
);

Create Table Item (
itemId Int Primary Key,
itemName Varchar(50),
rarity Varchar(20),
price Int
);

SET GLOBAL local_infile = 1; 
Create Database SubQuery;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Item_Large.csv'
INTO TABLE Item
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 


SET GLOBAL local_infile = 1; 
Create Database SubQuery;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Inventory_Large.csv'
INTO TABLE Inventory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 


Create Table Inventory (
inventoryId Int Primary Key,
playerId Int,
itemId Int,
quantity Int,
Foreign Key (playerId) References Player(playerId),
Foreign Key (itemId) References Item(itemId));

SET GLOBAL local_infile = 1; 
Create Database SubQuery;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Quest_Large.csv'
INTO TABLE Quest
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

Create Table Quest (
questId Int Primary Key,
questName Varchar(50),
rewardItemId Int,
difficulty Varchar(20),
Foreign Key (rewardItemId) References Item(itemId));





