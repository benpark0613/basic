-- ���� �����ϴ� ��Ÿ ������

-- �÷��� ���� null�� ���� ��ȸ�ϱ�
-- SELECT �÷���, �÷���, ...
-- FROM ���̺��
-- WHERE �÷��� IS NULL;

-- �÷��� ���� null�� �ƴ� ���� ��ȸ�ϱ�
-- SELECT �÷���, �÷���, ...
-- FROM ���̺��
-- WHERE �÷��� IS NOT NULL;

-- �μ������ڰ� ���� �������� ���� �μ��� �μ����̵�, �μ��̸� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID = NULL; -- NULL�� �÷��� ���� �������� ���� ���̱� ������ ũ��, �۴�, ����, �����ʴ� ���� �񱳸� �� �� ����.

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- �ҼӺμ��� �������� ���� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- �ڽ��� ������(���)�� �������� ���� ����� ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- Ŀ�̼��� �޴� ������ �߿��� �޿��� 10000�޷� �̻� �޴� ����� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL AND SALARY >= 10000;

-- Ŀ�̼��� ���� �ʴ� ������ �߿��� �޿��� 3000�޷� �̻� 5000�޷� �̸��� ����� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL AND SALARY >= 3000 AND SALARY < 5000;

--------------------------------------------------------------------------------
-- ������ ������ ���ϴ� �� ��ȸ�ϱ�
-- SELECT �÷���, �÷���, ...
-- WHERE �÷��� BETWEEN A AND B;

-- BETWEEN A AND B
-- ���ǽ� ���� A�̻� B������ ���� ��ȯ�Ѵ�

-- �޿��� 3000�޷� �̻� 5000�޷� �̸��� ����� ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY >= 3000 AND SALARY <= 5000;

--------------------------------------------------------------------------------
-- ���õ� �� �� �ϳ��� �÷��� ������ ������ TRUE�� �����ϱ�
-- SELECT �÷���, �÷���, ...
-- FROM ���̺��
-- WHERE �÷��� IN (��1, ��2, ��3, ...);
-- * IN �����ڴ� OR ������ ��ü�� �� �ִ�.
-- * IN �����ڴ� �÷���� ���õ� ���� ���ؼ� EQUAL �񱳸� �Ѵ�.

-- �Ҽӵ� �μ� ���̵� 10�̰ų� 20���̰ų� 30���� ������ ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30; 
-- * OR �����ڸ� �ߺ��ؼ� ����ϴ� ���� ���� �ʴ�.

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30);
-- * OR ������ ��� IN �����ڸ� �������

-- �ҼӺμ� ���̵� 10, 20, 30 �߿� �ϳ��̰�, �޿��� 10000�޷� �̻� �޴� ������
-- ���� ���̵�, �̸�, �ҼӺμ����̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 30) AND SALARY >= 10000;
-- * OR�� AND�� ���ǽĿ��� ���� ���Ǹ� OR ���ǳ��� ��ȣ�� ����� �Ѵ�.

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30) AND SALARY >= 10000;
-- * OR�� AND�� ���ǽĿ��� ���� ���Ǹ� OR�κ��� IN �����ڷ� ��ü����

--------------------------------------------------------------------------------
-- ���� �˻��ϱ�
-- SELECT �÷���, �÷���, ...
-- FROM ���̺��
-- WHERE �÷��� LIKE '����';
-- ���� ����: _ % �� �ִ�.

-- �Ŵ����� ���ϰ� �ִ� ������ ���̵�, �̸�, ���� ��ȸ�ϱ�
-- (�Ŵ����� ���ϰ� �ִ� ������ �������̵� XX_MAN �̴�.)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

--------------------------------------------------------------------------------
-- ��ȸ�� �� �����ϱ�

-- ORDER BY ���� ����ϸ� ��ȸ�� ���� ������ �� �ִ�.
-- ORDER BY ���� �÷����̳� ǥ������ �����ϸ� �ش� ���� ���ؼ� ������������ ���ĵȴ�.
-- ASC, DESC�� �����ϸ� ���� ����� ��������, ������������ ������ �� �ִ�. �������� ������ ������������ ���ĵȴ�.
-- SELECT �÷���, �÷���, ...
-- FROM ���̺��
-- (WHERE ���ǽ�)
-- ORDER BY �÷��� (ASC | DESC)

