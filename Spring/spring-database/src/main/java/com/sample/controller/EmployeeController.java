package com.sample.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.form.EmployeeSaveForm;
import com.sample.service.EmployeeService;
import com.sample.vo.Employee;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	/*
	 * http://localhost/emp/list.do 요청을 처리하는 요청 핸들러 메소드다.
	 * 요청핸들러 메소드가 반환하는 값은 내부이동 혹은 재요청할 URL이다.
	 * 
	 * 요청처리를 완료하면 /WEB-INF/jsp/employee/list.jsp로 내부이동시킨다.
	 */
	@RequestMapping(path = "/list.do")
	public String list(Model model) {
		// 전체 직원목록 조회
		List<Employee> employees = employeeService.getAllEmployees();
		// employee/list.jsp에서 표현할 데이터를 Model객체에 저장한다.
		model.addAttribute("employees", employees);
		
		return "/employee/list.jsp";
	}
	
	/*
	 * http://localhost/emp/detail.do?id=사원아이디 요청을 처리하는 요청 핸들러 메소드다.
	 * 요청처리를 완료하면 /WEB-INF/jsp/employee/detail.jsp로 내부이동시킨다.
	 * 
	 * 쿼리스트링으로 전달된 요청파라미터값은 요청핸들러 메소드에 요청파라미터 이름과 같은 이름의 매개변수를 선언하면 값을 획득할 수 있다.
	 */
	@GetMapping("/detail.do")
	public String detail(int id, Model model) {
		System.out.println("조회할 사원아이디: " + id);
		
		Employee employee = employeeService.getEmployeeDetail(id);
		model.addAttribute("employee", employee);
		
		return "employee/detail.jsp";
	}
	
	/*
	 * 요청방식이 GET이고
	 * 요청URL이 http://localhost/emp/insert.do인 요청을 처리하는 요청핸들러 메소드다.
	 */
	@GetMapping("/insert.do")
	public String form() {
		return "employee/form.jsp";
	}
	
	/*
	 * 요청방식이 POST이고
	 * 요청URL이 http://localhost/emp/insert.do인 요청을 처리하는 요청핸들러 메소드다.
	 * 폼 입력데이터가 아래와 같은 형식으로 전달된다.
	 * 		firstName=김&lastName=유신&phoneNumber=010-1234-5678&email=kim@gmail.dom
	 * 요청핸들러 메소드의 매개변수에 사용자정의 클래스타입의 변수를 선언하면 스프링은 폼입력값을 담은 Form객체로 인식한다.
	 * 		1. EmployeeSaveForm 객체를 생성한다.
	 * 		2. EmployeeSaveForm 객체의 멤버변수 타입과 이름을 조사한다.
	 * 		3. 요청객체의 요청파라미터에 동일한 이름의 요청파라미터가 있으면 값을 조회해서 EmployeeSaveForm객체의 setter 메소드를 호출해서 값을 저장한다.
	 * 		4. 모든 멤버변수에 대한 처리가 완료되면 요청핸들러 메소드를 실행하고, 매개변수 인자로 요청파라미터값이 저장된 EmployeeSaveForm객체를 전달한다.
	 */
	@PostMapping("/insert.do")
	public String save(EmployeeSaveForm employeeForm) {
		employeeService.addNewEmployee(employeeForm.toEmployee());
		
		return "redirect:list.do";
	}
	
	
	
	
	
	
}
