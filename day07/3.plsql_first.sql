-- PL/SQL은 SCOTT계정으로
-- SET SERVEROUTPUT ON;  -- SQLPLUS에서 사용
/* 1. 기본 pl/sql
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello, Oracle!');
END;
*/

/* 2. 변수선언 */
DECLARE
	v_empno number(4) := 7839;
	v_ename varchar2(10);
	v_pi CONSTANT number(10) := 3.141592;  -- 원주율은 상수
	v_deptno dept.deptno%TYPE;  -- deptno의 자료형을 참조해서 타입사용. number(2)로 대체
	v_deptrow dept%ROWTYPE;  -- dept테이블 한 레코드(행) 구조 모두 참조
	
BEGIN
	v_ename := 'KING';
	DBMS_OUTPUT.PUT_LINE('V_EMPNO => ' || V_EMPNO);
	DBMS_OUTPUT.PUT_LINE('V_ENAME => ' || v_ename);

	-- v_deptrow로 한줄 가져오기
--	SELECT deptno, dname, loc INTO v_deptrow 
--	  FROM dept
--	 WHERE deptno = 40;
	SELECT deptno INTO v_deptno
	  FROM dept
	 WHERE deptno = 40;
	
	DBMS_OUTPUT.PUT_LINE('deptno => ' || v_deptno);
	--DBMS_OUTPUT.PUT_LINE('dname => ' || v_deptrow.dname);
	--DBMS_OUTPUT.PUT_LINE('loc => ' || v_deptrow.loc);
END;