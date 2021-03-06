<%@page import="com.sample.vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/style.css">
<title>사원정보 관리::리스트</title>
</head>
<body>
	<h1>전체 사원 리스트</h1>
<%
	// 한 화면에 표시할 행의 갯수
	final int rowsPerPage = 5;
	// 한 화면(블록)에 표시할 페이지번호 갯수
	final int pagesPerBlock = 5;

	// 페이지번호 조회하기
	int currentPageNo = Integer.parseInt(request.getParameter("cpno"));
	// 조회할 데이터범위를 계산하기
	int begin = (currentPageNo - 1)*rowsPerPage + 1;
	int end = currentPageNo*rowsPerPage;

	EmployeeDao employeeDao = new EmployeeDao();
	List<Employee> employeeList = employeeDao.getEmployees(begin, end);
%>
	
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>직종아이디</th>
				<th>소속부서명</th>
			</tr>
		</thead>
		<tbody>
<%
	for (Employee emp : employeeList) {
%>
			<tr>
				<td><%=emp.getId() %></td>
				<td><%=emp.getFirstName() %> <%=emp.getLastName() %></td>
				<td><%=emp.getPhoneNumber() %></td>
				<td><%=emp.getEmail() %></td>
				<td><%=emp.getJob().getId() %></td>
				<td><a href="../dept/detail.jsp?deptId=<%=emp.getDepartment().getId() %>"><%=emp.getDepartment().getName() %></a></td>
			</tr>
<%
	}
%>
		</tbody>
	</table>
<%
	// 전체 사원수 조회하기
	int totalRecords = employeeDao.getEmployeesCount();									// 총 레코드 개수 : 107
	// 전체 페이지 갯수 계산하기
	int totalPages = (int)(Math.ceil((double)totalRecords/rowsPerPage));				// 총 페이지 갯수 : ceil(107/rowsPerPage) = 22
	// 전체 블록 갯수 계산하기
	int totalBlocks = (int)(Math.ceil((double)totalPages/pagesPerBlock));				// 총 블록 갯수 : ceil(22/pagesPerBlock) = 5
	
	// 현재 블록 계산하기
	int currentBlock = (int)(Math.ceil((double)currentPageNo/pagesPerBlock));			// 현재 블록번호 : ceil(7/pagesPerBlock) = 2
	// 현재 블록의 시작페이지번호와 끝페이지번호 계산하기
	int beginPageNo = (currentBlock - 1)*pagesPerBlock + 1;								// 현재 블록의 시작 페이지번호 : 6
	int endPageNo = currentBlock*pagesPerBlock;											// 현재 블록의 끝 페이지번호: 10
	if (currentBlock == totalBlocks) {
		endPageNo = totalPages;
	}
%>
	<div class="text-center pagination">
		<a href="list.jsp?cpno=<%=(currentBlock - 1)*pagesPerBlock %>" class="<%=currentBlock == 1 ? "disabled" : "" %>">이전</a>
<%
	for (int pno = beginPageNo; pno <= endPageNo; pno++) {
%>
		<a href="list.jsp?cpno=<%=pno %>" class="<%=pno == currentPageNo ? "active" : "" %>"><%=pno %></a>
<%
	}
%>
		<a href="list.jsp?cpno=<%=currentBlock*pagesPerBlock + 1 %>" class="<%=currentBlock == totalBlocks ? "disabled" : "" %>">다음</a>
	</div>
</body>
</html>