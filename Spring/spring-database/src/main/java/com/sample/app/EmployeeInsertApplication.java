package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.EmployeeService;
import com.sample.vo.Employee;

public class EmployeeInsertApplication {

	public static void main(String[] args) {
		String resource = "classpath:/spring/context-jdbc.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		EmployeeService service = ctx.getBean(EmployeeService.class);
		
		Employee employee = new Employee();
		employee.setFirstName("길동");
		employee.setLastName("홍");
		employee.setPhoneNumber("010-1234-5678");
		employee.setEmail("hong123@gmail.com");
		
		service.addNewEmployee(employee);
	}
}
