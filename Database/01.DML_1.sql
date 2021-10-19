--SELECT문의 기본구조
--SELECT * 혹은 컬럼명
--FROM 테이블명; 

-- 지정한 테이블의 모든 행, 모든 열 조회하기 
SELECT *
FROM DEPARTMENTS;

--직원(EMPLOYEES)테이블의 모든 행, 모든 열 조회하기 
SELECT *
FROM EMPLOYEES;

--국가(COUNTRIES)테이블의 모든 행, 모든 열 조회하기 
SELECT *
FROM COUNTRIES;
--------------------------------------------------------------------------------
--테이블의 모든 행, 지정한 열 조회하기 
--SELECT 컬럼명, 컬럼명, 컬럼명, ...(내가 보고싶은 열을 개별적으로 지정후)
--FROM 테이블명; 전체적인 열을 출력하겠다.

--직원(EMPLOYEES)테이블에서 직원아이디, 직원이름, 입사일, 급여를 지정하기 
--직원아이디: EMPLOYEE_ID, 직원이름:FIRST_NANE ,입사일:HIRE_DATE,급여:SALARY
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;

--직원(EMPLOYEES)테이블에서 직원아이디, 직원이름, 전화번호, 이메일을 조회하기 
--전화번호 :PHONE_NUMBER, 이메일:EMAIL
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES;

--부서(DEPARTMENT)테이블에서 부서아이디, 부서명 조회하기 
SELECT DEPARTMENT_ID, DEPARTMENT_NAME 
FROM DEPARTMENTS;

--직종(JOBS)테이블에서 직종아이디, 직종제목 조회하기 
SELECT JOB_ID, JOB_TITLE
FROM JOBS;
--소재지(LOCATIONS)테이블에서 소재지 아이디, 주소, 도시명 조회하기 
SELECT LOCATION_ID, STREET_ADDRESS, CITY
FROM LOCATIONS;

------------------------------------------------------------------------------
--SELECT절 에서 산술연산자 사용하기 (+,-,*,/)

--직원테이블에서 직원이름, 직원급여, 직원 연봉 조회하기 
--직원연봉은 급여*12로 가정한다. 
SELECT FIRST_NAME, SALARY, SALARY * 12
FROM EMPLOYEES;

--직종테이블(JOBS)에서 직종아이디, 최저급여, 최고급여, 최저급여의 차이를 조회하기 
SELECT JOB_ID, MIN_SALARY, MAX_SALARY, MAX_SALARY - MIN_SALARY
FROM JOBS;
--직원테이블에서 직원아이디, 이름, 급여, 10%인상된 급여, 인상된 금액을 조회하기 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*1.1, SALARY*1.1 - SALARY
FROM EMPLOYEES;

-----------------------------------------------------------------------------
--SELECT 절의 컬럼명에 별칭 사용하기 
--SELECT 컬럼명 AS 별칭, 컬럼명 AS 별칭, 컬럼명 AS별칭
--FROM 테이블명;

--SELECT 컬럼명 별칭, 컬럼명 별칭, 컬럼명 별칭(AS를 생략해도 됨)
--FROM 테이블명;

-- * 만약 별칭에 공백이나 특수문자가 포함되어있는 경우 ""로 감싸야 한다. 

--별칭의 필요 이유, SELECT절에서 연산식을 사용한 경우 
--연산식이 컬럼NAME으로 바뀌기 때문에 식별확인이 어려움 그래서 별칭을 작성하게 된다. 
SELECT EMPLOYEE_ID AS 직원아이디, FIRST_NAME AS 이름, SALARY AS 급여, SALARY*12 AS 연봉
FROM EMPLOYEES;
--컬럼의 이름이 변경이 된 것이 아닌, 지정해준 이름의 별칭명으로 출력되는 것뿐임,한글은 잘 작성하지 않음

--직종테이블에서 직종아이디, 최저급여, 최고급여, 최고급여와 최저급여 차이를 조회하기 
SELECT JOB_ID 아이디, MIN_SALARY 최저급여, MAX_SALARY 최고급여, MAX_SALARY - MIN_SALARY "급여 차이"
FROM JOBS;
-- * 별칭에 공백을 포함시키지 말자

--------------------------------------------------------------------
--중복된 결과 제거하기 
--SELECT DISTINCT 컬럼명, 컬럼명, ...
--FROM 테이블명;

-- 직원테이블에서 직원들이 소속된 부서아이디 조회하기
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

-- JAVA와 ORACLE의 null
-- JAVA에서 null: 참조변수가 가지는 값, 참조변수가 객체를 참조하고 있지 않다.
-- ORACLE에서 null: 그 레코드에 대한 그 컬럼의 값이 아직 결정되지 않았다.

---------------------------------------
-- 행을 제한하기(데이터 필터링하기)
-- SELECT 컬럼명, 컬럼명, 컬럼명, ...
-- FROM 테이블명
-- WHERE 조건식;
-- 조건식의 값이 TRUE로 판정되는 행만 조회됨
-- 조건식에서는 비교연산자, 논리연산자, 기타연산자들이 사용됨
-- 비교연산자: > < >= <= =(같다가 등호 하나) !=(같지 않다, 오라클에서 <>도 같은 의미)
-- 논리연산자: AND OR NOT

-- 급여를 15000달러 이상 받은 직원들의 직원아이디, 이름, 급여 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 15000;

-- 60번 부서에서 일하는 직원들의 직원아이디, 직원이름, 직종아이디를 조회하기
-- EMPLOYEE테이블의 DEPARTMENT_ID는 직원의 소속부서 아이디
-- EMPLOYEE테이블의 DEPARTMENT_ID가 60인 직원을 조회하는 것
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 세일즈매니저(SA_MAN)로 종사하고 있는 직원의 아이디, 이름, 전화번호, 이메일 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'; -- 소문자로 적으면 아무것도 안나타남
-- 오라클의 키워드와 식별자(테이블명, 컬럼명, 별칭 등)은 대소문자를 구분하지 않음
-- 하지만 테이블에 저장된 값은 대소문자를 엄격하게 구분함

-- WHERE절에서 여러 개의 조건으로 행을 필터링하기
-- SELECT 컬럼명, 컬럼명, 컬럼명
-- FROM 테이블명
-- WHERE 조건식1 AND 조건식2 AND 조건식3
-- * 각 조건식은 비교연산자, 논리연산자, 기타연산자를 사용해서 TRUE/FALSE로 판정되는 조건식

-- 50번 부서에 소속되어 있고, 급여를 3000달러 이하로 받은 직원들의
-- 직원아이디, 직원이름, 입사일자, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50 AND SALARY <= 30000;

-- 직원들 중에서 급여를 10000달러 이상 15000달러 미만으로 받는 직원들의 
-- 직원아이디, 이름, 직종아이디, 급여 조회하기 
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <= 15000;
