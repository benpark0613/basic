-- 조인
-- 두 개 이상의 테이블을 연관있는 행들끼리 연결해서 새로운 가상의 테이블을 생성하고, 그 가상의 테이블에서 데이터를 조회하는 것이다.
-- 조인의 종류
-- 등가조인, 비등가조인, 셀프조인, 포괄조인

-- 테이블 조인하기
-- SELECT 테이블1.컬럼명, 테이블1.컬럼명, 테이블2.컬럼명, ...
-- FROM 테이블1, 테이블2
-- WHERE 조인조건;

-- 등가조인
-- 조인 조건에서 = 연산자를 사용해서 선행 테이블과 후행테이블의 연관있는 행을 조인시킨다.

-- 사원아이디,   사원이름,     소속부서아이디,            소속부서이름   조회하기
-- EMPLOYEES,    EMPLOYEES,   EMPLOYEES/DEPARTMENTS,   DEPARTMENTS  조인할 테이블 : EMPLOYEES, DEPARTMENTS
-- 조인조건 : DEPARTMENT_ID값이 서로 같은 행끼리 연결
SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID  -- 조인조건
ORDER BY EMPLOYEES.EMPLOYEE_ID ASC;

-- 사원아이디, 사원이름, 직종아이디, 직종제목, 최소급여, 최대급여, 급여를 조회하기
-- E          E        E/J        J        J        J        E      조인할 테이블 : EMPLOYEES, JOBS
-- 조인조건 : 사원테이블의 직종아이디와 직종테이블의 직종아이디가 같은 값을 가지는 행끼리 연결
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID, B.JOB_TITLE, B.MIN_SALARY, B.MAX_SALARY, A.SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID;

-- 부서아이디, 부서명, 부서소재지 아이디, 소재지 도시명을 조회하기
-- D          D      D/L              L     조인할 테이블 : DEPARTMENTS, LOCATIONS
-- 조인조건 : 부서테이블의 소재지 아이디와 소재지 테이블의 소재지 아이디가 같은 값을 가지는 행끼리 연결
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID
ORDER BY D.DEPARTMENT_ID;

-- 사원아이디, 사원이름, 직종제목, 소속부서명을 조회하기
-- E          E        J        D       조인할 테이블 : EMPLOYEES, DEPARTMENTS, JOBS
-- 직종제목을 조회하기 위한 조인조건 : 직원테이블의 직종아이디와 직종테이블의 직종아이디가 서로 같은 행끼리 연결
-- 소속부서명을 조회하기 위한 조인조건 : 직원테이블의 부서아이디와 부서테이블의 부서아이디가 서로 같은 행끼리 연결
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.JOB_ID = J.JOB_ID 
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID ASC;

-- 사원아이디, 사원이름, 소속부서명, 소속부서소재지 도시명을 조회하
-- E          E        D          L     조인할 테이블 : EMPLOYEES, DEPARTMENTS, JOBS
-- 소속부서명을 조회하기 위한 조인조건 : 직원테이블의 소속부서아이디와 부서테이블의 부서아이디가 서로 같은 행끼리 연결
-- 소재지 도시명을 조회하기 위한 조인조건 : 부서테이블에서 그 직원이 소속된 부서의 위치아이디와 소재지의 위치 아이디가 서로 같은 행끼리 연결
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.EMPLOYEE_ID;

-- 급여를 10000 ~ 15000을 받는 사원들의 아이디, 이름, 급여, 직종제목, 소속부서명을 조회하기
-- E                                  E      E    E     J        D      조인할 테이블 : EMPLOYEES, JOBS, DEPARTMENTS
-- 직종제목을 조회하기 위한 조인조건 : 직원테이블의 직종아이디와 직종테이블의 직종아이디가 서로 같은 행끼리 연결
-- 소속부서명을 조회하기 위한 조인조건 : 직원테이블의 부서아이디와 부서테이블의 부서아이디가 서로 같은 행끼리 연결
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.SALARY >= 10000 AND E.SALARY <= 15000
AND E.JOB_ID = J.JOB_ID 
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- 커미션을 받는 직원들의 직원아이디와 이름, 급여, 커미션, 연봉, 소속부서명을 조회하기
-- E                    E          E     E    E       E    D
-- 소속부서명을 조회하기 위한 조인조건 : 직원테이블의 부서아이디와 부서테이블의 부서아이디가 서로 같은 행끼리 연결
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.COMMISSION_PCT, E.SALARY*12 + E.SALARY*E.COMMISSION_PCT*12 연봉, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE  E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

-- 부서테이블에서 부서관리자가 지정된 부서의 부서아이디, 부서명, 부서관리자 이름 조회하기
--               D                       D          D      E        조인할 테이블 : DEPARTMENTS, EMPLOYEES
-- 부서관리자 이름 조회하기 위한 조건 : 부서테이블의 관리자 아이디와 직원테이블의 사원 아이디가 서로 같은 행 끼리 연결
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID IS NOT NULL
AND D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

