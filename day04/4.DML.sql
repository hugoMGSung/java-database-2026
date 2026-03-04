-- DML

-- DEPT 테이블 복사 DEPT_TEMP 만들기
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

-- 조회
SELECT * FROM dept_temp;

-- MARKETING 추가
INSERT INTO DEPT_TEMP (deptno, dname, loc)
VALUES (50, 'MARKETING', 'SEOUL');

-- 에러 - 컬럼갯수와 데이터갯수 불일치
INSERT INTO dept_temp (deptno, dname, loc)
VALUES (60, 'STOCK');

-- 에러 - 컬럼의 데이터타입과 데이터형이 불일치
INSERT INTO dept_temp (deptno, dname, loc)
VALUES ('SEVEN', 'STOCK', 'BUSAN');

-- 이건 들어가요
INSERT INTO dept_temp (deptno, dname)
VALUES (60, 'STOCK');

INSERT INTO dept_temp (deptno, dname, loc)
VALUES (70, 'TEST', NULL);

-- EMP를 복사해서 EMP_TEMP 생성
CREATE TABLE emp_temp
    AS SELECT * FROM emp;

SELECT * FROM emp_temp;

-- emp_temp 모든 데이터 삭제
DELETE FROM emp_temp;
