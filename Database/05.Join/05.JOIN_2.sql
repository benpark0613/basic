-- 셀프 조인
-- 하나의 테이블을 이용해서 조인을 구성하는 것이다.
-- 하나의 테이블 안에 상위데이터, 하위데이터가 있는 경우 상위데이터와 하위데이터를 서로 연관지어서 조회할 때 셀프조인이 필요하다.
-- 하나의 테이블을 역할을 각각 나누어서 조인에 참여시켜야 한다.

-- 60번 부서에 소속된 직원들의 직원아이디, 이름, 상사의 이름을 조회하기
-- E1                        E1        E1    E2
SELECT EMP.EMPLOYEE_ID AS EMP_ID,
       EMP.FIRST_NAME  AS EMP_NAME,
       MGR.EMPLOYEE_ID AS MGR_ID,
       MGR.FIRST_NAME  AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.DEPARTMENT_ID = 60
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- 관리자가 지정된 모든 직원들의 직원 아이디, 직원이름, 직원급여, 직원급여등급, 직원의 매니저아이디, 매니저 이름, 매니저 급여, 매니저 급여등급, 직원과 매니저의 급여차이 조회하기
-- EMP                        EMP         EMP      EMP      S1          MGR                MGR         MGR         S2             EMP/MGR
SELECT EMP.EMPLOYEE_ID  AS EMP_ID,              -- 직원의 아이디
       EMP.FIRST_NAME   AS EMP_NAME,            -- 직원의 이름
       EMP.SALARY       AS EMP_SALARY,          -- 직원의 급여
       ES.GRADE         AS EMP_GRADE,           -- 직원의 급여등급
       MGR.EMPLOYEE_ID  AS MGR_ID,              -- 관리자의 아이디
       MGR.FIRST_NAME   AS MGR_NAME,            -- 관리자의 이름
       MGR.SALARY       AS MGR_SALARY,          -- 관리자의 급여
       MS.GRADE         AS MGR_GRADE,           -- 관리자의 급여등급
       MGR.SALARY - EMP.SALARY AS SALARY_GAP    -- 직원과 관리자의 급여차이
FROM EMPLOYEES EMP, EMPLOYEES MGR, SALARY_GRADE ES, SALARY_GRADE MS
WHERE EMP.MANAGER_ID IS NOT NULL                                    -- 관리자가 있는 직원만 필터링
AND EMP.MANAGER_ID = MGR.MANAGER_ID                                 -- 직원의 관리자 아이디와 관리자의 직원아이디가 같은 값을 가진 행끼리 연결
AND EMP.SALARY >= ES.MIN_SALARY AND EMP.SALARY <= ES.MAX_SALARY     -- 직원급여와 급여등급을 비등가 조인으로 연결
AND MGR.SALARY >= MS.MIN_SALARY AND MGR.SALARY <= MS.MAX_SALARY;    -- 관리자급여와 급여등급을 비등가 조인으로 연결

--------------------------------------------------------------------------------
-- 포괄조인
-- 포괄조인은 한쪽 테이블에는 데이터가 있고, 다른쪽 테이블에는 데이터가 없는 경우에 데이터가 있는 쪽 테이블의 내용을 전부 조회하는 조인방법이다.

-- 포괄조인을 사용하지 않았을 때
-- 부서아이디, 부서이름, 부서관리자아이디, 부서관리자 이름 조회하기
-- D          D        D               E
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

-- 포괄조인을 사용했을 때
-- 부서아이디, 부서이름, 부서관리자아이디, 부서관리자 이름 조회하기
-- D          D        D               E
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
ORDER BY D.DEPARTMENT_ID;

-- 사원아이디, 사원이름, 소속부서명 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- 사원아이디, 사원이름, 소속부서명 조회하기
-- 소속부서가 지정되지 않은 사원도 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
ORDER BY E.EMPLOYEE_ID;













