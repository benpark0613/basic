package example_08_31_operator;

public class Sample2 {

	public static void main(String[] args) {
		// + 연산자
		// 숫자와 숫자에 대해서는 덧셈연산을 수행한다.
		// 문자열과 함께 사용될 때는 무조건 이어붙이기로 수행한다.
		
		// 숫자 + 숫자 = 더하기
		// ? + 문자열 = 이어붙이기
		// 문자열 + ? = 이어붙이기
		// 문자열 + 문자열 = 이어붙이기
		
		System.out.println(1 + 3);						// 4
		// 1 + 3 > 4 
		
		System.out.println(1 + "abc");					// 1abc
		// 1 + "abc" > "1abc"
		
		System.out.println(1 + 3 + "abc");				// 4abc
		// 1 + 3 + "abc > 4 + "abc" > "4abc"
		
		System.out.println("abc" + 1 + 3);				// abc13
		// "abc" + 1 + 3 > "abc1" + 3 > "abc13" 
		
		System.out.println(1 + 3 + "abc" + 1 + 3);		// 4abc13
		// 1 + 3 + "abc" + 1 + 3 > 4 + "abc" + 1 + 3 > "4abc" + 1 + 3 > "4abc1" + 3 > "4abc13"
	
		System.out.println(1 + 3 + "abc" + (1 + 3));	// 4abc4
		// 1 + 3 + "abc" + (1 + 3) > 1 + 3 + "abc" + 4 > 4 + "abc" + 4 > "4abc" + 4 > "4abc4"
	}
}
