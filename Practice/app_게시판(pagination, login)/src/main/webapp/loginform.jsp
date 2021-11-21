<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>커뮤니티 게시판::로그인폼</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "login");
%>
<%@ include file="common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">로그인 폼</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-5">
<%
	String error = request.getParameter("error");

	if ("empty".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>로그인 실패!!</strong> 아이디와 비밀번호는 필수입력값입니다.
			</div>
<%	
	} else if ("notfound-user".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>로그인 실패!!</strong> 회원정보가 존재하지 않습니다.
			</div>
<%
	} else if ("mismatch-password".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>로그인 실패!!</strong> 비밀번호가 일치하지 않습니다.
			</div>
<%
	} else if ("login-required".equals("error")) {
%>
			<div class="alert alert-danger">
				<strong>로그인 실패!!</strong> 로그인이 필요한 페이지를 요청하였습니다.
			</div>
<%
	}
%>
			<form class="border p-3 bg-light" method="post" action="login.jsp">
				<div class="mb-3">
					<label class="form-label" for="user-id">아이디</label>
					<input type="text" class="form-control" name="id" id="user-id">
				</div>
				<div class="mb-3">
					<label class="form-label" for="user-password">비밀번호</label>
					<input type="password" class="form-control" name="password" id="user-password">
				</div>
				<div class="mb-3 text-end">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
		<div class="col-7">
			<img class="img-fluid m-2" src="resources/images/banners/banner1.png">
			<img class="img-fluid m-2" src="resources/images/banners/banner2.jpg">
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

















