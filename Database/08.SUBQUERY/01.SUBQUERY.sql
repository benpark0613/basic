-- ��������
-- �ٸ� SQL�� ���Ե� SQL���̴�.
-- SELECT��, FROM��, WHERE��, HAVING������ ����� �� �ִ�.

-- WHERE���̳� HAVING���������Ǵ� ���������� ���ǽ��� ���� �����ϴ� ����������.
-- ���ǽĿ��� ���Ǵ� ���� SQL�������� ȹ��Ǵ� ��쿡 ���������� ����Ѵ�.

--------------------------------------------------------------------------------
-- ������ ��������

-- 100�� ����� ���� �μ����� ���ϴ� ����� ���̵�, �̸� ��ȸ�ϱ�
-- 1. 100�� ����� ���ϴ� �μ� ��ȸ�ϱ�
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100;
--2. 90�� �μ����� ���ϴ� ���� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

-- 100�� ����� ���� �μ����� ���ϴ� ����� ���̵�, �̸� ��ȸ�ϱ� (�������� ���)
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM EMPLOYEES
                       WHERE EMPLOYEE_ID = 100);
                       
-- ��ü ������ ��ձ޿����� ���� �޿��� �޴� �������̵�, �̸�, �޿� ��ȸ�ϱ�
-- 1. ��ü ������ ��ձ޿� ��ȸ�ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEES;
-- 2. 6461.8317 ���� ���� �޿��� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 6461.8317;

-- ��ü ������ ��ձ޿����� ���� �޿��� �޴� �������̵�, �̸�, �޿��� ��ȸ�ϱ� (�������� ���)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                 FROM EMPLOYEES);

-- 100 ����� ���� �ؿ� �Ի��߰�, ��ü ������ ��ձ޿����� �޿��� ���� �޴� ����� ���̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE EMPLOYEE_ID = 100)
AND SALARY > (SELECT AVG(SALARY)
              FROM EMPLOYEES);

-- ��ü ������ �޿��� �λ��Ű��, �λ�ݾ��� ��ü ������ ��ձ޿��� 10%��ŭ �λ��Ų��.
UPDATE EMPLOYEES
SET
    SALARY = SALARY + (SELECT TRUNC(AVG(SALARY)*0.1)
                       FROM EMPLOYEES);

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- ������ ��������

-- �ڽ��� �����ϴ� ������ ����� ���� �ִ� �������� ���̵�, �̸�, ���� ���� ��ȸ
-- 1. �ڽ��� �����ϴ� ������ ����� ���� �ִ� ������ ���̵� ��ȸ > ��ȸ����� �������̴�.
SELECT DISTINCT EMPLOYEE_ID
FROM JOB_HISTORY;

-- 2. ������ ����� ���� �ִ� �������� ���̵�, �̸�, ���� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (101, 102, 114, 122, 176, 200, 201);

-- �ڽ��� �����ϴ� ������ ����� ���� �ִ� �������� ���̵�, �̸�, ���� ����, ���� �������̵� ��ȸ (������ �������� ���, ������ �������� ������ ���)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID
                      FROM JOB_HISTORY);

-- �ڽ��� �����ϴ� ������ ����� ���� �ִ� �������� ���̵�, �̸�, ���� ����, ���� �������̵� (���� ���)
-- ������������ ������ �����Ѵ�.
SELECT DISTINCT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, H.JOB_ID
FROM EMPLOYEES E, JOB_HISTORY H
WHERE E.EMPLOYEE_ID = H.EMPLOYEE_ID;

-- 30�� �μ��� �Ҽӵ� ��� ������ �޿����� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�
-- 30�� �μ��� �Ҽӵ� ������ �ִ� �޿����� �޿��� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > ALL (SELECT SALARY
                  FROM EMPLOYEES
                  WHERE DEPARTMENT_ID = 30);
                  
-- 30�� �μ��� �Ҽӵ� ��� ������ �޿����� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�      
-- 30�� �μ��� �Ҽӵ� ������ �ִ� �޿����� �޿��� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > (SELECT MAX(SALARY)
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 30);
-- 30�� �μ��� �Ҽӵ� ���� �� �ƹ��� �Ѹ��� �޿����� �޿��� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�   
-- 30�� �μ��� �Ҽӵ� ������ ���� �޿����� �޿��� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�
               
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > ANY (SELECT SALARY
                  FROM EMPLOYEES
                  WHERE DEPARTMENT_ID = 30);
-- 30�� �μ��� �Ҽӵ� ���� �� �ƹ��� �Ѹ��� �޿����� �޿��� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ�   
-- 30�� �μ��� �Ҽӵ� ������ ���� �޿����� �޿��� ���� �޴� 60�� �μ� �Ҽ��� ������ ��ȸ�ϱ� 
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
AND SALARY > (SELECT MIN(SALARY)
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 30);

--------------------------------------------------------------------------------
-- ���� �� ��������
-- SELECT *
-- FROM TABLE
-- WHERE (COL1, COL2) IN (SELECT COL3, COL4
--                        FROM TABLE)

-- �μ��� ���� �޿��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- �ڽ��� �Ҽӵ� �μ����� �����޿��� �޴� ����� �μ����̵�, ������̵�, �޿��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                  FROM EMPLOYEES
                                  WHERE DEPARTMENT_ID IS NOT NULL
                                  GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID ASC;

--------------------------------------------------------------------------------
-- HAVING ������ �������� ����ϱ�

-- �μ��� ������� ��ȸ���� �� ������� 5�� ������ �μ��� ���̵�� ������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) <= 5
ORDER BY 1;

-- �μ��� ������� ��ȸ���� �� ������� ���� ���� �μ��� ���̵�� ������� ��ȸ�ϱ�
SELECT MAX(COUNT(*))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = 45;

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMPLOYEES
                   WHERE DEPARTMENT_ID IS NOT NULL
                   GROUP BY DEPARTMENT_ID);

-- WITH��
-- SQL�� �������� ������ �̸����� ĳ��(�ӽú���)�Ѵ�.
-- ���������� ����ϴ� SQL������ �ݺ������� ����Ǵ� SQL�� ���ؼ� WITH���� ����ϸ� ���� ������ ���ȴ�.
-- WITH������ ������ ������ ���̺��� �Ʒ� SELECT������ ����� �� �ִ�.
-- WITH���� �ܵ����� ����� �� ����.
-- WITH ��Ī1
-- AS (SELECT ��),
-- ��Ī2
-- AS (SELECT ��)
-- SELECT COL, COL
-- FROM ��Ī1
-- WHERE ���ǽ�

-- WITH���� ����ؼ� �μ��� ������� ��ȸ���� �� ������� ���� ���� �μ��� ���̵�� ������� ��ȸ�ϱ�
WITH DEPT_EMP_CNT
AS (
    SELECT DEPARTMENT_ID AS DEPT_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NOT NULL
    GROUP BY DEPARTMENT_ID
), JOB_EMP_CNT
AS ( 
    SELECT JOB_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    GROUP BY JOB_ID
)
SELECT DEPT_ID, CNT
FROM DEPT_EMP_CNT
WHERE CNT = (SELECT MAX(CNT)
             FROM DEPT_EMP_CNT);




