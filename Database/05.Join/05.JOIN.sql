-- ����
-- �� �� �̻��� ���̺��� �����ִ� ��鳢�� �����ؼ� ���ο� ������ ���̺��� �����ϰ�, �� ������ ���̺��� �����͸� ��ȸ�ϴ� ���̴�.
-- ������ ����
-- �����, ������, ��������, ��������

-- ���̺� �����ϱ�
-- SELECT ���̺�1.�÷���, ���̺�1.�÷���, ���̺�2.�÷���, ...
-- FROM ���̺�1, ���̺�2
-- WHERE ��������;

-- �����
-- ���� ���ǿ��� = �����ڸ� ����ؼ� ���� ���̺�� �������̺��� �����ִ� ���� ���ν�Ų��.

-- ������̵�,   ����̸�,     �ҼӺμ����̵�,            �ҼӺμ��̸�   ��ȸ�ϱ�
-- EMPLOYEES,    EMPLOYEES,   EMPLOYEES/DEPARTMENTS,   DEPARTMENTS  ������ ���̺� : EMPLOYEES, DEPARTMENTS
-- �������� : DEPARTMENT_ID���� ���� ���� �ೢ�� ����
SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID  -- ��������
ORDER BY EMPLOYEES.EMPLOYEE_ID ASC;

-- ������̵�, ����̸�, �������̵�, ��������, �ּұ޿�, �ִ�޿�, �޿��� ��ȸ�ϱ�
-- E          E        E/J        J        J        J        E      ������ ���̺� : EMPLOYEES, JOBS
-- �������� : ������̺��� �������̵�� �������̺��� �������̵� ���� ���� ������ �ೢ�� ����
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID, B.JOB_TITLE, B.MIN_SALARY, B.MAX_SALARY, A.SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID;

-- �μ����̵�, �μ���, �μ������� ���̵�, ������ ���ø��� ��ȸ�ϱ�
-- D          D      D/L              L     ������ ���̺� : DEPARTMENTS, LOCATIONS
-- �������� : �μ����̺��� ������ ���̵�� ������ ���̺��� ������ ���̵� ���� ���� ������ �ೢ�� ����
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID
ORDER BY D.DEPARTMENT_ID;

-- ������̵�, ����̸�, ��������, �ҼӺμ����� ��ȸ�ϱ�
-- E          E        J        D       ������ ���̺� : EMPLOYEES, DEPARTMENTS, JOBS
-- ���������� ��ȸ�ϱ� ���� �������� : �������̺��� �������̵�� �������̺��� �������̵� ���� ���� �ೢ�� ����
-- �ҼӺμ����� ��ȸ�ϱ� ���� �������� : �������̺��� �μ����̵�� �μ����̺��� �μ����̵� ���� ���� �ೢ�� ����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.JOB_ID = J.JOB_ID 
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID ASC;

-- ������̵�, ����̸�, �ҼӺμ���, �ҼӺμ������� ���ø��� ��ȸ��
-- E          E        D          L     ������ ���̺� : EMPLOYEES, DEPARTMENTS, JOBS
-- �ҼӺμ����� ��ȸ�ϱ� ���� �������� : �������̺��� �ҼӺμ����̵�� �μ����̺��� �μ����̵� ���� ���� �ೢ�� ����
-- ������ ���ø��� ��ȸ�ϱ� ���� �������� : �μ����̺��� �� ������ �Ҽӵ� �μ��� ��ġ���̵�� �������� ��ġ ���̵� ���� ���� �ೢ�� ����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.EMPLOYEE_ID;

-- �޿��� 10000 ~ 15000�� �޴� ������� ���̵�, �̸�, �޿�, ��������, �ҼӺμ����� ��ȸ�ϱ�
-- E                                  E      E    E     J        D      ������ ���̺� : EMPLOYEES, JOBS, DEPARTMENTS
-- ���������� ��ȸ�ϱ� ���� �������� : �������̺��� �������̵�� �������̺��� �������̵� ���� ���� �ೢ�� ����
-- �ҼӺμ����� ��ȸ�ϱ� ���� �������� : �������̺��� �μ����̵�� �μ����̺��� �μ����̵� ���� ���� �ೢ�� ����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.SALARY >= 10000 AND E.SALARY <= 15000
AND E.JOB_ID = J.JOB_ID 
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- Ŀ�̼��� �޴� �������� �������̵�� �̸�, �޿�, Ŀ�̼�, ����, �ҼӺμ����� ��ȸ�ϱ�
-- E                    E          E     E    E       E    D
-- �ҼӺμ����� ��ȸ�ϱ� ���� �������� : �������̺��� �μ����̵�� �μ����̺��� �μ����̵� ���� ���� �ೢ�� ����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.COMMISSION_PCT, E.SALARY*12 + E.SALARY*E.COMMISSION_PCT*12 ����, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE  E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

-- �μ����̺��� �μ������ڰ� ������ �μ��� �μ����̵�, �μ���, �μ������� �̸� ��ȸ�ϱ�
--               D                       D          D      E        ������ ���̺� : DEPARTMENTS, EMPLOYEES
-- �μ������� �̸� ��ȸ�ϱ� ���� ���� : �μ����̺��� ������ ���̵�� �������̺��� ��� ���̵� ���� ���� �� ���� ����
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID IS NOT NULL
AND D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

