package example_08_31_casting;

public class Sample3 {
	public static void main(String[] args) {
		
		//문자와 정수 간의 형변환
		char value1 = 65;	// 문자타입의 변수에는 아스키코드표 65번째 문자가 대입된다.
		int value2 = 'B';	// 정수타입의 변수에는 아스키코드표에서 문자 'B'의 순번이 대입된다.

		System.out.println(value1);
		System.out.println(value2);
		
		// 문자열과 숫자 간의 형변환
		// 자바는 문자열과 숫자 간의 형변환은 지원하지 않는다.
//		int value3 = (int) "1234"; // 오류
//		String value4 = (String) 1234; // 오류
		
		
	}
}
