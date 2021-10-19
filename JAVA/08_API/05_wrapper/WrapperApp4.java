package example_10_01_wrapper;

public class WrapperApp4 {

	public static void main(String[] args) {
		
		// Wrapper 클래스의 parseXXX(문자열) 메소드
		/*
		 * 문자열을 기본자료형 타입의 값으로 변환하는 정적 메소드
		 * 		int			Integer.parseInt(String text)
		 * 		long		Long.parseLong(String text)
		 * 		double		Double.parseDouble(String text)
		 * 		boolean		Boolean.parseBoolean(String text)
		 */
		
		System.out.println("### 문자열을 int 타입의 정수값으로 변환하기");
		int value1 = Integer.parseInt("12345");
		// int value2 = Integer.parseInt("12_345");		// "12_345" 	오류 발생, 자리수를 나타내는 _문자를 허용하지 않음
		// int value3 = Integer.parseInt("12345.6");	// "12345.6"	오류 발생, 정수변환하기 때문에 소수점값을 허용하지 않음
		// int value4 = Integer.parseInt(" 12345");		// " 12345"		오류 발생, 공백문자를 허용하지 않음
		// int value5 = Integer.parseInt("12,345");		// "12,345"		오류 발생, 자리수를 나타내는 ,문자를 허용하지 않음
		
		System.out.println(value1);						// 1번째 경우만 숫자로 변환가능한 유효한 문자열이다.
		
		System.out.println("### 문자열을 double 타입의 실수값으로 반환하기");
		double value6 = Double.parseDouble("123.45");	// 실수로 변환하기 떄문에 소수점값을 허용한다.
		double value7 = Double.parseDouble("123.");		// 소수점만 표시하고, 소수점 이하 값이 없어도 상관없다.
		double value8 = Double.parseDouble("123");		// 정수형의 문자열도 상관없다.
		
		System.out.println(value6);
		System.out.println(value7);
		System.out.println(value8);
		
		/*
		 * java.lang.NumberFormatException
		 * 		숫자형식의 문자열이 아닌 값을 숫자로 변환할 때 발생하는 오류다.
		 */
	}
}
