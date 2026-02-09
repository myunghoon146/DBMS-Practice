Select 이름, 급여
From 직원 
Where 급여> (Select Avg(급여) From 직원);

Select 이름, 구매금액
From 고객 
Where 구매금액 = (Select 구매금액 from 고객 Where 고객 ID = 1001) and 고객_ID !=1001;

Select 직원.이름
From 직원 
Where 부서 (Select 총무부 or 회계부 From 부서명);

Select 이름 
From 사원
Where 급여 All (Select 급여 From 계약직);


Select 이름 
From 고객 
Where 존재하는거만~()에서 뭐라도 나오면 OK

Select 이름 From 고객 
Where Exists("asdfsaf" From 주문 Where 고객.고객번호 = 주문.고객번호)

Select 이름 From 교수 
Where Exists (Select 1 From 강의.과목);

