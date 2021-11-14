<%@page import="com.sample.dao.BoardReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int replyNo = Integer.parseInt(request.getParameter("replyNo"));
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	int currentPageNo = Integer.parseInt(request.getParameter("cpno")); 
	
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	boardReplyDao.deleteBoardReply(replyNo);
	
	response.sendRedirect("detail.jsp?no=" + boardNo + "&cpno=" + currentPageNo);
%>