-- 정렬
-- 내림차순 - 우리회사에서 가장 월급이 많은 사람부터
SELECT *
  FROM EMPLOYEE e
 ORDER BY e.SALARY DESC;

-- 우리회사가 가장 먼저 입사한 사람부터
SELECT *
  FROM EMPLOYEE e
 ORDER BY e.hire_date ASC;

-- 부서별 정리
SELECT *
  FROM EMPLOYEE e
 ORDER BY e.dept_id ASC;

-- 부서별 급여가 많은 직원 조회
SELECT *
  FROM EMPLOYEE e 
 ORDER BY e.dept_id ASC, e.SALARY DESC;

