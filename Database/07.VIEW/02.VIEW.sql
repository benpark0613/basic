-- VIEW(������ ���̺�) �����ϱ�
CREATE OR REPLACE VIEW EMP_SALARY_DETAIL_VIEW
AS
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.SALARY, E.COMMISSION_PCT, S.GRADE, 
       E.SALARY*12 + E.SALARY*NVL(E.COMMISSION_PCT, 0)*12 ANNUAL_SALARY
FROM EMPLOYEES E, DEPARTMENTS D, SALARY_GRADE S
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
WITH READ ONLY;

-- ������̵�, �̸�, �������̵�, �μ����̵�, �μ���, �޿�, Ŀ�̼�, �޿����, ����
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW;

-- ���޹��� ������̵� �ش��ϴ� ����� ������̵�, �̸�, �������̵�, �μ����̵�, �μ���, �޿�, Ŀ�̼�, �޿����, ����
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE EMPLOYEE_ID = 100;

-- ���޹��� �μ����̵� �ҼӵǾ� �ִ� ����� ������̵�, �̸�, �������̵�, �μ����̵�, �μ���, �޿�, Ŀ�̼�, �޿����, ����
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE DEPARTMENT_ID = 50;

-- ���޹��� �޿���޿� �ش��ϴ� ����� ������̵�, �̸�, �������̵�, �μ����̵�, �μ���, �޿�, Ŀ�̼�, �޿����, ����
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE GRADE = 'C';

-- ���޹��� �ּұ޿�, �ִ�޿� ������ ���ϴ� ����� ������̵�, �̸�, �������̵�, �μ����̵�, �μ���, �޿�, Ŀ�̼�, �޿����, ����
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, SALARY, COMMISSION_PCT, GRADE, ANNUAL_SALARY
FROM EMP_SALARY_DETAIL_VIEW
WHERE SALARY >= 15000 AND SALARY < 20000;

-- ������̵�, ����� ��ü�̸�, ��ȭ��ȣ, �̸���, �Ի���, �������̵�, ��������, �޿�, �޿����, ����, �μ����̵�, �μ���, �ٹ�����, �����ھ��̵�, �����ڸ�
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
    EMPLOYEES EMP,  -- ���� ���̺�
    JOBS J,         -- ���� ���̺�
    SALARY_GRADE S, -- �޿���� ���̺�
    DEPARTMENTS D,  -- �μ� ���̺�
    LOCATIONS L,    -- �ٹ��� ���̺�
    EMPLOYEES MGR   -- ������ ���̺�
WHERE 
    EMP.JOB_ID = J.JOB_ID                                            -- ������ �������̵�� �������̺��� �������̵� ������ �ೢ�� ����           
    AND EMP.SALARY >= S.MIN_SALARY AND EMP.SALARY <= S.MAX_SALARY    -- ������ �޿��� �޿�������̺��� �ּұ޿�, �ִ�޿� �������� ��ġ�ϴ� �ೢ�� ����
    AND EMP.DEPARTMENT_ID = D.DEPARTMENT_ID(+)                       -- ������ �ҼӺμ����̵�� �μ����̺��� �μ����̵� ������ �ೢ�� ����
    AND D.LOCATION_ID = L.LOCATION_ID(+)                             -- ������ �Ҽӵ� �μ��� ��ġ���̵�� �ٹ��� ���̺��� ��ġ���̵� ������ �ೢ�� ����
    AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID(+)                          -- ������ ������ ���̵�� ������ ���̺��� ���̵� ������ �ೢ�� ����
WITH READ ONLY;

-- �޿� ��޺� �ο����� ��ȸ�ϱ�
SELECT S.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
GROUP BY S.GRADE;

SELECT EMP_SALARY_GRADE, COUNT(*)
FROM EMP_DETAILS_VIEW
GROUP BY EMP_SALARY_GRADE;

-- �⵵��, �μ��̸��� �ű� �Ի��ڼ� ��ȸ�ϱ�
SELECT TO_CHAR(E.HIRE_DATE, 'YYYY'), D.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
GROUP BY TO_CHAR(E.HIRE_DATE, 'YYYY'), D.DEPARTMENT_NAME
ORDER BY 1, 2;

-- �⵵��, �μ��̸��� �ű� �Ի��ڼ� ��ȸ�ϱ� (�� ���)
SELECT TO_CHAR(EMP_HIRE_DATE, 'YYYY'), EMP_DEPT_NAME, COUNT(*)
FROM EMP_DETAILS_VIEW
GROUP BY TO_CHAR(EMP_HIRE_DATE, 'YYYY'), EMP_DEPT_NAME
ORDER BY 1, 2;

-- �޿������ D ����̰�, Oxford�� �ٹ��ϴ� ������ �̸�, ����, ��������, �μ����� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM SALARY_GRADE S, LOCATIONS L, DEPARTMENTS D, EMPLOYEES E, JOBS J
WHERE S.GRADE = 'D'
AND L.CITY = 'Oxford'
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
AND E.JOB_ID = J.JOB_ID;

-- �޿������ D ����̰�, Oxford�� �ٹ��ϴ� ������ �̸�, ����, ��������, �μ����� ��ȸ�ϱ� (�� ���)
SELECT EMP_NAME, EMP_JOB_ID, EMP_JOB_TITLE, EMP_DEPT_NAME
FROM EMP_DETAILS_VIEW
WHERE EMP_SALARY_GRADE = 'D' AND EMP_CITY = 'Oxford';













