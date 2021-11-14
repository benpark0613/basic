<%@page import="oracle.jdbc.logging.annotations.DisableTrace"%>
<%@page import="com.sample.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/style.css">
<title>게시판::리스트</title>
</head>
<body>
<%
	final int rowsPerPage = 5;
	final int pagesPerBlock = 5;
	
	BoardDao boardDao = new BoardDao();
	
	int currentPageNo;		
	if ((request.getParameter("cpno")) == null) {
		currentPageNo = 1;
	} else {
		currentPageNo = Integer.parseInt(request.getParameter("cpno"));		
	}
	int begin = (currentPageNo -1)*rowsPerPage + 1; 
	int end = currentPageNo*rowsPerPage;
	int totalRecords = boardDao.getBoardsCount();
	int totalPages = (int)(Math.ceil((double)totalRecords/rowsPerPage));
	int totalBlocks = (int)(Math.ceil((double)totalPages/pagesPerBlock));
	int currentBlock = (int)(Math.ceil((double)currentPageNo/pagesPerBlock));
	int beginPageNo = (currentBlock - 1)*pagesPerBlock + 1;
	int endPageNo = currentBlock*pagesPerBlock;
	if (currentBlock == totalBlocks) {
		endPageNo = totalPages;
	}

	List<Board> boardList = boardDao.getboards(begin, end);
%>
<div id="wrapper">
	<ul class="nav">
 		<li><a class="active" href="/sample/board/list.jsp?cpno=1">홈</a></li>
 		<li><a href="/sample/board/form.jsp">새 글</a></li>
	</ul>
	
	<h1>게시판 리스트</h1>

	<table>
		<colgroup>
			<col width="10%">
			<col width="*">
			<col width="12%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>추천수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
<%
	for (Board board : boardList) {
%>
			<tr>
				<td><%=board.getNo() %></td>
				<td><a href="viewCount.jsp?no=<%=board.getNo() %>&cpno=<%=currentPageNo %>"><%=board.getTitle() %></a></td>
				<td><%=board.getWriter() %></td>
				<td><%=board.getViewCount() %></td>
				<td><%=board.getLikeCount() %></td>
				<td><%=board.getCreatedDate() %></td>
			</tr>
<%		
	}
%>
		</tbody>
	</table>
	<div class="text-center pagination">
<%
	if (totalBlocks == 1) {
%>
		<a href="list.jsp?cpno=<%=totalPages %>" class="<%=currentBlock == 1 ? "disabled" : "" %>">이전</a>
<%		
	} else {
%>
		<a href="list.jsp?cpno=<%=(currentBlock - 1)*pagesPerBlock %>" class="<%=currentBlock == 1 ? "disabled" : "" %>">이전</a>
<%
	}

	for (int pno = beginPageNo; pno <= endPageNo; pno++) {
%>
		<a href="list.jsp?cpno=<%=pno %>" class="<%=pno == currentPageNo ? "active" : "" %>"><%=pno %></a>
<%		
	}
	
	if (currentBlock == totalBlocks) {
%>
		<a href="list.jsp?cpno=<%=currentPageNo %>" class="<%=currentBlock == totalBlocks ? "disabled" : "" %>">다음</a>
<%		
	} else {
%>
		<a href="list.jsp?cpno=<%=currentBlock*pagesPerBlock + 1 %>" class="<%=currentBlock == totalBlocks ? "disabled" : "" %>">다음</a>
<%
	}
%>
	</div>
	<div class="text-right">
		<a href="form.jsp" class="btn primary">새 글쓰기</a>
	</div>
</div>
</body>
</html>