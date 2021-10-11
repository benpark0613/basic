package example_10_07_1_map;

import java.util.HashMap;
import java.util.Map;

public class HashMapSample3 {

	public static void main(String[] args) {
		// Map을 사용하지 않은 경우
		System.out.println("### EventService1에서 Map을 사용하지 않은 경우");
		EventService1 service1 = new EventService1();
		service1.sendEventMessage("가을 신상품 할인 행사 진행!!", "SMS");
		service1.sendEventMessage("카톡 채널가입시 할인쿠폰 지급!!", "KAKAOTALK");
		
		// Map을 사용하는 경우
		System.out.println("### EventService2에서 Map을 사용하는 경우");
		EventService2 service2 = new EventService2();
		service2.sendEventMessage("가을 신상품 할인 행사 진행!!", "SMS");
		service2.sendEventMessage("카톡 채널가입시 할인쿠폰 지급!!", "KAKAOTALK");

	}
	
	static class EventService1 {
		
		SmsSender sms = new SmsSender();
		KakaoTalkSender kakao = new KakaoTalkSender();
		
		// senderType에 따라서 메세지를 전송하는 적절한 Sender를 고르는 if ~ else if 문이 필요하다. 
		public void sendEventMessage(String message, String senderType) {
			if ("SMS".equals(senderType)) {	// 문자열을 비교할 때는 상수값을 앞에 둔다. (null 오류방지)
				sms.sendMessage(message);
			} else if ("KAKAOTALK".equals(senderType)) {
				kakao.sendMessage(message);
			}
		}
	}
	
	static class EventService2 {
		// 각종 Sender구현객체를 각각 SMS와 KAKAOTALK을 키로 SmsSender와 KakaoTalkSender를 Map에 저장한다.
		// key값으로 사용할 Sender를 고를 수 있다.
		Map<String, Sender> senderMap = new HashMap<>();
		
		public EventService2() {
			senderMap.put("SMS", new SmsSender());
			senderMap.put("KAKAOTALK", new KakaoTalkSender());
		}
		
		public void sendEventMessage(String message, String senderType) {
			Sender sender = senderMap.get(senderType);
			sender.sendMessage(message);
		}
	}
	
	static interface Sender {
		void sendMessage(String message);
	}
	
	static class SmsSender implements Sender {
		@Override
		public void sendMessage(String message) {
			System.out.println("[SMS 메세지 발송] " + message);
		}
	}
	
	static class KakaoTalkSender implements Sender {
		@Override
		public void sendMessage(String message) {
			System.out.println("[카카오톡 메세지 발송] " + message);
		}
	}
}
