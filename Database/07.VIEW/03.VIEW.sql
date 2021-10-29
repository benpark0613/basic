-- �ζ��κ�
-- �μ��� �ο����� ��ȸ�ؼ� �μ��� �ο����� 10�� �̸��� �μ��� ���̵�, �μ���, �ο����� ��ȸ�ϱ�
SELECT V.DEPARTMENT_ID, D.DEPARTMENT_NAME, V.CNT
FROM (SELECT DEPARTMENT_ID, COUNT(*) CNT
      FROM EMPLOYEES
      WHERE DEPARTMENT_ID IS NOT NULL
      GROUP BY DEPARTMENT_ID) V, DEPARTMENTS D
WHERE V.CNT < 10
AND V.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- �ε���
SELECT ROWID, EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES;

SELECT ROWID, PRODUCT_NO, PRODUCT_NAME
FROM TB_SAMPLE_PRODUCTS;

SELECT *
FROM TB_SAMPLE_FOODS
WHERE FOOD_NO = 5001;

CREATE INDEX FOOD_NAME_IDX
ON TB_SAMPLE_FOODS (FOOD_NAME);

SELECT *
FROM TB_SAMPLE_FOODS
WHERE FOOD_NAME = '�����';


