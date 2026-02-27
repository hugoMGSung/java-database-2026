-- 조건없는 쿼리
SELECT * 
  FROM PRODUCT;

-- prod_id가 108번인 품목 조회
SELECT * 
  FROM PRODUCT
 WHERE prod_id = 108;

-- employee에서 dept_id 가 2번인 직원만 조회
SELECT *
  FROM EMPLOYEE e 
 WHERE e.DEPT_ID = 2;

-- emplyoee에서 dept_id 가 4번이고 월급이 5992달러인 직원 조회
SELECT * 
  FROM employee e
 WHERE e.dept_id = 4
   AND e.SALARY = 5991;

-- or 연산자, employee에서 dept_id가 1또는 4인 직원들 조회
SELECT * 
  FROM employee e
 WHERE e.dept_id = 1
    OR e.DEPT_ID = 4;