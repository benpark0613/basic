package example_09_13_modifier;

public class Sample2 {

	public static void main(String[] args) {
		Sample1 s1 = new Sample1();				// 사용가능	// public Sample1() {}						- 완전공개
		Sample1 s2 = new Sample1(10);			// 사용가능	// protected Sample1(int a) {}				- 패키지공개 + 자식에게 공개
		Sample1 s3 = new Sample1(10, 20);		// 사용가능	// Sample1(int a, int b) {}					- 패키지공개
//		Sample1 s4 = new Sample1(10, 20, 30);	// 사용불가능	// private Sample1(int a, int b, int c) {}	- 완전비공개
		
		s1.a = 10;	// 사용가능	// public int a		- 완전공개
		s1.b = 10;	// 사용가능	// protected int b	- 패키지공개 + 자식에게 공개
		s1.c = 10;	// 사용가능	// int c			- 패키지공개
//		s1.d = 10;	// 사용불가	// private int d	- 완전 비공개
		
		s1.method1();	// 사용가능	// public void method1() {...}		- 완전공개
		s1.method2();	// 사용가능	// protected void method2() {...}	- 패키지공개 + 자식에게 공개
		s1.method3();	// 사용가능	// void method3() {...}				- 패키지공개
//		s1.method4();	// 사용불가	// private void method4() {...}		- 완전비공개
	}
}
