package com.sample.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.User;

@Mapper
public interface UserDao {
	
	/*
	 * 사용자번호로 검색
	 * Map<String, Object> map = new HashMap<>();
	 * map.put("no", 100);
	 * User user = userDao.getUser(map);
	 * 
	 * 사용자아이디로 검색
	 * Map<String, Object> map = new HashMap<>();
	 * map.put("id", "hong");
	 * User user = userDao.getUser(map);
	 * 
	 * Map<String, Object> map = new HashMap<>();
	 * map.put("email", "hong@gmail.com");
	 * User user = userDao.getUser(map);
	 * 
	 */
	User getUser(Map<String, Object> map);
	User getUserByNo(int no);
	User getUserById(String id);
	User getUserByEmail(String email);
	void updateUser(User user);
}
