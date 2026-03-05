-- 트랜잭션

-- DEPT테이블 복사 
CREATE TABLE dept_tcl
    AS SELECT * 
         FROM dept;

SELECT * FROM dept_tcl;
SELECT * FROM emp_temp;

-- 트랜잭션 시작
COMMIT;

INSERT INTO dept_tcl (deptno, dname, loc)
VALUES (60, 'UNIT TEST', 'DELI');

ROLLBACK;

-- 트랜잭션 시작2
INSERT INTO dept_tcl (deptno, dname, loc)
VALUES (60, 'UNIT TEST', 'DELI');

UPDATE dept_tcl SET loc = 'BUSAN' 
 WHERE deptno = 40;

DELETE FROM dept_tcl WHERE dname = 'RESEARCH';

DELETE FROM emp_temp WHERE empno = 9999;

SELECT * FROM dept_tcl;
SELECT * FROM emp_temp;

COMMIT;
ROLLBACK;

DELETE FROM emp_temp;

SELECT * FROM emp_temp;

-- 세션, 락
SELECT * FROM dept_tcl;

UPDATE dept_tcl
   SET loc='MANILA'
 WHERE deptno = 60;

COMMIT;

-- 락2
DELETE FROM dept_tcl
 WHERE deptno = 60;

ROLLBACK;

