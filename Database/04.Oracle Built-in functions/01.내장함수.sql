-- 문자함수
-- 대/소문자 변환
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 문자열 잘라내기
-- SUBSTR(컬럼명, 시작위치) : 시작위치부터 끝까지 잘라낸다.
-- SUBSTR(컬럼명, 시작위치, 길이) 시작위치부터 지정된 길이만큼 잘라낸다.
SELECT JOB_ID, SUBSTR(JOB_ID, 1, 2), SUBSTR(JOB_ID, 4)
FROM JOBS;

-- 문자열 길이 조회하기
-- LENGTH(컬럼명) : 해당 컬럼에 저장된 값의 길이를 반환한다.
SELECT JOB_ID, LENGTH(JOB_ID)
FROM EMPLOYEES
ORDER BY LENGTH(JOB_ID) DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY JOB_ID_LENGTH DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY 2 DESC;

-- 문자열 채우기
-- LPAD(컬럼명, 전체길이, '패딩문자') : 문자열의 길이가 전체길이만큼 되도록 왼쪽에 패딩문자를 채운다.
-- RPAD(컬럼명, 전체길이, '패딩문자') : 문자열의 길이가 전체길이만큼 되도록 오른쪽에 패딩문자를 채운다.
SELECT FIRST_NAME, LPAD(FIRST_NAME, 15, '#'), RPAD(FIRST_NAME, 15, '#')
FROM EMPLOYEES;

SELECT LPAD('1234', 10, '0'), LPAD('12', 10, '0'), LPAD(123456, 10, '0')
FROM DUAL;

-- DUAL은 오라클에 내장된 1행 1열짜리 테이블이다.
SELECT *
FROM DUAL;

-- 문자열 연결하기
-- CONCAT(컬럼명1, 컬럼명2) : 지정된 컬럼의 값들을 서로 이어붙인다.
-- 컬럼명1 || 컬럼명2 || 컬럼명3 || ... || 컬럼명n : n개의 컬럼의 값들을 서로 이어붙인다.
SELECT FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, LAST_NAME), FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 불필요한 공백 없애기
-- TRIM(컬럼명) : 지정된 컬럼의 값 왼쪽, 오른쪽에 위치한 무의미한 공백을 제거한다.
SELECT TRIM('                              ABC        ABC                  ABC                    ')
FROM DUAL;

-- 문자열 바꾸기
-- REPLACE(컬럼명, 찾는문자열, 대체할문자열) : 지정한 컬럼에서 특정문자열을 찾아서 다른 문자열로 대체시킨다.
SELECT FIRST_NAME, REPLACE(LOWER(FIRST_NAME), 'a', '*')
FROM EMPLOYEES;

-- 문자열 찾기
-- INSTR(컬럼명, '찾는문자열') : 지정한 컬럼에서 찾는 문자의 위치를 반환한다.
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'A')
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- 숫자함수
-- 반올림하기(컬럼명) : 숫자를 일의 자리로 반올림한다.
-- 반올림하기(컬럼명, 자릿수) : 숫자를 지정된 자리수까지 반올림한다. 
--                           자릿수가 양의 정수면 소숫점자릿수
--                           자릿수가 음의 정수면 일의 자리, 십의 자리, 백의 자리 등으로 반올림한다.
SELECT ROUND(123.45, 2), ROUND(123.45, 1), ROUND(123.45, 0), ROUND(123.45), ROUND(123.45,-1), ROUND(123.45, -2)
FROM DUAL;

-- 소수점값 버리기
-- TRUNC(컬럼명) : 소숫점 부분을 반올림하지 않고 ,무조건 버린다.
SELECT ROUND(123.45), ROUND(123.55), TRUNC(123.45), TRUNC(123.55)
FROM DUAL;

-- 천장값과 바닥값 구하기
-- CEIL(컬럼명) : 자신보다 큰 정수 중에서 가장 작은 정수를 반환한다.
-- FLOOR(컬럼명) : 자신보다 작은 정수 중에서 가장 큰 정수를 반환한다.
SELECT ROUND(2.6), TRUNC(2.6), CEIL(2.6), FLOOR(2.6)
FROM DUAL;

-- 나머지 구하기
-- MOD(숫자1, 숫자2) : 첫번째 숫자를 두번째 숫자로 나눗셈을 수행하고, 나머지 값을 반환한다.
SELECT MOD(10, 3), MOD(5, 3)
FROM DUAL;

