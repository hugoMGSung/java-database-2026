-- 주문 2,000건 + 주문상세 각 1~3건씩 생성
BEGIN
  FOR i IN 1..2000 LOOP
    INSERT INTO orders (order_id, cust_id, order_date)
    VALUES (
      seq_orders.NEXTVAL,
      TRUNC(DBMS_RANDOM.VALUE(1, 501)),                 -- 고객 1~500
      SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 365))
    );

    FOR j IN 1..TRUNC(DBMS_RANDOM.VALUE(1,4)) LOOP      -- 1~3개
      INSERT INTO order_item (order_item_id, order_id, prod_id, quantity)
      VALUES (
        seq_order_item.NEXTVAL,
        seq_orders.CURRVAL,                              -- 방금 만든 주문ID
        TRUNC(DBMS_RANDOM.VALUE(1, 201)),               -- 상품 1~200
        TRUNC(DBMS_RANDOM.VALUE(1, 10))
      );
    END LOOP;
  END LOOP;
END;

COMMIT; -- 이줄만 실행할때는 Ctrl+Enter