--------------------------------------------------------------------------------
-- 비등가조인 실습을 위한 테이블 생성
CREATE TABLE SALARY_GRADE (
    GRADE CHAR(1) PRIMARY KEY,
    MIN_SALARY NUMBER(8,2),
    MAX_SALARY NUMBER(8,2)
);
INSERT INTO SALARY_GRADE VALUES('A', 50000, 99999);
INSERT INTO SALARY_GRADE VALUES('B', 25000, 49999);
INSERT INTO SALARY_GRADE VALUES('C', 12500, 24999);
INSERT INTO SALARY_GRADE VALUES('D', 6500, 12499);
INSERT INTO SALARY_GRADE VALUES('E', 3000, 6499);
INSERT INTO SALARY_GRADE VALUES('F', 1500, 2999);
INSERT INTO SALARY_GRADE VALUES('G', 0, 1499);

COMMIT;

--------------------------------------------------------------------------------
-- 비등가 조인
-- 테이블을 조인할 때 같은 값을 가진 행끼리 조인하는 것이 아니라, 크다/작다 조건을 이용해서 행을 조인시키는 방식이다.
-- 등급(등급마다 보통 최소/최대값이 정해져 있고, 해당 범위에 속할 때 그 등급이 부여된다.)을 조회할 때 활용한다.

-- 직원아이디, 직원이름, 급여, 급여등급을 조회하기
-- E          E        E     S      조인할 테이블 : EMPLOYEES, SALARY_GRADE
-- 조인조건 : 직원의 급여가 해당 등급의 최소등급 이상, 최대 등급 이하에 해당하는 행을 연결시킨다.
SELECT S.GRADE, E.SALARY, E.EMPLOYEE_ID, E.FIRST_NAME
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY S.GRADE ASC, E.SALARY DESC;

-- 80번 부서에 소속된 직원 중에서 급여등급이 E등급에 속하는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
-- E                            S                      E            E     E          E      조인할 테이블 : EMPLOYEES, SALARY
-- 검색조건 : 소속부서 아이디가 80이다.
-- 검색조건 : 급여등급이 E등급이다.
-- 조인조건 : 직원의 급여가 해당등급의 최소등급 이상, 최대등급 이하에 해당하는 행을 연결시킨다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.DEPARTMENT_ID = 80
AND S.GRADE = 'E'
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY E.EMPLOYEE_ID;

-- 급여등급이 D등급에 해당하는 직원의 아이디, 이름, 직종아이디, 소속부서명, 근무지 도시명을 조회하기
-- S                        E             E    E          D          L      조인할 테이블 : EMPLOYEES. DEPARTMENTS, LOCATIONS, SALARY_GRADE 
-- 검색조건 : 급여등급이 D등급이다.
-- 조인조건 : 직원테이블의 급여가 등급테이블의 최소급여 이상, 최대급여 이하다.
-- 조인조건 : 직원테이블의 소속부서 아이디와 부서의 부서아이디가 같다.
-- 조인조건 : 부서테이블의 소재지 아이디와 소재지 테이블의 소재지 아이디가 같다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.JOB_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, SALARY_GRADE S
WHERE S.GRADE = 'D'
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY 
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.EMPLOYEE_ID;


-- 모든 직원의 아이디, 이름, 직종아이디, 직종제목, 급여, 급여등급, 소속부서아이디, 소속부서명, 부서소재지 도시명을 조회하기
--            E      E     E/J       J         E    S        E/D           D          L     조인할 테이블 : EMPLOYEES, JOBS, SALARY_GRADE, DEPARTMENTS, LOCATIONS
-- 조인조건 : 직원 테이블의 직종아이디와 직종테이블의 직종아이디가 같다.
-- 조인조건 : 급여가 등급테이블의 최소급여 이상, 최대급여 이하다.
-- 조인조건 : 직원테이블의 소속부서 아이디와 부서테이블의 부서아이디가 같다.
-- 조인조건 : 부서테이블의 소재지 아이디와 소재지 테이블의 소재지 아이디가 같다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, S.GRADE, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, JOBS J, SALARY_GRADE S, DEPARTMENTS D, LOCATIONS L
WHERE E.JOB_ID = J.JOB_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.EMPLOYEE_ID;

-- 'Oxford'에서 일하고 있는 직원들의 아이디, 이름, 직종아이디, 급여, 급여등급을 조회하기
--  L                              E      E    E/J        E     S       조인할 테이블 : LOCATIONS, DEPARTMENTS(관계 속에 숨겨진 테이블), EMPLOYEES, SALARY_GRADE
-- 검색조건 : 도시명이 Oxford다.
-- 조인조건 : 급여가 등급테이블의 최소급여 이상, 최대급여 이하다.
-- 조인조건 : 소재지 테이블의 소재지 아이디와 부서테이블의 소재지 아이디가 같다.
-- 조인조건 : 부서테이블의 부서아이디와 직원테이블의 소속부서 아이디가 같다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY, S.GRADE 
FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E, SALARY_GRADE S
WHERE L.CITY = 'Oxford'
AND L.LOCATION_ID = D.LOCATION_ID
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY E.EMPLOYEE_ID ASC;























