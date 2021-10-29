-- 'Executive' 부서의 모든 사원의 아이디와 이름과 직종, 부서번호를 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_NAME = 'Executive';

-- 'Neena' 보다 많은 급여를 받는 사원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena');

-- 급여를 가장 많이 받는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);

-- 전체 직원의 평균급여 2배 이상을 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= (SELECT AVG(SALARY)*2
                 FROM EMPLOYEES);

-- 전체 사원의 평균급여보다 급여를 많이 받고, 이름이 50번 부서에서 근무하는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND SALARY > (SELECT AVG(SALARY)
              FROM EMPLOYEES);

-- 사원들의 전체 평균보다 적은 급여를 받은 사원들의 아이디, 이름, 급여, 급여등급을 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARY_GRADE S
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES)
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY;

-- 80번 부서에 근무하고, 80번 부서의 최저급여를 받는 사원의 아이디, 이름, 직종아이디, 급여, 부서아이디를 조회하기



-- 'Neena'에게 보고받는 사람과 같은 매니저에게 보고하는 직원의 아이디, 이름, 매니저의 아이디, 매니저의 이름의 조회하기

-- 'Ismael'과 같은 해에 입사했고, 같은 부서에 근무하는 직원의 아이디, 이름, 입사일, 부서아이디를 조회하기

-- 부서별 평균급여를 계산했을 때 'Ismael'이 근무하는 부서의 평균급여보다 급여를 많이 받는 부서의 아이디와 평균급여를 조회하기

-- 100번 매니저에게 보고하는 직원이 몇명인지 조회하기

-- 부서별 최고급여를 조회했을 때 최고급여가 15000을 넘는 부서의 아이디와 최고급여를 조회하기

-- 직원 급여를 기준으로 급여 등급을 조회했을 때, 급여등급별 직원수를 조회하기

-- 가장 적은 직원이 입사한 해와 그 해에 입사한 직원수를 조회하기

-- 소속 부서의 평균급여보다 많은 급여를 받는 직원의 아이디와 직원이름, 급여, 그 부서의 평균 급여를 조회하기

-- 직종별 평균급여를 계산했을 때 평균급여가 가장 적은 직종과 평균급여를 조회하기

-- 직종별 평균급여를 계산했을 때 평균급여가 가장 적은 직종의 아이디, 직종제목, 그 직종의 최저급여, 그 직종의 최대급여를 조회하기
