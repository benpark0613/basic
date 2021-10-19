package example_10_13_custom_exception.service;

import java.util.ArrayList;
import java.util.List;

import example_10_13_custom_exception.exception.PasswordMissMatchException;
import example_10_13_custom_exception.exception.UserAlreadyExistException;
import example_10_13_custom_exception.exception.UserNotFoundException;
import example_10_13_custom_exception.vo.User;

public class UserService {

	private List<User> users = new ArrayList<>();
	private User loginUser = null;
	
	public void registerUser(User user) {
		User savedUser = this.getUsetById(user.getId());
		if (savedUser != null) {
			throw new UserAlreadyExistException("["+user.getId()+"] 이미 등록된 아이디입니다.");
		}
		
		users.add(user);
	}
	
	public void login(String id, String password) {
		User savedUser = this.getUsetById(id);
		if (savedUser == null) {
			throw new UserNotFoundException("["+id+"] 사용자정보를 찾을 수 없습니다.");
		}
		if(!savedUser.getPassword().equals(password)) {
			throw new PasswordMissMatchException("비밀번호가 일치하지 않습니다.");
		}
		
		loginUser = savedUser;
	}
	
	public void logout() {
		if (loginUser != null) {
			loginUser = null;
		}
		
	}
	
	public boolean isLogined() {
		return loginUser != null;
	}
	
	public User getUsetById(String id) {
		for (User user : users) {
			if (user.getId().equals(id)) {
				return user;
			}
		}
		return null;
	}
}
