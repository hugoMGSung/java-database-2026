-- 트리거 생성
CREATE OR REPLACE TRIGGER trg_emp_log
AFTER
INSERT OR UPDATE OR DELETE ON emp_trg
FOR EACH ROW

BEGIN
	IF inserting THEN  -- emp_trg 테이블 새 데이터가 들어가면
		-- emp_trg_log 테이블에 아래의 쿼리실행
		INSERT INTO emp_trg_log 
		   (tablename, dml_type, empno, 
		    user_name, change_date)
		VALUES 
           ('EMP_TRG', 'INSERT', :NEW.empno, 
            sys_context('USERENV', 'SESSION_USER'), sysdate);

	ELSIF updating THEN  -- 데이터가 수정되면
		-- emp_trg_log 테이블에 아래의 쿼리실행
		INSERT INTO emp_trg_log 
		   (tablename, dml_type, empno, 
		    user_name, change_date)
		VALUES 
           ('EMP_TRG', 'UPDATE', :old.empno, 
            sys_context('USERENV', 'SESSION_USER'), sysdate);
	
	ELSIF deleting THEN  -- 데이터가 삭제되면
		-- emp_trg_log 테이블에 아래의 쿼리실행
		INSERT INTO emp_trg_log 
		   (tablename, dml_type, empno, 
		    user_name, change_date)
		VALUES 
           ('EMP_TRG', 'DELETE', :old.empno, 
            sys_context('USERENV', 'SESSION_USER'), sysdate);	
	
	END IF;
END;
