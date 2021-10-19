package example_09_16_polymorphism;

public class MessengerApp {

	public static void main(String[] args) {
		
		System.out.println("### Messenger로 메세지 보내기");
		Messenger messenger = new Messenger();
		messenger.sendMessage("010-1111-1111", "010-2222-2222", "이벤트에 당첨되었습니다.");
		
		System.out.println("### KakaoTalkMessenger로 메세지 보내기");
		KakaoTalkMessenger katalk = new KakaoTalkMessenger("홍길동", "고양이사진");
		katalk.sendMessage("홍길동", "이순신", "내일 학교에서 11시에 보자");

		System.out.println("### KakaoTalkMessenger로 메세지 보내기");
		Messenger kakao = new KakaoTalkMessenger("김유신", "강아지사진");
		kakao.sendMessage("김유신", "강감찬", "빵사와라");
		
	}
}
