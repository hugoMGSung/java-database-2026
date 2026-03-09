-- function 생성
CREATE OR REPLACE FUNCTION FNC_AFTERTAX(
	sal IN number
) RETURN NUMBER 
IS
	tax NUMBER := 0.05;
BEGIN
	RETURN round(sal - (sal * tax));
END FNC_AFTERTAX;

-- 함수 실행
SELECT fnc_aftertax(3000) FROM dual;

-- SELECT문에 함수를 사용가능
SELECT empno, ename, sal
     , fnc_aftertax(sal) AS aftertax     -- 커스텀 함수
     , to_char(hiredate, 'yyyy-mm-dd')   -- 오라클 내장함수
  FROM emp;

-- 함수 삭제
DROP FUNCTION FNC_AFTERTAX;

