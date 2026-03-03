-- sum 합산 함수
SELECT sum(salary)
  FROM EMPLOYEE;

-- 아무 의미 없음
SELECT sum(dept_id)
  FROM EMPLOYEE;

-- 각 레코드(한 줄, 로우, 행)로 개수를 구할 수 있음
SELECT count(*)
  FROM EMPLOYEE;

-- 특정 컬럼의 갯수로 구할 수 있음
SELECT count(DISTINCT dept_id)
  FROM EMPLOYEE;

-- salary 합산 596,490 
-- salary 개수 97
-- 전체 데이터 100
SELECT avg(salary)
  FROM EMPLOYEE;

SELECT min(salary), max(salary)
  FROM EMPLOYEE;

-- min, max는 날짜도 가능
SELECT min(HIRE_DATE), max(HIRE_DATE)
  FROM EMPLOYEE;

SELECT min(EMP_NAME), max(emp_name)
  FROM EMPLOYEE;
