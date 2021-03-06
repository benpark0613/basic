<%@page import="com.sample.dao.DepartmentDao"%>
<%@page import="com.sample.vo.Employee"%>
<%@page import="com.sample.vo.Location"%>
<%@page import="com.sample.vo.Department"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		modifyform.jsp에서 수정폼의 값을 제출하면 update.jsp가 실행된다.
		update.jsp에는 
			id=부서아이디&name=부서이름&managerId=부서관리자아이디&locationId=부서소재자아이디
			id=부서아이디&name=부서이름&locationId=부서소재자아이디
	*/
	
	int departmentId = Integer.parseInt(request.getParameter("id"));
	String departmentName = request.getParameter("name");
	int locationId = Integer.parseInt(request.getParameter("locationId"));
	String tempManagerId = request.getParameter("managerId");
	
	DepartmentDao departmentDao = new DepartmentDao();
	// 테이블의 값을 수정할 때는 항상 테이블에 저장된 현재값을 먼저 조회한다.
	Department department = departmentDao.getDepartmentById(departmentId);
	// 입력폼에서 제출한 값을 대입한다.
	department.setName(departmentName);									// 수정폼에서 입력한 부서명		
	department.getLocation().setId(locationId);							// 수정폼에서 선택한 부서소재지 아이디
	if (tempManagerId == null) {
		department.getManager().setId(null);							
	} else {
		department.getManager().setId(Integer.parseInt(tempManagerId));	// 수정폼에 선택한 매니저 아이디
	}
	
	// 부서정보를 수정한다.
	departmentDao.updateDepartment(department);	
	
	// 수정된 부서의 상세정보를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("detail.jsp?deptId=" + departmentId);	
%>