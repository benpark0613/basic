-- ��ȣ���� ��������
-- ���������� �÷��� �����ϴ� ����������.
-- ���������� ��ȸ�� �� �ึ�� �ѹ��� ����ȴ�. (�� �ึ�� ���ǽ��� ����ȴ�.)
-- WHERE ���ǽ��� �������� TRUE�� �����Ǵ� �ุ ����������  ��ȸ�ȴ�.

-- �������� �������̵� ��� �޿��� ��ȸ���� ��, �ڽ��� ���� �������̵��� ��ձ޿����� �޿��� ���� �޴� ����� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT X.EMPLOYEE_ID, X.FIRST_NAME, X.JOB_ID, X.SALARY
FROM EMPLOYEES X
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES Y
                WHERE Y.JOB_ID = X.JOB_ID);
                 
-- �������� ���̵�, �̸�, �������̵�, �ش� �����ڰ� �����ϴ� ������ ���� ��ȸ�ϱ�
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

