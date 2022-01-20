package com.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.DepartmentService;
import com.sample.service.EmployeeService;
import com.sample.service.JobService;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	@Autowired
	JobService jobService;
	@Autowired
	DepartmentService departmentService;

	@GetMapping("/list.do")
	public String list() {
		
		return "emp/list.jsp";
	}
	
	@GetMapping("/insert.do")
	public String form() {
		
		return "emp/form.jsp";
	}
	
	@PostMapping("/insert.do")
	public String insert() {
		
		return "redirect:list.do";
	}
	
	@GetMapping("/detail.do")
	public String detail() {
		
		return "emp/detail.jsp";
	}
	
	@GetMapping("/modify.do")
	public String modifyform() {
		
		return "emp/modifyform.jsp";
	}
	
	@PostMapping("/modify.do")
	public String modify() {
		
		return "redirect:detail.do?id=10";
	}
	
}
