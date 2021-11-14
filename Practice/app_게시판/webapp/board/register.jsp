<%@page import="com.sample.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");

	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(title, writer, content);
	
	response.sendRedirect("list.jsp?cpno=1");
%>