-- 행을 제한하는 기타 연산자

-- 컬럼의 값이 null인 행을 조회하기
-- SELECT 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- WHERE 컬럼명 IS NULL;

-- 컬럼의 값이 null이 아닌 행을 조회하기
-- SELECT 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- WHERE 컬럼명 IS NOT NULL;

-- 부서관리자가 아직 지정되지 않은 부서의 부서아이디, 부서이름 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID = NULL; -- NULL은 컬럼의 값이 정해지지 않은 것이기 때문에 크다, 작다, 같다, 같지않다 등의 비교를 할 수 없다.

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- 소속부서가 지정되지 않은 사원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- 자신의 관리자(상사)가 지정되지 않은 사원의 아이디, 이름, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 커미션을 받는 직원들 중에서 급여를 10000달러 이상 받는 사원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL AND SALARY >= 10000;

-- 커미션을 받지 않는 직원들 중에서 급여가 3000달러 이상 5000달러 미만인 사원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL AND SALARY >= 3000 AND SALARY < 5000;

--------------------------------------------------------------------------------
-- 지정된 범위에 속하는 행 조회하기
-- SELECT 컬럼명, 컬럼명, ...
-- WHERE 컬럼명 BETWEEN A AND B;

-- BETWEEN A AND B
-- 조건식 값이 A이상 B이하일 참을 반환한다

-- 급여가 3000달러 이상 5000달러 미만인 사원의 아이디, 이름, 급여, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY >= 3000 AND SALARY <= 5000;

--------------------------------------------------------------------------------
-- 제시된 값 중 하나를 컬럼이 가지고 있으면 TRUE로 판정하기
-- SELECT 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- WHERE 컬럼명 IN (값1, 값2, 값3, ...);
-- * IN 연산자는 OR 연산을 대체할 수 있다.
-- * IN 연산자는 컬럼명과 제시된 값에 대해서 EQUAL 비교만 한다.

-- 소속된 부서 아이디가 10이거나 20번이거나 30번인 직원의 아이디, 이름, 부서아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30; 
-- * OR 연산자를 중복해서 사용하는 것은 좋지 않다.

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30);
-- * OR 연산자 대신 IN 연산자를 사용하자

-- 소속부서 아이디가 10, 20, 30 중에 하나이고, 급여를 10000달러 이상 받는 직원의
-- 직원 아이디, 이름, 소속부서아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30) AND SALARY >= 10000;
-- * OR와 AND가 조건식에서 같이 사용되면 OR 조건끼리 괄호로 묶어야 한다.

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30) AND SALARY >= 10000;
-- * OR와 AND가 조건식에서 같이 사용되면 OR부분은 IN 연산자로 대체하자

--------------------------------------------------------------------------------
-- 패턴 검색하기
-- SELECT 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- WHERE 컬럼명 LIKE '패턴';
-- 패턴 문자: _ % 가 있다.

-- 매니저로 일하고 있는 직원의 아이디, 이름, 직종 조회하기
-- (매니저로 일하고 있는 직원은 직종아이디가 XX_MAN 이다.)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

--------------------------------------------------------------------------------
-- 조회된 행 정렬하기

-- ORDER BY 절을 사용하면 조회된 행을 정렬할 수 있다.
-- ORDER BY 절에 컬럼명이나 표현식을 저장하면 해당 값에 대해서 오름차순으로 정렬된다.
-- ASC, DESC를 지정하면 정렬 방식을 오름차순, 내림차순으로 변경할 수 있다. 지정하지 않으면 오름차순으로 정렬된다.
-- SELECT 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- (WHERE 조건식)
-- ORDER BY 컬럼명 (ASC | DESC)

-- 60번 부서에 소속된 직원들의 아이디, 이름, 입사일, 급여를 조회하기
-- 이름으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY FIRST_NAME;

-- 급여순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY ASC;

-- 입사일 순으로 내림차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY HIRE_DATE DESC;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY 3 DESC; -- SELECT절의 컬럼중에서 3번째 컬럼의 값을 기준으로 정렬시키기 (권장되지 않음)

-- 직종정보 테이블에서 모든 직종정보의 아이디, 제목, 최저급여를 조회하기
-- 최저급여를 기준으로 내림차순 정렬하기
SELECT JOB_ID, JOB_TITLE, MIN_SALARY
FROM JOBS
ORDER BY MIN_SALARY DESC;

-- 60번과 80번 부서에서 근무중인 직원들의 급여, 이름, 입사일을 조회하기
-- 급여를 기준으로 내림차순 정렬하고, 급여가 같을 때는 이름 기준으로 오름차순 정렬시킨다.
SELECT SALARY, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (60, 80)
ORDER BY SALARY DESC, FIRST_NAME ASC;

--------------------------------------------------------------------------------
-- 테이블에 대이터 추가/변경/삭제하기

-- 학생이름, 국어점수, 수학점수, 영어점수를 저장하는 테이블을 정의하고,
-- 해당 테이블에 성적정보를 추가/변경/삭제하기

