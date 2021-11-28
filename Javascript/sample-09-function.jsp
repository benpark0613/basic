<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
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
      //  자바스크립트 함수의 매개변수, 지역변수, 반환값
      //  매개변수
      //      자바스크립트 함수는 매개변수를 가질 수 있다.
      //      함수를 실행할 때 매개변수에 맞는 적절한 값을 인자로 전달해야한다.
      //      함수를 실행할 때 매개변수의 갯수보다 적은 갯수의 값을 인자로 전달할 수 있다.
      //      함수를 실행할 때 매개변수의 갯수보다 많은 갯수의 값을 인자로 전달할 수 있다.
      //      매개변수로 숫자, 문자열, 불린값, 배열, 객체, 함수를 전달받을 수 있다.

      function greeting(name) {
        console.log(name + "님 반갑습니다.");
      }

      // 기본값을 가지는 매개변수 정의하기
      // 기본값이 정의된 매개변수는 값을 전달받지 못하면 기본값으로 설정된 값이 매개변수에 저장된다.
      function sendMessage(from, to, title, text = "내용은 없습니다.") {
        console.log(from, to, title, text);
      }

      greeting(); // 매개변수 name에 값이 전달되지 않았음, 매개변수 name값은 undefined다.
      greeting("홍길동"); // 매개변수 name에 값이 전달되었다. 매개변수 name값은 "홍길동"이다.

      sendMessage(
        "홍길동",
        "김유신",
        "오후 2시 회의",
        "오후 2시에 회의있습니다."
      ); // 모든 매개변수에 값이 전달되었다.
      sendMessage("강감찬", "이순신", "점심때 짜장면 어때?"); // text 매개변수에 값이 전달되지 않았다. text 매개변수에는 기본값으로 설정한 값이 저장된다.

      function sum(x, y) {
        // arguments는 자바스크립트 함수는 매개변수로 전달되는 모든 인자값을 가지는 배열이다.
        // 모든 자바스크립트 함수가 공통으로 가지고 있는 값이다.
        console.log("arguments", arguments);
        console.log("x=", x, "y=", y);
        var result = x + y;
        console.log("연산결과", result);
      }

      // 자바스크립트 함수를 호출할 때는 매개변수의 갯수에 상관없이 함수를 호출할 수 있다.
      sum();
      sum(10);
      sum(200, 400);
      sum(3000, 6000, 9000);
      sum(500, 1500, 2500, 3500, 4500);

      // 지역변수
      //      함수안에서 정의한 변수다.
      //      해당 함수 내부에서만 사용가능하다.
      function showMessage() {
        // 지역변수다.
        // var를 생략하면 글로벌 변수가 된다.
        var message = "반갑습니다.";
        console.log("지역변수의 값", message);
      }
      showMessage();
      // console.log(message);    오류, 함수내부에서 선언된 지역변수는 함수 밖에서 사용할 수 없다.

      // 글로벌 변수
      //      함수의 외부에서 정의한 변수다.
      //      서로 다른 함수에서 사용할 수 있다.
      //      여러 함수에서 공통으로 사용하는 값을 글로벌 변수로 정의할 수 있다.
      var path = "c:/save/";

      function saveImage(filename) {
        var fullPath = path + filename;
        console.log(fullPath + "파일을 저장합니다.");
      }

      function downloadImage(filename) {
        var fullPath = path + filename;
        console.log(fullPath + "파일을 다운로드합니다.");
      }

      saveImage("logo.png");
      downloadImage("logo.png");

      // 함수의 반환값
      //      함수를 호출한 측에게 반환되는 값이다.
      //      return문을 사용해서 값을 반환할 수 있다.
      //      함수 선언부의 반환타입을 정의할 필요가 없다. (자바스크립트의 모든 변수는 변수를 생성할 때 타입을 지정할 필요가 없기 때문이다.)
      //      함수의 반환값은 숫자, 문자열, 불린값, 배열, 객체, 함수
      function plus(x, y) {
        var z = x + y;
        return z;
      }

      var returnValue = plus(10, 20);
      console.log("반환값", returnValue);

      // 객체를 반환하는 함수
      function getScore(name, kor, eng, math) {
        var total = kor + eng + math;
        var average = total / 3;

        // 학생성적정보를 포함하는 객체를 생성
        var result = {
          학생이름: name,
          국어점수: kor,
          영어점수: eng,
          수학점수: math,
          총점: total,
          평균: average,
        };
        return result;
      }

      // score 변수에는 getScore()함수가 반환한 객체가 대입된다.
      var score = getScore("홍길동", 100, 80, 60);
      console.log(score.학생이름);
      console.log(score["학생이름"]);
      console.log(score.총점);
      console.log(score["평균"]);
    </script>
  </body>
</html>
