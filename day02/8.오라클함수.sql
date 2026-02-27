-- 문자열 함수
-- 대문자, 소문자, 첫글자만 대문자 변환 함수
SELECT c.CUST_name
     , lower(c.CUST_NAME) AS "고객명"
     , INITCAP(lower(c.CUST_NAME)) AS "고객명"
     , c.CITY     
     , upper(c.CITY) AS "도시명"
  FROM CUSTOMER c ;

-- where절에도 사용가능
SELECT *
  FROM CUSTOMER c 
 WHERE lower(C.CITY) = 'seoul';

-- 문자열길이
SELECT city, length(city) AS "글자길이"
  FROM CUSTOMER;

-- 문자열 추출
SELECT EMP_NAME, SUBSTR(EMP_NAME, 4, 1)
  FROM EMPLOYEE 
  
-- 문자열에서 찾기
SELECT INSTR('HELLO, ORACLE!', 'L') AS "첫번째L위치"
     , INSTR('HELLO, ORACLE!', 'L', 5) AS "5번째이후 L위치"
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS "2번째위치 이후 두번째나타나는L위치"
  FROM dual;

-- 문자열 교체
SELECT REPLACE('Oh, Hello Oracle!', 'Hello', 'HELL') AS "변경된문자열"
  FROM dual;

-- 빈공간을 특정문자로 채우기
SELECT lpad('Matrix', 20, '#'),
       rpad('Oracle', 20, '@')
  FROM dual;

SELECT lpad('10', 2, '0') FROM dual;


-- 두 문자열 합치기
SELECT concat('Hello ', 'World')
  FROM dual;

-- 공백제거 
SELECT TRIM('     Marvel Universe     ')
     , LTRIM('     Marvel Universe     ')
     , RTRIM('     Marvel Universe     ')
  FROM dual;


SELECT 1 AS "같아요"
  FROM dual
 WHERE 'Hello World' = trim('     Hello World ');


-- 숫자함수
SELECT ROUND(1234.3456)
     , round(1234.3456, 3)  -- 소수점 세번째자리까지 반올림
     , TRUNC(1234.3456, 3)
     , CEIL(3.14)
     , FLOOR(3.68)
     , MOD(11, 2)
  FROM dual;
