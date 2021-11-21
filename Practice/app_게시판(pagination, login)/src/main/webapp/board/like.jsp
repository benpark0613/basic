<%@page import="com.sample.board.vo.BoardLiker"%>
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
	
	if (board.getWriter().getNo() == loginUserInfo.getNo()) {
		response.sendRedirect("detail.jsp?no="+no+"&pageNo="+pageNo+"&error=deny-like");
		return;
	}
	
	BoardLiker savedBoardLiker = boardDao.getBoardLiker(no, loginUserInfo.getNo());
	
	if (savedBoardLiker != null) {
		response.sendRedirect("detail.jsp?no="+no+"&pageNo="+pageNo+"&error=deny-like");
		return;
	}
	
	BoardLiker boardLiker = new BoardLiker();
	boardLiker.setBoardNo(no);
	boardLiker.setUserNo(loginUserInfo.getNo());
	boardDao.insertBoardLiker(boardLiker);
	board.setLikeCount(board.getLikeCount() + 1);
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no="+no+"&pageNo="+pageNo);
%>

















