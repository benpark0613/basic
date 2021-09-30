package example_09_27_inner_class;

public class Outer3 {

	private int x;
	private static int y;
	
	public void m1() {
		System.out.println("멤버 메소드");
	}
	public static void m2() {
		System.out.println("정적 메소드");
	}
	
	public void m3() {
		int a = 10;
		int b = 10;
		
		// 로컬 내부 클래스
		class Inner2 {
			int m;
			/*
			 * 로컬내부 클래스에서는 정적변수를 정의할 수 없다.
			 * static int n;
			 */
			
			void m3()  {
				System.out.println("로컬 내부클래스의 멤버메소드");
				System.out.println(x);			// 외부 클래스의 멤버변수
				System.out.println(Outer3.y);	// 외부 클래스의 정적변수
				m1();							// 외부 클래스의 멤버메소드
				Outer3.m2();					// 외부 클래스의 정적변수
			
				System.out.println(a);			// 내부클래스가 정의된 메소드에서 선언된 변수
				/*
				 * 로컬내부클래스는 값이 변하는 변수의 값은 사용할 수 없다.
				 * System.out.println(b);		// 내부클래스가 정의된 메소드에서 선언된 변수 - 값이 변경됨
				*/
				System.out.println(m);			// 내부클래스에 정의된 멤버변수 사용
			}
			/*
			 * 로컬 클래스내부에서는 정적메소드를 선언할 수 없다.
			 * static void m4() {
			 *	System.out.println("로컬 내부클래스의 정적메소드");
			} 
			 */
			
		}
		b = 30;
	}
}
