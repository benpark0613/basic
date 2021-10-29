-- �����Լ�
-- ��/�ҹ��� ��ȯ
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ���ڿ� �߶󳻱�
-- SUBSTR(�÷���, ������ġ) : ������ġ���� ������ �߶󳽴�.
-- SUBSTR(�÷���, ������ġ, ����) ������ġ���� ������ ���̸�ŭ �߶󳽴�.
SELECT JOB_ID, SUBSTR(JOB_ID, 1, 2), SUBSTR(JOB_ID, 4)
FROM JOBS;

-- ���ڿ� ���� ��ȸ�ϱ�
-- LENGTH(�÷���) : �ش� �÷��� ����� ���� ���̸� ��ȯ�Ѵ�.
SELECT JOB_ID, LENGTH(JOB_ID)
FROM EMPLOYEES
ORDER BY LENGTH(JOB_ID) DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY JOB_ID_LENGTH DESC;

SELECT JOB_ID, LENGTH(JOB_ID) JOB_ID_LENGTH
FROM EMPLOYEES
ORDER BY 2 DESC;

-- ���ڿ� ä���
-- LPAD(�÷���, ��ü����, '�е�����') : ���ڿ��� ���̰� ��ü���̸�ŭ �ǵ��� ���ʿ� �е����ڸ� ä���.
-- RPAD(�÷���, ��ü����, '�е�����') : ���ڿ��� ���̰� ��ü���̸�ŭ �ǵ��� �����ʿ� �е����ڸ� ä���.
SELECT FIRST_NAME, LPAD(FIRST_NAME, 15, '#'), RPAD(FIRST_NAME, 15, '#')
FROM EMPLOYEES;

SELECT LPAD('1234', 10, '0'), LPAD('12', 10, '0'), LPAD(123456, 10, '0')
FROM DUAL;

-- DUAL�� ����Ŭ�� ����� 1�� 1��¥�� ���̺��̴�.
SELECT *
FROM DUAL;

-- ���ڿ� �����ϱ�
-- CONCAT(�÷���1, �÷���2) : ������ �÷��� ������ ���� �̾���δ�.
-- �÷���1 || �÷���2 || �÷���3 || ... || �÷���n : n���� �÷��� ������ ���� �̾���δ�.
SELECT FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, LAST_NAME), FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ���ʿ��� ���� ���ֱ�
-- TRIM(�÷���) : ������ �÷��� �� ����, �����ʿ� ��ġ�� ���ǹ��� ������ �����Ѵ�.
SELECT TRIM('                              ABC        ABC                  ABC                    ')
FROM DUAL;

-- ���ڿ� �ٲٱ�
-- REPLACE(�÷���, ã�¹��ڿ�, ��ü�ҹ��ڿ�) : ������ �÷����� Ư�����ڿ��� ã�Ƽ� �ٸ� ���ڿ��� ��ü��Ų��.
SELECT FIRST_NAME, REPLACE(LOWER(FIRST_NAME), 'a', '*')
FROM EMPLOYEES;

-- ���ڿ� ã��
-- INSTR(�÷���, 'ã�¹��ڿ�') : ������ �÷����� ã�� ������ ��ġ�� ��ȯ�Ѵ�.
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'A')
FROM EMPLOYEES;

--------------------------------------------------------------------------------
-- �����Լ�
-- �ݿø��ϱ�(�÷���) : ���ڸ� ���� �ڸ��� �ݿø��Ѵ�.
-- �ݿø��ϱ�(�÷���, �ڸ���) : ���ڸ� ������ �ڸ������� �ݿø��Ѵ�. 
--                           �ڸ����� ���� ������ �Ҽ����ڸ���
--                           �ڸ����� ���� ������ ���� �ڸ�, ���� �ڸ�, ���� �ڸ� ������ �ݿø��Ѵ�.
SELECT ROUND(123.45, 2), ROUND(123.45, 1), ROUND(123.45, 0), ROUND(123.45), ROUND(123.45,-1), ROUND(123.45, -2)
FROM DUAL;

