-- 곱셉연산자, 비교연산자
-- 동등연산자 = (== 아님!)
SELECT emp_name, salary, salary * 12 AS "ANNUAL", hire_date
  FROM employee
 WHERE (salary * 12) <> 37248; 

-- NOT
SELECT emp_name, salary, salary * 12 AS "ANNUAL", hire_date
  FROM employee
 WHERE NOT (salary * 12) = 37248; 

-- IN = OR와 동일
SELECT e.*
  FROM EMPLOYEE e 
 WHERE e.DEPT_ID = 1 OR e.DEPT_ID = 4;

SELECT e.*
  FROM EMPLOYEE e 
 WHERE e.DEPT_ID NOT IN (1, 4);

-- BETWEEN
-- hire_date는 날짜형이지만 날짜타입의 문자열과 비교가능
-- 2022한해동안 입사한 직원정보 조회
SELECT * 
  FROM EMPLOYEE e 
 WHERE e.HIRE_DATE >= '2022-01-01'
   AND e.HIRE_DATE <= '2022-12-31';


SELECT * 
  FROM EMPLOYEE e 
 WHERE e.HIRE_DATE BETWEEN '2022-01-01' AND '2022-12-31';

SELECT * 
  FROM EMPLOYEE e 
 WHERE e.salary BETWEEN 3000 AND 6000;

-- LIKE - 문자열에 패턴을 검색
-- % _  중 현업에서는 % 제일 많이 사용
-- Seoul : _eo___ , %eo%, _eo% 전부 동일하게 검색
SELECT *
  FROM customer
 WHERE city LIKE '%eo%';

-- NULL 비교
-- empty와 다름!!!
SELECT *
  FROM CUSTOMER
 WHERE city IS NULL;  -- '' empty 와 다름 

 
-- 집합연산
-- 가상테이블 - 조인, 유니온처럼 쿼리 결과로 나오는 테이블
SELECT PROD_NAME, PRICE
  FROM PRODUCT
 WHERE PRICE >= 45000
 UNION -- UNION ALL 은 중복제거없이 모두 출력
SELECT EMP_NAME, SALARY
  FROM EMPLOYEE 
 WHERE SALARY >= 9000;

-- 교집합 UNION 대신 INTERSECT 사용









 







