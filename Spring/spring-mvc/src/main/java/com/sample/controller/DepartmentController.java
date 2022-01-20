package com.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.form.DepartmentInsertForm;
import com.sample.form.DepartmentModifyForm;
import com.sample.service.DepartmentService;
import com.sample.service.EmployeeService;

@Controller
@RequestMapping("/dept")
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	@Autowired
	EmployeeService employeeService;

	@GetMapping("/list.do")
	public String list(Model model) {
		// 전체 부서목록을 조회해서 model에 담는다.
		return "dept/list.jsp";
	}
	
	@GetMapping("/insert.do")
	public String form(Model model) {
		// 입력폼에서 필요한 소재지 목록을 조회해서 model에 담는다.
		return "dept/form.jsp";
	}
	
	@PostMapping("/insert.do")
	public String insert(DepartmentInsertForm form) {	// 입력폼에서 제출한 부서명과 소재지 아이디를 전달받는 객체
		// DepartmentInsertForm에 저장된 값을 Department객체로 복사하고, DepartmentService의 새 부서 등록 서비스에 전달한다.
		return "redirect:list.do";
	}
	
	@GetMapping("/modify.do")
	public String formForm(int id, Model model) {	// 요청파라미터의 부서아이디를 전달받는 변수, Model 타입변수
		// 부서아이디에 해당하는 부서 상세정보 조회해서 model에 저장
		// 부서아이디에 해당하는 부서에 소속된 직원목록 조회해서 model에 저장
		// 전체 소재지 목록을 조회해서 model에 저장
		return "dept/modifyform.jsp";
	}
	
	@PostMapping("/modify.do")
	public String modify(DepartmentModifyForm form) {	// 부서정보 수정폼에서 제출한 부서정보를 전달받는 객체
		// DepartmentModifyForm에 저장된 값을 Department객체로 복사하고, DepartmentService의 부서정보 수정 서비스에 전달한다.
		return "redirect:list.do";
	}
	
}
