package example_08_31_var;

public class Sample5 {

	public static void main(String[] args) {
		// 논리값(boolean 값)
		// 두 가지 상태만을 가지는 값을 표현할 때 사용되는 값이다.
		// 예) 합격/불합격, 미혼/기혼, 회원/비회원 ...
		// true와 false는 각각 참/거짓을 표현하는 자바의 예약어다.
		// 불린타입의 변수는 오직 true/false 둘 중 하나의 값만 저장할 수 있다.
		
		boolean passed = true;		// 합격은 true, 불합격은 false
		boolean guest = true;		// 회원은 true, 비회원은 false
		boolean notMarried = true;	// 미혼은 true, 기혼은 false
		boolean hasHouse = false;	// 미소유자 true, 집소유자 false
		
		System.out.println(passed);
		System.out.println(hasHouse);
		
		// 화면에 불린타입의 값과 문자열을 출력했을 때 어떤 것이 불린값인지 구분할 수 없다.
		System.out.println(true);		// true가 출력됨
		System.out.println(false);		// false가 출력됨
		System.out.println("true");		// true가 출력됨
		System.out.println("false");	// false가 출력됨

	}

}