-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �Ի���, �޿��� ��ȸ�ϱ�
-- �̸����� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY FIRST_NAME;

-- �޿������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY ASC;

-- �Ի��� ������ �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY HIRE_DATE DESC;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY 3 DESC; -- SELECT���� �÷��߿��� 3��° �÷��� ���� �������� ���Ľ�Ű�� (������� ����)

-- �������� ���̺��� ��� ���������� ���̵�, ����, �����޿��� ��ȸ�ϱ�
-- �����޿��� �������� �������� �����ϱ�
SELECT JOB_ID, JOB_TITLE, MIN_SALARY
FROM JOBS
ORDER BY MIN_SALARY DESC;

-- 60���� 80�� �μ����� �ٹ����� �������� �޿�, �̸�, �Ի����� ��ȸ�ϱ�
-- �޿��� �������� �������� �����ϰ�, �޿��� ���� ���� �̸� �������� �������� ���Ľ�Ų��.
SELECT SALARY, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (60, 80)
ORDER BY SALARY DESC, FIRST_NAME ASC;

--------------------------------------------------------------------------------
-- ���̺� ������ �߰�/����/�����ϱ�

-- �л��̸�, ��������, ��������, ���������� �����ϴ� ���̺��� �����ϰ�,
-- �ش� ���̺� ���������� �߰�/����/�����ϱ�

-- ���̺� �����ϱ�
CREATE TABLE TB_SCORES (
    STUDENT_NAME VARCHAR2(20) NOT NULL, -- �л��̸� �÷���: STUDENT_NAME ������Ÿ��: VARCHAR2 ����: 20    NULL�� ��뿩��: ������� ����
    KOR_SCORE NUMBER(3,0) DEFAULT 0,    -- �������� �÷���: KOR_SCORE    ������Ÿ��: NUMBER   ����: 3 �Ҽ������� �ִ� 3�ڸ� ����     �⺻��: 0
    ENG_SCORE NUMBER(3,0) DEFAULT 0,    -- �������� �÷���: ENG_SCORE    ������Ÿ��: NUMBER   ����: 3 �Ҽ������� �ִ� 3�ڸ� ����     �⺻��: 0
    MATH_SCORE NUMBER(3,0) DEFAULT 0    -- �������� �÷���: MATH_SCORE   ������Ÿ��: NUMBER   ����: 3 �Ҽ������� �ִ� 3�ڸ� ����     �⺻��: 0
);

--------------------------------------------------------------------------------
-- ���ο� �� �߰��ϱ�
-- INSERT INTO ���̺��(�÷�1, �÷�2, ...) VALUES(��1, ��2, ...);

-- ���̺��� ��� �÷��� ���� �����ϰ�(NULL���� ����) �÷�������� ���� �����ϴ� ��쿡�� �÷����� �������� �ʾƵ� �ȴ�.
-- INSERT INTO ���̺�� VALUES(��1, ��2, ��3, ..., ��N);

-- TB_SCORES ���̺� �������� �߰��ϱ�
-- ������, 100, 90, 90
-- ������, 80, 80, 70
-- �̼���, 100, 80, 70
-- ���߱�, 80, 60, 60
-- ������, 90, 70, 90
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('������', 100, 90, 90);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('������', 80, 80, 70);
INSERT INTO TB_SCORES(STUDENT_NAME, KOR_SCORE, ENG_SCORE, MATH_SCORE) VALUES('�̼���', 100, 80, 70);
INSERT INTO TB_SCORES VALUES('���߱�', 80, 60, 60);
INSERT INTO TB_SCORES VALUES('������', 90, 70, 90);

