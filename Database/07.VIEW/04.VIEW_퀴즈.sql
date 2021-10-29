-- 'Executive' �μ��� ��� ����� ���̵�� �̸��� ����, �μ���ȣ�� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_NAME = 'Executive';

-- 'Neena' ���� ���� �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena');

-- �޿��� ���� ���� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);

-- ��ü ������ ��ձ޿� 2�� �̻��� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= (SELECT AVG(SALARY)*2
                 FROM EMPLOYEES);

-- ��ü ����� ��ձ޿����� �޿��� ���� �ް�, �̸��� 50�� �μ����� �ٹ��ϴ� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND SALARY > (SELECT AVG(SALARY)
              FROM EMPLOYEES);

-- ������� ��ü ��պ��� ���� �޿��� ���� ������� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARY_GRADE S
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES)
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY;

-- 80�� �μ��� �ٹ��ϰ�, 80�� �μ��� �����޿��� �޴� ����� ���̵�, �̸�, �������̵�, �޿�, �μ����̵� ��ȸ�ϱ�



-- 'Neena'���� ����޴� ����� ���� �Ŵ������� �����ϴ� ������ ���̵�, �̸�, �Ŵ����� ���̵�, �Ŵ����� �̸��� ��ȸ�ϱ�

-- 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϴ� ������ ���̵�, �̸�, �Ի���, �μ����̵� ��ȸ�ϱ�

-- �μ��� ��ձ޿��� ������� �� 'Ismael'�� �ٹ��ϴ� �μ��� ��ձ޿����� �޿��� ���� �޴� �μ��� ���̵�� ��ձ޿��� ��ȸ�ϱ�

-- 100�� �Ŵ������� �����ϴ� ������ ������� ��ȸ�ϱ�

-- �μ��� �ְ�޿��� ��ȸ���� �� �ְ�޿��� 15000�� �Ѵ� �μ��� ���̵�� �ְ�޿��� ��ȸ�ϱ�

-- ���� �޿��� �������� �޿� ����� ��ȸ���� ��, �޿���޺� �������� ��ȸ�ϱ�

-- ���� ���� ������ �Ի��� �ؿ� �� �ؿ� �Ի��� �������� ��ȸ�ϱ�

-- �Ҽ� �μ��� ��ձ޿����� ���� �޿��� �޴� ������ ���̵�� �����̸�, �޿�, �� �μ��� ��� �޿��� ��ȸ�ϱ�

-- ������ ��ձ޿��� ������� �� ��ձ޿��� ���� ���� ������ ��ձ޿��� ��ȸ�ϱ�

-- ������ ��ձ޿��� ������� �� ��ձ޿��� ���� ���� ������ ���̵�, ��������, �� ������ �����޿�, �� ������ �ִ�޿��� ��ȸ�ϱ�
