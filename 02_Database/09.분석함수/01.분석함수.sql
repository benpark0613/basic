-- TOP-N �м�
-- ���̺��� ���� Ư�� �÷����� �������� �������� �� ������ ������ ���ԵǴ� ���� ��ȸ�ϴ� ��
-- ROWNUM(�ǻ��÷�: Pseudo Column): ��ȸ�� ����� ���ؼ� ������ ���̴� �÷��̴�.

-- ������ �߿��� �޿��� ���� ���� �޴� ���� 5���� ������ ��ȸ�ϱ�, �������̵�, �̸�, �޿�
SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

-- �����ϴ� �������� ���� ���� ���� 3���� ������ ���̵�� �����ϴ� �������� ��ȸ�ϱ� 
SELECT MANAGER_ID, CNT
FROM (SELECT MANAGER_ID, COUNT(*) CNT
      FROM EMPLOYEES
      GROUP BY MANAGER_ID
      ORDER BY CNT DESC)
WHERE ROWNUM <= 3;

--------------------------------------------------------------------------------
-- �м��Լ��� ����ؼ� ���� ��ȸ�ϱ�

-- �޿��� �������� �������� ������ ����, ��ȸ�� �࿡ ���� Ȥ�� ������ �ο��Ѵ�.
SELECT SALARY,  
       RANK()       OVER (ORDER BY SALARY DESC) "RANK", 
       DENSE_RANK() OVER (ORDER BY SALARY DESC) "DENSE_RANK",
       ROW_NUMBER() OVER (ORDER BY SALARY DESC) "ROW_NUMBER"            
FROM EMPLOYEES;

-- PARTITION BY �÷��� (������ �÷��� ������ �޿��� �������� ������������ ������ ���� ��ȸ�� �࿡ ���� Ȥ�� ������ �ο��Ѵ�.)
SELECT DEPARTMENT_ID, SALARY,  
       RANK()       OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) "RANK", 
       DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) "DENSE_RANK",
       ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) "ROW_NUMBER"            
FROM EMPLOYEES;

-- �������� �޿��� ������������ �������� �� ���� 7������ ��ȸ�ϱ�
SELECT *
FROM (SELECT RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK <= 7;     -- ��ȸ�� ���� ����: 8��

-- �������� �޿��� ������������ �������� �� ���� 7������ ��ȸ�ϱ�
SELECT *
FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK <= 7;     -- ��ȸ�� ���� ����: 9�� 

-- �������� �޿��� ������������ �������� �� 7��° ����� ��ȸ�ϱ�
SELECT *
FROM (SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK <= 7;     -- ��ȸ�� ���� ����: 7�� 




-- �������� �޿��� ������������ �������� �� ���� 11 ~ 20������ ��ȸ�ϱ�
SELECT *
FROM (SELECT RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK >=11 AND SALARY_RANK <= 20;     -- ��ȸ�� ���� ����: 10��

-- �������� �޿��� ������������ �������� �� ���� 11 ~ 20������ ��ȸ�ϱ�
SELECT *
FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK >=11 AND SALARY_RANK <= 20;     -- ��ȸ�� ���� ����: 21�� 

-- �������� �޿��� ������������ �������� �� 11 ~ 20��° ����� ��ȸ�ϱ�
SELECT *
FROM (SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) SALARY_RANK, 
             EMPLOYEE_ID, 
             FIRST_NAME, 
             SALARY
      FROM EMPLOYEES)
WHERE SALARY_RANK >=11 AND SALARY_RANK <= 20;     -- ��ȸ�� ���� ����: 10�� 






