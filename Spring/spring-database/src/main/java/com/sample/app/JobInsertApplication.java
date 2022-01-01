package com.sample.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sample.service.JobService;
import com.sample.vo.Job;

public class JobInsertApplication {

	public static void main(String[] args) {
		String resource = "classpath:/spring/context-jdbc.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		JobService service = ctx.getBean(JobService.class);
		
		Job job = new Job();
		job.setId("IT_TEST");
		job.setTitle("Test");
		job.setMinSalary(5000);
		job.setMaxSalary(10000);
		
		service.insertNewJob(job);
	}
}
