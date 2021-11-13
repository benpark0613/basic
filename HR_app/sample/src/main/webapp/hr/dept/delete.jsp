<%@page import="com.sample.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		detail.jsp에서 삭제작업을 요청했을 때 실행되는 jsp
		detail.jsp에서 삭제작업을 요청할 때는 "delete.jsp?deptId=부서아이디"형식의 요청을 한다.
		
		detail.jsp에서 삭제요청한 부서아이디를 요청파라미터로 전달한다.
	*/
	
	int departmentId = Integer.parseInt(request.getParameter("deptId"));

	DepartmentDao departmentDao = new DepartmentDao();
	// 부서정보 삭제하기
	departmentDao.deleteDepartment(departmentId);
	
	// 전체 부서목록을 재요청하게하는 URL을 응답으로 보낸다.
	response.sendRedirect("list.jsp");
%>

