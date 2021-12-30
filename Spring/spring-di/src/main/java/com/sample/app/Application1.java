package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.controller.UserController;
import com.sample.service.UserService;

public class Application1 {

	public static void main(String[] args) {
		
		// 스프링 빈 설정파일의 경로
		String resource = "classpath:/spring/context-1.xml";
		
		// 스프링 컨테이너 객체 생성하기
		/*
		 * ApplicationContext
		 * 		+ 인터페이스다.
		 * 		+ 스프링 컨테이너 객체가 반드시 구현할 기능을 정의하고 있다.
		 * ClassPathXmlApplicationContext
		 * 		+ 클래스다.
		 * 		+ ApplicationContext 인터페이스를 구현한 클래스다.
		 * 		+ 지정된 리소스(스프링 빈 설정 파일)을 읽어서 객체 생성/조립/보관을 수행한다.
		 * 		+ 스프링 컨테이너는 특별한 설정이 없는 한 모든 객체를 싱글턴 상태로 유지한다.
		 */
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		// 스프링 컨테이너가 생성/조립/보관중인 객체 가져오기
		/*
		 * Object getBean(String id)
		 * 		+ 지정된 아이디로 생성해서 보관중인 객체를 반환한다.
		 * 		+ 반환타입이 Object이기 때문에 반드시 적절한 타입으로 형변환해야 한다.
		 * 
		 * T getBean(String id, Class<T> class)
		 * 		+ 지정된 아이디와 클래스 타입으로 객체를 가져온다.
		 * 		+ 클래스타입을 지정했기 때문에 형변환이 필요없다.
		 * 
		 */
		UserController controller = ctx.getBean("userController", UserController.class);
		UserService service = ctx.getBean("userServiceImpl", UserService.class);
		
		//System.out.println(controller);
		//System.out.println(service);
		
		String viewPage = controller.execute(100);
		
	}
}
