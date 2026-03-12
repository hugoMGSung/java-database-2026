-- 인덱스 테스트 시작!
SELECT COUNT(*) FROM orders_big;

-- 오라클 옵티마이저 갱신설정
BEGIN
	DBMS_STATS.GATHER_TABLE_STATS(
		ownname => USER,
		tabname => 'ORDERS_BIG',
		CASCADE => TRUE
	);
END;


/*
 * ORDER_ID에 PK제약조건, ORDER_ID에만 인덱스 자동생성
 * 나머지 NOT_NULL 제약조건
 * */
SELECT * FROM orders_big;

-- 인덱스가 없는 상태 조회 - 0.18초 대략 0.2초 소요
SELECT COUNT(*) 
  FROM orders_big
 WHERE customer_id = 12345;


-- 실행계획(Execution Plan) 확인
-- 중급이상 DB개발자들이 확인하는 기능
explain plan FOR 
SELECT COUNT(*) 
  FROM orders_big
 WHERE customer_id = 12345;

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- 위 실행계획에서 가장 유심히 볼 것 -> TABLE ACCESS FULL(FULL TABLE SCAN)
-- 300만건을 전부 읽어서 12345를 찾는 것


-- CUSTOMER_ID에 인덱스 생성
CREATE INDEX IDX_ORDERS_BIG_CUSTOMER_ID
    ON ORDERS_BIG(CUSTOMER_ID);


-- 오라클 옵티마이저 재갱신설정
BEGIN
	DBMS_STATS.GATHER_TABLE_STATS(
		ownname => USER,
		tabname => 'ORDERS_BIG',
		CASCADE => TRUE
	);
END;

-- 인덱스가 있는 상태 조회 - 대략 0.004초 소요. 50배 속도 개선
SELECT COUNT(*) 
  FROM orders_big
 WHERE customer_id = 12345;


--- 실행계획(Execution Plan) 재확인
explain plan FOR 
SELECT COUNT(*) 
  FROM orders_big
 WHERE customer_id = 12345;

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- TABLE ACCESS FULL이 INDEX RANGE SCAN으로 변경
-- 전체 COST가 5641정도에서 3으로 대폭 축소 -> 성능 개선

/* 인덱스 효과가 별로 없는 컬럼 */
-- STATUS 컬럼 - READY(준비), PAID(결제), SHIPPED(배송중), DONE(배송완료), CANCEL(취소)
SELECT COUNT(*)
  FROM orders_big
 WHERE status = 'PAID';

-- 실행계획
explain plan FOR 
SELECT COUNT(*)
  FROM orders_big
 WHERE status = 'PAID';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- STATUS 컬럼 인덱스 부여
DROP INDEX IDX_ORDERS_BIG_STATUS;

CREATE INDEX IDX_ORDERS_BIG_STATUS
    ON ORDERS_BIG(STATUS);

 
-- 재실행
SELECT COUNT(*)
  FROM orders_big
 WHERE status = 'PAID';

-- 인덱스 생성 후 실행계획
explain plan FOR 
SELECT COUNT(*)
  FROM orders_big
 WHERE status = 'PAID';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- 검색하는 데이터가 전체의 20% 정도이므로 
-- INDEX RANGE SCAN을 해도 비용이 많이 줄지 않음


/* 복합인덱스 */
SELECT *
FROM ORDERS_BIG
WHERE CUSTOMER_ID = 23456
  AND ORDER_DATE >= DATE '2024-01-01';

CREATE INDEX IDX_ORDERS_BIG_CUST_DATE
ON ORDERS_BIG(CUSTOMER_ID, ORDER_DATE);

-- 복합 인덱스 실행계획
EXPLAIN PLAN FOR
SELECT *
FROM ORDERS_BIG
WHERE CUSTOMER_ID = 23456
  AND ORDER_DATE >= DATE '2024-01-01';



SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- 인덱스 확인 쿼리
SELECT *
  FROM USER_INDEXES
 WHERE TABLE_NAME = 'ORDERS_BIG';