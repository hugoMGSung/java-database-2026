-- PL/SQL 저장서브프로그램
-- python func_a() 
CREATE OR REPLACE PROCEDURE PRC_NOPARAM
IS
	-- DECLARE 영역
	v_empno number(4) := 7788;
	v_ename varchar2(10);
BEGIN
	SELECT ename INTO v_ename
	  FROM emp
	 WHERE empno = v_empno;
	
	DBMS_OUTPUT.PUT_LINE('V_EMPNO => ' || v_empno);
	DBMS_OUTPUT.PUT_LINE('V_ENAME => ' || v_ename);
END PRC_NOPARAM;


-- 실행
call prc_noparam();

CALL prc_param(7698);