-- �Ҽ����� ������
-- TRUNC(�÷���) : �Ҽ��� �κ��� �ݿø����� �ʰ� ,������ ������.
SELECT ROUND(123.45), ROUND(123.55), TRUNC(123.45), TRUNC(123.55)
FROM DUAL;

-- õ�尪�� �ٴڰ� ���ϱ�
-- CEIL(�÷���) : �ڽź��� ū ���� �߿��� ���� ���� ������ ��ȯ�Ѵ�.
-- FLOOR(�÷���) : �ڽź��� ���� ���� �߿��� ���� ū ������ ��ȯ�Ѵ�.
SELECT ROUND(2.6), TRUNC(2.6), CEIL(2.6), FLOOR(2.6)
FROM DUAL;

-- ������ ���ϱ�
-- MOD(����1, ����2) : ù��° ���ڸ� �ι�° ���ڷ� �������� �����ϰ�, ������ ���� ��ȯ�Ѵ�.
SELECT MOD(10, 3), MOD(5, 3)
FROM DUAL;

--------------------------------------------------------------------------------
-- ��¥�Լ�
-- SYSDATE : �ý����� ���� ��¥�� �ð������� ��ȯ�ϴ� �Լ�
SELECT SYSDATE
FROM DUAL;

-- ��¥ �ݿø� �� �ð����� �����
-- ROUND(��¥) : �ش� ������ �ð��� ������ �Ѿ��� ��� ������ 0�� 0�� 0�ʰ� ��ȯ�ȴ�.
-- TRUNC(��¥) : �ش� ��¥�� ��� �ð������� 0���� �ٲ� ���� ��ȯ�ȴ�.
SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- MONTHS_BETWEEN(��¥1, ��¥2) : �� ��¥ ������ �������� ��ȯ�Ѵ�.
SELECT FIRST_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ADD_MONTHS(��¥, ������) : ��¥���� ������ ��������ŭ ����� ��¥�� ��ȯ�Ѵ�.
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -3), ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- LAST_DAY(��¥) : �ش� ��¥�� ���� ���� �� ������ ��¥�� ��ȯ�Ѵ�.
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- ��¥ ����
-- ��¥ + ���� : ��¥���� ������ ���ڸ�ŭ ����� ��¥�� ��ȯ�Ѵ�.
-- ��¥ - ���� : ��¥���� ������ ���ڸ�ŭ ���� ��¥�� ��ȯ�Ѵ�.
-- ��¥ - ��¥ : �� ��¥ ������ �ϼ��� ��ȯ�Ѵ�.
-- ��¥ + ��¥ : ����
-- ��¥ + ����/24 : ��¥���� ������ �ð���ŭ ����� ��¥�� ��ȯ�Ѵ�.
-- ��¥ - ����/24 : ��¥���� ������ �ð���ŭ ���� ��¥�� ��ȯ�Ѵ�.
SELECT SYSDATE, 
        SYSDATE + 1/24 AS "1�ð� ���� ��¥",
        SYSDATE + 6/24 AS "6�ð� ���� ��¥",
        SYSDATE + 1    AS "�Ϸ� ������ ��¥",
        TRUNC(SYSDATE) - 3    AS "3�� �� ��¥", 
        SYSDATE - 7    AS "1���� �� ��¥"
FROM DUAL;

SELECT FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE) - HIRE_DATE AS "�� �ٹ��ϼ�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

--------------------------------------------------------------------------------
-- ��Ÿ�Լ�
-- NVL(�÷���, NULL�� �� ��ü�� ��) : ������ �÷����� NULL�� �� ��ü���� ��ȯ�ȴ�. NULL�� �ƴϸ� �÷����� ��ȯ�ȴ�.
--                                 �÷����� ��ü�� ���� ������Ÿ���� ���� ���̴�.
--                                 NULL���� �����ϴ� ��Ģ������ ������������ �׻� NULL�̴�.
--                                 ��Ģ����Ŀ� NULL���� �����ϴ� �÷��� ���ԵǾ� �ִٸ� NVL�Լ��� ����ؼ� NULL���� ������ ������ ��ü�� �� �����ؾ� �Ѵ�.
SELECT NVL(10, 0), NVL(NULL, 0)
FROM DUAL;

-- ��� �������� �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�ϱ�
-- ���� : �޿�*12 + �޿�*Ŀ�̼�*12
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*12 + SALARY*NVL(COMMISSION_PCT, 0)*12
FROM EMPLOYEES;

-- NVL2(�÷���, ��1, ��2) : ������ �÷��� ���� NULL�� �ƴϸ� ��1, NULL�̸� ��2�� ��ȯ�ȴ�.
--                        ��1�� ��2�� ������Ÿ���� ���� ���̴�.

-- Ŀ�̼� ���ɿ��θ� 'YES/NO'������ ��ȸ�ϱ�
SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, 'YES', 'NO')
FROM EMPLOYEES;

-- CASE ~ WHEN ���1 : IF���� ����
-- CASE
--      WHEN ���ǽ�1 THEN ǥ����1     -- ���ǽ�1�� TRUE�� �����Ǹ� ǥ����1�� ��������� �ȴ�.
--      WHEN ���ǽ�2 THEN ǥ����2     -- ���ǽ�2�� TRUE�� �����Ǹ� ǥ����2�� ��������� �ȴ�.
--      WHEN ���ǽ�3 THEN ǥ����3     -- ���ǽ�3�� TRUE�� �����Ǹ� ǥ����3�� ��������� �ȴ�.
--      ELSE ǥ����4                 -- ���ǽ�1, ���ǽ�2, ���ǽ�3�� ��� FALSE�� �����Ǹ� ǥ����4�� ��������� �ȴ�.
-- END 

-- CASE ~ WHEN ���2
-- CASE
--      WHEN ��1 THEN ǥ����1     -- ���� ��1�� ��ġ�ϸ� ǥ����1�� ��������� �ȴ�.
--      WHEN ��2 THEN ǥ����2     -- ���� ��2�� ��ġ�ϸ� ǥ����1�� ��������� �ȴ�.
--      WHEN ��3 THEN ǥ����3     -- ���� ��3�� ��ġ�ϸ� ǥ����1�� ��������� �ȴ�.
--      ELSE ǥ����4              -- ��1, ��2, ��3�� ��� ��ġ���� ������ ǥ����4�� ��������� �ȴ�.
-- END 

-- �޿��� ���� ���� ����ϱ�
-- �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ 20000�޷� �ʰ� : 50%, 15000�޷� �ʰ� 40%, 10000�޷� �ʰ� 30%, 5000�޷� �ʰ� 20%, �׿� 10%��.
SELECT FIRST_NAME, SALARY,
       CASE
            WHEN SALARY > 20000 THEN SALARY*0.5
            WHEN SALARY > 15000 THEN SALARY*0.4
            WHEN SALARY > 10000 THEN SALARY*0.3
            WHEN SALARY > 5000  THEN SALARY*0.2
            ELSE SALARY*0.1
        END AS TAX
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- TB_SAMPLE_PRODUCTS ���̺��� ī�װ��� ����Ʈ ���޾��� ��ȸ�ϱ�
-- ī�װ��� ����Ʈ���� ��� 1000��, ��Ʈ���� ��� 500��, �º��� ��� 700��, ����Ʈ��ġ�� ��� 600�� �׿ܴ� 200���̴�.
SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_DISCOUNT_PRICE,
       CASE PRODUCT_CATEGORY
            WHEN '����Ʈ��' THEN 1000
            WHEN '��Ʈ��' THEN 500
            WHEN '�º�' THEN 700
            WHEN '����Ʈ��ġ' THEN 600
            ELSE 200
       END AS POINT
FROM TB_SAMPLE_PRODUCTS;

