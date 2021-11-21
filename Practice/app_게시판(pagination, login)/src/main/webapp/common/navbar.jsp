<%@page import="com.sample.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String menu = (String) pageContext.getAttribute("menu");

	User loginUserInfo = (User)session.getAttribute("LOGIN_USER_INFO");
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
		<a class="navbar-brand" href="/practice-board/index.jsp">커뮤니티 게시판</a>
		<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbar-1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar-1">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a href="/practice-board/index.jsp" class="nav-link <%="home".equals(menu) ? "active" : "" %>">홈</a></li>
				<li class="nav-item"><a href="/practice-board/board/list.jsp" class="nav-link <%="board".equals(menu) ? "active" : "" %>">게시판</a></li>
			</ul>
			<ul class="navbar-nav">
<%
	if (loginUserInfo == null) {
%>
				<li class="nav-item"><a href="/practice-board/loginform.jsp" class="nav-link <%="login".equals(menu) ? "active" : "" %>">로그인</a></li>
				<li class="nav-item"><a href="/practice-board/registerform.jsp" class="nav-link <%="register".equals(menu) ? "active" : "" %>">회원가입</a></li>
<%
	} else {
%>
				<li class="nav-item"><a href="/practice-board/user/detail.jsp" class="nav-link <%="user".equals(menu) ? "active" : "" %>">마이페이지</a></li>
				<li class="nav-item"><a href="/practice-board/logout.jsp" class="nav-link">로그아웃</a></li>
<%
	}
%>
			</ul>
		</div>
	</div>
</nav>