-- 테이블 생성하기
CREATE TABLE TB_SCORES (
    STUDENT_NAME VARCHAR2(20) NOT NULL, -- 학생이름 컬럼명: STUDENT_NAME 데이터타입: VARCHAR2 길이: 20    NULL값 허용여부: 허용하지 않음
    KOR_SCORE NUMBER(3,0) DEFAULT 0,    -- 국어점수 컬럼명: KOR_SCORE    데이터타입: NUMBER   길이: 3 소숫점없는 최대 3자리 정수     기본값: 0
    ENG_SCORE NUMBER(3,0) DEFAULT 0,    -- 영어점수 컬럼명: ENG_SCORE    데이터타입: NUMBER   길이: 3 소숫점없는 최대 3자리 정수     기본값: 0
    MATH_SCORE NUMBER(3,0) DEFAULT 0    -- 수학점수 컬럼명: MATH_SCORE   데이터타입: NUMBER   길이: 3 소숫점없는 최대 3자리 정수     기본값: 0
);

--------------------------------------------------------------------------------
-- 새로운 행 추가하기
-- INSERT INTO 테이블명(컬럼1, 컬럼2, ...) VALUES(값1, 값2, ...);

-- 테이블의 모든 컬럼에 값을 지정하고(NULL값도 가능) 컬럼순서대로 값을 지정하는 경우에는 컬럼명을 나열하지 않아도 된다.
-- INSERT INTO 테이블명 VALUES(값1, 값2, 값3, ..., 값N);

-- TB_SCORES 테이블에 성적정보 추가하기
-- 김유신, 100, 90, 90
-- 강감찬, 80, 80, 70
-- 이순신, 100, 80, 70
-- 안중근, 80, 60, 60
-- 류관순, 90, 70, 90
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('김유신', 100, 90, 90);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('강감찬', 80, 80, 70);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('이순신', 100, 80, 70);
INSERT INTO TB_SCORES VALUES('안중근', 80, 60, 60);
INSERT INTO TB_SCORES VALUES('류관순', 90, 70, 90);

-- COMMIT과 ROLLBACK
-- COMMIT: INSERT/UPDATE/DELETE 명령어 실행결과를 테이블에 반영시킨다.
-- ROLLBACK: INSERT/UPDATE/DELETE 명령어 실행결과를 테이블에 반영시키지 않는다. 테이블의 데이터가 INSERT/UPDATE/DELETE 실행 전으로 되돌아간다.
-- * COMMIT과 ROLLBACK이 실행 된 후에는 그 작업을 되돌릴 수 없다.
-- * COMMIT 실행 후 테이블에 반영된 것을 ROLLBACK 시킬 수 없다.
-- * ROLLBACK으로 반영이 취소된 것을 COMMIT으로 반영시킬 수 없다.


-- COMMIT 명령어를 실행하면 INSERT INTO로 테이블에 추가한 행이 실제 테이블에 반영된다.
COMMIT;

--------------------------------------------------------------------------------
-- 테이블의 데이터 변경하기

-- UPDATE 테이블명
-- SET
--  컬럼명1 = 값1,
--  컬럼명2 = 값2,
--  ...
--  컬럼명N = 값N -- 맨 마지막 항목에는 ,가 없다.
-- (WHERE 조건식); -- WHERE 조건절은 생략가능하다. 생략하면 테이블의 모든 행에 대해서 변경작업이 실행된다. WHERE 절을 생략하는 경우는 거의 없다.

-- 모든 직원들의 급여가 20000달러로 변경된다.
UPDATE EMPLOYEES
SET
    SALARY = 20000;
    
-- 소속부서 아이디가 60번인 직원들의 급여가 50000달러로 변경된다.
UPDATE EMPLOYEES
SET
    SALARY = 50000
WHERE DEPARTMENT_ID = 60;

-- 10, 20, 30번 부서에 소속된 사원들의 급여가 50000달러로 변경된다.
UPDATE EMPLOYEES
SET
    SALARY = 50000
WHERE EMPLOYEES_ID = 100;

-- ROLLBACK 위에서 실행했던 모든 변경작업의 테이블 반영을 취소시킨다.
ROLLBACK;

-- 김유신 학생의 영어점수와 수학점수를 각각 95점 85점으로 변경하기
UPDATE TB_SCORES
SET
    ENG_SCORE = 95,
    MATH_SCORE = 85
WHERE STUDENT_NAME = '김유신';

-- 모든 학생의 총점과 평균 컬럼의 값을 변경하기
UPDATE TB_SCORES
SET
    TOTAL_SCORE = KOR_SCORE + ENG_SCORE + MATH_SCORE,
    AVERAGE = (KOR_SCORE + ENG_SCORE + MATH_SCORE) / 3;
