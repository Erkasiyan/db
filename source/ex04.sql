/*
    문제 1 ]
        직급이 MANAGER 인 사원의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요.
*/
SELECT
    e.ename 사원이름, e.job 직급, e.hiredate 입사일, e.sal 급여, d.dname 부서이름
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno
;
/*
    문제 2 ]
        사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요.
*/
SELECT
    ename 사원이름, e.job 직급, e.hiredate 입사일, e.sal 급여, s.grade 급여등급
FROM
    emp e, salgrade s
WHERE
    sal BETWEEN losal And hisal
    AND LENGTH(ename) = 5
;    
/*
    문제 3 ]
        입사일이 81년이고
        직급이 MANAGER인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
*/
    
SELECT
    e.ename 사원이름, e.job 직급, e.hiredate 입사일, e.sal 급여,
    s.grade 급여등급, d.dname 부서이름, d.loc 부서위치
FROM
    emp e, salgrade s, dept d
WHERE
    sal BETWEEN losal AND hisal
    AND e.deptno = d.deptno
;    
    
/*
    문제 4 ]
        사원들의
        사원이름, 직급, 급여, 급여등급, 상사이름
        을 조회하세요.
*/

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, s.grade 급여등급, h.ename 상사이름
FROM
    emp e, salgrade s, emp h
WHERE
    e.mgr = h.empno(+)
    AND e.sal BETWEEN losal AND hisal
;
/*
    문제 5 ]
        사원들의
        사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
*/

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, NVL(s.ename, '상사없음') 상사이름,
    d.dname 부서이름, g.grade 급여등급
FROM
    emp e, emp s, dept d, salgrade g
WHERE
    e.deptno = d.deptno
    AND e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
;