--------------------------------------------------------------------------------
-- 날짜함수
-- SYSDATE : 시스템의 현재 날짜와 시간정보를 반환하는 함수
SELECT SYSDATE
FROM DUAL;

-- 날짜 반올림 및 시간정보 지우기
-- ROUND(날짜) : 해당 날자의 시간이 정오름 넘었을 경우 다음날 0시 0분 0초가 반환된다.
-- TRUNC(날짜) : 해당 날짜의 모든 시간정보를 0으로 바꾼 값이 반환된다.
SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- MONTHS_BETWEEN(날짜1, 날짜2) : 두 날짜 사이의 개월수를 반환한다.
SELECT FIRST_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ADD_MONTHS(날짜, 개월수) : 날짜에서 지정된 개월수만큼 변경된 날짜를 반환한다.
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -3), ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- LAST_DAY(날짜) : 해당 날짜가 속한 달의 맨 마지막 날짜를 반환한다.
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- 날짜 연산
-- 날짜 + 숫자 : 날짜에서 지정된 숫자만큼 경과된 날짜를 반환한다.
-- 날짜 - 숫자 : 날짜에서 지정된 숫자만큼 이전 날짜를 반환한다.
-- 날짜 - 날짜 : 두 날짜 사이의 일수를 반환한다.
-- 날짜 + 날짜 : 오류
-- 날짜 + 숫자/24 : 날짜에서 지정된 시간만큼 경과된 날짜를 반환한다.
-- 날짜 - 숫자/24 : 날짜에서 지정된 시간만큼 이전 날짜를 반환한다.
SELECT SYSDATE, 
        SYSDATE + 1/24 AS "1시간 이후 날짜",
        SYSDATE + 6/24 AS "6시간 이후 날짜",
        SYSDATE + 1    AS "하루 증가된 날짜",
        TRUNC(SYSDATE) - 3    AS "3일 전 날짜", 
        SYSDATE - 7    AS "1주일 전 날짜"
FROM DUAL;

SELECT FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE) - HIRE_DATE AS "총 근무일수"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

--------------------------------------------------------------------------------
-- 기타함수
-- NVL(컬럼명, NULL일 때 대체할 값) : 지정된 컬럼값이 NULL일 때 대체값이 반환된다. NULL이 아니면 컬럼값이 반환된다.
--                                 컬럼값과 대체할 값은 데이터타입이 같은 값이다.
--                                 NULL값을 포함하는 사칙연산의 최종연산결과는 항상 NULL이다.
--                                 사칙연산식에 NULL값을 포함하는 컬럼이 포함되어 있다면 NVL함수를 사용해서 NULL값을 적절한 값으로 대체한 후 연산해야 한다.
SELECT NVL(10, 0), NVL(NULL, 0)
FROM DUAL;

-- 모든 직원들의 이름, 급여, 커미션, 연봉을 조회하기
-- 연봉 : 급여*12 + 급여*커미션*12
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12
FROM EMPLOYEES;

-- NVL2(컬럼명, 값1, 값2) : 지정된 컬럼의 값이 NULL이 아니면 값1, NULL이면 값2가 반환된다.
--                        값1과 값2는 데이터타입이 같은 값이다.

-- 커미션 수령여부를 'YES/NO'값으로 조회하기
SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, 'YES', 'NO')
FROM EMPLOYEES;

-- CASE ~ WHEN 용법1 : IF문과 유사
-- CASE
--      WHEN 조건식1 THEN 표현식1     -- 조건식1이 TRUE로 판정되면 표현식1의 최종결과가 된다.
--      WHEN 조건식2 THEN 표현식2     -- 조건식2이 TRUE로 판정되면 표현식2의 최종결과가 된다.
--      WHEN 조건식3 THEN 표현식3     -- 조건식3이 TRUE로 판정되면 표현식3의 최종결과가 된다.
--      ELSE 표현식4                 -- 조건식1, 조건식2, 조건식3이 모두 FALSE로 판정되면 표현식4의 최종결과가 된다.
-- END 

