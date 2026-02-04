-- 2026-02-04
Use SelectExpert;
Select * From Users;

-- lastName이 C로 시작하는 사람들을 모두 출력 
-- lastName에서 z를 포함하는 모든 사람을 출력
-- firstName에서 5글자인 모든 사람을 출력

Select*
From Users
Where lastName Like "C%";



Select*
From Users
Where lastName like "%z%";

Select*
From Users
Where firstName like "_____";


