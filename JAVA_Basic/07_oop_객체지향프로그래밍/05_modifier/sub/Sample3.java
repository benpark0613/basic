package example_09_13_modifier.sub;

import example_09_13_modifier.Sample1;

public class Sample3 {

	public static void main(String[] args) {
		Sample1 s1 = new Sample1();				// 사용가능	// 다른 패키지에서는 완전 공개된 것만 사용가능하다.
//		Sample1 s2 = new Sample1(10);			// 사용불가능
//		Sample1 s3 = new Sample1(10, 20);		// 사용불가능
//		Sample1 s4 = new Sample1(10, 20, 30);	// 사용불가능
		
		s1.a = 10;	// 사용가능	// public int a;	- 완전공개
//		s1.b = 10;	// 사용불가	// protected int b;	- 패키지 + 자식클래스에 공개
//		s1.c = 10;	// 사용불가	// int c;			- 패키지공개
//		s1.d = 10;	// 사용불가	// private int d;	- 완전비공개
		
		s1.method1();	// 사용가능	// public void method1() {...}		- 완전공개
//		s1.method2();	// 사용불가능	// protected void method2() {...}	- 패키지 + 자식클래스에 공개
//		s1.method3();	// 사용불가능	// void method3() {...}				- 패키지공개
//		s1.method4();	// 사용불가능	// private void method4() {...}		- 완전비공개
	}
}
