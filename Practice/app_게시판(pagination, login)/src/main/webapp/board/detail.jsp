<%@page import="java.util.List"%>
<%@page import="com.sample.board.vo.BoardLiker"%>
<%@page import="com.sample.board.vo.Board"%>
<%@page import="com.sample.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>커뮤니티 게시판::상세</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "board");
%>
<%@ include file="../common/navbar.jsp" %>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-3">게시글 상세</h1>
		</div>
	</div>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	String error = request.getParameter("error");
	
	BoardDao boardDao = BoardDao.getInstance();	
	Board board = boardDao.getBoardDetail(no);
	board.setViewCount(board.getViewCount() + 1);
	boardDao.updateBoard(board);
%>
	<div class="row mb-3">
		<div class="col">
<%
	if ("deny-delete".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>삭제 실패!!</strong> 자신이 작성한 글이 아닌 경우 삭제할 수 없습니다.
			</div>
<%
	} else if ("deny-update".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>수정 실패!!</strong> 자신이 작성한 글이 아닌 경우 수정할 수 없습니다.
			</div>			
<%
	} else if ("deny-like".equals(error)) {
%>
			<div class="alert alert-danger">
				<strong>추천 실패!!</strong> 이미 추천한 글이거나 자신의 글은 추천할 수 없습니다.
			</div>
<%
	}
%>
			<table class="table">
				<tbody>
					<tr class="d-flex">
						<th class="col-2">번호</th>
						<td class="col-4"><%=board.getNo() %></td>
						<th class="col-2">등록일</th>
						<td class="col-4"><%=board.getCreatedDate() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-2">제목</th>
						<td class="col-4"><%=board.getTitle() %></td>
						<th class="col-2">작성자</th>
						<td class="col-4"><%=board.getWriter().getName() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-2">조회수</th>
						<td class="col-4"><%=board.getViewCount() %></td>
						<th class="col-2">추천수</th>
						<td class="col-4"><%=board.getLikeCount() %>
<%
	if (board.getLikeCount() > 0) {
%>
							<button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#board-liker-modal">보기</button>
<%
	}
%>
						</td>
					</tr>
					<tr class="d-flex">
						<th class="col-2">내용</th>
						<td class="col-10"><%=board.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="d-flex justify-content-between">
				<div>
<%
	if (loginUserInfo != null && loginUserInfo.getNo() == board.getWriter().getNo()) {
%>
					<a href="delete.jsp?no=<%=board.getNo() %>&pageNo=<%=pageNo %>" class="btn btn-danger">삭제</a>
<%
	}
%>
<%
	if (loginUserInfo != null && loginUserInfo.getNo() != board.getWriter().getNo()) {
		BoardLiker boardLiker = boardDao.getBoardLiker(board.getNo(), loginUserInfo.getNo());
%>
					<a href="like.jsp?no=<%=board.getNo() %>&pageNo=<%=pageNo %>" class="btn btn-success <%=boardLiker != null ? "disabled" : "" %>">추천</a>
<%
	}
%>
				</div>
				<a href="list.jsp?pageNo=<%=pageNo %>" class="btn btn-primary">목록</a>
			</div>
		</div>
	</div>
</div> 
<%
	List<User> boardLikeUserList = boardDao.getLikeUsers(no);
%>
<div class="modal" tabindex="-1" id="board-liker-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="card bg-primary">
					<div class="card-header fs-bold text-white">추천인</div>
					<ul class="list-group">
<%
	for (User user : boardLikeUserList) {
%>
						<li class="list-group-item"><%=user.getName() %></li>
<%
	}
%>
					</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



















