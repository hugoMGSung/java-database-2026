/* JOIN!!!!! */
-- 관계형(Relational)DB, RDB에서 테이블을 합쳐서 표현하는 방법
SELECT *
  FROM emp;

SELECT *
  FROM dept;


-- 합치기(그냥합치기 - 카테시안곱)
SELECT *
  FROM emp, dept;

-- 등가조인 inner-join, equi-join, simple join
SELECT *
  FROM emp, dept
 WHERE emp.deptno = dept.deptno;


-- 이름 사용
SELECT emp.empno, emp.ename, emp.job
     , emp.mgr, emp.hiredate, emp.sal
     , emp.sal, dept.deptno, dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno;

-- 별명 사용
SELECT e.empno, e.ename, e.job
     , e.mgr, e.hiredate, e.sal
     , d.deptno, d.dname
  FROM emp e, dept d
 WHERE e.deptno = d.deptno;

-- 비등가조인
SELECT * 
  FROM emp;

SELECT *
  FROM salgrade;

SELECT *
  FROM emp e, salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal;







