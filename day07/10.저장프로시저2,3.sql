-- 저장프로시저 생성 2
CREATE OR REPLACE PROCEDURE SCOTT.PRC_PARAM
(
	p_empno IN number
)
IS
	-- DECLARE 영역
	v_ename varchar2(10);
BEGIN
	SELECT ename INTO v_ename
	  FROM emp
	 WHERE empno = p_empno;
	
	DBMS_OUTPUT.PUT_LINE('EMPNO => ' || p_empno);
	DBMS_OUTPUT.PUT_LINE('ENAME => ' || v_ename);
END PRC_PARAM;

-- 저장프로시저 생성 3 
CREATE OR REPLACE PROCEDURE SCOTT.PRC_INOUTPARAM
(	
	p_empno IN NUMBER,
	p_ename OUT varchar2
)
IS
BEGIN
	SELECT ename INTO p_ename
	  FROM emp
	 WHERE empno = p_empno;
	
	DBMS_OUTPUT.PUT_LINE('EMPNO => ' || p_empno);
	DBMS_OUTPUT.PUT_LINE('ENAME => ' || p_ename);
END PRC_INOUTPARAM;
