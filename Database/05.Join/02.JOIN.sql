-- ���� ����
-- �ϳ��� ���̺��� �̿��ؼ� ������ �����ϴ� ���̴�.
-- �ϳ��� ���̺� �ȿ� ����������, ���������Ͱ� �ִ� ��� ���������Ϳ� ���������͸� ���� ������� ��ȸ�� �� ���������� �ʿ��ϴ�.
-- �ϳ��� ���̺��� ������ ���� ����� ���ο� �������Ѿ� �Ѵ�.

-- 60�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, ����� �̸��� ��ȸ�ϱ�
-- E1                        E1        E1    E2
SELECT EMP.EMPLOYEE_ID AS EMP_ID,
       EMP.FIRST_NAME  AS EMP_NAME,
       MGR.EMPLOYEE_ID AS MGR_ID,
       MGR.FIRST_NAME  AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.DEPARTMENT_ID = 60
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- �����ڰ� ������ ��� �������� ���� ���̵�, �����̸�, �����޿�, �����޿����, ������ �Ŵ������̵�, �Ŵ��� �̸�, �Ŵ��� �޿�, �Ŵ��� �޿����, ������ �Ŵ����� �޿����� ��ȸ�ϱ�
-- EMP                        EMP         EMP      EMP      S1          MGR                MGR         MGR         S2             EMP/MGR
SELECT EMP.EMPLOYEE_ID  AS EMP_ID,              -- ������ ���̵�
       EMP.FIRST_NAME   AS EMP_NAME,            -- ������ �̸�
       EMP.SALARY       AS EMP_SALARY,          -- ������ �޿�
       ES.GRADE         AS EMP_GRADE,           -- ������ �޿����
       MGR.EMPLOYEE_ID  AS MGR_ID,              -- �������� ���̵�
       MGR.FIRST_NAME   AS MGR_NAME,            -- �������� �̸�
       MGR.SALARY       AS MGR_SALARY,          -- �������� �޿�
       MS.GRADE         AS MGR_GRADE,           -- �������� �޿����
       MGR.SALARY - EMP.SALARY AS SALARY_GAP    -- ������ �������� �޿�����
FROM EMPLOYEES EMP, EMPLOYEES MGR, SALARY_GRADE ES, SALARY_GRADE MS
WHERE EMP.MANAGER_ID IS NOT NULL                                    -- �����ڰ� �ִ� ������ ���͸�
AND EMP.MANAGER_ID = MGR.MANAGER_ID                                 -- ������ ������ ���̵�� �������� �������̵� ���� ���� ���� �ೢ�� ����
AND EMP.SALARY >= ES.MIN_SALARY AND EMP.SALARY <= ES.MAX_SALARY     -- �����޿��� �޿������ �� �������� ����
AND MGR.SALARY >= MS.MIN_SALARY AND MGR.SALARY <= MS.MAX_SALARY;    -- �����ڱ޿��� �޿������ �� �������� ����

--------------------------------------------------------------------------------
-- ��������
-- ���������� ���� ���̺��� �����Ͱ� �ְ�, �ٸ��� ���̺��� �����Ͱ� ���� ��쿡 �����Ͱ� �ִ� �� ���̺��� ������ ���� ��ȸ�ϴ� ���ι���̴�.

-- ���������� ������� �ʾ��� ��
-- �μ����̵�, �μ��̸�, �μ������ھ��̵�, �μ������� �̸� ��ȸ�ϱ�
-- D          D        D               E
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

-- ���������� ������� ��
-- �μ����̵�, �μ��̸�, �μ������ھ��̵�, �μ������� �̸� ��ȸ�ϱ�
-- D          D        D               E
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
ORDER BY D.DEPARTMENT_ID;

-- ������̵�, ����̸�, �ҼӺμ��� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- ������̵�, ����̸�, �ҼӺμ��� ��ȸ�ϱ�
-- �ҼӺμ��� �������� ���� ����� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
ORDER BY E.EMPLOYEE_ID;













