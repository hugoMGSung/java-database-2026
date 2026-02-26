-- 직원 100명 추가 - python 반복문 for와 유사
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO employee (emp_id, emp_name, salary, hire_date, dept_id)
    VALUES (
      seq_employee.NEXTVAL,
      'EMP_' || i,
      TRUNC(DBMS_RANDOM.VALUE(3000, 10000)),
      SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 2000)),
      TRUNC(DBMS_RANDOM.VALUE(1, 5))  -- 1~4 부서
    );
  END LOOP;
END;
