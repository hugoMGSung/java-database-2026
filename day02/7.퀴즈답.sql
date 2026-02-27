-- 1. employee 테이블에서 직원명과 급여를 조회하세요.
-- 직원명은 "이름", 급여는 "월급"이라는 별명으로 변경하세요. 급여가 높은 순으로 정렬하세요.
SELECT e.EMP_NAME AS "이름"
     , e.SALARY AS "월급"
  FROM EMPLOYEE e
 ORDER BY e.SALARY DESC;

-- 2. customer 테이블에서 도시가 'seoul'인 고객만 조회하세요.
-- 고객명은 "고객이름", reg_date 는 "가입일"로, 가입일이 최근 순으로 정렬하세요.
SELECT c.CUST_NAME AS "고객이름"
     , c.REG_DATE AS "가입일"
  FROM CUSTOMER c
 WHERE c.CITY = 'Seoul';

-- 3. product 테이블에서 가격이 10,000이상 30,000 이하인 상품을 조회하세요.
-- "상품명", "판매가"로 별명을 사용하고, 가격이 낮은 순으로 정렬하세요.
SELECT p.PROD_NAME AS "상품명"
     , p.PRICE AS "판매가"
  FROM PRODUCT p 
 WHERE p.PRICE BETWEEN 10000 AND 30000
 ORDER BY p.PRICE ASC;

SELECT p.PROD_NAME AS "상품명"
     , p.PRICE AS "판매가"
  FROM PRODUCT p 
 WHERE p.PRICE >= 10000
   AND p.PRICE <= 30000
 ORDER BY p.PRICE ASC;