<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>커뮤니티 게시판</title>
</head>
<body>
<% 
	pageContext.setAttribute("menu", "home"); 
%>
<%@ include file="common/navbar.jsp" %>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">커뮤니티 게시판</h1>
					<p class="fs-4">커뮤니티에서 글을 게시하고, 공유해보세요</p>
<%
	if (loginUserInfo == null) {
%>
					<div class="mt-3">
						<a href="loginform.jsp" class="btn btn-primary btn-lg">로그인</a>
						<a href="registerform.jsp" class="btn btn-primary btn-lg">회원가입</a>
					</div>
<%
	} else {
%>
					<div class="mt-3">
						<p class="fs-4"><strong class="text-primary"><%=loginUserInfo.getName() %></strong>님 환영합니다.</p>
						<p class="fs-4">다양한 게시글을 확인해보세요</p>
					</div>
<%
	}
%>
				</div>
			</div>
		</div>
	</div>
<%
	String register = request.getParameter("register");

	if ("completed".equals(register)) {
%>
	<div class="row mb-3">
		<div class="col">
			<div class="alert alert-success">
				<strong>회원가입 완료</strong> 회원가입이 완료되었습니다.
				<p>로그인 후 커뮤니티의 다양한 서비스를 사용해보세요!!</p>
			</div>
		</div>
	</div>
<%
	}
%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>










