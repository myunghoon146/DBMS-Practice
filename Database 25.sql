-- 2026-02-03
Use SelectExpert;
-- Case 조금하기
-- Group By 진행(꼭)

Select * From Users;


-- userID가 20이하면 A, 40 이하면 B, 6 이하면 C 나머지를 D로 출력 

Select IF(userID<=20, "A", 
			IF(userID<=40, "B", IF(userID<=60, "C", "D"))) As R
From Users;

-- Case. When Thewn만 기억하자 왠댄왠댄 왠댄

Select 
	Case
		When userID<=20 Then "A"
        When userID<=40 Then "B"
        When userID<=60 Then "C"
        Else "D"
	End As R
From users;    

-- firstName이 K로 시작 D로 시작 S로 시작 순 결과 출력

Select 
	Case 
		When Left(firstName,1)="K" Then 1
        When Left(firstName,1)="D" Then 2
        When Left(firstName,1)="S" Then 3
        Else 4
    End As firstName From Users;
    
Select 점수 Avg(점수) as 학생점수 
From 학생
Group By 학기;

Select 수당금액 Avg(수당금액) as 평균수당금액
From 직원수당
Group By 부서
Having Avg(수당금액)>=100000;

Select 
From 학교출석
Where 출석여부 

Select 지점명
From 매출내역 
Group By 카테고리='식품'
Having Sum(판매금액)