-- DECODE(�÷���, ��1, ǥ����1,    -- �÷��� ���� ��1�� ��ġ�ϸ� ǥ����1�� ��������� �ȴ�.
--               ��2, ǥ����2,    -- �÷��� ���� ��2�� ��ġ�ϸ� ǥ����2�� ��������� �ȴ�.
--               ��3, ǥ����3)    -- �÷��� ���� ��3�� ��ġ�ϸ� ǥ����3�� ��������� �ȴ�.
--                               -- �÷��� ���� ��1, ��2, ��3 ��ο� ��ġ���� ������ NULL�� ��������� �ȴ�.

-- DECODE(�÷���, ��1, ǥ����1,    -- �÷��� ���� ��1�� ��ġ�ϸ� ǥ����1�� ��������� �ȴ�.
--               ��2, ǥ����2,    -- �÷��� ���� ��2�� ��ġ�ϸ� ǥ����2�� ��������� �ȴ�.
--               ��3, ǥ����3,    -- �÷��� ���� ��3�� ��ġ�ϸ� ǥ����3�� ��������� �ȴ�.
--               ǥ����4)         -- �÷��� ���� ��1, ��2, ��3 ��ο� ��ġ���� ������ ǥ����4�� ��������� �ȴ�.

-- TB_SAMPLE_PRODUCTS ���̺��� ī�װ��� ����Ʈ ���޾��� ��ȸ�ϱ�
-- ī�װ��� ����Ʈ���� ��� 1000��, ��Ʈ���� ��� 500��, �º��� ��� 700��, ����Ʈ��ġ�� ��� 600�� �׿ܴ� 200���̴�.
SELECT PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE,
       DECODE(PRODUCT_CATEGORY, '����Ʈ��', 1000,
                                '��Ʈ��', 500,
                                '�º�', 700,
                                '����Ʈ��ġ', 600, 
                                200) AS POINT
FROM TB_SAMPLE_PRODUCTS;

--------------------------------------------------------------------------------
-- ��ȯ�Լ�
-- ����Ŭ�� �Ʒ��� 4���� ��ȯ�� �����Ѵ�.
-- ���� > ����
-- ���� > ����
-- ��¥ > ����
-- ���� > ��¥
-- ������ ��ȯ : RDBMS�� �ڵ����� ������Ÿ���� ��ȯ�� �ִ� ��
-- ����� ��ȯ : ��ȯ�Լ��� ����ؼ� ������Ÿ���� ��ȯ�� �ִ� ��

-- ������ ��ȯ
SELECT '1000' * 10, '1000' - 10, '1000' + 10, '1000'/10     -- ���� '1000'�� ���� 1000���� ��ȯ
FROM DUAL;
-- ������ ��ȯ
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '100';                                  -- ���� '100'�� EMPLOYEE_ID�� Ÿ�԰� ���� Ÿ������ ��ȯ
-- ������ ��ȯ
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01';                            -- ���� '2007/01/01'�� HIRE_DATE�� Ÿ�԰� ���� Ÿ������ ��ȯ
-- ������ ��ȯ
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007-01-01';                            -- ���� '2007/01/01'�� HIRE_DATE�� Ÿ�԰� ���� Ÿ������ ��ȯ
-- ������ ��ȯ
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007.01.01';                            -- ���� '2007/01/01'�� HIRE_DATE�� Ÿ�԰� ���� Ÿ������ ��ȯ

-- ����� ��ȯ
-- �����õ� ���� > ���� : TO_NUMBER('�����õȹ���', '����')
SELECT TO_NUMBER('1,000','9,999')*10                        -- TO_NUMBER('�����õȹ���', '����')�� ���ڰ� ������ ������ ���������� �� ���ڷ� ��ȯ
FROM DUAL;

