package example_09_16_polymorphism;

public class KakaoTalkMessenger extends Messenger {

	private String nickName;
	private String profile;
	
	public KakaoTalkMessenger(String nickName, String profile) {
		this.nickName = nickName;
		this.profile = profile;
	}
	
	public void displayMyProfile() {
		System.out.println("별명: " + nickName);
		System.out.println("사진: " + profile);
	}
	
	// 상위클래스(Messenger)의 sendMessage(from, to, text)를 재정의한다.
	@Override
	public void sendMessage(String from, String to, String text) {
		System.out.println("### 카톡으로 메세지를 발송함");
		System.out.println("보내는 사람 아이디: " + from);
		System.out.println("받는 사람 아이디: " + to);
		System.out.println("내용: " + text);
		System.out.println();
	}
}
