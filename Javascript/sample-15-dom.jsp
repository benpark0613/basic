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
    <div class="container">
      <div class="row mb-3">
        <div class="col">
          <h1>폼 요소의 값 조회/변경하기</h1>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-6">
          <h3>폼 요소의 값 조회하기</h3>
          <p>
            아이디 및 비밀번호 입력필드에 모든 값이 입력된 경우에만 폼 입력값이
            login.jsp로 제출되게 한다.
          </p>
          <form
            id="form-login"
            class="border p-3 bg-light"
            method="post"
            action="login.jsp"
            onsubmit="checkInputField(event)"
          >
            <div class="mb-3">
              <label class="form-label">아이디</label>
              <input type="text" class="form-control" name="id" id="user-id" />
              <div
                class="form-text text-danger"
                style="display: none"
                id="error-message-id"
              >
                아이디는 필수입력값입니다.
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">비밀번호</label>
              <input
                type="password"
                class="form-control"
                name="password"
                id="user-password"
              />
              <div
                class="form-text text-danger"
                style="display: none"
                id="error-message-password"
              >
                비밀번호는 필수입력값입니다.
              </div>
            </div>
            <div class="mb-3 text-end">
              <button type="submit" class="btn btn-primary">로그인</button>
            </div>
          </form>
        </div>
        <div class="col-6"></div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
      function checkInputField(event) {
        // form태그에서 onsubmit이벤트 발생시 폼입력값을 서버로 제출하는 기본동작이 실행되지 않게 한다.
        event.preventDefault();

        // 폼 엘리먼트를 조회한다.
        var loginForm = document.getElementById("form-login");

        // 아이디와 비밀번호 입력필드 엘리먼트를 선택한다.
        var userIdElement = document.getElementById("user-id");
        var userPasswordElement = document.getElementById("user-password");
        // 오류 메세지를 표시하는 엘리먼트를 선택한다.
        var idErrorMessageElement = document.getElementById("error-message-id");
        var passwordErrorMessageElement = document.getElementById(
          "error-message-password"
        );
        // 입력필드 유효성 체크 전에 모든 에러메세지를 숨긴다.
        idErrorMessageElement.style.display = "none";
        passwordErrorMessageElement.style.display = "none";

        // 아이디 입력필드에 입력된 값을 조회한다.
        // 비밀번호 입력필드에 입력된 값을 조회한다.
        var userId = userIdElement.value;
        var userPassword = userPasswordElement.value;

        // 입력필드에 대한 유효성체크, 통과여부를 저장하는 변수
        var isValid = true;
        if (userId === "") {
          idErrorMessageElement.style.display = "";
          isValid = false;
        }

        if (userPassword === "") {
          passwordErrorMessageElement.style.display = "";
          isValid = false;
        }

        // 유효성체크를 모두 통과했다면 form 엘리먼트객체의 submit() 메소드를 실행해서 폼 입력값을 서버로 제출시킨다.
        if (isValid) {
          loginForm.submit();
        }
      }
    </script>
  </body>
</html>
