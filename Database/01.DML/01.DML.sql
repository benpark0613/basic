--SELECT���� �⺻����
--SELECT * Ȥ�� �÷���
--FROM ���̺���; 

-- ������ ���̺��� ��� ��, ��� �� ��ȸ�ϱ� 
SELECT *
FROM DEPARTMENTS;

--����(EMPLOYEES)���̺��� ��� ��, ��� �� ��ȸ�ϱ� 
SELECT *
FROM EMPLOYEES;

--����(COUNTRIES)���̺��� ��� ��, ��� �� ��ȸ�ϱ� 
SELECT *
FROM COUNTRIES;
--------------------------------------------------------------------------------
--���̺��� ��� ��, ������ �� ��ȸ�ϱ� 
--SELECT �÷���, �÷���, �÷���, ...(���� �������� ���� ���������� ������)
--FROM ���̺���; ��ü���� ���� ����ϰڴ�.

--����(EMPLOYEES)���̺����� �������̵�, �����̸�, �Ի���, �޿��� �����ϱ� 
--�������̵�: EMPLOYEE_ID, �����̸�:FIRST_NANE ,�Ի���:HIRE_DATE,�޿�:SALARY
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;

--����(EMPLOYEES)���̺����� �������̵�, �����̸�, ��ȭ��ȣ, �̸����� ��ȸ�ϱ� 
--��ȭ��ȣ :PHONE_NUMBER, �̸���:EMAIL
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES;

--�μ�(DEPARTMENT)���̺����� �μ����̵�, �μ��� ��ȸ�ϱ� 
SELECT DEPARTMENT_ID, DEPARTMENT_NAME 
FROM DEPARTMENTS;

--����(JOBS)���̺����� �������̵�, �������� ��ȸ�ϱ� 
SELECT JOB_ID, JOB_TITLE
FROM JOBS;
--������(LOCATIONS)���̺����� ������ ���̵�, �ּ�, ���ø� ��ȸ�ϱ� 
SELECT LOCATION_ID, STREET_ADDRESS, CITY
FROM LOCATIONS;

------------------------------------------------------------------------------
--SELECT�� ���� ��������� ����ϱ� (+,-,*,/)

--�������̺����� �����̸�, �����޿�, ���� ���� ��ȸ�ϱ� 
--���������� �޿�*12�� �����Ѵ�. 
SELECT FIRST_NAME, SALARY, SALARY * 12
FROM EMPLOYEES;

--�������̺�(JOBS)���� �������̵�, �����޿�, �ְ��޿�, �����޿��� ���̸� ��ȸ�ϱ� 
SELECT JOB_ID, MIN_SALARY, MAX_SALARY, MAX_SALARY - MIN_SALARY
FROM JOBS;
--�������̺����� �������̵�, �̸�, �޿�, 10%�λ�� �޿�, �λ�� �ݾ��� ��ȸ�ϱ� 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*1.1, SALARY*1.1 - SALARY
FROM EMPLOYEES;

-----------------------------------------------------------------------------
--SELECT ���� �÷����� ��Ī ����ϱ� 
--SELECT �÷��� AS ��Ī, �÷��� AS ��Ī, �÷��� AS��Ī
--FROM ���̺���;

--SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī(AS�� �����ص� ��)
--FROM ���̺���;

-- * ���� ��Ī�� �����̳� Ư�����ڰ� ���ԵǾ��ִ� ��� ""�� ���ξ� �Ѵ�. 

--��Ī�� �ʿ� ����, SELECT������ ������� ����� ��� 
--������� �÷�NAME���� �ٲ�� ������ �ĺ�Ȯ���� ����� �׷��� ��Ī�� �ۼ��ϰ� �ȴ�. 
SELECT EMPLOYEE_ID AS �������̵�, FIRST_NAME AS �̸�, SALARY AS �޿�, SALARY*12 AS ����
FROM EMPLOYEES;
--�÷��� �̸��� ������ �� ���� �ƴ�, �������� �̸��� ��Ī������ ��µǴ� �ͻ���,�ѱ��� �� �ۼ����� ����

--�������̺����� �������̵�, �����޿�, �ְ��޿�, �ְ��޿��� �����޿� ���̸� ��ȸ�ϱ� 
SELECT JOB_ID ���̵�, MIN_SALARY �����޿�, MAX_SALARY �ְ��޿�, MAX_SALARY - MIN_SALARY "�޿� ����"
FROM JOBS;
-- * ��Ī�� ������ ���Խ�Ű�� ����

--------------------------------------------------------------------
--�ߺ��� ��� �����ϱ� 
--SELECT DISTINCT �÷���, �÷���, ...
--FROM ���̺���;

-- �������̺����� �������� �Ҽӵ� �μ����̵� ��ȸ�ϱ�
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

-- JAVA�� ORACLE�� null
-- JAVA���� null: ���������� ������ ��, ���������� ��ü�� �����ϰ� ���� �ʴ�.
-- ORACLE���� null: �� ���ڵ忡 ���� �� �÷��� ���� ���� �������� �ʾҴ�.

---------------------------------------
-- ���� �����ϱ�(������ ���͸��ϱ�)
-- SELECT �÷���, �÷���, �÷���, ...
-- FROM ���̺���
-- WHERE ���ǽ�;
-- ���ǽ��� ���� TRUE�� �����Ǵ� �ุ ��ȸ��
-- ���ǽĿ����� �񱳿�����, ����������, ��Ÿ�����ڵ��� ����
-- �񱳿�����: > < >= <= =(���ٰ� ��ȣ �ϳ�) !=(���� �ʴ�, ����Ŭ���� <>�� ���� �ǹ�)
-- ����������: AND OR NOT

-- �޿��� 15000�޷� �̻� ���� �������� �������̵�, �̸�, �޿� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 15000;

-- 60�� �μ����� ���ϴ� �������� �������̵�, �����̸�, �������̵� ��ȸ�ϱ�
-- EMPLOYEE���̺��� DEPARTMENT_ID�� ������ �ҼӺμ� ���̵�
-- EMPLOYEE���̺��� DEPARTMENT_ID�� 60�� ������ ��ȸ�ϴ� ��
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ������Ŵ���(SA_MAN)�� �����ϰ� �ִ� ������ ���̵�, �̸�, ��ȭ��ȣ, �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'; -- �ҹ��ڷ� ������ �ƹ��͵� �ȳ�Ÿ��
-- ����Ŭ�� Ű����� �ĺ���(���̺���, �÷���, ��Ī ��)�� ��ҹ��ڸ� �������� ����
-- ������ ���̺��� ����� ���� ��ҹ��ڸ� �����ϰ� ������

-- WHERE������ ���� ���� �������� ���� ���͸��ϱ�
-- SELECT �÷���, �÷���, �÷���
-- FROM ���̺���
-- WHERE ���ǽ�1 AND ���ǽ�2 AND ���ǽ�3
-- * �� ���ǽ��� �񱳿�����, ����������, ��Ÿ�����ڸ� ����ؼ� TRUE/FALSE�� �����Ǵ� ���ǽ�

-- 50�� �μ��� �ҼӵǾ� �ְ�, �޿��� 3000�޷� ���Ϸ� ���� ��������
-- �������̵�, �����̸�, �Ի�����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50 AND SALARY <= 30000;

-- ������ �߿��� �޿��� 10000�޷� �̻� 15000�޷� �̸����� �޴� �������� 
-- �������̵�, �̸�, �������̵�, �޿� ��ȸ�ϱ� 
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <= 15000;