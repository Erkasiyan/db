/*
    9. REPLACE()
        ==> 문자열의 특정부분을 다른 문자열로 대체해서 반환해주는 함수
        
        형식 ]
            REPLACE(데이터, 찾을문자, 대치문자)
            
    10. TRIM()
        ==> 문자열 중에서 앞 또는 뒤에 있는 지정한 문자를 삭제해서 반환해주는 함수
        
        참고 ]
            중간에 있는 문자는 삭제하지 못한다.
            
        형식 ]
            TRIM([삭제할문자 FROM ] 데이터)
        참고 ]
            같은 문자가 앞, 뒤에 연속되어 있으면 모두 지운다.
            
        참고 ]
            가끔 데이터 앞 또는 뒤에 공백문자가 들어간 경우가 있다.
            이런 경우를 대비해서 앞 뒤에 들어간 공백 문자를 제거할 목적으로 많이 사용한다.
            
        10 - 1 
            LTRIM
            RTRIM
                형식 ]
                    LTRIM(데이터, 삭제문자)
                    
    11. CHR()
        ==> ASCII 코드를 알려주면 그 코드에 해당하는 문자를 알려주는 함수
        
        형식 ]
            CHR(숫자)
        
    12. ASCII()
        ==> 문자열에 해당하는 ASCII 코드를 알려주는 함수
        
        형식 ]
            ASCII(데이터)
            
        참고 ]
            두글자이상으로 된 문자열의 경우는 
            첫문자의 코드값을 반환해준다.
            
    13. TRANSLATE
        ==> REPALCE 와 마찬가지로 문자열 중 지정한 부분을 
            다른 문자열로 바꿔서 반환해주는 함수
            
            차이점 ]
                REPLACE 함수는 바꿀 문자열 전체를 바꾸는데
                이 함수는 문자단위 처리한다.
                
        형식 ]
            TRANSLATE(데이터, 바꿀문자열, 바뀔문자열)
*/

SELECT
    REPLACE('hong gil dong', 'n', 'nn') 홍길동
FROM
    dual
;

SELECT
    REPLACE('     hong gil dong     ', ' ', '') 홍길동
FROM
    dual
;

SELECT
    TRIM('     hong gil dong     ') 홍길동
FROM
    dual
;


SELECT
    TRIM(' ' FROM '     hong gil dong     ') 홍길동
FROM
    dual
;

SELECT
    RTRIM(
        LTRIM('ooooooooooooracleoooooooooooooooo', 'o'),
        'o'
    ),
    TRIM('o' FROM 'ooooooooooooracleoooooooooooooooo')
FROM
    dual
;

-- ASCII()
SELECT
    ASCII('HONG') 코드값,
    CHR(ASCII('HONG')) 알파벳
FROM
    dual
;

SELECT
    TRANSLATE('ADBC', 'ABCD', '1234')
    /*
        A ---> 1
        B ---> 2
        C ---> 3
        D ---> 4
        로 변환한다.
    */
FROM
    dual
;


--------------------------------------------------------------------------------
/*
    날짜 처리 함수
    
        **
        참고 ]
            SYSDATE
            ==> 예약어 
                현재 시스템의 날짜와 시간을 알려주는 예약어
                (의사 컬럼으로 보면 된다.)
                
        참고 ]
            날짜 - 날짜 의 연산식이 가능하다.
            날짜 연번끼리 - 연산을 하게된다.
            
            참고 ]
                날짜연번 : 날수.시간
            
            날짜데이터의 기준점은 1970년 1월 1일 0시 0분 0초를 기준으로 한다.
            
        참고 ]
            날짜데이터의 연산은 오직 - 연산만 가능하다.
            날짜 + 날짜,
            날짜 * 날짜,
            날짜 / 날짜
            는 허락하지 않는다.
            
        참고 ]
            날짜 +(또는 -)  숫자
            의 연산은 가능하다.
            ==> 날짜 연번 +(-) 숫자이므로
                결국 날짜에서 원하는 숫자만큼 이동된 날짜를 표시한다.
                
    2. MONTHS_BETWEEN
        ==> 두 날짜 데이터의 개월수를 알려주는 함수
            
            형식 ]
                MONTHS_BETWEEN(날짜, 날짜)
*/

-- 사원들의 근무일수를 조회하세요.
SELECT
    ename 사원이름, 
    FLOOR(sysdate - hiredate) 근무일수
FROM
    emp
;

SELECT
    SYSDATE + 10 "10일후"
FROM
    DUAL
;

--------------------------------------------------------------------------------
/*
    날짜데이터 처리함수
        
        1. ADD_MONTHS()
            ==> 날짜에 지정한 달수를 더하거나 뺀 날짜를 알려준다.
            
            형식 ]
                ADD_MONTHS(날짜, 더할개월수)
                
            참고 ]
                더할개월수에 음수를 입력하면
                해당 개월수를 뺀 날짜를 알려준다.
                
    3. 
*/

SELECT
    ADD_MONTHS(SYSDATE, 4) "4개월후",
    ADD_MONTHS(SYSDATE, -3) "3개월전"
FROM
    dual
;

-- 사원들의 근무개월수를 조회하세요.
SELECT
    ename 사원이름,
    hiredate 입사일,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) "근무개월수"
FROM
    emp
;