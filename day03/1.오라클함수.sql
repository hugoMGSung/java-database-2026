-- 날짜출력
SELECT sysdate AS now
     , sysdate-1 AS "내일-날짜"
     , sysdate+1 AS tomorrow
  FROM dual;

-- 달을 증가시키는 함수
SELECT sysdate AS "current"
	 , ADD_MONTHS(sysdate, 2) AS "3monthlater"  
  FROM dual;

-- 입사 10주년이 되는 사원 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
     , ADD_MONTHS(HIRE_DATE, 120) AS "Anniversal10Years"
  FROM EMPLOYEE;

-- 두 날짜간의 개월 수 차이
-- 우리회사 가장 입사 오래된 직원과 가장 최근 입사한 직원사이 개월수
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
     , MONTHS_BETWEEN(MAX(HIRE_DATE), MIN(HIRE_DATE)) AS "OldestbetwNewest"
  FROM EMPLOYEE;

-- 돌아오는 요일, 달의 마지막 날짜 구하기
SELECT sysdate
     , NEXT_DAY(sysdate, '화요일')
     , last_day(add_months(sysdate, -1))
  FROM dual;

-- 
SELECT * 
FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_LANGUAGE';

ALTER SESSION SET NLS_DATE_LANGUAGE = KOREAN; --  AMERICAN;

-- sysdate보다 current_date(세션타임)로 현재 
SELECT current_date FROM dual;



/* 형변환 */
SELECT emp_id, EMP_NAME, emp_id + '500'   -- 자동형변환
  FROM EMPLOYEE;

SELECT 'EMP' + emp_id, emp_name
  FROM employee;

-- TO_CHAR() 날짜,숫자 데이터를 문자 데이터 변환
SELECT TO_CHAR(current_date, 'YYYY/MM/DD HH24:MI:SS') AS "현재일시"
  FROM DUAL;


SELECT TO_CHAR(SALARY, '$999,999.00') AS "SAL_$"
     , TO_CHAR(SALARY, 'L999,999') AS "SAL_L"  -- 지역화폐단위
     , TO_CHAR(SALARY, '999,999.00') AS "SAL_1"  -- 소수점 표현
  FROM EMPLOYEE;


-- TO_NUMBER() 문자 데이터를 숫자 데이터로
SELECT 1300 + '1500'     
  FROM dual;

SELECT '1,300' + '1,500' -- 1000단위 쉼표가 포함된 문자열은 자동 형변환X
  FROM dual;

-- 1000단위 쉼표가 표현된 문자 데이터면 숫자포맷을 사용, 숫자로 형변환해줘야
SELECT to_number('1,300', '999,999') + to_number('1,500', '999,999')
  FROM dual;

-- 안됨
SELECT to_number('천삼백', '999,999') 
  FROM dual;

-- TO_DATE() 문자형식으로된 날짜데이터를 날짜형으로 변경
SELECT TO_date('2026/03/03') AS TODATE1
     , TO_date('2026-03-03', 'YYYY-MM-DD') AS TODATE2
     , to_char(TO_date('2026-03-03', 'YYYY-MM-DD'), 'YYYY-MM-DD') AS TODATE3
  FROM dual;