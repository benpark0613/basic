-- �����˻�
-- ������ ������ �̿��ؼ� ��/�� ���迡 �ִ� �����͸� ��ȸ�Ѵ�.

-- 100�� ������ ������ ��ġ�ϰ� �ִ� ���� ��ȸ�ϱ�
SELECT LEVEL, EMPLOYEE_ID,LPAD('-', (LEVEL-1)*5, '-') || FIRST_NAME
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID AND LEVEL <= 3;

-- 101�� ������ ������ ��ġ�ϰ� �ִ� ���� ��ȸ�ϱ�
SELECT LEVEL, EMPLOYEE_ID,LPAD('-', (LEVEL-1)*5, '-') || FIRST_NAME
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 101
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID AND LEVEL <= 2;

-- 205�� ������ ������ ��ġ�ϰ� �ִ� �Ŵ��� ��ȸ�ϱ�
SELECT LEVEL, EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 205
CONNECT BY PRIOR MANAGER_ID = EMPLOYEE_ID;      -- Shelley > Neena > Steven 

--------------------------------------------------------------------------------
-- LEVEL�� CONNECT BY�� ���ӵ� ����/ ��¥ �����ϱ�

-- 2004�⿡ �Ի��� �������� ������ �� �� �� �Ի��ߴ��� ��ȸ�ϱ�
SELECT TO_NUMBER(Y.MONTH) MONTH , Y.MONTH, NVL(X.CNT, 0) CNT
FROM (SELECT TO_CHAR(HIRE_DATE, 'MM') MONTH, COUNT(*) CNT
      FROM EMPLOYEES 
      WHERE HIRE_DATE > '2004/01/01' AND HIRE_DATE < TO_DATE('2004/12/31') + 1
      GROUP BY TO_CHAR(HIRE_DATE, 'MM')) X,
     (SELECT LPAD(LEVEL, 2, '0') MONTH
      FROM DUAL
      CONNECT BY LEVEL <= 12) Y
WHERE X.MONTH(+) = Y.MONTH
ORDER BY Y.MONTH ASC;

-- 2021/10/01 ~ 2021/10/31 ������ ��¥�� �����ϱ�
SELECT TO_DATE('2021/10/01', 'YYYY/MM/DD') + LEVEL - 1
FROM DUAL
CONNECT BY LEVEL <= TO_DATE('2021/10/31') - TO_DATE('2021/10/01') + 1;

-- �������� �޿� 1000�޷� ������ �����ؼ� �޿��� �ο����� ��ȸ�ϱ�
SELECT Y.SALARY, NVL(CNT, 0) NVL
FROM (SELECT TRUNC(SALARY, -3) SALARY, COUNT(*) CNT
      FROM EMPLOYEES
      GROUP BY TRUNC(SALARY, -3)) X,
     (SELECT LEVEL*1000 SALARY
      FROM DUAL
      CONNECT BY LEVEL <= 24) Y
WHERE X.SALARY(+) = Y.SALARY      
ORDER BY 1;






















