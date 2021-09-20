package example_09_16_polymorphism;

import java.util.Date;

/**
 * 이벤트 등록, 이벤트 알림, 이벤트 당첨자 선정 등의 기능이 구현된 클래스다.
 * @author 박성근
 *
 */
public class EventService {
	
	/**
	 * Messenger 객체 및 Messenger 하위 객체들을 참조하는 변수
	 */
	private Messenger messenger = new EmailMessenger("admin", "1234");
	
	/**
	 * 최신 이벤트 소식을 수신허락한 고객들에게 보냅니다.
	 * @param from 보내는 곳
	 * @param to 받는 곳
	 * @param text 이벤트 내용
	 */
	public void noticeEvent(String from, String to, String text) {
		System.out.println("### 최신 이벤트 소식을 발송합니다.");
		messenger.sendMessage(from, to, text);
	}
	
	/**
	 * 새로운 이벤트를 등록한다.
	 * @param title 이벤트 제목
	 * @param text 이벤트 내용
	 * @param startDate 이벤트 시작일
	 * @param endDate 이벤트 종료일
	 */
	public void addEvent(String title, String text, Date startDate, Date endDate) {
		
	}
	
}
