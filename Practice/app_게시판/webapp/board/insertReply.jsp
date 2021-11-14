<%@page import="com.sample.dao.BoardReplyDao"%>
<%@page import="com.sample.vo.BoardReply"%>
<%@page import="com.sample.vo.Board"%>
<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int currentPageNo = Integer.parseInt(request.getParameter("cpno"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	BoardReply boardReply = new BoardReply();
	boardReply.setWriter(writer);
	boardReply.setContent(content);
	boardReply.setBoard(board);
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	boardReplyDao.insertReply(boardReply);
	
	response.sendRedirect("detail.jsp?no=" + boardNo + "&cpno=" + currentPageNo);
%>