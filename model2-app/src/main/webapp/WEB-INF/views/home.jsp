<%@page import="kr.co.jhta.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
   <title></title>
</head>
<body>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<h1>홈</h1>
			<p>${message}</p> <!-- EL표현식 -->
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<h3>최신 게시글</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="x" items="${boardList }">
				<tr>
					<td>${x.no }</td>
					<td>${x.title }</td>
					<td>${x.writer }</td>
					<td>${x.createdDate }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>	
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<h3>최신 게시글</h3>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
<%
	List<Board> boardList = (List<Board>) request.getAttribute("boardList");
	for (Board board : boardList) {
%>
		<tr>
			<td><%=board.getNo() %></td>
			<td><%=board.getTitle() %></td>
			<td><%=board.getWriter() %></td>
			<td><%=board.getCreatedDate() %></td>
		</tr>
<%
	}
%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>