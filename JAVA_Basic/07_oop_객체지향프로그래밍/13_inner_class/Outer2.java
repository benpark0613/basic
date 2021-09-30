package example_09_27_inner_class;

public class Outer2 {

	private int x;
	private static int y;
	
	public void m1() {
		System.out.println("멤버 메소드");
	}
	public static void m2() {
		System.out.println("정적 메소드");
	}
	
	// 정적 내부 클래스
	static class Inner1 {
		private int a;
		private static int b;
		
		public void m3() {
			System.out.println("정적  내부클래스의 멤버메소드");
			
			/*
			 * 외부클래스의 멤버변수를 사용할 수 없다.
			 * System.out.println(x);
			 */			
			System.out.println(Outer2.y);
			/* 
			 * 외부클래스의 멤버메소드를 사용할 수 없다.
			 * m1(); 
			 */
			Outer2.m2();
			System.out.println(a);
			System.out.println(Inner1.b);
			Inner1.m4();
		}
		public static void m4() {
			System.out.println("정적 매부클래스의 정적 메소드");
		}
	}
}