-- COMMIT�� ROLLBACK
-- COMMIT: INSERT/UPDATE/DELETE ��ɾ� �������� ���̺� �ݿ���Ų��.
-- ROLLBACK: INSERT/UPDATE/DELETE ��ɾ� �������� ���̺� �ݿ���Ű�� �ʴ´�. ���̺��� �����Ͱ� INSERT/UPDATE/DELETE ���� ������ �ǵ��ư���.
-- * COMMIT�� ROLLBACK�� ���� �� �Ŀ��� �� �۾��� �ǵ��� �� ����.
-- * COMMIT ���� �� ���̺� �ݿ��� ���� ROLLBACK ��ų �� ����.
-- * ROLLBACK���� �ݿ��� ��ҵ� ���� COMMIT���� �ݿ���ų �� ����.


-- COMMIT ��ɾ �����ϸ� INSERT INTO�� ���̺� �߰��� ���� ���� ���̺� �ݿ��ȴ�.
COMMIT;

--------------------------------------------------------------------------------
-- ���̺��� ������ �����ϱ�

-- UPDATE ���̺��
-- SET
--  �÷���1 = ��1,
--  �÷���2 = ��2,
--  ...
--  �÷���N = ��N -- �� ������ �׸񿡴� ,�� ����.
-- (WHERE ���ǽ�); -- WHERE �������� ���������ϴ�. �����ϸ� ���̺��� ��� �࿡ ���ؼ� �����۾��� ����ȴ�. WHERE ���� �����ϴ� ���� ���� ����.

-- ��� �������� �޿��� 20000�޷��� ����ȴ�.
UPDATE EMPLOYEES
SET
    SALARY = 20000;
    
-- �ҼӺμ� ���̵� 60���� �������� �޿��� 50000�޷��� ����ȴ�.
UPDATE EMPLOYEES
SET
    SALARY = 50000
WHERE DEPARTMENT_ID = 60;

-- 10, 20, 30�� �μ��� �Ҽӵ� ������� �޿��� 50000�޷��� ����ȴ�.
UPDATE EMPLOYEES
SET
    SALARY = 50000
WHERE EMPLOYEES_ID = 100;

-- ROLLBACK ������ �����ߴ� ��� �����۾��� ���̺� �ݿ��� ��ҽ�Ų��.
ROLLBACK;

-- ������ �л��� ���������� ���������� ���� 95�� 85������ �����ϱ�
UPDATE TB_SCORES
SET
    ENG_SCORE = 95,
    MATH_SCORE = 85
WHERE STUDENT_NAME = '������';

-- ��� �л��� ������ ��� �÷��� ���� �����ϱ�
UPDATE TB_SCORES
SET
    TOTAL_SCORE = KOR_SCORE + ENG_SCORE + MATH_SCORE,
    AVERAGE = (KOR_SCORE + ENG_SCORE + MATH_SCORE) / 3;
-- * �÷��� ���� �����ϱ� ���ؼ� ���� �÷��� ���� ����ϴ� ���� �����ϴ�.
-- * �÷��� ���� �����ϱ� ���ؼ� ��Ģ ������ �����ϴ� ǥ���ĵ� �������.

COMMIT;

--------------------------------------------------------------------------------
-- ���̺��� �� �����ϱ�
-- DELETE FROM ���̺��
-- (WHERE ���ǽ�) -- WHERE���� �����ϸ� ���̺��� ��� ���� �����ȴ�. WHERE�� ���� DELETE ������ �����ϴ� ���� ���� ����.

-- �������� ���̺��� ������ �л��� ������ �����ϱ�
DELETE FROM TB_SCORES
WHERE STUDENT_NAME = '������';

-- ����� 80�� �̸��� �л��� �������� �����ϱ�
DELETE FROM TB_SCORES
WHERE AVERAGE < 80;

-- ������ �����ߴ� ��� �۾��� ���̺� �ݿ��� ��ҽ�Ų��.
ROLLBACK;

SELECT *
FROM TB_SCORES;

