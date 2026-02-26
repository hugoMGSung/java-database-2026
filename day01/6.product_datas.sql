-- 상품 200개
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO product (prod_id, prod_name, price)
    VALUES (
      seq_product.NEXTVAL,
      'PRODUCT_' || i,
      TRUNC(DBMS_RANDOM.VALUE(1000, 50000))
    );
  END LOOP;
END;