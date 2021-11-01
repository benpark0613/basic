-- TOP-N 분석
-- 테이블의 행을 특정 컬럼값을 기준으로 정렬했을 때 지정된 순위에 포함되는 행을 조회하는 것
-- ROWNUM(의사컬럼: Pseudo Column): 조회된 결과에 대해서 순번을 붙이는 컬럼이다.

-- 직원들 중에서 급여를 가장 많이 받는 상위 5명의 직원을 조회하기, 직원아이디, 이름, 급여
SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

-- 관리하는 직원수가 가장 많은 상위 3명의 관리자 아이디와 관리하는 직원수를 조회하기 
SELECT MANAGER_ID, CNT
FROM (SELECT MANAGER_ID, COUNT(*) CNT
      FROM EMPLOYEES
      GROUP BY MANAGER_ID
      ORDER BY CNT DESC)
WHERE ROWNUM <= 3;

--------------------------------------------------------------------------------
-- 분석함수를 사용해서 행을 조회하기

-- 급여를 기준으로 내림차순 정렬한 다음, 조회된 행에 순위 혹은 순번을 부여한다.
SELECT SALARY,  
       RANK()       OVER (ORDER BY SALARY DESC) "RANK", 
       DENSE_RANK() OVER (ORDER BY SALARY DESC) "DENSE_RANK",
       ROW_NUMBER() OVER (ORDER BY SALARY DESC) "ROW_NUMBER"            
FROM EMPLOYEES;

-- PARTITION BY 컬럼명 (지정된 컬럼명 내에서 급여를 기준으로 내림차순으로 정렬한 다음 조회된 행에 순위 혹은 순번을 부여한다.)
SELECT DEPARTMENT_ID, SALARY,  
       RANK()       OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) "RANK", 
       DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) "DENSE_RANK",
       ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) "ROW_NUMBER"            
FROM EMPLOYEES;

-- 직원들의 급여를 내림차순으로 정렬했을 때 순위 7위까지 조회하기
SELECT *
FROM (SELECT RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK <= 7;     -- 조회된 행의 갯수: 8개

-- 직원들의 급여를 내림차순으로 정렬했을 때 순위 7위까지 조회하기
SELECT *
FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK <= 7;     -- 조회된 행의 갯수: 9개 

-- 직원들의 급여를 내림차순으로 정렬했을 때 7번째 행까지 조회하기
SELECT *
FROM (SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK <= 7;     -- 조회된 행의 갯수: 7개 




-- 직원들의 급여를 내림차순으로 정렬했을 때 순위 11 ~ 20위까지 조회하기
SELECT *
FROM (SELECT RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK >=11 AND SALARY_RANK <= 20;     -- 조회된 행의 갯수: 10개

-- 직원들의 급여를 내림차순으로 정렬했을 때 순위 11 ~ 20위까지 조회하기
SELECT *
FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK >=11 AND SALARY_RANK <= 20;     -- 조회된 행의 갯수: 21개 

-- 직원들의 급여를 내림차순으로 정렬했을 때 11 ~ 20번째 행까지 조회하기
SELECT *
FROM (SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK >=11 AND SALARY_RANK <= 20;     -- 조회된 행의 갯수: 10개 






