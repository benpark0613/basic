-- 서브쿼리
-- 다른 SQL에 포함된 SQL문이다.
-- SELECT절, FROM절, WHERE절, HAVING절에서 사용할 수 있다.

-- WHERE절이나 HAVING절에서사용되는 서브쿼리는 조건식의 값을 제공하는 서브쿼리다.
-- 조건식에서 사용되는 값이 SQL실행으로 획득되는 경우에 서브쿼리를 사용한다.

--------------------------------------------------------------------------------
-- 단일행 서브쿼리

-- 100번 사원과 같은 부서에서 일하는 사원의 아이디, 이름 조회하기
-- 1. 100번 사원이 일하는 부서 조회하기
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100;
--2. 90번 부서에서 일하는 직원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

-- 100번 사원과 같은 부서에서 일하는 사원의 아이디, 이름 조회하기 (서브쿼리 사용)
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM EMPLOYEES
                       WHERE EMPLOYEE_ID = 100);
                       
-- 전체 직원의 평균급여보다 적은 급여를 받는 직원아이디, 이름, 급여 조회하기
-- 1. 전체 직원의 평균급여 조회하기
SELECT AVG(SALARY)
FROM EMPLOYEES;
-- 2. 6461.8317 보다 적은 급여를 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 6461.8317;

-- 전체 직원의 평균급여보다 적은 급여를 받는 직원아이디, 이름, 급여를 조회하기 (서브쿼리 사용)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                 FROM EMPLOYEES);

-- 100 사원과 같은 해에 입사했고, 전체 직원의 평균급여보다 급여를 많이 받는 사원의 아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE EMPLOYEE_ID = 100)
AND SALARY > (SELECT AVG(SALARY)
              FROM EMPLOYEES);

-- 전체 직원의 급여를 인상시키기, 인상금액은 전체 직원의 평균급여의 10%만큼 인상시킨다.
UPDATE EMPLOYEES
SET
    SALARY = SALARY + (SELECT TRUNC(AVG(SALARY)*0.1)
                       FROM EMPLOYEES);

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- 다중행 서브쿼리

-- 자신이 종사하던 직종이 변경된 적이 있는 직원들의 아이디, 이름, 현재 직종 조회
-- 1. 자신이 종사하던 직종이 변경된 적이 있는 직원의 아이디 조회 > 조회결과가 다중행이다.
SELECT DISTINCT EMPLOYEE_ID
FROM JOB_HISTORY;

-- 2. 직종이 변경된 적이 있는 직원들의 아이디, 이름, 현재 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (101, 102, 114, 122, 176, 200, 201);

-- 자신이 종사하던 직종이 변경된 적이 있는 직원들의 아이디, 이름, 현재 직종, 예전 직종아이디 조회 (다중행 서브쿼리 사용, 다중행 서브쿼리 연산자 사용)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID
                      FROM JOB_HISTORY);

-- 자신이 종사하던 직종이 변경된 적이 있는 직원들의 아이디, 이름, 현재 직종, 예전 직종아이디 (조인 사용)
-- 서브쿼리보다 조인을 권장한다.
SELECT DISTINCT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, H.JOB_ID
FROM EMPLOYEES E, JOB_HISTORY H
WHERE E.EMPLOYEE_ID = H.EMPLOYEE_ID;

-- 30번 부서에 소속된 모든 직원의 급여보다 많이 받는 60번 부서 소속의 직원을 조회하기
-- 30번 부서에 소속된 직원의 최대 급여보다 급여를 많이 받는 60번 부서 소속의 직원을 조회하기
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > ALL (SELECT SALARY
                  FROM EMPLOYEES
                  WHERE DEPARTMENT_ID = 30);
                  
-- 30번 부서에 소속된 모든 직원의 급여보다 많이 받는 60번 부서 소속의 직원을 조회하기      
-- 30번 부서에 소속된 직원의 최대 급여보다 급여를 많이 받는 60번 부서 소속의 직원을 조회하기
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > (SELECT MAX(SALARY)
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 30);
-- 30번 부서에 소속된 직원 중 아무나 한명의 급여보다 급여를 많이 받는 60번 부서 소속의 직원을 조회하기   
-- 30번 부서에 소속된 직원의 최저 급여보다 급여를 많이 받는 60번 부서 소속의 직원을 조회하기
               
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > ANY (SELECT SALARY
                  FROM EMPLOYEES
                  WHERE DEPARTMENT_ID = 30);
-- 30번 부서에 소속된 직원 중 아무나 한명의 급여보다 급여를 많이 받는 60번 부서 소속의 직원을 조회하기   
-- 30번 부서에 소속된 직원의 최저 급여보다 급여를 많이 받는 60번 부서 소속의 직원을 조회하기 
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > (SELECT MIN(SALARY)
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 30);

--------------------------------------------------------------------------------
-- 다중 열 서브쿼리
-- SELECT *
-- FROM TABLE
-- WHERE (COL1, COL2) IN (SELECT COL3, COL4
--                        FROM TABLE)

-- 부서별 최저 급여를 조회하기
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 자신이 소속된 부서에서 최저급여를 받는 사원의 부서아이디, 사원아이디, 급여를 조회하기
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                  FROM EMPLOYEES
                                  WHERE DEPARTMENT_ID IS NOT NULL
                                  GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID ASC;

--------------------------------------------------------------------------------
-- HAVING 절에서 서브쿼리 사용하기

-- 부서별 사원수를 조회했을 때 사원수가 5명 이하인 부서의 아이디와 사원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) <= 5
ORDER BY 1;

-- 부서별 사원수를 조회했을 때 사원수가 가장 많은 부서의 아이디와 사원수를 조회하기
SELECT MAX(COUNT(*))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = 45;

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMPLOYEES
                   WHERE DEPARTMENT_ID IS NOT NULL
                   GROUP BY DEPARTMENT_ID);

-- WITH절
-- SQL의 실행결과를 지정된 이름으로 캐싱(임시보관)한다.
-- 서브쿼리를 사용하는 SQL문에서 반복적으로 실행되는 SQL에 대해서 WITH절을 사용하면 실행 성능이 향상된다.
-- WITH절에서 정의한 가상의 테이블의 아래 SELECT문에서 사용할 수 있다.
-- WITH절은 단독으로 사용할 수 없다.
-- WITH 별칭1
-- AS (SELECT 문),
-- 별칭2
-- AS (SELECT 문)
-- SELECT COL, COL
-- FROM 별칭1
-- WHERE 조건식

-- WITH절을 사용해서 부서별 사원수를 조회했을 때 사원수가 가장 많은 부서의 아이디와 사원수를 조회하기
WITH DEPT_EMP_CNT
AS (
    SELECT DEPARTMENT_ID AS DEPT_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NOT NULL
    GROUP BY DEPARTMENT_ID
), JOB_EMP_CNT
AS ( 
    SELECT JOB_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    GROUP BY JOB_ID
)
SELECT DEPT_ID, CNT
FROM DEPT_EMP_CNT
WHERE CNT = (SELECT MAX(CNT)
             FROM DEPT_EMP_CNT);




