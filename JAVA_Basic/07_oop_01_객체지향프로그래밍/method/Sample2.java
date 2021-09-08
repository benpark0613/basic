package example_09_07_method;

public class Sample2 {

	// 통장의 현재 잔액
	long balance;
	int password;
	
	// 현재 잔액을 반환하는 기능
	// long getCurrentBalance() { ... }
	long getCurrentBalance() {		// void로 정의하면? 만들어야 하는 값들이 엄청나게 많아진다.
		return balance;				// 데이터 타입을 정해두면 반환된 값으로 데이터를 가공할 수 있다.
	}
	
	// 금액을 전달받아서 잔액을 변경하는 기능
	// void updateBalance(long depositMoney) {... }
	void updateBalance(long depositMoney) {
		balance += depositMoney;
	}
	
	// 이전 비밀번호와 새 비밀번호를 전달받아서 비밀번호를 변경하는 기능
	// void changePassword(int prePassword, int password) { ... }
	void changePassword(int prePassword, int newPassword) {
		if (password != prePassword) {
			System.out.println("비밀번호가 일치하지 않습니다.");
		} else {
			password = newPassword;
		}
	}
		
}