-- CASE ~ WHEN 용법2
-- CASE
--      WHEN 값1 THEN 표현식1     -- 값이 값1과 일치하면 표현식1이 최종결과가 된다.
--      WHEN 값2 THEN 표현식2     -- 값이 값2과 일치하면 표현식1이 최종결과가 된다.
--      WHEN 값3 THEN 표현식3     -- 값이 값3과 일치하면 표현식1이 최종결과가 된다.
--      ELSE 표현식4              -- 값1, 값2, 값3이 모두 일치하지 않으면 표현식4가 최종결과가 된다.
-- END 

-- 급여에 따른 세금 계산하기
-- 이름, 급여, 세금을 조회하기
-- 세금은 20000달러 초과 : 50%, 15000달러 초과 40%, 10000달러 초과 30%, 5000달러 초과 20%, 그외 10%다.
SELECT FIRST_NAME, SALARY,
       CASE
            WHEN SALARY > 20000 THEN SALARY*0.5
            WHEN SALARY > 15000 THEN SALARY*0.4
            WHEN SALARY > 10000 THEN SALARY*0.3
            WHEN SALARY > 5000  THEN SALARY*0.2
            ELSE SALARY*0.1
        END AS TAX
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- TB_SAMPLE_PRODUCTS 테이블에서 카테고리별 포인트 지급액을 조회하기
-- 카테고리가 스마트폰인 경우 1000점, 노트북인 경우 500점, 태블릿인 경우 700점, 스마트워치인 경우 600점 그외는 200점이다.
SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_DISCOUNT_PRICE,
       CASE PRODUCT_CATEGORY
            WHEN '스마트폰' THEN 1000
            WHEN '노트북' THEN 500
            WHEN '태블릿' THEN 700
            WHEN '스마트워치' THEN 600
            ELSE 200
       END AS POINT
FROM TB_SAMPLE_PRODUCTS;

-- DECODE(컬럼명, 값1, 표현식1,    -- 컬럼의 값이 값1과 일치하면 표현식1이 최종결과가 된다.
--               값2, 표현식2,    -- 컬럼의 값이 값2와 일치하면 표현식2가 최종결과가 된다.
--               값3, 표현식3)    -- 컬럼의 값이 값3과 일치하면 표현식3이 최종결과가 된다.
--                               -- 컬럼의 값이 값1, 값2, 값3 모두와 일치하지 않으면 NULL이 최종결과가 된다.

-- DECODE(컬럼명, 값1, 표현식1,    -- 컬럼의 값이 값1과 일치하면 표현식1이 최종결과가 된다.
--               값2, 표현식2,    -- 컬럼의 값이 값2와 일치하면 표현식2가 최종결과가 된다.
--               값3, 표현식3,    -- 컬럼의 값이 값3과 일치하면 표현식3이 최종결과가 된다.
--               표현식4)         -- 컬럼의 값이 값1, 값2, 값3 모두와 일치하지 않으면 표현식4가 최종결과가 된다.

-- TB_SAMPLE_PRODUCTS 테이블에서 카테고리별 포인트 지급액을 조회하기
-- 카테고리가 스마트폰인 경우 1000점, 노트북인 경우 500점, 태블릿인 경우 700점, 스마트워치인 경우 600점 그외는 200점이다.
SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE,
       DECODE(PRODUCT_CATEGORY, '스마트폰', 1000,
                                '노트북', 500,
                                '태블릿', 700,
                                '스마트워치', 600, 
                                200) AS POINT
FROM TB_SAMPLE_PRODUCTS;

--------------------------------------------------------------------------------
-- 변환함수
-- 오라클은 아래의 4가지 변환을 지원한다.
-- 숫자 > 문자
-- 문자 > 숫자
-- 날짜 > 문자
-- 문자 > 날짜
-- 묵시적 변환 : RDBMS가 자동으로 데이터타입을 변환해 주는 것
-- 명시적 변환 : 변환함수를 사용해서 데이터타입을 변환해 주는 것

-- 묵시적 변환
SELECT '1000' * 10, '1000' - 10, '1000' + 10, '1000'/10     -- 문자 '1000'이 숫자 1000으로 변환
FROM DUAL;
-- 묵시적 변환
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '100';                                  -- 문자 '100'이 EMPLOYEE_ID의 타입과 같은 타입으로 변환
-- 묵시적 변환
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01';                            -- 문자 '2007/01/01'이 HIRE_DATE의 타입과 같은 타입으로 변환
-- 묵시적 변환
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007-01-01';                            -- 문자 '2007/01/01'이 HIRE_DATE의 타입과 같은 타입으로 변환
-- 묵시적 변환
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007.01.01';                            -- 문자 '2007/01/01'이 HIRE_DATE의 타입과 같은 타입으로 변환

