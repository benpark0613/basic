package example_09_16_polymorphism;

/**
 * 메세지 전송기능이 구현된 클래스다
 * @author 박성근
 */
public class Messenger {

	/**
	 * 메세지를 전송한다.
	 * @param from 메세지 보내는 사람
	 * @param to 메세지 받는 사람
	 * @param text 메세지 내용
	 */
	public void sendMessage(String from, String to, String text) {
		System.out.println("### 문자메세지를 발송함");
		System.out.println("송신자 전화번호: " + from);
		System.out.println("발신자 전화번호: " + to);
		System.out.println("내용: " + text);
		System.out.println();
	}
}