--------------------------------------------------------------------------------
-- DML �ǽ��ϱ�
-- å���� ���̺� �����ϱ�
-- å����
-- ��ȣ:    BOOK_NO              NUMBER    5 PRIMARY KEY,
-- ����:    BOOK_TITLE           VARCHAR2  250 NOT NULL,
-- ����:    BOOK_WRITER          VARCHAR2  100 NOT NULL,
-- ���ǻ�:  BOOK_PUBLISHER       VARCHAR2  100,
-- ����:    BOOK_PRICE           NUMBER    7,
-- ���ΰ���: BOOK_DISCOUNT_PRICE  NUMBER    7,
-- ���:    BOOK_STOCK           NUMBER    4,
-- �Ǹſ���: BOOK_ON_SALE         VARCHAR2  30

-- 0. ���� ���̺� �����ϱ�
-- DROP TABLE ���̺��;

-- 1. CREATE TABLE ������ ����ؼ� ���̺� �����ϱ�
--    ���̺���� TB_SAMPLE_BOOKS��.
CREATE TABLE TB_SAMPLE_BOOKS (
    BOOK_NO              NUMBER    (5)   PRIMARY KEY,
    BOOK_TITLE           VARCHAR2  (250) NOT NULL,
    BOOK_WRITER          VARCHAR2  (100) NOT NULL,
    BOOK_PUBLISHER       VARCHAR2  (100),
    BOOK_PRICE           NUMBER    (7),
    BOOK_DISCOUNT_PRICE  NUMBER    (7),
    BOOK_STOCK           NUMBER    (4)   DEFAULT 10,
    BOOK_ON_SALE         VARCHAR2  (30)  DEFAULT '�Ǹ���'
);

-- 2. INSERT INTO ������ ����ؼ� TB_SAMPLE_BOOKS
--    ������ �� å�忡 �����ִ� å�� �����ؼ� ������ �߰��ϱ�
--    å ������ �߰��� �� å ��ȣ�� �ߺ����� �߰����� �ʵ��� �Ѵ�.
--    ����, ���ΰ���, ���, �Ǹſ��δ� ������ ������ �����Ѵ�.
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10001, '�̰��� �ڹٴ�', '�̼���', '�Ѻ��̵��', 35000, 33000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10002, '�ڹ��� ����', 'ȫ�浿', '�Ѻ��̵��', 35000, 33000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10003, '������ �� �׼�', '������', '������', 45000, 42000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10004, '����Ƽ�� �ڹ�', '������', '�λ���Ʈ ���ǻ�', 18000, 16000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10005, '������ ���', '������', '��Ű�Ͻ�', 35000, 32000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10006, '���� ������ 3', '�̼���', '���������ǻ�', 38000, 35000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10007, '���̺� �Ϻ� ���̵�', '������', '�Ѻ��̵��', 20000, 18000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10008, '�ʸ��ེ ������ ����', 'ȫ�浿', '�Ѻ��̵��', 20000, 18000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10009, '����Ŭ ���� ��ȭ ������ �ع�', '������', '�λ���Ʈ ���ǻ�', 45000, 41000);
INSERT INTO TB_SAMPLE_BOOKS(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PUBLISHER, BOOK_PRICE, BOOK_DISCOUNT_PRICE) VALUES (10010, '�ϵ� �Ϻ� ���̵�', '�̼���', '�Ѻ��̵��', 30000, 27000);

-- 3. COMMIT�� �����ؼ� �߰��� å������ ���̺� �ݿ���Ų��.
COMMIT;

-- 4. TB_SAMPLE_BOOKS ���̺� ����� ��� å ������ ��ȸ�ϱ�
SELECT *
FROM TB_SAMPLE_BOOKS;

--------------------------------------------------------------------------------
-- ������ ����� ������ ���̺� ������ �߰��ϱ�
-- 1. ���̺� �����ϱ�
CREATE TABLE TB_EXCEL_BOOKS (
    BOOK_NO NUMBER(5) PRIMARY KEY,
    BOOK_TITLE VARCHAR2(250) NOT NULL,
    BOOK_WRITER VARCHAR2(250) NOT NULL,
    BOOK_PUBLISHER VARCHAR2(250),
    BOOK_PRICE NUMBER(7),
    BOOK_DISCOUNT_PRICE NUMBER(7),
    BOOK_POINT NUMBER(5),
    BOOK_REVIEW_SCORE NUMBER(3, 1),
    BOOK_SAIL_SCORE NUMBER(8)
);


