-- 기타함수로 처리

/*
    문제 1 ]
        각 직급별로 한글 직급으로
        사원들의
            사원이름, 직급, 한글직급
        을 조회하세요.
        
        MANAGER     : 관리자
        SALESMAN    : 영업사원
        CLERK       : 점원
*/
SELECT
    ename 사원이름, job 직급,
    CASE WHEN job = 'ANALYST' THEN '분석가'
         WHEN job = 'CLERK' THEN '점원'
         WHEN job = 'MANAGER' THEN '관리자'
         WHEN job = 'SALESMAN' THEN '영업사원'
         ELSE '사장'
    END 한글직급
FROM
    emp
ORDER BY
    job DESC
;

/*
    문제 2 ]
        각 부서별로 이번달 보너스를 다르게 지급하려고 한다.
        10 번 부서는 급여의 10%
        20 번 부서는 급여의 15%
        30 번 부서는 급여의 20% 를 지급하기로 했다.
        그리고 거기에 각각의 커미션을 더해서 급여로 지급하기로 했다.
        커미션이 없는 사원은 커미션을 0으로 해서 계산해서
        사원들의
            사원이름, 부서번호, 급여, 지급급여
        를 조회하세요.
*/

SELECT
    ename 사원이름, deptno 부서번호, sal 급여,
    CASE WHEN deptno = 10 THEN NVL2(comm, sal * 1.1 + comm, sal * 1.1)
         WHEN deptno = 20 THEN NVL2(comm, sal * 1.15 + comm, sal * 1.2)
         ELSE NVL2(comm, sal * 1.2 + comm, sal * 1.2)
    END 지급급여
FROM
    emp
;

/*
    문제 3 ]
        입사년도를 기준으로 해서
            80년 'A등급'
            81년 'B등급'
            82년 'C등급'
            이외 'D등급'
        으로 조회되도록 사원들의
            사원이름, 직급, 입사일, 등급
        을 조회하세요.
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일,
    CASE WHEN TO_CHAR(hiredate,'yy') = '80' THEN 'A등급'
         WHEN TO_CHAR(hiredate,'yy') = '81' THEN 'B등급'
         WHEN TO_CHAR(hiredate,'yy') = '82' THEN 'C등급'
         ELSE 'D등급'
    END 등급
FROM
    emp
;


SELECT hiredate 입사일,
        DECODE(TO_CHAR(hiredate,'yy'), '80', 'A등급',
                    '81', 'B등급',
                    '82', 'C등급',
                    'D등급') 등급
FROM emp;                    


SELECT
    TO_CHAR(hiredate, 'YY')
FROM
    emp
;
/*
    문제 4 ]
        사원이름의 글자수가 4글자면 'Mr.'을 이름앞에 붙이고
        4글자가 아니면 뒤에 ' 님'으로 조회되도록
        사원들의
            사원이름, 이름글자수, 조회이름
        을 조회하세요.
*/
SELECT
    ename 사원이름, LENGTH(ename) 이름글자수,
    CASE
        WHEN LENGTH(ename) = 4 THEN 'Mr.' || ename
        ELSE ename || '님'
    END 조회이름
FROM
    emp
;

/*
    문제 5 ]
        부서번호가 10번 또는 20번이면  급여 + 커미션으로 지급하고
        그 이외의 부서는 급여만 지급하려고 한다.
        사원들의
            사원이름, 직급, 부서번호, 급여, 커미션, 지급급여
        를 조회하세요.
        단, 커미션이 없는 경우는 0으로 대신해서 게산하는 것으로 한다.
*/

SELECT
    ename 사원이름, job 직급, deptno 부서번호, sal 급여, comm 커미션,
    CASE
        WHEN deptno = 10 or deptno = 20 THEN NVL2(comm, sal + comm, sal)
        ELSE sal
    END 지급급여
FROM
    emp
;

/*
    문제 6 ]
        입사요일이 토요일, 일요일 인 사원은
            급여를 20% 더해서 지급하고
        그 이외의 요일에 입사한 사원은
            급여의 10%를 더해서 지급하려고 한다.
            
        사원들의
            사원이름, 급여, 입사일, 입사요일, 지급급여
        를 조회하세요.
*/

SELECT
    ename 사원이름, sal 급여, hiredate 입사일,
    TO_CHAR(hiredate, 'day') 입사요일,
    CASE
        WHEN TO_CHAR(hiredate, 'day') = '토요일' or
            TO_CHAR(hiredate, 'day') = '일요일' THEN sal * 1.2
        ELSE sal * 1.1
    END 지급급여
FROM
    emp
;


/*
    문제 7 ]
        근무개월수가 490개월을 이상인 사원은
            커미션을 500 을 추가해서 지급하고
        근무개월수가 490개월 미만인 사원은
            커미션을 현재커미션만 지급하도록 할 예정이다.
        사원들의
            사원이름, 커미션, 입사일, 근무개월수, 지급커미션
        을 조회하세요.
        단, 커미션이 없는 사원은 0으로 계산하는 것으로 한다.
*/