-- * 컬럼의 값을 변경하기 위해서 기존 컬럼의 값을 사용하는 것이 가능하다.
-- * 컬럼의 값을 변경하기 위해서 사칙 연산을 포함하는 표현식도 상관없다.

COMMIT;

--------------------------------------------------------------------------------
-- 테이블의 행 삭제하기
-- DELETE FROM 테이블명
-- (WHERE 조건식) -- WHERE절을 생략하면 테이블의 모든 행이 삭제된다. WHERE절 없이 DELETE 구문을 실행하는 경우는 거의 없다.

-- 성적정보 테이블에서 김유신 학생의 정보를 삭제하기
DELETE FROM TB_SCORES
WHERE STUDENT_NAME = '김유신';

-- 평균이 80점 미만인 학생의 성적정보 삭제하기
DELETE FROM TB_SCORES
WHERE AVERAGE < 80;

-- 위에서 수행했던 모든 작업이 테이블 반영을 취소시킨다.
ROLLBACK;

SELECT *
FROM TB_SCORES;

--------------------------------------------------------------------------------
-- DML 실습하기
-- 책정보 테이블 정의하기
-- 책정보
-- 번호:    BOOK_NO              NUMBER    5 PRIMARY KEY,
-- 제목:    BOOK_TITLE           VARCHAR2  250 NOT NULL,
-- 저자:    BOOK_WRITER          VARCHAR2  100 NOT NULL,
-- 출판사:  BOOK_PUBLISHER       VARCHAR2  100,
-- 가격:    BOOK_PRICE           NUMBER    7,
-- 할인가격: BOOK_DISCOUNT_PRICE  NUMBER    7,
-- 재고:    BOOK_STOCK           NUMBER    4,
-- 판매여부: BOOK_ON_SALE         VARCHAR2  30

-- 0. 기존 테이블 삭제하기
-- DROP TABLE 테이블명;

-- 1. CREATE TABLE 구문을 사용해서 테이블 생성하기
--    테이블명은 TB_SAMPLE_BOOKS다.
CREATE TABLE TB_SAMPLE_BOOKS (
    BOOK_NO              NUMBER    (5)   PRIMARY KEY,
    BOOK_TITLE           VARCHAR2  (250) NOT NULL,
    BOOK_WRITER          VARCHAR2  (100) NOT NULL,
    BOOK_PUBLISHER       VARCHAR2  (100),
    BOOK_PRICE           NUMBER    (7),
    BOOK_DISCOUNT_PRICE  NUMBER    (7),
    BOOK_STOCK           NUMBER    (4)   DEFAULT 10,
    BOOK_ON_SALE         VARCHAR2  (30)  DEFAULT '판매중'
);

-- 2. INSERT INTO 구문을 사용해서 TB_SAMPLE_BOOKS
--    여러분 집 책장에 꽂혀있는 책을 참고해서 여러개 추가하기
--    책 정보를 추가할 때 책 번호는 중복값이 추가되지 않도록 한다.
--    가격, 할인가격, 재고, 판매여부는 임의의 값으로 정의한다.
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10001, '이것이 자바다', '이순신', '한빛미디어', 35000, 33000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10002, '자바의 정석', '홍길동', '한빛미디어', 35000, 33000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10003, '스프링 인 액션', '김유신', '제이펍', 45000, 42000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10004, '이펙티브 자바', '강감찬', '인사이트 출판사', 18000, 16000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10005, '빅데이터 기술', '류관순', '위키북스', 35000, 32000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10006, '프로 스프링 3', '이순신', '에이콘출판사', 38000, 35000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10007, '하이브 완벽 가이드', '김유신', '한빛미디어', 20000, 18000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10008, '맵리듀스 디자인 패턴', '홍길동', '한빛미디어', 20000, 18000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10009, '오라클 성능 고도화 원리와 해법', '김유신', '인사이트 출판사', 45000, 41000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10010, '하둡 완벽 가이드', '이순신', '한빛미디어', 30000, 27000);

-- 3. COMMIT을 실행해서 추가된 책정보를 테이블에 반영시킨다.
COMMIT;

-- 4. TB_SAMPLE_BOOKS 테이블에 저장된 모든 책 정보를 조회하기
SELECT *
FROM TB_SAMPLE_BOOKS;

--------------------------------------------------------------------------------
-- 엑셀에 저장된 정보로 테이블에 데이터 추가하기
-- 1. 테이블 정의하기
CREATE TABLE TB_EXCEL_BOOKS (
    BOOK_NO NUMBER(5) PRIMARY KEY,
    BOOK_TITLE VARCHAR2(250) NOT NULL,
    BOOK_WRITER VARCHAR2(250) NOT NULL,
    BOOK_PUBLISHER VARCHAR2(250),
    BOOK_PRICE NUMBER(7),
    BOOK_DISCOUNT_PRICE NUMBER(7),
    BOOK_POINT NUMBER(5),
    BOOK_REVIEW_SCORE NUMBER(3, 1),
    BOOK_SAIL_SCORE NUMBER(8)
);


