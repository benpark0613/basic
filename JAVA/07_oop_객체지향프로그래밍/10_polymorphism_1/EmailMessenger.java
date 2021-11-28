package example_09_16_polymorphism;

public class EmailMessenger extends Messenger {

	private String email;
	private String password;
	
	public EmailMessenger(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
	@Override
	public void sendMessage(String from, String to, String text) {
		System.out.println("[" + email + "][" + password + "]로 메일계정에 로그인함");
		System.out.println("### 이메일로 메세지를 발송함");
		System.out.println("보내는 주소: " + from);
		System.out.println("받는 주소: " + to);
		System.out.println("내용: " + text);
		System.out.println();
	}
}
