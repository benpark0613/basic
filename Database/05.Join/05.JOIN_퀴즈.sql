-- 급여가 12000을 넘는 사원의 이름과 급여를 조회하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000;

-- 급여가 5000이상 12000이하인 사원의 이름과 급여를 조회하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 12000;

-- 2006년에 입사한 사원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01' AND HIRE_DATE < TO_DATE('2006/12/31') + 1
ORDER BY HIRE_DATE;

-- 20과 50번 부서에 소속된 사원의 이름과 부서번호를 조회하고, 이름을 알파벳순으로 정렬해서 조회하기
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50)
ORDER BY FIRST_NAME;

-- 급여가 5000이상 12000이하고, 20번과 50번 부서에 소속된 사원의 이름과 급여, 부서번호를 조회하기
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 12000
AND DEPARTMENT_ID IN (20, 50);

-- 관리자가 없는 사원의 이름과 직종, 급여를 조회하기
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 직종이 'SA_MAN'이거나 'ST_MAN'인 직원중에서 급여를 8000이상 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN', 'ST_MAN')
AND SALARY >= 8000;

-- 모든 사원의 이름, 직종아이디, 급여, 소속부서명을 조회하기
--            E      E/J      E     D
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 모든 사원의 이름, 직종아이디, 직종제목, 급여, 최소급여, 최대급여를 조회하기
--            E      E/J       J       E     J        J
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, J.MAX_SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 모든 사원의 이름, 직종아이디, 직종제목, 급여, 최소급여와 본인 급여의 차이를 조회하기
--            E     E/J       J        E      J         E
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, E.SALARY - J.MIN_SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 커미션을 받는 모든 사원의 아이디, 직원이름, 부서이름, 소속부서의 소재지(도시명)을 조회하기
-- E                     E         E         D      L 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

-- 이름이 A나 a로 시작하는 모든 사원의 이름과 직종, 직종제목, 급여, 소속부서명을 조회하기
--  E                         E           E/J   J         E    D
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE SUBSTR(UPPER(E.FIRST_NAME), 1, 1) = 'A'
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 30, 60, 90번 부서에 소속되어 있는 사원들 중에서 100에게 보고하는 사원들의 이름, 직종, 급여, 급여등급을 조회하기
-- E /D                                       E                           E E    E    S
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.DEPARTMENT_ID IN (30, 60, 90)
AND E.MANAGER_ID = 100
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY;


-- 80번 부서에 소속된 사원들의 이름, 직종, 직종제목, 급여, 최소급여, 최대급여, 급여등급,  소속부서명을 조회하기
-- E/D                       E    E/J   J      E     J          J      S          D
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, S.GRADE, D.DEPARTMENT_NAME
FROM EMPLOYEES  E, JOBS J, SALARY_GRADE S, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- 'ST_CLERK'로 근무하다가 다른 직종으로 변경한 사원의 아이디, 이름,  변경전 부서명, 현재 직종, 현재 근무부수서명을 조회하기
--               H                          H/E           E      D1           E         D2 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D1.DEPARTMENT_NAME PREV_DEPARTMENT_NAME, 
       E.JOB_ID CURRENT_JOB_ID, D2.DEPARTMENT_NAME CURRENT_DEPARTMENT_NAME
FROM JOB_HISTORY H, EMPLOYEES E, DEPARTMENTS D1, DEPARTMENTS D2
WHERE H.JOB_ID = 'ST_CLERK'
AND H.DEPARTMENT_ID = D1.DEPARTMENT_ID -- 이전부서명 조회를 위한 조인
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID      -- 사원정보 조회를 위한 조인
AND E.DEPARTMENT_ID = D2.DEPARTMENT_ID;  -- 현재 소속된 부서명 조회ㅣ을 위한 조인


