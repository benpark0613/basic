package com.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.DepartmentDao;
import com.sample.dao.LocationDao;

@Service
public class DepartmentService {

	@Autowired
	DepartmentDao departmentDao;
	@Autowired
	LocationDao locationDao;
	
	
}