--------------------------------------------------------------------------------
-- ������ �ǽ��� ���� ���̺� ����
CREATE TABLE SALARY_GRADE (
    GRADE CHAR(1) PRIMARY KEY,
    MIN_SALARY NUMBER(8,2),
    MAX_SALARY NUMBER(8,2)
);
INSERT INTO SALARY_GRADE VALUES('A', 50000, 99999);
INSERT INTO SALARY_GRADE VALUES('B', 25000, 49999);
INSERT INTO SALARY_GRADE VALUES('C', 12500, 24999);
INSERT INTO SALARY_GRADE VALUES('D', 6500, 12499);
INSERT INTO SALARY_GRADE VALUES('E', 3000, 6499);
INSERT INTO SALARY_GRADE VALUES('F', 1500, 2999);
INSERT INTO SALARY_GRADE VALUES('G', 0, 1499);

COMMIT;

--------------------------------------------------------------------------------
-- �� ����
-- ���̺��� ������ �� ���� ���� ���� �ೢ�� �����ϴ� ���� �ƴ϶�, ũ��/�۴� ������ �̿��ؼ� ���� ���ν�Ű�� ����̴�.
-- ���(��޸��� ���� �ּ�/�ִ밪�� ������ �ְ�, �ش� ������ ���� �� �� ����� �ο��ȴ�.)�� ��ȸ�� �� Ȱ���Ѵ�.

-- �������̵�, �����̸�, �޿�, �޿������ ��ȸ�ϱ�
-- E          E        E     S      ������ ���̺� : EMPLOYEES, SALARY_GRADE
-- �������� : ������ �޿��� �ش� ����� �ּҵ�� �̻�, �ִ� ��� ���Ͽ� �ش��ϴ� ���� �����Ų��.
SELECT S.GRADE, E.SALARY, E.EMPLOYEE_ID, E.FIRST_NAME
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY S.GRADE ASC, E.SALARY DESC;

-- 80�� �μ��� �Ҽӵ� ���� �߿��� �޿������ E��޿� ���ϴ� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
-- E                            S                      E            E     E          E      ������ ���̺� : EMPLOYEES, SALARY
-- �˻����� : �ҼӺμ� ���̵� 80�̴�.
-- �˻����� : �޿������ E����̴�.
-- �������� : ������ �޿��� �ش����� �ּҵ�� �̻�, �ִ��� ���Ͽ� �ش��ϴ� ���� �����Ų��.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
FROM EMPLOYEES E, SALARY_GRADE S
WHERE E.DEPARTMENT_ID = 80
AND S.GRADE = 'E'
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY E.EMPLOYEE_ID;

-- �޿������ D��޿� �ش��ϴ� ������ ���̵�, �̸�, �������̵�, �ҼӺμ���, �ٹ��� ���ø��� ��ȸ�ϱ�
-- S                        E             E    E          D          L      ������ ���̺� : EMPLOYEES. DEPARTMENTS, LOCATIONS, SALARY_GRADE 
-- �˻����� : �޿������ D����̴�.
-- �������� : �������̺��� �޿��� ������̺��� �ּұ޿� �̻�, �ִ�޿� ���ϴ�.
-- �������� : �������̺��� �ҼӺμ� ���̵�� �μ��� �μ����̵� ����.
-- �������� : �μ����̺��� ������ ���̵�� ������ ���̺��� ������ ���̵� ����.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.JOB_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, SALARY_GRADE S
WHERE S.GRADE = 'D'
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY 
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.EMPLOYEE_ID;


-- ��� ������ ���̵�, �̸�, �������̵�, ��������, �޿�, �޿����, �ҼӺμ����̵�, �ҼӺμ���, �μ������� ���ø��� ��ȸ�ϱ�
--            E      E     E/J       J         E    S        E/D           D          L     ������ ���̺� : EMPLOYEES, JOBS, SALARY_GRADE, DEPARTMENTS, LOCATIONS
-- �������� : ���� ���̺��� �������̵�� �������̺��� �������̵� ����.
-- �������� : �޿��� ������̺��� �ּұ޿� �̻�, �ִ�޿� ���ϴ�.
-- �������� : �������̺��� �ҼӺμ� ���̵�� �μ����̺��� �μ����̵� ����.
-- �������� : �μ����̺��� ������ ���̵�� ������ ���̺��� ������ ���̵� ����.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, S.GRADE, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, JOBS J, SALARY_GRADE S, DEPARTMENTS D, LOCATIONS L
WHERE E.JOB_ID = J.JOB_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.EMPLOYEE_ID;

-- 'Oxford'���� ���ϰ� �ִ� �������� ���̵�, �̸�, �������̵�, �޿�, �޿������ ��ȸ�ϱ�
--  L                              E      E    E/J        E     S       ������ ���̺� : LOCATIONS, DEPARTMENTS(���� �ӿ� ������ ���̺�), EMPLOYEES, SALARY_GRADE
-- �˻����� : ���ø��� Oxford��.
-- �������� : �޿��� ������̺��� �ּұ޿� �̻�, �ִ�޿� ���ϴ�.
-- �������� : ������ ���̺��� ������ ���̵�� �μ����̺��� ������ ���̵� ����.
-- �������� : �μ����̺��� �μ����̵�� �������̺��� �ҼӺμ� ���̵� ����.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY, S.GRADE 
FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E, SALARY_GRADE S
WHERE L.CITY = 'Oxford'
AND L.LOCATION_ID = D.LOCATION_ID
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND E.SALARY >= S.MIN_SALARY AND E.SALARY <= S.MAX_SALARY
ORDER BY E.EMPLOYEE_ID ASC;























