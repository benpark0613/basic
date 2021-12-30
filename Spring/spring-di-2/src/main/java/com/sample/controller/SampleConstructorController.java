package com.sample.controller;

import com.sample.service.ProductServiceImpl;
import com.sample.service.UserServiceImpl;
import com.sample.vo.Product;
import com.sample.vo.User;

public class SampleConstructorController {

	// 스프링 컨테이너가 생성자메소드를 이용해서 의존하는 객체를 주입 받을 수 있다.
	private ProductServiceImpl productService;
	private UserServiceImpl userService;
	
	/*
	 * 기본 생성자가 정의되어 있지 않다.
	 * 빈 설정파일에서 <bean id="식별자" class="클래스명"></bean>로 스프링 컨테이너에 보관할 빈을 생성할 수 없다.
	 */
	
	// 스프링 컨테이너가 생성자 메소드를 이용해서 의존하는 객체를 주입할 수 있다.
	public SampleConstructorController(ProductServiceImpl productService, UserServiceImpl userService) {
		this.productService = productService;
		this.userService = userService;
	}
	
	public String execute() {
		Product product = productService.getProductByNo(100);
		User user = userService.getUserByNo(100);
		
		System.out.println(product);
		System.out.println(user);
		
		return null;
	}
}
