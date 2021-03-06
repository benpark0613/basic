package com.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.UserDao;
import com.sample.exception.LoginErrorException;
import com.sample.vo.User;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public User login(String id, String password) {
		// 회원정보
		User user = userDao.getUserById(id);		
		if (user == null) {
			throw new LoginErrorException("회원정보가 존재하지 않습니다.");
		}
		if ("Y".equals(user.getDisabled())) {
			throw new LoginErrorException("탈퇴처리된 회원아이디 입니다.");
		}
		if (!password.equals(user.getPassword())) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		// 인증된 사용자정보를 반환
		return user;
	}
}
