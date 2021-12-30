package com.sample.controller;

import com.sample.service.ProductServiceImpl;
import com.sample.service.UserServiceImpl;
import com.sample.vo.Product;
import com.sample.vo.User;

public class SampleSetterController {

	/*
	 * Setter Injection(setter 메소드를 이용한 의존성 주입)
	 * 		1. 의존하는 객체를 담는 멤버변수를 정의한다.
	 * 		2. 멤버변수만큼 setter메소드를 정의한다.
	 * 		3. 스프링 빈 설정파일에서 <property /> 태그를 이용해서 의존하는 객체를 주입시킨다.
	 * 		+ 스프링 컨테이너는 스프링 빈 설정파일을 <bean/> 태그 정보를 읽어서 객체를 생성하고, <property/> 태그 정보를 읽어서 의존성 주입을 수행한다. 
	 */
	
	/*
	 * SampleSetterController가 클라이언트의 요청을 처리할 때 사용하는 서비스 객체(의존하는 서비스객체)를 담는 멤버변수(프로퍼티)를 정의한다.
	 */
	private ProductServiceImpl productService;
	private UserServiceImpl userService;
	
	/*
	 * SampleSetterController가 클라이언트의 요청을 처리할 때 사용하는 서비스객체를 전달받는 setter메소드를 정의한다.
	 * 의존하는 객체를 주입(전달)받기 위한 setter 메소드를 정의하는 것이다.
	 */
	public void setProductService(ProductServiceImpl productService) {
		this.productService =productService;
	}
	
	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	/*
	 * 아래의 메소드가 정상 동작됨
	 * 		productService와 userService 각각 null이 아니다.
	 * 		productService와 userService변수에는 스프링 컨테이너가 생성해서 보관해둔 객체들 중에서 타입이 일치하는 객체가 주입되었다.
	 * 		+ 의존하는 객체에 대한 주입정보를 <property name="setter메소드이름" ref="스프링 컨테이너에 보관중인 객체의 아이디"> 태그에서
	 * 		읽어서 적절한 객체를 setter메소드를 이용해서 주입한다.
	 * 		
	 */
	public String execute() {
		Product product = productService.getProductByNo(100);
		User user = userService.getUserByNo(100);
		
		System.out.println(product);
		System.out.println(user);
		
		return null;
	}
}
