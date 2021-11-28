package example_09_16_polymorphism;

public class NewsServiceApp {

	public static void main(String[] args) {
		
		Messenger messenger1 = new Messenger();
		KakaoTalkMessenger messenger2 = new KakaoTalkMessenger("홍길동", "고양이사진");
		EmailMessenger messenger3 = new EmailMessenger("admin", "zxcv1234");
		
		NewsService service = new NewsService();
		service.setMessenger(messenger3);
		service.broadcastNews("010-1111-1111", "010-2222-2222", "코로나가 종식되었습니다.");
		
	}
}
