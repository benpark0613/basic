<%@page import="com.sample.vo.BoardReply"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.BoardReplyDao"%>
<%@page import="com.sample.vo.Board"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/style.css">
<title>게시판::상세</title>
</head>
<body>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int currentPageNo = Integer.parseInt(request.getParameter("cpno"));
	
	BoardDao boardDao = new BoardDao();
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	
	Board board = boardDao.getBoardByNo(boardNo);
	List<BoardReply> boardReplies = boardReplyDao.getAllBoardReplies();
%>
<div id="wrapper">
	<ul class="nav">
 		<li><a class="active" href="/sample/board/list.jsp?cpno=1">홈</a></li>
 		<li><a href="/sample/board/form.jsp">새 글</a></li>
	</ul>

	<h1>게시글 상세 정보</h1>
	
	<table>
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="40%">
		</colgroup>
		<tbody>
			<tr>
				<th>글번호</th>
				<td><%=board.getNo() %></td>
				<th>등록일</th>
				<td><%=board.getCreatedDate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=board.getTitle() %></td>
				<th>작성자</th>
				<td><%=board.getWriter() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=board.getViewCount() %></td>
				<th>추천수</th>
				<td><%=board.getLikeCount() %> <a href="like.jsp?no=<%=board.getNo() %>&cpno=<%=currentPageNo %>" class="btn primary sm">추천</a></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><%=board.getContent() %></td>
			</tr>
		</tbody>
	</table>
	
	<div class="text-right">
		<a href="modifyform.jsp?no=<%=board.getNo() %>&cpno=<%=currentPageNo %>" class="btn warning">수정</a>
		<a href="delete.jsp?no=<%=board.getNo() %>&cpno=<%=currentPageNo %>" class="btn danger">삭제</a>
		<a href="list.jsp?cpno=<%=currentPageNo %>" class="btn primary">목록</a>
	</div>
	<div>
		<form class="well" method="post" action="insertReply.jsp?">
			<input type="hidden" name="no" value="<%=board.getNo() %>"/>
			<input type="hidden" name="cpno" value="<%=currentPageNo %>"/>
			<div class="form-group">
				<label>작성자</label>
				<input type="text" name="writer" />
			</div>
			<div class="form-group">
				<textarea rows="3" name="content"></textarea>
			</div>
			<div class="text-right">
				<button type="submit" class="btn default">등록</button>
			</div>
		</form>
		
	</div>
	<div>
		<table>
			<colgroup>
				<col width="*">
				<col width="10%">
				<col width="20%">
				<col width="9%">
			</colgroup>
			<tbody>
<%
	for (BoardReply boardReply : boardReplies) {
%>
				<tr>
					<td><%=boardReply.getContent() %></td>
					<td><%=boardReply.getWriter() %></td>
					<td><%=boardReply.getCreatedDate() %></td>
					<td class="text-center"><a href="deleteReply.jsp?replyNo=<%=boardReply.getNo() %>&boardNo=<%=board.getNo() %>&cpno=<%=currentPageNo %>" class="btn danger sm">삭제</a></td>
				</tr>
<%
	}
%>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>