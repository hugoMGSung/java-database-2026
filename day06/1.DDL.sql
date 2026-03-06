-- DDL - CREATE 
CREATE TABLE dept_ddl (
	deptno 	number(2),
	dname  	varchar2(14),
	loc 	varchar2(13)
);

-- DROP
DROP TABLE dept_ddl;

-- DDL용 테이블 복사
CREATE TABLE emp_alter
    AS SELECT * FROM emp;

SELECT * FROM emp_alter;

-- ALTER - 테이블 변경(컬럼명 변경, 컬럼 추가, 컬럼 삭제 ...)
ALTER TABLE emp_alter
  ADD PHONE varchar2(20);

-- ALTER 여러 컬럼 추가
ALTER TABLE emp_alter
  ADD (
      FAX varchar2(20),
      email varchar2(100),
      address varchar2(200)
);

-- Alter 컬럼(열)이름 변경
ALTER TABLE emp_alter
  RENAME COLUMN PHONE TO TEL;

-- ALTER 컬럼(열) 자료형 변경
ALTER TABLE emp_alter 
  MODIFY empno NUMBER(8);

-- ALTER 특정컬럼 삭제 
ALTER TABLE emp_alter 
 DROP COLUMN fax;

-- 여러컬럼 삭제시는 COLUMN 키워드 대신 소괄호사용
ALTER TABLE emp_alter 
 DROP (
 	email, address
);

-- RENAME 객체이름 변경
RENAME emp_alter TO emp_rename;

-- TRUNCATE 객체중 테이블 데이터 초기화(완전삭제)
-- COMMIT, ROLLBACK 안됨(트랜잭션 불가)
SELECT * FROM emp_rename;

TRUNCATE TABLE emp_rename;