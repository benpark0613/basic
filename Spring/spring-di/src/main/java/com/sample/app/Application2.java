package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.controller.ProductController;
import com.sample.service.ProductService;

public class Application2 {

	public static void main(String[] args) {
		
		// 스프링 빈 설정 파일의 경로
		String resource = "classpath:/spring/context-2.xml";
		// 스프링 컨테이너(ClassPathXmlApplicationContext) 객체 생성 -> 스프링 빈 설정파일 로딩, 클래스 스캔해서 객체생성하고, 스프링 컨테이너에 보관, 객체 조립 수행
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		ProductService service = ctx.getBean(ProductService.class);
		ProductController controller = ctx.getBean(ProductController.class);
		
		System.out.println(service);
		System.out.println(controller);
		
		controller.execute(100);
		
		
	}
}
