<%@page import="com.sample.dao.EmployeeDao"%>
<%@page import="com.sample.vo.Job"%>
<%@page import="com.sample.vo.Department"%>
<%@page import="com.sample.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int deptId = Integer.parseInt(request.getParameter("deptId"));
	String jobId = request.getParameter("jobId");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String email = request.getParameter("email");
	String phoneNumber = request.getParameter("phoneNumber");
	double salary = Double.parseDouble(request.getParameter("salary"));
	double commissionPct = Double.parseDouble(request.getParameter("commissionPct"));
	int managerId = Integer.parseInt(request.getParameter("managerId"));
	
	Employee employee = new Employee();
	Department department = new Department();
	Job job = new Job();
	Employee manager = new Employee();
	
	employee.setFirstName(firstName);
	employee.setLastName(lastName);
	employee.setEmail(email);
	employee.setPhoneNumber(phoneNumber);
	employee.setSalary(salary);
	employee.setCommissionPct(commissionPct);
	
	department.setId(deptId);
	job.setId(jobId);
	manager.setId(managerId);
	
	employee.setDepartment(department);
	employee.setJob(job);
	employee.setManager(manager);
	
	EmployeeDao employeeDao = new EmployeeDao();
	employeeDao.insertEmployee(employee);
	
	// 전체 사원목록을 제공하는 list.jsp를 재요청하게하는 응답을 보낸다.
	response.sendRedirect("list.jsp?cpno=1");
%>