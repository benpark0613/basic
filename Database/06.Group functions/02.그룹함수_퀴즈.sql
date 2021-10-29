-- 모든 직원의 이름, 소속부서 아이디, 소속부서 이름을 조회하기
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 60번 부서에 소속된 직원의 이름, 업무 아이디, 업무제목을 조회하기
SELECT E.FIRST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.DEPARTMENT_ID = 60
AND E.JOB_ID = J.JOB_ID;

-- 100번 직원이 근무하고 있는 도시의 이름을 조회하기
SELECT L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.EMPLOYEE_ID = 100
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

-- 커미션을 받는 직원의 이름, 부서이름, 급여, 커미션, 연봉을 조회하기
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, E.SALARY, E.COMMISSION_PCT, E.SALARY*12 + E.SALARY*E.COMMISSION_PCT*12
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 커미션을 받지 않는 직원의 이름, 부서이름, 급여, 급여 등급을 조회하기
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, E.SALARY, S.GRADE
FROM EMPLOYEES E, DEPARTMENTS D, SALARY_GRADE S
WHERE E.COMMISSION_PCT IS NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY S.GRADE;

-- 'Toronto'에서 근무하는 모든 직원의 이름, 직종아이디, 부서아이디, 부서이름을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE L.CITY = 'Toronto'
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

-- 급여등급이 'D'인 직원들의 이름, 직종아이디, 급여를 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY
FROM EMPLOYEES E, SALARY_GRADE S
WHERE S.GRADE = 'D' 
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= MAX_SALARY
ORDER BY E.SALARY;

-- 50번과 80번 부서에 소속된 직원들의 아이디, 이름, 매니저 아이디, 매니저 이름을 조회하기
SELECT EMP.EMPLOYEE_ID AS EMP_ID, 
       EMP.FIRST_NAME AS EMP_NAME,
       MGR.EMPLOYEE_ID AS MGR_ID,
       MGR.FIRST_NAME AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.DEPARTMENT_ID IN (50, 80) 
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- 자신의 매니저보다 먼저 입사한 직원들의 이름, 자신의 입사일, 매니저 이름, 매니저의 입사일을 조회하기
SELECT EMP.FIRST_NAME AS EMP_NAME,
       EMP.HIRE_DATE AS EMP_HIRE_DATE,
       MGR.FIRST_NAME AS MGR_NAME,
       MGR.HIRE_DATE AS MGR_HIRE_DATE
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.HIRE_DATE < MGR.HIRE_DATE
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- 직원중에서 자신이 담당하고 있는 직종의 최저급여와 최고급여의 평균보다 급여를 더 많이 받는 사원의 이름, 직종아이디, 급여, 그 직종의 평균급여를 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, (J.MIN_SALARY + J.MAX_SALARY)/2 AS AVG_SALARY
FROM EMPLOYEES E, JOBS J
WHERE (J.MIN_SALARY + J.MAX_SALARY)/2 < E.SALARY
AND E.JOB_ID = J.JOB_ID; 

-- 자신의 직종이 변경된 적이 있는 직원들의 직원아이디, 변경전 직종아이디, 변경전 소속부서명, 현재 직종아이디, 현재 소속부서명을 조회하기
SELECT E.EMPLOYEE_ID, H.JOB_ID PREV_JOB_ID, ED.DEPARTMENT_NAME PREV_DEPARTMENT_NAME,
       E.JOB_ID CURRENT_JOB_ID, ED.DEPARTMENT_NAME CURRENT_DEPARTMENT_NAME
FROM JOB_HISTORY H, EMPLOYEES E, DEPARTMENTS HD, DEPARTMENTS ED
WHERE H.EMPLOYEE_ID = E.EMPLOYEE_ID         
AND H.DEPARTMENT_ID = HD.DEPARTMENT_ID
AND E.DEPARTMENT_ID = ED.DEPARTMENT_ID;

-- 이전에 'Executive' 부서에 근무한 적이 있는 직원의 이름, 현재 직종아이디, 현재 소속부서명을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, ED.DEPARTMENT_NAME
FROM JOB_HISTORY H, EMPLOYEES E, DEPARTMENTS HD, DEPARTMENTS ED
WHERE H.DEPARTMENT_ID = HD.DEPARTMENT_ID
AND HD.DEPARTMENT_NAME = 'Executive'
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID
AND E.DEPARTMENT_ID = ED.DEPARTMENT_ID;

-- 2006년에 50번부서에서 근무한 적이 있는 직원의 아이디, 이름을 조회하기
SELECT *
FROM JOB_HISTORY H , EMPLOYEES E
WHERE H.DEPARTMENT_ID = 50 
AND TO_CHAR(H.START_DATE, 'YYYY') <= 2006 AND TO_CHAR(H.END_DATE, 'YYYY') >= 2006
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID;

-- 모든 직원들을 직종아이디별로 나누었을 때 직종아이디별 사원수를 조회하기
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID;

-- 직원들을 급여등급을 기준으로 그룹화했을 때 급여등급별 인원수를 조회하기
SELECT S.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
GROUP BY S.GRADE
ORDER BY S.GRADE;

-- 직원들을 부서명을 기준으로 그룹화했을 때 각 부서별 최저급여, 최고급여, 평균급여를 조회하기
SELECT D.DEPARTMENT_NAME, MIN(SALARY), MAX(SALARY), AVG(SALARY)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY D.DEPARTMENT_NAME;

-- 50번과 80번 부서에 소속된 직원들의 급여등급별 인원수를 조사했을 때 해당 등급의 인원수가 3명이상인 등급과, 인원수를 조회하기
SELECT S.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADE S
WHERE DEPARTMENT_ID IN (50, 80) 
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
GROUP BY S.GRADE
HAVING COUNT(*) >= 3
ORDER BY S.GRADE;






























