package example_09_16_polymorphism;

/**
 * 뉴스 구독을 신청한 사용자에게 최신 뉴스를 발송하는 서비스클래스다.
 * @author 박성근
 *
 */
public class NewsService {

	/**
	 * 최신 뉴스를 사용자에게 전달할 때 사용하는 Messenger류 객체를 참조하는 참조변수
	 */
	private Messenger messenger;
	
	/**
	 * 기본 생성자 메소드다.
	 */
	public NewsService() {}
	
	/**
	 * Messenger류 객체의 주소값을 전달받아서 멤버변수에 대입해는 생성자 메소드다.
	 * @param messenger
	 */
	public NewsService(Messenger messenger) {
		this.messenger = messenger;
	}
	
	/**
	 * Messenger류 객체의 주소값을 전달받아서 멤버변수에 대입하는 setter 메소드다.
	 * @param messenger
	 */
	public void setMessenger(Messenger messenger) {
		this.messenger = messenger;
	}
	
	/**
	 * 최신뉴스를 구독자에게 발송한다.
	 * @param from 뉴스를 보내는 곳
	 * @param to 뉴스를 수신하는 곳
	 * @param news 최신 뉴스
	 */
	public void broadcastNews(String from, String to, String news) {
		messenger.sendMessage(from, to, news);
	}
	
	
}
