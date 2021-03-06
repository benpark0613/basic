<%@page import="com.sample.vo.Employee"%>
<%@page import="com.sample.dao.EmployeeDao"%>
<%@page import="com.sample.vo.Job"%>
<%@page import="com.sample.dao.JobDao"%>
<%@page import="com.sample.vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
<title>사원정보관리::등록폼</title>
</head>
<body>
	<h1>새 사원정보 등록폼</h1>
<%
	DepartmentDao departmentDao = new DepartmentDao();
	JobDao jobDao = new JobDao();
	EmployeeDao employeeDao = new EmployeeDao();
	
	// 전체 부서목록 조회하기
	List<Department> departments = departmentDao.getAllDepartments();
	// 전체 직종목록 조회하기
	List<Job> jobs = jobDao.getAllJobs();
	// 전체 관리자목록 조회하기
	List<Employee> managers = employeeDao.getAllManagers();
%>
	<div>
		<form class="well" method="post" action="register.jsp">
			<div class="form-group">
				<label>소속부서</label>
				<select name="deptId">
					<option value="" selected="selected" disabled="disabled">부서를 선택하세요</option>
<%
	for(Department dept : departments) {
%>
					<option value="<%=dept.getId() %>"> <%=dept.getName() %></option>
<%
	}
%>
				</select>
			</div>
			<div class="form-group">
				<label>직종</label>
				<select name="jobId">
					<option value="" selected="selected" disabled="disabled">직종을 선택하세요</option>
<%
	for (Job job : jobs) {
%>	
					<option value="<%=job.getId() %>"> <%=job.getTitle() %> (<%=job.getMinSalary() %> ~ <%=job.getMaxSalary() %> 달러)</option>
<%
	}
%>
				</select>
			</div>
			<div class="form-group">
				<label>이름1</label>
				<input type="text" name="firstName" />
			</div>
			<div class="form-group">
				<label>이름2</label>
				<input type="text" name="lastName" />
			</div>
			<div class="form-group">
				<label>이메일</label>
				<input type="text" name="email" />
			</div>
			<div class="form-group">
				<label>전화번호</label>
				<input type="text" name="phoneNumber" />
			</div>
			<div class="form-group">
				<label>급여</label>
				<input type="number" name="salary" />
			</div>
			<div class="form-group">
				<label>커미션</label>
				<input type="radio" name="commissionPct" value="0.1" />0.1
				<input type="radio" name="commissionPct" value="0.15" />0.15
				<input type="radio" name="commissionPct" value="0.2" />0.2
				<input type="radio" name="commissionPct" value="0.25" checked="checked" />0.25
				<input type="radio" name="commissionPct" value="0.3" />0.3
				<input type="radio" name="commissionPct" value="0.35" />0.35
				<input type="radio" name="commissionPct" value="0.4" />0.4
				<input type="radio" name="commissionPct" value="0.45" />0.45
			</div>
			<div class="form-group">
				<label>관리자</label>
				<select name="managerId">
					<option value="" disabled="disabled" selected="selected"> 관리자를 선택하세요</option>
<%
	for (Employee manager : managers) {
%>
					<option value="<%=manager.getId() %>"> <%=manager.getFirstName() %> <%=manager.getLastName() %> (<%=manager.getDepartment().getName() %>)</option>
<%
	}
%>					
				</select>
			</div>
			<div class="text-right">
				<button type="submit" class="btn">등록</button>
			</div>
		</form>
	</div>
</body>
</html>