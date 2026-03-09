-- PL/SQL 반복문
DECLARE
	V_NUM NUMBER := 0;
BEGIN	
--	LOOP
--		DBMS_OUTPUT.PUT_LINE('V_NUM => ' || V_NUM);
--		V_NUM := V_NUM + 1;
--		EXIT WHEN V_NUM > 100;
--	END LOOP;
	
	FOR V_NUM IN 1..100 LOOP
		CONTINUE WHEN MOD(V_NUM, 2) = 1; -- 짝수면 continue
		DBMS_OUTPUT.PUT_LINE('V_NUM => ' || V_NUM);
		-- V_NUM := V_NUM + 1;		
		EXIT WHEN V_NUM > 100;
		-- DBMS_LOCK.SLEEP(0.2); 
		-- DBEAVER에서는 장시간 대기후 한꺼번에 출력됨
	END LOOP;	
END;
