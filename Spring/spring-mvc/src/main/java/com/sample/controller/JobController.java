package com.sample.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.form.JobInsertModifyForm;
import com.sample.service.JobService;
import com.sample.vo.Job;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Autowired
	JobService jobService;

	@GetMapping("/list.do")
	public String list(Model model) {
		// 전체 직종목록을 조회해서 model 객체에 저장한다.
		
		return "job/list.jsp";
	}
	
	@GetMapping("/insert.do")
	public String form() {
		
		return "job/form.jsp";
	}
	
	@PostMapping("/insert.do")
	public String insert(JobInsertModifyForm form) {
		// JobInsertModifyForm에 저장된 값을 Job객체로 복사하고 JobService의 직종정보 등록 서비스에 전달한다.
		return "redirect:list.do";
	}
	
	@GetMapping("/modify.do")
	public String formForm(String id, Model model) {
		// 직종아이디에 해당하는 직종정보를 조회해서 model에 담는다.
		// 전체 직종 정보를 조회해서 최저급여목록과 최고급여목록을 조회한다.
		List<Job> jobs = jobService.getAllJobs();
		List<Integer> minSalaryList = jobs.stream()		// 스트림 생성			List<Job>		-> Stream<Job>
				.map(job -> job.getMinSalary())			// 스트림 중간연산(변환)	Stream<Job> 	-> Stream<Integer>
				.distinct()								// 스트림 중간연산(필터링)	Stream<Integer> -> Stream<Integer>
				.sorted()								// 스트림 중간연산(정렬)	Stream<Integer> -> Stream<Integer>
				.collect(Collectors.toList());			// 스트림 최종연산		Stream<Integer> -> List<Integer>
		List<Integer> maxSalaryList = jobs.stream()
				.map(job -> job.getMaxSalary())
				.distinct()
				.sorted()
				.collect(Collectors.toList());
		jobs.stream().forEach(job -> System.out.println(job.getId()));
		return "job/modifyform.jsp";
	}
	
	@PostMapping("/modify.do")
	public String modify() {
		
		return "redirect:list.do";
	}
	
}
