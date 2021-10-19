package example_10_01_wrapper;

public class WrapperApp2 {

	public static void main(String[] args) {
		// 오토박싱, 오토언박싱 (자바 5버전부터 지원하는 기능)
		// 기본자료형 > Wrapper 클래스타입의 객체로
		// Wrapper 클래스타입의 객체 > 기본자료형값으로 변경을 자동으로 처리하는 것
		
		// 오토박싱
		// 변수의 타입은 Wrapper 클래스 타입이고 저장할 값의 타입이 기본자료형일 때
		// 자동으로 변수의 타입과 일치하는 Wrapper 객체를 생성해서 기본자료형값을 저장한 다음 그 객체를 참조변수에 대입하는 것
		Integer a1 = 10;			// Integer a1 = new Integer(10);		실제로 실행되는 코드
		Long a2 = 10000000000000L;	// Long a2 = new Long(10000000000000L); 실제로 실행되는 코드
		Double a3 = 3.141592;		// Double a3 = new Double.(3.141592)
		
		Object b1 = 10;				// Object b1 = new Integer(10); b1 참조변수는 Integer객체의 내부에 있는 Object를 참조중이다.
		Object b2 = 10000000000l; 	//
		Object b3 = 3.141592;
		
		// 오토언박싱
		// Wrapper 클래스 타입의 객체에 저장된 값을
		// 기본 자료형 타입의 변수에 대입하면 자동으로 해당 Wrapper객체가 가지고 있는 기본자료형 값이 대입된다.
		Integer c1 = 1000;			// Integer c1 = new Integer(100);
		int c2 = c1;				// int c2 = c1.intValue();	Integer객체의 intValue()를 실행해서 정수값을 꺼내서 변수 c2에 저장한다.
		
		// 오토박싱과 오토언박싱이 지원되기 때문에 Wrapper객체와 기본자료형 간의 사칙연산도 가능하다.
		Integer d1 = 20;
		Integer d2 = 30;
		int d3 = 40;
		
		// 기본자료형타입 변수 = 객체 + 객체 + 정수
		int sum = d1 + d2 + d3;		// int sum = d1.intValue() + d2.intValue() + d3;
		System.out.println("합계: " + sum);
	}
}
