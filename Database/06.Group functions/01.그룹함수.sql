-- �׷��Լ�(�������Լ�)
-- COUNT(*), COUNT(�÷���), SUM(�÷���), AVG(�÷���), MIN(�÷���), MAX(�÷���)
-- �������Լ� Ȥ�� �׷��Լ��� ���� �׷�� ��ȸ����� �ϳ� ��ȸ�Ǵ� �Լ���.
-- ���� �׷��� �������� ������ ���̺��� ��� ���� �ϳ��� �׷��̴�.

-- ���� �׷��� �������� �ʾұ� ������ ���̺��� ��� �࿡ ���ؼ� COUNT(*) �Լ��� ����ȴ�.
SELECT COUNT(*)
FROM EMPLOYEES;

-- GROUP BY ��
-- ���̺��� ���� ������ �÷��� ���� ���� �ͳ��� �׷����� ���´�.
-- �������Լ��� ���� ����ϸ� �׷�� �������Լ��� �����ؼ� �׷츶�� �������� ��ȸ�� �� �ִ�.
-- ���̺� ����� �����Ϳ� ���ؼ� �׷캰 �հ�/���/�ּҰ�/�ִ밪/�л�/ǥ������ ���� ����� ��ȸ�� �� �ִ�.
-- GROUP BY ���� ����ߴ� �÷��̳� ǥ������ �������Լ��� ���� SELECT������ ����� �� �ִ�.

-- �������̺��� �������� �ҼӺμ����� �������� �� �� �μ��� �ο����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

-- �Ի�⵵�� �������� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY YEAR;

-- �ҼӺμ��� ��ձ޿� ��ȸ�ϱ�(�μ��̸�, ��ձ޿�)
SELECT D.DEPARTMENT_NAME, ROUND(AVG(SALARY)) SALARY_AVG
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
ORDER BY 1;

-- �Ի�⵵�� ����� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'), DEPARTMENT_ID
ORDER BY 1, 2;

-- �� �����(REGIONS) ����� ��ȸ�ϱ�
SELECT R.REGION_NAME, COUNT(*)
FROM REGIONS R, COUNTRIES C, LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
WHERE R.REGION_ID = C.REGION_ID
AND C.COUNTRY_ID = L.COUNTRY_ID
AND L.LOCATION_ID = D.LOCATION_ID
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY R.REGION_NAME;

-- HAVING ���ǽ�
-- �׷��Լ��� ������ ����� ���͸��� �� ����Ѵ�.
-- WHERE���� ���ǽĿ��� �׷��Լ��� ����� �� ����.
-- HAVING���� ���ǽĿ��� �׷��Լ��� ����� �� �ִ�.
-- HAVING���� GROUP BY���� �Բ� ����ؾ� �Ѵ�. �ܵ����� ����� �� ����.

-- �μ��� ������� ��ȸ���� ��, �Ҽӵ� ������� 10�� ������ �μ��� ���̵�� �ο����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) <= 10;

-- �Ի�⵵��, �μ��� ������� ��ȸ���� ��, 2005�⵵�� 10�� �̻� �Ի��� �μ��� �μ����̵�� ������� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'), DEPARTMENT_ID
HAVING TO_CHAR(HIRE_DATE, 'YYYY') = '2005' AND COUNT(*) >= 10
ORDER BY 1, 2;

-- 2005�⵵�� 10�� �̻� �Ի��� �μ��� �μ����̵�� ������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < TO_DATE('2005/12/31') + 1
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 10;