-- ����� ����ȯ
-- ���� > �����õ� ���� : TO_CHAR(����, '����������')
-- ���Ϲ��� : 0 (���� �ϳ��� ����, �����ο��� �ش� �ڸ��� ���ڰ� ��� 0�� ��µȴ�.)
-- ���Ϲ��� : 9 (���� �ϳ��� ����, �����ο��� �ش� �ڸ��� ���ڰ� ������ ��µ��� �ʴ´�.)
-- ���Ϲ��� : , (�ڸ���)
-- ���Ϲ��� : . (�Ҽ���)
SELECT TO_CHAR(1000000, '9,999,999'), TO_CHAR(10000, '9,999,999'), TO_CHAR(1000, '0,000,000')
FROM DUAL;
-- ����� ����ȯ
SELECT TO_CHAR(123.456, '999.99'), TO_CHAR(123.456, '000.00'), TO_CHAR(123.4, '999.99'), TO_CHAR(123.4, '000.00')
FROM DUAL;

-- ����� ����ȯ
-- ���Ϲ��� : YYYY Ȥ�� yyyy (��)
-- ���Ϲ��� : MM Ȥ�� mm     (��)
-- ���Ϲ��� : DD Ȥ�� dd     (��)
-- ���Ϲ��� : AM Ȥ�� am     (����/����)
-- ���Ϲ��� : HH Ȥ�� hh     (�ð�)
-- ���Ϲ��� : HH24 Ȥ�� hh24 (24�ð�)
-- ���Ϲ��� : MI Ȥ�� mi     (��)
-- ���Ϲ��� : SS Ȥ�� ss     (��)

-- ��¥ > �����õ� ����
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), TO_CHAR(SYSDATE, 'yyyy/mm/dd'), TO_CHAR(SYSDATE, 'HH24:MI:SS'), TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM DUAL;

-- �����õ� ���� > ��¥
SELECT SYSDATE - TO_DATE('2021/10/01')
FROM DUAL;

-- 2007�� ��ݱ⿡ �Ի��� ������� ����� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE < TO_DATE('2007/06/30') + 1;

--------------------------------------------------------------------------------
-- ������ �Լ�
-- SUM(�÷���)          : �ش� �÷��� �հԸ� ��ȯ�Ѵ�. NULL�� ���� �����Ѵ�.
-- AVG(�÷���)          : �ش� �÷��� ��հ��� ��ȯ�Ѵ�. NULL�� ���� �����Ѵ�.
-- MAX(�÷���)          : �ش� �÷��� �ִ밪�� ��ȯ�Ѵ�. NULL�� ���� �����Ѵ�.
-- MIN(�÷���)          : �ش� �÷��� �ּҰ��� ��ȯ�Ѵ�. NULL�� ���� �����Ѵ�.
-- COUNT(* Ȥ�� �÷���) : ���� ������ ��ȯ�Ѵ�. *�� ��� �ش� �÷��� ���� NULL�̾ ���Խ�Ų��. �÷����� ������ �ش� �÷��� NULL�̸� ���ܵȴ�.

-- 60�� �μ��� �Ҽӵ� �������� �ѱ޿��� ��ȸ�ϱ�
SELECT SUM(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60�� �μ��� �Ҽӵ� �������� ��ձ޿��� ��ȸ�ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 60�� �μ��� �Ҽӵ� �������� �ִ�޿�, �ּұ޿��� ��ȸ�ϱ�
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ��ü ����� ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES;

-- Ŀ�̼��� �޴� ����� ���� ��ȸ�ϱ�
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;
-- Ŀ�̼��� �޴� ����� ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- �޿��� ���� ���� ���� ����� �̸��� �޿��� ��ȸ�ϱ�
-- ������ �Լ��� ��׷�� �� �ุ ����� ������ ������ �������Լ��� �ƴ� �Ͱ� ���� ����� �� ����.
-- �Ʒ��� SQL ���� ������.
SELECT FIRST_NAME, MAX(SALARY)
FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES;

SELECT MAX(SALARY)
FROM EMPLOYEES;

-- �޿��� ���� ���� ���� ����� �̸��� �޿��� ��ȸ�ϱ�
-- ��������(SUB QUERY)
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);


