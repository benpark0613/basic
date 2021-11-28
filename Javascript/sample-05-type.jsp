<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <title></title>
  </head>
  <body>
    <div class="container"></div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
      // 자바스크립트의 객체 타입

      // 배열 > java의 List와 유사
      // 값을 여러 개 담는 자료구조, 0번부터 시작하는 index가 있다.
      // 배열에 저장되는 값의 타입은 상관없다.
      // 가변길이 배열이다.
      var arr1 = []; // 길이가 0인 배열 생성
      // 배열의 특정 인덱스에 값 저장하기
      arr1[0] = 100;
      arr1[1] = 200;
      arr1[45] = 450;
      arr1[75] = 500;
      arr1[99] = 10000;

      console.log("arr1 배열의 타입", typeof arr1);
      console.log("arr1 배열", arr1);
      console.log("arr1 배열의 0번째 값", arr1[0]); // 100 출력
      console.log("arr1 배열의 1번째 값", arr1[1]); // 200 출력
      console.log("arr1 배열의 2번째 값", arr1[2]); // undefined 출력

      // 배열에 여러 종류의 값을 저장할 수 있다.
      // 배열에 여러 종류의 값을 저장할 수는 있지만, 실제 프로젝트에서는 배열에 같은 종류의 값만 담는다.
      var arr2 = [10, "강감찬", "김유신", [100, 200, 300], 3.14];
      console.log("arr2 배열", arr2);

      // 객채 > java의 Map과 유사하다.
      // 자바스크립트의 객체는 class가 필요없다.
      // 때문에 자바스크립트의 객체는 프로그램 실행 중에 그 구성요소를 자유롭게 추가/삭제할 수 있다.
      // 이름:값의 쌍으로 저장하는 자료구조
      // 값은 숫자, 문자열, boolean값, 배열, 객체, 함수 등이 가능하다.
      var obj1 = {}; // 비어 있는 객체 생성
      var obj2 = {
        name: "홍길동",
        kor: 100,
        eng: 100,
        math: 100,
        passed: true,
      };

      // 함수 > java의 메소드와 유사하다.
      // 이름있는 코드블록이다.
      // 접근제한자가 없다. 반환타입이 없다. 매개변수는 변수명만 적는다.

      function plus(x, y) {
        var z = x + y;
        return z;
      }

      console.log("plus의 타입", typeof plus);
      var result1 = plus(10, 20);
      var result2 = plus(100, 456);
      var result3 = plus(198574, 6857694);
      console.log("덧셈결과", result1);
      console.log("덧셈결과", result2);
      console.log("덧셈결과", result3);
      console.log("덧셈결과", plus(10000, 20000));
    </script>
  </body>
</html>
