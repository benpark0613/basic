<%@page import="com.sample.board.vo.User"%>
<%@page import="com.sample.board.dao.BoardDao"%>
<%@page import="com.sample.board.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if (title != null && title.isBlank()) {
		response.sendRedirect("form.jsp?error=empty-title");
		return;
	}
	if (content != null && content.isBlank()) {
		response.sendRedirect("form.jsp?error=empty-content");
		return;
	}
	
	User loginUserInfo = (User)session.getAttribute("LOGIN_USER_INFO");
	
	if (loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	}
	
	Board board = new Board();
	board.setTitle(title);
	board.setWriter(loginUserInfo);
	board.setContent(content);
	
	BoardDao boardDao = BoardDao.getInstance();
	boardDao.insertBoard(board);
	response.sendRedirect("list.jsp");
%>









