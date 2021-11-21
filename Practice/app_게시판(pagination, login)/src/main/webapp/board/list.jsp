<%@page import="com.sample.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="utils.Pagination"%>
<%@page import="com.sample.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>커뮤니티 게시판::리스트</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "board");
%>
<%@ include file="../common/navbar.jsp" %>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">게시글 목록</h1>
		</div>
	</div>
<%
	String pageNo = request.getParameter("pageNo");
	
	BoardDao boardDao = BoardDao.getInstance();
	
	int totalRecords = boardDao.getTotalRecords();
	
	Pagination pagination = new Pagination(pageNo, totalRecords);
	
	List<Board> boardList = boardDao.getBoardList(pagination.getBegin(), pagination.getEnd());
%>
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<thead>
					<tr class="d-flex">
						<th class="col-1">번호</th>
						<th class="col-5">제목</th>
						<th class="col-2">작성자</th>
						<th class="col-1">추천수</th>
						<th class="col-1">조회수</th>
						<th class="col-2">등록일</th>
					</tr>
				</thead>
				<tbody>
<%
	if (boardList.isEmpty()) {
%>
					<tr>
						<td class="text-center" colspan="6">게시글이 존재하지 않습니다.</td>
					</tr>
<%
	} else {
		for (Board board : boardList) {
%>
					<tr class="d-flex">
						<td class="col-1"><%=board.getNo() %></td>
						<td class="col-5">
<%
			if ("Y".equals(board.getDeleted())) {
%>
							<span><del>삭제된 글입니다.</del></span>
<%
			} else {
%>
							<a href="detail.jsp?no=<%=board.getNo() %>&pageNo=<%=pagination.getPageNo() %>"><%=board.getTitle() %></a>
<%			
			}
%>	
						</td>
						<td class="col-2"><%=board.getWriter().getName() %></td>
						<td class="col-1"><%=board.getLikeCount() %></td>
						<td class="col-1"><%=board.getViewCount() %></td>
						<td class="col-2"><%=board.getCreatedDate() %></td>
					</tr>
<%
		}
	}
%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-6 offset-3">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=!pagination.isExistPrev() ? "disabled" : "" %>"><a class="page-link" href="list.jsp?pageNo=<%=pagination.getPrevPage() %>">이전</a></li>
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
					<li class="page-item <%=pagination.getPageNo() == num ? "active" : "" %>"><a class="page-link" href="list.jsp?pageNo=<%=num %>"><%=num %></a></li>
<%
	}
%>
					<li class="page-item <%=!pagination.isExistNext() ? "disabled" : "" %>"><a class="page-link" href="list.jsp?pageNo=<%=pagination.getNextPage() %>">다음</a></li>
				</ul>
			</nav>
		</div>
		<div class="col-3 text-end">
<%
	if (loginUserInfo != null) {
%>
			<a href="form.jsp" class="btn btn-outline-primary">새 글</a>
<%
	}
%>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>













