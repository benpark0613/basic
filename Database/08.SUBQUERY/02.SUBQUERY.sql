-- 상호연관 서브쿼리
-- 메인쿼리의 컬럼을 참조하는 서브쿼리다.
-- 메인쿼리로 조회된 각 행마다 한번씩 실행된다. (각 행마다 조건식이 실행된다.)
-- WHERE 조건식의 연산결과가 TRUE로 판정되는 행만 최종적으로  조회된다.

-- 직원들의 직종아이디별 평균 급여를 조회했을 때, 자신이 속한 직종아이디의 평균급여보다 급여를 많이 받는 사원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT X.EMPLOYEE_ID, X.FIRST_NAME, X.JOB_ID, X.SALARY
FROM EMPLOYEES X
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES Y
                WHERE Y.JOB_ID = X.JOB_ID);
                 
-- 관리자의 아이디, 이름, 직종아이디, 해당 관리자가 관리하는 직원의 수를 조회하기
SELECT X.EMPLOYEE_ID, X.FIRST_NAME, X.JOB_ID, (SELECT COUNT(*)
                                               FROM EMPLOYEES Y
                                               WHERE Y.MANAGER_ID = X.EMPLOYEE_ID) CNT
FROM EMPLOYEES X
WHERE X.EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID
                        FROM EMPLOYEES
                        WHERE MANAGER_ID IS NOT NULL);

SELECT X.EMPLOYEE_ID, X.FIRST_NAME, X.JOB_ID, Y.CNT
FROM EMPLOYEES X, (SELECT MANAGER_ID, COUNT(*) CNT
                   FROM EMPLOYEES
                   GROUP BY MANAGER_ID) Y
WHERE X.EMPLOYEE_ID = Y.MANAGER_ID
AND X.EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID
                      FROM EMPLOYEES
                      WHERE MANAGER_ID IS NOT NULL);

