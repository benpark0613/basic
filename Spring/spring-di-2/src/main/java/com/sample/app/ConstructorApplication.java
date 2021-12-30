package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.controller.SampleConstructorController;

public class ConstructorApplication {

	public static void main(String[] args) {
		
		String resource = "classpath:/spring/context-constructor-injection.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		SampleConstructorController controller = ctx.getBean(SampleConstructorController.class);
		controller.execute();
	}
}
