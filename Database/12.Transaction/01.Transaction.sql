-- Ʈ����� ó���ϱ�
-- 1�� Ʈ������� ���๮
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '�����', 1000, 100, '�Ǹ���', 3002);    -- 1�� Ʈ����� ����
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '��������', 700, 1000, '�Ǹ���', 3002);
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '����Ĩ', 1500, 100, '�Ǹ���', 3002);
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, 'ĭ��', 2000, 50, '�Ǹ���', 3002);

SELECT *
FROM TB_SAMPLE_FOODS;
-- 1�� Ʈ������� ���๮ ������ �����ͺ��̽� �ݿ�
COMMIT;     -- DML�۾���� �ݿ�, �������̴� 1�� Ʈ����� ����, 2�� Ʈ����� ����
            -- 1�� Ʈ������� ����Ǿ��� ������ 1�� Ʈ������� ���๮ �������� �ٽ� �ǵ��� �� ����.

-- 2�� Ʈ������� ���๮
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 3800
WHERE FOOD_NO IN (5001, 5002);
-- 2�� Ʈ������� ���๮
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 4000
WHERE FOOD_NO IN (5003, 5006);
-- 2�� Ʈ������� ���๮
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '�ſ��â������', 4500, 50, '�Ǹ���', 3001);
-- 2�� Ʈ������� ���๮ ������ �����ͺ��̽� �ݿ����
ROLLBACK;       -- DML�۾���� �ݿ����, �������̴� 2�� Ʈ������ ����, 3�� Ʈ����� ����
COMMIT;         -- DML�۾���� �ݿ�, �������̴� 3�� Ʈ����� ����, 4�� Ʈ����� ����
                -- �ش� COMMIT ���ɾ�� 2�� Ʈ����� ���� ���๮ �������� �����ͺ��̽��� �ݿ���ų �� ����.
                -- COMMIT ���� ���� ������ ROLLBACK ���� ������ 2�� Ʈ������� ���� ����Ǿ��� ������
                -- 2�� Ʈ�����ó�� �۾��� ������ �� ����.
                -- 2�� Ʈ����ǿ��� �����ߴ� �۾��� �����ͺ��̽��� �ݿ��ϰ� �ʹٸ� ���ο� Ʈ������� ������ ������
                -- �ٽ� ���๮���� �����ϰ�, COMMIT�� �����Ѵ�.
                
-- 4�� Ʈ������� ���๮
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 3800
WHERE FOOD_NO IN (5001, 5002);
-- 4�� Ʈ������� ���๮
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 4000
WHERE FOOD_NO IN (5003, 5006);
-- 4�� Ʈ������� ���๮
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '�ſ��â������', 4500, 50, '�Ǹ���', 3001);     

COMMIT;