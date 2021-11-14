<%@page import="com.sample.vo.Board"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/style.css">
<title>게시판::수정</title>
</head>
<body>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int currentPageNo = Integer.parseInt(request.getParameter("cpno"));
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
%>
<div id="wrapper">
	<ul class="nav">
 		<li><a href="/sample/board/list.jsp?cpno=1">홈</a></li>
 		<li><a class="active" href="/sample/board/form.jsp">새 글</a></li>
	</ul>

	<h1>게시글 수정폼</h1>
	
	<div>
		<form class="well" method="post" action="update.jsp?">
			<input type="hidden" name="no" value="<%=board.getNo() %>"/>
			<input type="hidden" name="cpno" value="<%=currentPageNo %>"/>
			<div class="form-group">
				<label>제목</label>
				<input type="text" value="<%=board.getTitle() %>" name="title" />
			</div>
			<div class="form-group">
				<label>작성자</label>
				<input type="text" value="<%=board.getWriter() %>" name="writer" />
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea rows="10" name="content"><%=board.getContent() %></textarea>
			</div>
			<div class="text-right">
				<button class="btn default" type="submit">수정완료</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>