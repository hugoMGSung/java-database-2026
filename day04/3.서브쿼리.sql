/* 서브쿼리 */

-- 1.사원이름 JONES인 사원 급여 조회
SELECT e.sal
  FROM emp e
 WHERE e.ename = 'JONES';

-- 2.급여가 2,975보다 높은 사원 조회
SELECT *
  FROM emp e
 WHERE e.sal >= 2975; -- 고정된 값

-- 서브쿼리 = 1, 2번 쿼리 합친것
SELECT *
  FROM emp e
 WHERE e.sal >= (SELECT e1.sal FROM emp e1 WHERE e1.ename = 'JONES');


/*  9-2 단일행 서브쿼리 */
-- SCOTT 직원의 입사날짜보다 이전에 입사한 직원 조회
SELECT e.hiredate
  FROM emp e
 WHERE e.ename = 'SCOTT';

-- 1987-07-13이 1980-01-01보다 큰수
SELECT *
  FROM emp o
 WHERE o.hiredate < (SELECT e.hiredate
                       FROM emp e
                      WHERE e.ename = 'SCOTT');

-- 모든 직원의 평균 급여보다 높은 급여를 받는 직원 조회
SELECT *
  FROM emp o
 WHERE o.sal >= (SELECT avg(e.sal)
                   FROM emp e)
   AND o.deptno = 20;

-- 서브쿼리와 조인을 같이 사용가능
SELECT o.*, d.dname
  FROM emp o, dept d
 WHERE o.deptno = d.deptno
   AND o.sal >= (SELECT avg(e.sal)
                   FROM emp e)
   AND o.deptno = 20;



/*  9-3 다중행 서브쿼리 */
-- RESEARCH, SALES인 부서에 다니는 직원들만 조회
SELECT *
  FROM emp e
 WHERE e.deptno IN (SELECT d.deptno
                      FROM dept d
                     WHERE d.dname IN ('RESEARCH', 'SALES'));


-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 조회
-- 부서별로 2850, 3000, 5000 행이 조회됨
SELECT max(e.sal), e.deptno
  FROM emp e
 GROUP BY e.deptno;


-- IN 구문을 쓰면 다중행 데이터를 조회가능
-- IN도 OR구문과 동일
SELECT *
  FROM emp o
 WHERE o.sal IN (SELECT max(e.sal)
                   FROM emp e
                  GROUP BY e.deptno);
  

-- ANY, SOME 서브쿼리 변환 결과들 중 메인쿼리의 조건이 하나로 참이면
SELECT *
  FROM emp o
 WHERE o.sal = ANY (SELECT max(e.sal)
                      FROM emp e
                     GROUP BY e.deptno);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원정보 조회
-- ANY, SOME -> OR조건
SELECT * 
  FROM emp o
 WHERE o.sal < ANY (SELECT sal
                      FROM emp
                     WHERE deptno = 30);

-- 30번 부서 사원들의 모든 급여보다 적은 급여를 받는 사원정보 조회
-- ALL -> AND조건
SELECT * 
  FROM emp o
 WHERE o.sal < ALL (SELECT sal
                      FROM emp
                     WHERE deptno = 30);

-- 서브쿼리 결과 값이 존재하면 메인쿼리가 조회
-- 내가 찾는 부서가 있다면 모든 직원 조회하라
SELECT *
  FROM emp o 
 WHERE EXISTS (SELECT dname
                 FROM dept
                WHERE deptno = 50);
 


/* 9-4 다중열 서브쿼리 */
SELECT *
  FROM emp o
 WHERE (o.sal, o.deptno) IN (SELECT max(e.sal), e.deptno
                               FROM emp e
                              GROUP BY e.deptno);



/* 9-5 FROM 절 서브쿼리 */
-- 가상테이블이다!
SELECT e.empno
     , e.deptno 
     , to_char(e.hiredate, 'yyyy-mm-dd') AS "입사일"
  FROM emp e;

-- 가상의 테이블을 만들어서 마치 실제 테이블인 것처럼 사용가능
SELECT *
  FROM dept d, (SELECT empno
                     , deptno 
                     , to_char(hiredate, 'yyyy-mm-dd') AS "입사일"
                  FROM emp) e
 WHERE d.deptno = e.deptno;

-- JOIN으로 변경
SELECT d.*, e.empno, e.deptno, to_char(hiredate, 'yyyy-mm-dd') AS "입사일" 
  FROM dept d, emp e
 WHERE d.deptno = e.deptno;
  

-- 복잡한 서브쿼리도 가능!
SELECT count(*), sub1.DEPTNO 
  FROM (
			SELECT d.deptno, d.dname, d.loc, e.empno, e.입사일
			  FROM dept d, (SELECT empno
			                     , deptno 
			                     , to_char(hiredate, 'yyyy-mm-dd') AS "입사일"
			                  FROM emp) e
			 WHERE d.deptno = e.deptno
        ) sub1
 GROUP BY sub1.DEPTNO;


-- 둘다 서브쿼리로 사용
SELECT e10.empno, e10.ename, e10.deptno, d.dname, d.loc
  FROM (SELECT * FROM emp WHERE deptno = 10) e10,
       (SELECT * FROM dept) d
 WHERE e10.deptno = d.deptno;

-- WITH절로 가상 테이블을 위로 올려서 정의
-- 가독성, 성능개선
WITH
e10 AS (SELECT * FROM emp WHERE deptno = 10),
d AS (SELECT * FROM dept)
SELECT e10.empno, e10.ename, e10.deptno, d.dname, d.loc
  FROM e10, d
 WHERE e10.deptno = d.deptno;

-- 상호연관 서브쿼리 - 알고만 있길. 차후 실무에서 확인 
-- 메인쿼리 데이터를 서브쿼리 사용, 그결과를 다시 메인쿼리 반영
SELECT *
  FROM emp e1
 WHERE e1.sal > (SELECT MIN(SAL)
                   FROM emp
                  WHERE deptno = e1.deptno)
 ORDER BY e1.deptno, e1.sal;


/* 9-6 SELECT절 서브쿼리 */
SELECT e.empno
     , e.ename
     , e.job
     , e.sal
     , (SELECT grade
          FROM salgrade
         WHERE e.sal BETWEEN losal AND hisal) AS "SALGRADES"
     , e.deptno
     , (SELECT dname
          FROM dept
         WHERE deptno = e.deptno) AS "DEPARTMENTS"
  FROM emp e
 ORDER BY e.empno;

-- JOIN으로 변경가능. 위 서브쿼리보다 성능개선
SELECT e.empno
     , e.ename
     , e.job
     , e.sal
     , s.grade AS "SALGRADES"
     , e.deptno
     , d.dname AS "DEPARTMENTS"
  FROM emp e, dept d, salgrade s
 WHERE e.deptno = d.deptno
   AND e.sal BETWEEN s.losal AND s.hisal
 ORDER BY e.empno;





