-- EMPLOYEES ���̺��� �̸��� 8���� �������� �̸��� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 8;

-- EMPLOYEES ���̺��� �̸��� 8���� �̻��� �������� �̸��� ���ڼ��� ��ȸ�ϱ�
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 8;

-- EMPLOYEES ���̺��� ������ �̸��� ���� �빮�ڷ� ��ȯ���� �� 3��° ���ڰ� 'E'�� ��� ������ �̸��� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SUBSTR(UPPER(FIRST_NAME), 3, 1) = 'E';

-- EMPLOYEES ���̺��� 2007�⵵�� �Ի��� �������� �������̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/12/31') + 1;

-- EMPLOYEES ���̺��� 2005�⿡ �Ի��� ���� �߿��� Ŀ�̼��� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID,FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < TO_DATE('2005/12/31') + 1
AND COMMISSION_PCT IS NOT NULL;

-- EMPLOYEES ���̺��� ������ �Ի����� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TRUNC(SYSDATE);

-- EMPLOYEES ���̺��� 10���޿� �Ի��� ��� ������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM') = '10';

-- EMPLOYEES ���̺��� �̹� �޿� �Ի��� ��� ������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/') || '01');

-- EMPLOYEES ���̺��� �޿��� 5000�̻� �޴� �������� ���̵�, �̸�, �޿�, �޿� ����� ��ȸ�ϱ�
-- �޿� ���: 20000�̻� A, 15000�̻� B, 10000�̻� C, �� �ܴ� D ��.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
    CASE
        WHEN SALARY >= 20000 THEN 'A'
        WHEN SALARY >= 15000 THEN 'B'
        WHEN SALARY >= 10000 THEN 'C'
        ELSE 'D'
    END SALARY_GRADE
FROM EMPLOYEES
WHERE SALARY >= 5000 
ORDER BY SALARY_GRADE ASC, SALARY DESC;        

-- EMPLOYEES ���̺��� 60�� �μ��� �Ҽӵ� ������� �ٹ��������� ������ �������� ����ؼ� ��ȸ�ϱ�
-- �������̵�, �̸�, �Ի���, �ٹ��������� ��ȸ�Ǿ�� �ϰ�, �ٹ��������� �������� �������� �����Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY MONTHS ASC;

-- EMPLOYEES ���̺��� ����� �̸��� �޿��� ǥ���ϰ�, �޿��� ���ؼ� #�� ǥ���ϱ�
-- '#'�ϳ��� �޿� 1000�� �ش��Ѵ�.

-- ��¿���
-- ȫ�浿 4300 ####
-- ������ 8700 ########
-- ������ 6500 ######
SELECT FIRST_NAME, JOB_ID, SALARY, LPAD('#', TRUNC(SALARY/1000), '#')
FROM EMPLOYEES;

-- EMPLOYEES ���̺��� 2006�� ��ݱ⿡ �Ի��� �������� �������̵�, �̸�, �Ի���, ������ ����ϱ�
-- ������ �޿�*12 + �޿�*Ŀ�̼�*12��
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12 ANNUAL_SALARY
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01' AND HIRE_DATE < TO_DATE('2006/06/30') + 1;

-- EMPLOYEES ���̺��� 100�� ��翡�� �����ϴ� �����߿��� Ŀ�̼��� ���� �������� �������̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE MANAGER_ID = 100 AND COMMISSION_PCT IS NOT NULL;

-- EMPLOYEES ���̺��� 80���μ��� �Ҽӵ� �������� ��ձ޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
SELECT ROUND(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 80;

-- EMPLOYEES ���̺��� 100�� ��翡�� �����ϴ� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID = 100;
