<%@page import="com.sample.dao.LocationDao"%>
<%@page import="com.sample.vo.Location"%>
<%@page import="com.sample.vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.EmployeeDao"%>
<%@page import="com.sample.vo.Department"%>
<%@page import="com.sample.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
<title>부서정보 관리::수정폼</title>
</head>
<body>
	<h1>부서정보 수정폼</h1>
<%
	/*
		부서상세화면에서 수정화면을 요청한다.
		부서상세화면에서 "modifyform.jsp?deptId=부서아이디" 요청을 서버로 보낸다.
	*/
	
	int departmentId = Integer.parseInt(request.getParameter("deptId"));
	
	DepartmentDao departmentDao = new DepartmentDao();
	EmployeeDao employeeDao = new EmployeeDao();
	LocationDao locationDao = new LocationDao();
	
	// 부서아이디에 해당하는 부서상세정보 조회
	Department department = departmentDao.getDepartmentById(departmentId);
	// 해당 부서에 소속된 직원들 조회
	List<Employee> employees = employeeDao.getEmployeesByDepartmentId(departmentId);
	// 모든 부서소재지정보 조회
	List<Location> locations = locationDao.getAllLocations();

%>
	
	<div>
		<form class="well" method="post" action="update.jsp">
			<div class="form-group">
				<label>부서아이디</label>
				<input type="text" name="id" value="<%=department.getId() %>" readonly="readonly"/>
			</div>
			<div class="form-group">
				<label>부서명</label>
				<input type="text" name="name" value="<%=department.getName() %>"/>
			</div>
			<div class="form-group">
				<label>부서 관리자</label>
<%
	if(employees.isEmpty()) {
%>
				<!-- disabled="disabled" 속성이 정의된 필드는 서버로 제출되지 않는다. -->
				<input type="text" name="managerId" value="해당 부서에 소속된 사원이 없습니다." disabled="disabled"/>
<%
	} else {
%>
				<select name="managerId">
<%
		for (Employee emp : employees) {
%>
					<option value="<%=emp.getId() %>" <%=emp.getId() == department.getManager().getId() ? "selected" : "" %>> <%=emp.getFirstName() %> <%=emp.getLastName() %></option>
<%	
		}
	}
%>
				</select>
			</div>
			<div class="form-group">
				<label>부서 소재지</label>
				<select name="locationId">
<%
	for (Location loc : locations) {
%>
					<option value="<%=loc.getId() %>" <%=loc.getId() == department.getLocation().getId() ? "selected" : "" %>> <%=loc.getCity() %> (<%=loc.getCountryId() %>)</option>
<%
	}
%>
				</select>
			</div>
			<div class="text-right">
				<button class="btn">수정</button>
			</div>
		</form>
	</div>
</body>
</html>