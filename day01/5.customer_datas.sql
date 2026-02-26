-- 고객 500명 
BEGIN
  FOR i IN 1..500 LOOP
    INSERT INTO customer (cust_id, cust_name, city, reg_date)
    VALUES (
      seq_customer.NEXTVAL,
      'CUST_' || i,
      CASE MOD(i,4)
        WHEN 0 THEN 'Seoul'
        WHEN 1 THEN 'Busan'
        WHEN 2 THEN 'Incheon'
        ELSE 'Daegu'
      END,
      SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 1000))
    );
  END LOOP;
END;