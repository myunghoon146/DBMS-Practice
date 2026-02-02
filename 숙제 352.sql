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

SET SQL_SAFE_UPDATES = 0;
Update Users Set Fullname = concat(firstName+ '  ' + lastName);

Select*From Users;

Update Users Set fullNameUpper = concat(firstName + " "+lastName);

Update Users Set fullNameLower = concat(firstName + "  "+lastName); 

Select char_length(