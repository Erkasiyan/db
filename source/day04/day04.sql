/*
    참고 ]
        HAVING 절
        ==> 그룹화한 결과를 필터링을 할 때
            필터링 조건을 기술하는 절....
            
        참고 ]
            WHERE 절에는 그룹함수를 사용할 수 없다.
            HAVING 절에는 그룹함수를 사용할 수 있다.
*/

/*
    JOIN 
    ==> Relation DataBase Management System 에서는 데이터의 중복을 피하기 위해서
        테이블을 분리하고 그럼으로써 테이블들 간에 관계가 형성이 되었다.
        
        그런데 분리된 테이블에서 데이터를 추출해낼때 사용하는 문법이 JOIN 이다.
        
        참고 ]
            오라클 역시 ER 형태의 데이터베이스이다.
            ER
                엔티티(테이블)끼리의 관계를 이야기하고
                이런 관계들로 테이블을 관리하는 데이터베이스를 관계형데이터베이스라고 한다.
                
    참고 ]
        관계형데이터베이스에서는 여러개의 테이블에서 동시에 검색하는 기능은 이미 가지고 있다.
        ==> 이때 여러개의 테이블에서 데이터를 동시에 검색하면
            Cartesian Product 가 만들어지는데
            이 결과에는 정확하지 않은 데이터도 포함되어있다.
            따라서 정확한 데이터만 필터링해서 꺼내와야 하는데
            이때 이 필터링하는 작업이 JOIN 이라고 한다.
                
*/

-- 영문색상이름 테이블
DROP TABLE ecolor;
CREATE TABLE ecolor (
    ceno NUMBER(3) -- 영문 칼라 일련번호
        CONSTRAINT ECLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7) -- 칼라 코드값
        CONSTRAINT ECLR_CODE_UK UNIQUE
        CONSTRAINT ECLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT ECLR_NAME_NN NOT NULL
);

-- 데이터추가
INSERT INTO
    ecolor
VALUES(
    100, '#FF0000', 'red'
);

INSERT INTO
    ecolor
VALUES(
    101, '#00FF00', 'green'
);

INSERT INTO
    ecolor
VALUES(
    102, '#0000FF', 'blue'
);

-- 영문칼라테이블 조회
SELECT * FROM ecolor;
COMMIT; -- 메모리의 작업영역에서 작업한 내용을 데이터베이스에 적용시키는 명령


CREATE TABLE kcolor (
    ckno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7)
        CONSTRAINT KCLR_CODE_UK UNIQUE
        CONSTRAINT KCLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT KCLR_NAME_NN NOT NULL
);

-- 데이터추가
INSERT INTO
    kcolor
VALUES(
    100, '#FF0000', '빨강'
);

INSERT INTO
    kcolor
VALUES(
    101, '#00FF00', '녹색'
);

INSERT INTO
    kcolor
VALUES(
    102, '#0000FF', '파랑'
);

commit;


SELECT * FROM ecolor;
SELECT * FROM kcolor;

SELECT
    *
FROM
    ecolor, kcolor
;

SELECT
    *
FROM
    emp e, emp ee
;

SELECT
    ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code -- 조인조건
;
