-- 그룹함수(다중행함수)
-- COUNT(*), COUNT(컬럼명), SUM(컬럼명), AVG(컬럼명), MIN(컬럼명), MAX(컬럼명)
-- 다중행함수 혹은 그룹함수는 행의 그룹당 조회결과가 하나 조회되는 함수다.
-- 행의 그룹을 지정하지 않으면 테이블의 모든 행이 하나의 그룹이다.

-- 행의 그룹을 지정하지 않았기 때문에 테이블의 모든 행에 대해서 COUNT(*) 함수가 실행된다.
SELECT COUNT(*)
FROM EMPLOYEES;

-- GROUP BY 절
-- 테이블의 행을 지정된 컬럼의 값이 같은 것끼리 그룹으로 묶는다.
-- 다중행함수와 같이 사용하면 그룹당 다중행함수를 실행해서 그룹마다 실행결과를 조회할 수 있다.
-- 테이블에 저장된 데이터에 대해서 그룹별 합계/평균/최소값/최대값/분산/표준편차 등의 결과를 조회할 수 있다.
-- GROUP BY 절에 사용했던 컬럼이나 표현식은 다중행함수와 같이 SELECT절에서 사용할 수 있다.

-- 직원테이블의 직원들을 소속부서별로 구분했을 때 각 부서별 인원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

-- 입사년도별 직원수를 조회하기
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY YEAR;

-- 소속부서별 평균급여 조회하기(부서이름, 평균급여)
SELECT D.DEPARTMENT_NAME, ROUND(AVG(SALARY)) SALARY_AVG
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
ORDER BY 1;

-- 입사년도별 사원수 조회하기
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'), DEPARTMENT_ID
ORDER BY 1, 2;

-- 각 대륙별(REGIONS) 사원수 조회하기
SELECT R.REGION_NAME, COUNT(*)
FROM REGIONS R, COUNTRIES C, LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
WHERE R.REGION_ID = C.REGION_ID
AND C.COUNTRY_ID = L.COUNTRY_ID
AND L.LOCATION_ID = D.LOCATION_ID
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY R.REGION_NAME;

-- HAVING 조건식
-- 그룹함수를 적용한 결과를 필터링할 때 사용한다.
-- WHERE절의 조건식에는 그룹함수를 사용할 수 없다.
-- HAVING절의 조건식에는 그룹함수를 사용할 수 있다.
-- HAVING절은 GROUP BY절과 함께 사용해야 한다. 단독으로 사용할 수 없다.

-- 부서별 사원수를 조회했을 때, 소속된 사원수가 10명 이하인 부서의 아이디와 인원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) <= 10;

-- 입사년도별, 부서별 사원수를 조회했을 때, 2005년도에 10명 이상 입사한 부서의 부서아이디와 사원수를 조회하기
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'), DEPARTMENT_ID
HAVING TO_CHAR(HIRE_DATE, 'YYYY') = '2005' AND COUNT(*) >= 10
ORDER BY 1, 2;

-- 2005년도에 10명 이상 입사한 부서의 부서아이디와 사원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < TO_DATE('2005/12/31') + 1
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 10;















