-- 300만건 더미데이터 생성
BEGIN
    FOR i IN 0 .. 29 LOOP
        INSERT /*+ APPEND */
        INTO ORDERS_BIG
        SELECT
            i * 100000 + LEVEL AS ORDER_ID,
            TRUNC(DBMS_RANDOM.VALUE(1, 300001)) AS CUSTOMER_ID,
            DATE '2020-01-01' + TRUNC(DBMS_RANDOM.VALUE(0, 365 * 5)) AS ORDER_DATE,
            CASE MOD(i * 100000 + LEVEL, 5)
                WHEN 0 THEN 'READY'
                WHEN 1 THEN 'PAID'
                WHEN 2 THEN 'SHIPPED'
                WHEN 3 THEN 'DONE'
                ELSE 'CANCEL'
            END AS STATUS,
            'P' || TO_CHAR(MOD(i * 100000 + LEVEL, 10000), 'FM00000') AS PRODUCT_CODE,
            ROUND(DBMS_RANDOM.VALUE(1000, 500000), 2) AS AMOUNT,
            CASE MOD(i * 100000 + LEVEL, 4)
                WHEN 0 THEN 'SEOUL'
                WHEN 1 THEN 'BUSAN'
                WHEN 2 THEN 'DAEGU'
                ELSE 'INCHEON'
            END AS REGION
        FROM dual
        CONNECT BY LEVEL <= 100000;

        COMMIT;
    END LOOP;
END;


SELECT COUNT(*) FROM orders_big;