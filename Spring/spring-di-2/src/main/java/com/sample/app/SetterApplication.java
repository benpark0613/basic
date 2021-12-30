package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.controller.SampleSetterController;

public class SetterApplication {
	
	public static void main(String[] args) {
		
		String resource = "classpath:/spring/context-setter-injection.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		SampleSetterController controller = ctx.getBean(SampleSetterController.class);
		controller.execute();
	}
}
