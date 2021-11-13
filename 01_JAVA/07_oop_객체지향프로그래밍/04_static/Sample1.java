package example_09_10_static;

public class Sample1 {

	static int x;		// 정적변수, 클래스변수
	int y;				// 멤버변수, 인스턴스변수
	
	// 정적 메소드는 정적변수는 사용가능하다.
	static void staticMethod() {	// 정적 메소드, 클래스 메소드
		System.out.println(Sample1.x);	// 정적변수 사용가능
		// System.out.println(y);		// 오류, 멤버변수 사용불가능
	}
	
	void instanceMethod() {			// 멤버 메소드, 인스턴스 메소드
		System.out.println(Sample1.x);	// 정적변수 사용가능
		System.out.println(y);			// 멤버변수 사용가능
	}
	
	// 정적 메소드는 다른 정적 메소드는 실행가능하다.
	static void staticMethod2() {	// 정적 메소드, 클래스 메소드
		Sample1.staticMethod();			// 다른 정적 메소드 사용가능
		// instanceMethod();			// 오류, 멤버 메소드 사용불가능
	}
	
	void instanceMethod2() {		// 멤버 메소드, 인스턴스 메소드
		Sample1.staticMethod();			// 정적 메소드 사용가능
		instanceMethod();				// 다른 멤버 메소드 사용가능
	}
}
