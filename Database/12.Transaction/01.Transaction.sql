-- 트랜잭션 처리하기
-- 1번 트랜잭션의 실행문
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '새우깡', 1000, 100, '판매중', 3002);    -- 1번 트랜잭션 시작
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '초코파이', 700, 1000, '판매중', 3002);
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '꼬북칩', 1500, 100, '판매중', 3002);
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '칸쵸', 2000, 50, '판매중', 3002);

SELECT *
FROM TB_SAMPLE_FOODS;
-- 1번 트랜잭션의 실행문 수행결과 데이터베이스 반영
COMMIT;     -- DML작업결과 반영, 진행중이던 1번 트랜잭션 종료, 2번 트랜잭션 시작
            -- 1번 트랜잭션이 종료되었기 때문에 1번 트랜잭션의 수행문 수행결과를 다시 되돌릴 수 없다.

-- 2번 트랜잭션의 실행문
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 3800
WHERE FOOD_NO IN (5001, 5002);
-- 2번 트랜잭션의 실행문
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 4000
WHERE FOOD_NO IN (5003, 5006);
-- 2번 트랜잭션의 실행문
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '매운곱창볶음밥', 4500, 50, '판매중', 3001);
-- 2번 트랜잭션의 실행문 수행결과 데이터베이스 반영취소
ROLLBACK;       -- DML작업결과 반영취소, 진행중이던 2번 트랜젝션 종료, 3번 트랜잭션 시작
COMMIT;         -- DML작업결과 반영, 진행중이던 3번 트랜잭션 종료, 4번 트랜잭션 시작
                -- 해당 COMMIT 명령어로 2번 트랜잭션 내의 실행문 실행결과를 데이터베이스에 반영시킬 수 없다.
                -- COMMIT 실행 전에 실행한 ROLLBACK 명령 때문에 2번 트랜잭션은 완전 종료되었기 때문에
                -- 2번 트랜잭션처리 작업도 실행할 수 없다.
                -- 2번 트랜잭션에서 실행했던 작업을 데이터베이스에 반영하고 싶다면 새로운 트랜잭션이 시작한 다음에
                -- 다시 실행문들을 실행하고, COMMIT을 실행한다.
                
-- 4번 트랜잭션의 실행문
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 3800
WHERE FOOD_NO IN (5001, 5002);
-- 4번 트랜잭션의 실행문
UPDATE TB_SAMPLE_FOODS
SET FOOD_PRICE = 4000
WHERE FOOD_NO IN (5003, 5006);
-- 4번 트랜잭션의 실행문
INSERT INTO TB_SAMPLE_FOODS VALUES(FOOD_SEQ.NEXTVAL, '매운곱창볶음밥', 4500, 50, '판매중', 3001);     

COMMIT;