<%@page import="com.sample.board.vo.Board"%>
<%@page import="com.sample.board.dao.BoardDao"%>
<%@page import="com.sample.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	
	User loginUserInfo = (User)session.getAttribute("LOGIN_USER_INFO");
	
	if (loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	}
	
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardDetail(no);
	
	if (board.getWriter().getNo() != loginUserInfo.getNo()) {
		response.sendRedirect("detail.jsp?no="+no+"&pageNo="+pageNo+"&error=deny-delete");
		return;
	}
	
	boardDao.deleteBoard(no);

	response.sendRedirect("list.jsp?pageNo=" + pageNo);
%>