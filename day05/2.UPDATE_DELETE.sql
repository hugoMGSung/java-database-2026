-- DML - UPDATE

-- dept_temp2 생성
CREATE TABLE dept_temp2
    AS SELECT * FROM dept;

-- 확인 조회
SELECT * FROM dept_temp2;

-- 전체데이터 수정! (조심)
UPDATE dept_temp2
   SET loc = 'SEOUL';

-- DELETE FROM dept_temp2;

INSERT INTO dept_temp2 (deptno, dname, loc)
SELECT deptno, dname, loc
  FROM dept;


-- 일반적인 UPDATE
UPDATE dept_temp2
   SET loc = 'BUSAN'
 WHERE deptno = 40;

-- 서브쿼리로 업데이트
UPDATE dept_temp2
   SET loc = 'LOS ANGELUS'
 WHERE deptno = (SELECT deptno
                   FROM dept_temp2
                  WHERE dname = 'OPERATIONS');

SELECT * FROM dept_temp2;


-- DML - DELETE
SELECT * FROM emp_temp;

-- JOB이 CLERK(사무원)인 데이터 삭제
-- 1. SELECT문으로 WHERE절로 조회하고 
SELECT * FROM emp_temp
 WHERE job = 'CLERK';

-- 2. SELECT *을 DELETE로 변경, 실행
DELETE FROM emp_temp
 WHERE job = 'CLERK';

