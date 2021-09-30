package example_09_27_inner_class;

public class Outer1 {

	private int x;							// 멤버변수, 인스턴스변수, 프로퍼티
	private static int y;					// 정적변수, 클래스변수
	
	public void m1() {						// 멤버메소드, 인스턴스메소드
		System.out.println("멤버 메소드");	
	}
	public static void m2() {				// 정적메소드, 클래스메소드
		System.out.println("정적 메소드");
	}
	
	// 멤버 내부클래스, 인스턴스 내부클래스
	class Inner1 {
		private int a;						// 멤버 내부클래스의 멤버변수, 인스턴스 변수, 프로퍼티
		/*
		 * 멤버 내부클래스에서는 정적변수를 선언할 수 없다.
		 * private static int b;				
		 */
		public void m3() {					// 멤버 내부클래스의 멤버메소드, 인스턴스 메소드
			
			System.out.println(x);			// 외부클래스의 멤버변수 사용가능
			System.out.println(Outer1.y);	// 외부클래스의 정적변수 사용가능
			m1();							// 외부클래스의 멤버메소드 사용가능
			Outer1.m2();					// 외부클래스의 정적메소드 사용가능
			System.out.println(a);			// 자신의 멤버변수 사용가능
		}
		
		/*
		 * 멤버 내부클래스에서는 정적메소드를 선언할 수 없다.
		 * public static void m4() {			
		 *	
		 * }
		 */
	}
	
}
