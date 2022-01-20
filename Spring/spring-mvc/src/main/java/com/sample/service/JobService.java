package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.JobDao;
import com.sample.vo.Job;

@Service
public class JobService {

	@Autowired
	JobDao jobDao;
	
	public List<Job> getAllJobs() {
		
		return jobDao.getAllJobs();
	}
}
