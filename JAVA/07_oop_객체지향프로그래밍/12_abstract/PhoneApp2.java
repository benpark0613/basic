package example_09_24_abstract;

public class PhoneApp2 {

	// 전화걸기 기능이 잘 동작하는지 테스트하는 메소드
	public static void testCall(Phone phone) {
		phone.call("010-2222-2222");
	}
	
//	// 인터넷하기 기능이 잘 동작하는지 테스트하는 메소드
//	public static void testInternet(Phone phone) {
//		if (phone instanceof SmartPhone) {
//			System.out.println("전달받은 객체는 SmartPhone 타입이다.");
//			((SmartPhone)phone).internet("http://daum.net");
//		} else {
//			System.out.println("전달받은 객체는 SmartPhone 타입이 아니다.");			
//		}
//	}
	
	// 인터넷하기 기능이 잘 동작하는지 테스트하는 메소드
	// 매개변수의 타입을 SmartPhone타입으로 정의하면, SmartPhone 인터페이스를 구현한 객체만 전달받을 수 있다.
	// 즉, 인터넷 기능이 지원되지 않는 일반폰들은 이 메소드를 실행할 수도 없다.
	// 따라서, 위의 주석처리된 코드처럼 instanceof 연산자를 사용하거나, SmartPhone타입으로 강제형변환하는 코드도 필요없다.
	public static void testInternet(SmartPhone smartPhone) {
		smartPhone.internet("http://naver.com");
	}
	
	public static void main(String[] args) {
		System.out.println("### 아이폰으로 테스트하기");
		Iphone iphone = new Iphone("010-1111-1111", "192.168.0.1", "hong");
		PhoneApp2.testCall(iphone);
		PhoneApp2.testInternet(iphone);
		System.out.println();
		
		System.out.println("### 일반폰으로 테스트하기");
		NormalPhone normal = new NormalPhone("010-3333-3333");
		PhoneApp2.testCall(normal);
		// PhoneApp2.testInternet(normal); 오류
	}
}
