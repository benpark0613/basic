-- �޿��� 12000�� �Ѵ� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000;

-- �޿��� 5000�̻� 12000������ ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 12000;

-- 2006�⿡ �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01' AND HIRE_DATE < TO_DATE('2006/12/31') + 1
ORDER BY HIRE_DATE;

-- 20�� 50�� �μ��� �Ҽӵ� ����� �̸��� �μ���ȣ�� ��ȸ�ϰ�, �̸��� ���ĺ������� �����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50)
ORDER BY FIRST_NAME;

-- �޿��� 5000�̻� 12000���ϰ�, 20���� 50�� �μ��� �Ҽӵ� ����� �̸��� �޿�, �μ���ȣ�� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 12000
AND DEPARTMENT_ID IN (20, 50);

-- �����ڰ� ���� ����� �̸��� ����, �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- ������ 'SA_MAN'�̰ų� 'ST_MAN'�� �����߿��� �޿��� 8000�̻� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN', 'ST_MAN')
AND SALARY >= 8000;

-- ��� ����� �̸�, �������̵�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
--            E      E/J      E     D
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
--            E      E/J       J       E     J        J
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, J.MAX_SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿��� ���� �޿��� ���̸� ��ȸ�ϱ�
--            E     E/J       J        E      J         E
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, E.SALARY - J.MIN_SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- Ŀ�̼��� �޴� ��� ����� ���̵�, �����̸�, �μ��̸�, �ҼӺμ��� ������(���ø�)�� ��ȸ�ϱ�
-- E                     E         E         D      L 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

-- �̸��� A�� a�� �����ϴ� ��� ����� �̸��� ����, ��������, �޿�, �ҼӺμ����� ��ȸ�ϱ�
--  E                         E           E/J   J         E    D
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE SUBSTR(UPPER(E.FIRST_NAME), 1, 1) = 'A'
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 30, 60, 90�� �μ��� �ҼӵǾ� �ִ� ����� �߿��� 100���� �����ϴ� ������� �̸�, ����, �޿�, �޿������ ��ȸ�ϱ�
-- E /D                                       E                           E E    E    S
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.DEPARTMENT_ID IN (30, 60, 90)
AND E.MANAGER_ID = 100
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY;


-- 80�� �μ��� �Ҽӵ� ������� �̸�, ����, ��������, �޿�, �ּұ޿�, �ִ�޿�, �޿����,  �ҼӺμ����� ��ȸ�ϱ�
-- E/D                       E    E/J   J      E     J          J      S          D
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, S.GRADE, D.DEPARTMENT_NAME
FROM EMPLOYEES  E, JOBS J, SALARY_GRADE S, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- 'ST_CLERK'�� �ٹ��ϴٰ� �ٸ� �������� ������ ����� ���̵�, �̸�,  ������ �μ���, ���� ����, ���� �ٹ��μ������� ��ȸ�ϱ�
--               H                          H/E           E      D1           E         D2 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D1.DEPARTMENT_NAME PREV_DEPARTMENT_NAME, 
       E.JOB_ID CURRENT_JOB_ID, D2.DEPARTMENT_NAME CURRENT_DEPARTMENT_NAME
FROM JOB_HISTORY H, EMPLOYEES E, DEPARTMENTS D1, DEPARTMENTS D2
WHERE H.JOB_ID = 'ST_CLERK'
AND H.DEPARTMENT_ID = D1.DEPARTMENT_ID -- �����μ��� ��ȸ�� ���� ����
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID      -- ������� ��ȸ�� ���� ����
AND E.DEPARTMENT_ID = D2.DEPARTMENT_ID;  -- ���� �Ҽӵ� �μ��� ��ȸ���� ���� ����


