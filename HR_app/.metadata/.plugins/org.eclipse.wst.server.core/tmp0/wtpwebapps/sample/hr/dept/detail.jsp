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
<title>부서정보 관리::부서 상세정보</title>
</head>
<body>
	<h1>부서 정보</h1>
<%
	/*
		- 부서목록에서 부서상세정보를 요청했을 때 실행되는 JSP다.
		- 부서목록에서 부서상세정보를 요청할 때는 "detail.jsp?deptId=부서아이디" 형식의 요청URL이 서버로 전달된다.
		- 쿼리스트링(deptId=부서아이디)은 브라우저에서 부서상세정보를 조회하기 위해서 클릭한 부서의 아이디 정보를 나타낸다.
		- Tomcat은 쿼리스트링을 분석해서 요청객체의 요청파라미터정보에 저장한다.
		- Tomcat은 detail_jsp객체의 _jspService(request, response) 메소드를 실행할 때, 요청객체와 응답객체를 인자로 전달한다.
		- _jspService(request, response)  메소드의 코드로 포함되는 JSP 코드에서 request변수와 response변수에 전달된
		  요청객체, 응답객체를 활용할 수 있다.
		- 특히, 클라이언트가 서버로 전달한 요청파라미터값은 요청객체의 getParameter(String name) 메소드를 사용해서 조회할 수 있다.
	*/

	int departmentId = Integer.parseInt(request.getParameter("deptId"));
	
	DepartmentDao departmentDao = new DepartmentDao();
	EmployeeDao employeeDao = new EmployeeDao();
	
	// 부서아이디로 부서 상세정보 조회하기
	Department department = departmentDao.getDepartmentById(departmentId);
	// 부서아이디로 해당 부서에 소속된 사원수 조회하기
	int employeesCount = departmentDao.getEmployeesCountById(departmentId);
	// 부서아이디로 해당 부서에 소속된 전체 사원정보 조회하기
	List<Employee> employeeList = employeeDao.getEmployeesByDepartmentId(departmentId);
	
%>
	<h3>부서 상세정보</h3>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>부서명</th>
				<th>부서관리자</th>
				<th>부서소재지</th>
				<th>소속 사원수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=departmentId %></td>
				<td><%=department.getName() %></td>
				<td><%=department.getManager().getFirstName() %>  <%=department.getManager().getLastName() %></td>
				<td><%=department.getLocation().getCity() %></td>
				<td><%=employeesCount %> 명</td>
			</tr>
		</tbody>
	</table>
	
	<div class="text-right">
		<a href="modifyform.jsp?deptId=<%=departmentId %>">수정</a>
<%
	if (employeesCount == 0) {
%>
		<a href="delete.jsp?deptId=<%=departmentId %>">삭제</a>
<%
	}
%>
	</div>
	
	<h3>소속 사원 리스트</h3>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>입사일</th>
			</tr>
		</thead>
		<tbody>
<%
	if (employeeList.isEmpty()) {
%>
			<tr>
				<td class="text-center" colspan="5">소속된 사원이 없습니다.</td>
			</tr>
<% 	
	} else {
		for (Employee employee : employeeList) {
%>
			<tr>
				<td><%=employee.getId() %></td>
				<td><a href=""><%=employee.getFirstName() %> <%=employee.getLastName() %></a></td>
				<td><%=employee.getEmail() %></td>
				<td><%=employee.getPhoneNumber() %></td>
				<td><%=employee.getHireDate() %></td>
			</tr>	
<%		
		}		
	}
%>
		</tbody>
	</table>
	
	<div class="text-right">
		<a href="list.jsp">부서 목록</a>
	</div>
</body>
</html>