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
<c:set var="menu" value="샘플3"></c:set>
<%@ include file="navbar.jsp" %>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<h1>c:forEach 태그</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>직원 리스트</h3>
			<table class="table">
				<thead>
					<tr>
						<th>first</th>
						<th>last</th>
						<th>index</th>
						<th>count</th>
						<th>번호</th>
						<th>이름</th>
						<th>부서명</th>
						<th>직위</th>
						<th>급여</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty employees }">
							<tr>
								<td class="text-center" colspan="10">검색된 직원이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="emp" items="${employees }" varStatus="loop">
								<tr>
									<td>${loop.first }</td>
									<td>${loop.last }</td>
									<td>${loop.index }</td>
									<td>${loop.count }</td>
									<td class="align-middle">${emp.no }</td>
									<td class="align-middle">${emp.name }</td>
									<td class="align-middle">
										<select>
											<c:forEach var="dept" items="${departments }">
												<option value="${dept.no }" ${emp.deptNo eq dept.no ? 'selected' : '' }> ${dept.name }</option>
											</c:forEach>
										</select>
									</td>
									<td class="align-middle">${emp.position }</td>
									<td class="align-middle">${emp.salary }</td>
									<td>
										<a href="detail.hta?no=${emp.no }" class="btn btn-outline-primary btn-sm">상세정보</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a href="" class="page-link">이전</a></li>
	
				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }"><a href="" class="page-link">${num }</a></li>
				</c:forEach>
	
				<li class="page-item"><a href="" class="page-link">다음</a></li>
			</ul>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>





