SELECT
    ename 사원이름, comm 커미션, hiredate 입사일,
    FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) 근무개월수,
    CASE
        WHEN FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) >= 490 
        THEN NVL2(comm, comm + 500, 500)
        ELSE NVL2(comm, comm, 0)
    END 지급커미션
FROM
    emp
;  

/*
    문제 8 ]
        이름 글자수가 5글자 이상인 사원은 이름을
            3글자*** 로 표현하고
        이름 글자수가 4글자 이하인 사람은 그대로 출력할 예정이다.
        사원들의 
            사원이름, 이름글자수, 조회이름
        을 조회하세요.
*/

SELECT
    ename 사원이름, LENGTH(ename) 이름글자수,
    CASE
        WHEN LENGTH(ename) >= 5 
        THEN RPAD((SUBSTR(ename, 1, 3)), LENGTH(ename),'*')
        ELSE ename
    END 조회이름
FROM
    emp
;

SELECT ename, SUBSTR(ename, 1, 3), RPAD(SUBSTR(ename, 1, 3), LENGTH(ename), '*') FROM emp;
-------------------------------------------------------------------------------
-- group by

/*
    문제 1 ]
        각 부서별로 최소 급여를 조회하려고 한다.
        각부서별
            부서번호, 최소급여
        를 조회하세요.
*/
SELECT
    deptno 부서번호, MIN(sal) 최소급여
FROM
    emp
GROUP BY
    deptno
;
/*
    문제 2 ]
        각 직급별로 급여의 총액과 평균급여를 직급과 함께 조회하세요.
*/

SELECT
    SUM(sal) 총액, ROUND(AVG(sal)) 평균급여, job 직급 
FROM
    emp
GROUP BY
    job
;

/*
    문제 3 ]
        입사 년도별로 평균 급여와 총급여를 조회하세요.
*/

SELECT
    AVG(sal) 평균급여, SUM(sal) 총급여, TO_CHAR(hiredate,'YY') 입사년도
FROM
    emp
GROUP BY
    hiredate
;

/*
    문제 4 ]
        각 년도마다 입사한 사원수를 조회하세요.
*/

SELECT
    TO_CHAR(hiredate, 'yy') 년도, COUNT(*)
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'yy')
ORDER BY
    TO_CHAR(hiredate, 'yy')
;

/*
    문제 5 ]
        사원 이름의 글자수를 기준으로 그룹화해서 조회하려고 한다.
        사원 이름의 글자수가 4, 5 글자인 사원의 수를 조회하세요.
*/

SELECT
    LENGTH(ename) 이름글자수, COUNT(*) 사원의수
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
    LENGTH(ename) < 6
ORDER BY
    LENGTH(ename)
;    

/*
    문제 6 ]
        81년도에 입사한 사원의 수를 직급별로 조회하세요.
*/

SELECT
    job 직급, COUNT(*)
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
GROUP BY
    job

;

/*
    문제 7 ]
        사원이름의 글자수가 4, 5글자인 사원의 수를 부서별로 조회하세요.
        단, 사원수가 한사람 이하인 부서는 조회에서 제외하세요.
*/

SELECT
    deptno 부서번호, COUNT(*) 사원의수
FROM
    emp
WHERE
    LENGTH(ename) = 4 or LENGTH(ename) = 5
GROUP BY
    deptno
HAVING
    COUNT(*) > 1
;

/*
    문제 8 ]
        81년도 입사한 사원의 전체 급여를 직급별로 조회하세요.
        단, 직급별 평균 급여가 1000 미만인 직급은 조회에서 제외하세요.
*/

SELECT
    SUM(sal) 전체급여, ROUND(AVG(sal)) 평균급여, job 직급 
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = 81
GROUP BY
    job
HAVING
    AVG(sal) >= 1000
;

/*
    문제 9 ]
        81년도 입사한 사원의 총 급여를 사원이름글자수 별로 그룹화하세요.
        단, 총 급여가 2000 미만인 경우는 조회에서 제외하고
        총 급여가 높은 순서에서 낮은 순서대로 조회되게 하세요.
*/

SELECT
    SUM(sal) 총급여, LENGTH(ename) 사원이름글자수
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = 81
GROUP BY
    LENGTH(ename)
HAVING
    SUM(sal) >= 2000
ORDER BY
    SUM(sal) DESC
;

/*
    문제 10 ]
        사원 이름 길이가 4, 5 글자인 사원의 부서별 사원수를 조회하세요.
        단, 사원수가 0인 경우는 조회에서 제외하고
        부서번호 순서대로 조회하세요.
*/

SELECT
    deptno 부서번호, COUNT(*) 사원수
FROM
    emp
WHERE
    LENGTH(ename) = 4 or LENGTH(ename) = 5
GROUP BY
    deptno
HAVING
    COUNT(*) > 0 
ORDER BY
    deptno ASC
;