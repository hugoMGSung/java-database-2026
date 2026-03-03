-- DECODE 함수
-- 1 HR 2 sales 3 IT 4 marketing
SELECT emp_id
     , emp_name
     , dept_id
     , salary
     , DECODE(dept_id, 
              1, salary * 1.5, 
              2, salary * 1.1, 
              3, salary * 1.8, 
              4, salary * 1.0) AS bonus
  FROM employee;


-- CASE문 DECODE가 함수라면, CASE는 IF와 같은 구문
-- decode는 오라클함수. 다른 DB에서는 CASE문 사용해야
SELECT emp_id
     , emp_name
     , dept_id
     , salary
     , CASE dept_id
     	WHEN 1 THEN salary * 1.5
     	WHEN 2 THEN salary * 1.1
     	WHEN 3 THEN salary * 1.8
     	WHEN 4 THEN salary * 1.0
       END AS bonus
  FROM employee;