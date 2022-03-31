-- 계층형 질의
/*
    댓글형 게시판의 경우
    목록을 꺼내올때 상위글 바로 다음에
    그글의 댓글이 조회가 되어야 한다.
    
    오라클의 경우는 
    계층형 결과를 볼수 있는 문법을 만들어서 제공해주고 있다.
    
    형식 ]
        SELECT
        
        FROM
        
        START WITH
            계층 추적 시작 값...
        CONNECT BY
            계층추적 조건
        ORDER SIBLINGS BY
            계층간 정렬...
            
        참고 ]
            PRIOR : "이전" 이란 의미로
                    이전 계층을 의미...
*/

-- 사원들을 조회하는데 사장부터 계층으로 조회하세요...
SELECT
    LPAD(' ', (LEVEL - 1) * 3, ' ') || empno ||' - ' || ename ||' - ' || job ||' - ' || mgr ||' - ' || LEVEL 정보, HIREDATE
FROM
    emp
START WITH
    mgr IS NULL
CONNECT BY
    mgr = PRIOR empno
ORDER SIBLINGS BY
    hiredate DESC
;


--------------------------------------------------------------------------------
/*
    CRUD - 데이터를 다루는 명령들의 약자
    
    따라서 CRUD 를 이야기하면 
    DML 명령을 사용할 수 있는지를 이야기하는 것이된다.
    
    이제 우리가 배운 명령들은 모두
    CRUD 중에서 R 에 해당하는
    SELECT 질의명령만 공부했는데
    
    C - CREATE - INSERT 
    U - UPDATE - UPDATE
    D - DELETE - DELETE
    
    을 공부할 예정이다.
    
    
    1. INSERT
        ==> 이미 만들어진 테이블에 데이터를 추가하는 명령
        
            형식 ]
                INSERT INTO
                     테이블이름[(필드이름1, 필드이름2, ....)]
                VALUES(
                    테이블이 가지는 모든 필드의 데이터
                    만약 필드이름을 지정해 놓으면
                    위에서 지정한 순서대로 필드에 해당하는 데이터를 입력해야 한다.
                );
                
            주의 ] 
                입력을 할때는 필드의 순서에 맞게
                반드시 데이터의 갯수와 순서를 일치시켜서 입력해야 한다.
    
*/


-- 연습용 테이블 복사...
-- emp 테이블을 구조만 복사해서 emp1으로 만들자.
CREATE TABLE emp1
AS
    SELECT
        *
    FROM
        emp
    WHERE
        1 = 2
;

-- emp1에 '제니' 사원을 입력해보자.
INSERT INTO
    emp1
VALUES(
    1001, '제니', '사장', null, sysdate, 300, 116, 99
);

ALTER TABLE emp1
MODIFY hiredate DEFAULT sysdate;

ALTER TABLE emp1
ADD CONSTRAINT EMP1_NO_PK PRIMARY KEY(empno)
;

DESC emp1;

-- emp1 테이블에 로제 사원을 입력하세요.
INSERT INTO
    emp1(empno, ename)
VALUES(
    1002, '로제'
);

-- emp1 테이블에 리사 사원을 추가하세요.
INSERT INTO 
    emp1(ename, empno)
VALUES(
--     1003, '리사' -- 순서가 맞지 않아서 입력오류
    '리사', 1003
);

/*
    **********
    참고 ]
        DML 명령은 메모리 상에 확보한 세션공간에서만
        작업이 이루어진다.
        따라서 데이터베이스에 적용은 안되어있는 상태이다.
        작업내용을 데이터베이스에 적용되기를 원하면
        반드시 commit 명령을 실행해야 한다.
*/

commit;

INSERT INTO 
    emp1(ename, empno)
VALUES(
--     1003, '리사' -- 순서가 맞지 않아서 입력오류
    '지수', 1004
);



