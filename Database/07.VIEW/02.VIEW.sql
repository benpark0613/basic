-- VIEW(가상의 테이블) 정의하기
CREATE OR REPLACE VIEW EMP_SALARY_DETAIL_VIEW
AS
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.SALARY, E.COMMISSION_PCT, S.GRADE, 
       E.SALARY*12 + E.SALARY*NVL(E.COMMISSION_PCT, 0)*12 ANNUAL_SALARY
FROM EMPLOYEES E, DEPARTMENTS D, SALARY_GRADE S
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
WITH READ ONLY;

-- 사원아이디, 이름, 직종아이디, 부서아이디, 부서명, 급여, 커미션, 급여등급, 연봉
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW;

-- 전달받은 사원아이디에 해당하는 사원의 사원아이디, 이름, 직종아이디, 부서아이디, 부서명, 급여, 커미션, 급여등급, 연봉
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE EMPLOYEE_ID = 100;

-- 전달받은 부서아이디에 소속되어 있는 사원의 사원아이디, 이름, 직종아이디, 부서아이디, 부서명, 급여, 커미션, 급여등급, 연봉
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE DEPARTMENT_ID = 50;

-- 전달받은 급여등급에 해당하는 사원의 사원아이디, 이름, 직종아이디, 부서아이디, 부서명, 급여, 커미션, 급여등급, 연봉
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE GRADE = 'C';

-- 전달받은 최소급여, 최대급여 범위에 속하는 사원의 사원아이디, 이름, 직종아이디, 부서아이디, 부서명, 급여, 커미션, 급여등급, 연봉
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE SALARY >= 15000 AND SALARY < 20000;

-- 사원아이디, 사원의 전체이름, 전화번호, 이메일, 입사일, 직종아이디, 직종제목, 급여, 급여등급, 연봉, 부서아이디, 부서명, 근무지역, 관리자아이디, 관리자명
-- E          E              E        E       E      E          J        E    S        E     E          D      L        E           E     
CREATE OR REPLACE VIEW EMP_DETAILS_VIEW 
AS
SELECT 
    EMP.EMPLOYEE_ID                                             AS EMP_ID,
    EMP.FIRST_NAME || ' ' || EMP.LAST_NAME                      AS EMP_NAME,
    EMP.PHONE_NUMBER                                            AS EMP_TEL,
    EMP.EMAIL                                                   AS EMP_EMAIL,
    EMP.HIRE_DATE                                               AS EMP_HIRE_DATE,
    EMP.JOB_ID                                                  AS EMP_JOB_ID,
    J.JOB_TITLE                                                 AS EMP_JOB_TITLE,
    EMP.SALARY                                                  AS EMP_SALARY,
    EMP.COMMISSION_PCT                                          AS EMP_COMMISSION,
    S.GRADE                                                     AS EMP_SALARY_GRADE,
    EMP.SALARY*12 + EMP.SALARY*NVL(EMP.COMMISSION_PCT, 0)*12    AS EMP_ANNUAL_SALARY,
    EMP.DEPARTMENT_ID                                           AS EMP_DEPT_ID,
    D.DEPARTMENT_NAME                                           AS EMP_DEPT_NAME,
    L.CITY                                                      AS EMP_CITY,
    MGR.EMPLOYEE_ID                                             AS MGR_ID,
    MGR.FIRST_NAME || ' ' || MGR.LAST_NAME                      AS MGR_NAME
FROM 
    EMPLOYEES EMP,  -- 직원 테이블
    JOBS J,         -- 직종 테이블
    SALARY_GRADE S, -- 급여등급 테이블
    DEPARTMENTS D,  -- 부서 테이블
    LOCATIONS L,    -- 근무지 테이블
    EMPLOYEES MGR   -- 관리자 테이블
WHERE 
    EMP.JOB_ID = J.JOB_ID                                            -- 직원의 직종아이디와 직종테이블의 직종아이디가 동일한 행끼리 연결           
    AND EMP.SALARY >= S.MIN_SALARY AND EMP.SALARY <= S.MAX_SALARY    -- 직원의 급여가 급여등급테이블의 최소급여, 최대급여 범위내에 위치하는 행끼리 연결
    AND EMP.DEPARTMENT_ID = D.DEPARTMENT_ID(+)                       -- 직원의 소속부서아이디와 부서테이블의 부서아이디가 동일한 행끼리 연결
    AND D.LOCATION_ID = L.LOCATION_ID(+)                             -- 직원이 소속된 부서의 위치아이디와 근무지 테이블의 위치아이디가 동일한 행끼리 연결
    AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID(+)                          -- 직원의 관리자 아이디와 관리자 테이블의 아이디가 동일한 행끼리 연결
WITH READ ONLY;

-- 급여 등급별 인원수를 조회하기
SELECT S.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
GROUP BY S.GRADE;

SELECT EMP_SALARY_GRADE, COUNT(*)
FROM EMP_DETAILS_VIEW
GROUP BY EMP_SALARY_GRADE;

-- 년도별, 부서이름별 신규 입사자수 조회하기
SELECT TO_CHAR(E.HIRE_DATE, 'YYYY'), D.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
GROUP BY TO_CHAR(E.HIRE_DATE, 'YYYY'), D.DEPARTMENT_NAME
ORDER BY 1, 2;

-- 년도별, 부서이름별 신규 입사자수 조회하기 (뷰 사용)
SELECT TO_CHAR(EMP_HIRE_DATE, 'YYYY'), EMP_DEPT_NAME, COUNT(*)
FROM EMP_DETAILS_VIEW
GROUP BY TO_CHAR(EMP_HIRE_DATE, 'YYYY'), EMP_DEPT_NAME
ORDER BY 1, 2;

-- 급여등급이 D 등급이고, Oxford에 근무하는 직원의 이름, 직종, 직종제목, 부서명을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM SALARY_GRADE S, LOCATIONS L, DEPARTMENTS D, EMPLOYEES E, JOBS J
WHERE S.GRADE = 'D'
AND L.CITY = 'Oxford'
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
AND E.JOB_ID = J.JOB_ID;

-- 급여등급이 D 등급이고, Oxford에 근무하는 직원의 이름, 직종, 직종제목, 부서명을 조회하기 (뷰 사용)
SELECT EMP_NAME, EMP_JOB_ID, EMP_JOB_TITLE, EMP_DEPT_NAME
FROM EMP_DETAILS_VIEW
WHERE EMP_SALARY_GRADE = 'D' AND EMP_CITY = 'Oxford';













