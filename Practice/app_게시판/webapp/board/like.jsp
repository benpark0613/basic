<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int currentPageNo = Integer.parseInt(request.getParameter("cpno"));
	
	BoardDao boardDao = new BoardDao();
	boardDao.addLike(boardNo);
	
	response.sendRedirect("detail.jsp?no=" + boardNo + "&cpno=" + currentPageNo);
%>