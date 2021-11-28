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
    <title>자바스크립트에서 변수 정의 및 초기화</title>
  </head>
  <body>
    <div class="container">
      <h1>자바스크립트에서 변수 정의 및 초기화</h1>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
      // 변수의 선언
      var name;
      var tel, email, age;

      // 변수의 초기화
      (name = "홍길동"), (tel = "010-1111-1111"), (email = "hong@gmail.com");

      name = "홍길동";
      tel = "010-1111-1111";
      email = "hong@gmail.com";
      age = 30;

      // 변수의 선언과 초기화
      var title = "이것이 자바다"; // 문자열 > ''
      var writer = "신용권"; // 문자열 > ""
      var price = 35000;

      // 변수의 선언과 초기화
      var studName = "홍길동",
        kor = 100,
        eng = 80,
        math = 90;
    </script>
  </body>
</html>
