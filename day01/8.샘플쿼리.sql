-- 부서 테이블의 데이터 개수 확인
SELECT count(*) FROM department;  -- 한줄 실행 Ctrl + Enter

SELECT count(*) FROM employee;

SELECT count(*) FROM customer;

SELECT count(*) FROM product;

SELECT count(*) FROM orders;

SELECT count(*) FROM order_item;


-- 주문 테이블에서 앞쪽 데이터 5개만 조회
SELECT * FROM orders WHERE rownum <= 5;



