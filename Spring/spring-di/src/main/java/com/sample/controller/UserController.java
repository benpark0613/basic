package com.sample.controller;

import com.sample.service.UserService;
import com.sample.vo.User;

public class UserController {

	// 사용자관련 업무로직이 구현된 UserService 구현객체가 필요하다.
	private UserService userService;
	
	// UserController 객체(빈)은 UserService타입의 객체를 전달받기 위해서 setter 메소드를 정의한다.
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	// 사용자번호를 전달받아서 사용자 상세정보를 출력하는 요청핸들러 메소드
	public String execute(int userNo) {
		User user = userService.getUserByNo(userNo);
		System.out.println("사용자번호 : " + user.getNo());
		System.out.println("사용자명 : " + user.getName());
		System.out.println("사용자이메일 : " + user.getEmail());
		System.out.println("사용자비밀번호 : " + user.getPassword());
		
		return "detail.jsp";
	}
}
