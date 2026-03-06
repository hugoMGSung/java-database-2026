-- 객체

-- 데이터 사전
-- 사용중인 객체들 확인하는 역할
SELECT *
  FROM user_indexes;

SELECT *
  FROM USER_VIEWS;  -- 스키마 SYS 내 위치

-- USER_OBJECTS, USER_RULES, USER_TABLES, USER_INDEXES, USER_VIEWS, ...
-- USER_SEQUENCES, 

SELECT *
  FROM dictionary
 WHERE table_name LIKE 'USER_%'
 ORDER BY table_name;

-- 인덱스 생성
-- IDX(인덱스 접두어)_테이블_인덱스컬럼
CREATE INDEX IDX_EMP_SAL
    ON emp(sal);


-- 인덱스 삭제
DROP INDEX idx_emp_sal;


-- 뷰
CREATE VIEW VW_EMP20
    AS (SELECT empno, ename, job, deptno
          FROM emp
         WHERE deptno = 20);

SELECT * FROM VW_EMP20;

SELECT * 
   FROM VW_EMP20 v, dept d
  WHERE v.deptno = d.deptno;

-- 삭제
DROP VIEW VW_EMP20;


-- 뷰2
CREATE OR REPLACE VIEW vw_dept_all
    AS (SELECT * FROM dept);

SELECT * FROM VW_dept_all;

INSERT INTO vw_dept_all (deptno, dname, loc)
 VALUES ('90', 'TEST', 'NONE');

COMMIT;


-- 시퀀스
-- 생성
CREATE SEQUENCE SEQ_BOARD
START WITH 1 -- 보통 1부터 시작
INCREMENT BY 1  -- 보통 1씩 증가
MAXVALUE 9999999  -- 또는 NOMAXVALUE
NOCYCLE      -- MAXVALUE까지 가면 끝. CYCLE - MAX까지가면 다시 1
NOCACHE;

-- 게시판 테이블 생성
CREATE TABLE boardtbl (
	board_id    NUMBER(7)   PRIMARY KEY, 
	title       varchar2(200)  NOT NULL,
	writer      varchar2(50)   NOT NULL,
	contents    varchar2(4000),
	regdate     DATE DEFAULT SYSDATE
);

-- 게시판 데이터 입력
INSERT INTO boardtbl 
(board_id, title, writer, contents)
values
(SEQ_BOARD.NEXTVAL, '테스트 제목', '홍길동', '내용입니다.');

INSERT INTO boardtbl 
(board_id, title, writer, contents)
values
(SEQ_BOARD.NEXTVAL, '테스트2 제목', '홍길순', '새 내용입니다.');

INSERT INTO boardtbl 
(board_id, title, writer, contents)
values
(SEQ_BOARD.NEXTVAL, '테스트3 제목', '유고성', '누구냐 넌~');

COMMIT;

SELECT * FROM boardtbl;

-- 다음 시퀀스 확인
SELECT SEQ_BOARD.NEXTVAL FROM DUAL;

SELECT SEQ_BOARD.CURRVAL FROM DUAL;

-- 시퀀스 수정
ALTER SEQUENCE SEQ_BOARD
INCREMENT BY 2
CYCLE;

-- 시퀀스 삭제
DROP SEQUENCE SEQ_BOARD;