-- 명시적 변환
-- 포맷팅된 문자 > 숫자 : TO_NUMBER('포맷팅된문자', '패턴')
SELECT TO_NUMBER('1,000','9,999')*10                        -- TO_NUMBER('포맷팅된문자', '패턴')은 문자가 지정된 패턴의 숫자형식일 때 숫자로 변환
FROM DUAL;

-- 명시적 형변환
-- 숫자 > 포맷팅된 문자 : TO_CHAR(숫자, '포맷팅패턴')
-- 패턴문자 : 0 (숫자 하나와 대응, 정수부에서 해당 자리에 숫자가 없어도 0이 출력된다.)
-- 패턴문자 : 9 (숫자 하나와 대응, 정수부에서 해당 자리에 숫자가 없으면 출력되지 않는다.)
-- 패턴문자 : , (자릿수)
-- 패턴문자 : . (소수점)
SELECT TO_CHAR(1000000, '9,999,999'), TO_CHAR(10000, '9,999,999'), TO_CHAR(1000, '0,000,000')
FROM DUAL;
-- 명시적 형변환
SELECT TO_CHAR(123.456, '999.99'), TO_CHAR(123.456, '000.00'), TO_CHAR(123.4, '999.99'), TO_CHAR(123.4, '000.00')
FROM DUAL;

-- 명시적 형변환
-- 패턴문자 : YYYY 혹은 yyyy (년)
-- 패턴문자 : MM 혹은 mm     (월)
-- 패턴문자 : DD 혹은 dd     (일)
-- 패턴문자 : AM 혹은 am     (오전/오후)
-- 패턴문자 : HH 혹은 hh     (시간)
-- 패턴문자 : HH24 혹은 hh24 (24시간)
-- 패턴문자 : MI 혹은 mi     (분)
-- 패턴문자 : SS 혹은 ss     (초)

-- 날짜 > 포맷팅된 문자
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), TO_CHAR(SYSDATE, 'yyyy/mm/dd'), TO_CHAR(SYSDATE, 'HH24:MI:SS'), TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM DUAL;

-- 포맷팅된 문자 > 날짜
SELECT SYSDATE - TO_DATE('2021/10/01')
FROM DUAL;

-- 2007년 상반기에 입사한 사원들의 목록을 조회
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/06/30') + 1;

--------------------------------------------------------------------------------
-- 다중행 함수
-- SUM(컬럼명)          : 해당 컬럼의 합게를 반환한다. NULL인 행은 제외한다.
-- AVG(컬럼명)          : 해당 컬럼의 평균값을 반환한다. NULL인 행은 제외한다.
-- MAX(컬럼명)          : 해당 컬럼의 최대값을 반환한다. NULL인 행은 제외한다.
-- MIN(컬럼명)          : 해당 컬럼의 최소값을 반환한다. NULL인 행은 제외한다.
-- COUNT(* 혹은 컬럼명) : 행의 갯수를 반환한다. *인 경우 해당 컬럼의 값이 NULL이어도 포함시킨다. 컬럼명을 적으면 해당 컬럼이 NULL이면 제외된다.

-- 60번 부서에 소속된 직원들의 총급여를 조회하기
SELECT SUM(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60번 부서에 소속된 직원들의 평균급여를 조회하기
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60번 부서에 소속된 직원들의 최대급여, 최소급여를 조회하기
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 전체 사원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES;

-- 커미션을 받는 사원의 수를 조회하기
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;
-- 커미션을 받는 사원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 급여를 가장 많이 받은 사람의 이름과 급여를 조회하기
-- 다중행 함수는 행그룹당 한 행만 결과가 나오기 때문에 다중행함수가 아닌 것과 같이 사용할 수 없다.
-- 아래의 SQL 문은 오류다.
SELECT FIRST_NAME, MAX(SALARY)
FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES;

SELECT MAX(SALARY)
FROM EMPLOYEES;

-- 급여를 가장 많이 받은 사람의 이름과 급여를 조회하기
-- 서브쿼리(SUB QUERY)
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);


