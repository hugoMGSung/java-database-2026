SELECT * FROM dept_tcl;

update DEPT_TCL 
   set loc = 'SEOUL'
 where deptno= 50;


DELETE FROM dept_tcl
 WHERE deptno = 60;

insert into dept_tcl (deptno, dname, loc)
values (90, 'TEST', 'TEST');

ROLLBACK;
