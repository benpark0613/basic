<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<h1>날짜/시간, 숫자 포맷팅</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>날짜/시간을 형식화해서 출력하기</h3>
			<p>${today }</p>
			<p><fmt:formatDate value="${today }"/></p>
			<p><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			<p><fmt:formatDate value="${today }" pattern="M월 d일 a h시 m분 s초"/></p>
			<p><fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE"/></p>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>숫자를 형식화해서 출력하기</h3>
			<p>잔액 : ${balance }</p>
			<p>잔액 : <fmt:formatNumber value="${balance }"/></p>
			<p>잔액 : <fmt:formatNumber value="${balance }" pattern="##,###"/></p>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>