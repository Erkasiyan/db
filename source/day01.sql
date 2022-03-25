/*
    자바주석처리부분
    
    sqldeveloper 에서만 가능한 주석
    
    -----------------------------------------------
    질의명령
        질의 : 물어본다. 의미
        
        데이터베이스 관리시스템한테 해당 데이터가 어디에 있는지
        문의를 한다고해서 질의명령이라 한다.

-----------------------------------------------------------
SQL : Structured Qurey Language 의 약자
        구조화된 쿼리 언어
        
        이미 구조화 되어있는 명령을 사용해서 데이터를 조작하는 언어
        프로그램이 불가능하다는 점 특징이다.
        
    명령종류 ]
        1. DML 명령    
            - Data Manipulation Language(데이터 조작 언어)
            ==> 데이터를 추가, 수정, 삭제, 조회하는 작업을 하는 명령
                
                데이터를 조작하는 방법
                C   - CREATE    - INSERT
                R   - READ      - SELECT
                U   - UPDATE    - UPDATE
                D   - DELETE    - DELETE
                
        2. DDL 명령
            - Data Definition Language(데이터 정의 언어)
            ==> 개체를 마늗ㄹ고 수정하는 언어
                
                CREATE  - 개체(테이블, 사용자, 함수, 인덱스...)를 만들때 사용하는 명령
                ALTER   - 개체를 수정하는 명령
                DROP    - 개체를 삭제하는 명령 
                TRUNCATE    - 테이블을 잘라내는 명령
                
        3. DCL 명령
            - Data Control Language(데이터 제어 언어)
            ==> 작업을 적용시킨다던지 (TCL 명령 : Transaction Control Language)
                권한을 준다던지..
                    
                COMMIT
                ROLLBACK
                
                GRANT
                REVOKE
                
--------------------------------------------------------------------------------------                


*/

-- 이것은 오라클 주석 ==> 어디서든지 사용할 수 있는 주석
--select * from emp e, det d where d.deptno = e.deptno;
select * from emp;

select 
    empno, ename, job, mgr, hiredate, sal, comm, dname, loc -- select 절이라 부른다.
from 
    emp e, dept d -- from wjf
where 
    d.deptno = e.deptno; -- 조건절(where)절
    
/* 
    참고 ]
        오라클의 명령은 명령을 구분하는 문자로 ; 을 사용한다.
        
        따라서 질의명령을 작성하는데 ;(세미콜론)을 적지 않으면
        명령이 끝나지 않은것으로 간주한다.
        
        하나의 명령이 종료되면 반드시 세미콜론(;)을 적어줘야 한다.
*/