-- PL/SQL 커서

DECLARE
	--커서 데이터를 입력할 변수
	vr_dept dept%rowtype;

	-- 커서 선언
	CURSOR cur1 IS
	SELECT deptno, dname, loc
	  FROM dept;
BEGIN
	-- 커서 오픈
	OPEN cur1;
	
	LOOP
		-- 커서로 데이터를 읽을때는 FETCH 사용
		FETCH cur1 INTO vr_dept;
		-- 페치해도 데이터가 없으면 break
		EXIT WHEN cur1%NOTFOUND;
	
		dbms_output.put_line('부서 : ' || vr_dept.deptno 
		                  || ',부서명 : ' || vr_dept.dname
		                  || ',위치 : ' || vr_dept.loc);
	END LOOP;
	
	CLOSE cur1; -- 마지막 커서 닫기
END;
