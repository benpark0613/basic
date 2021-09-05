package example_08_31_operator;

public class Sample1 {

	public static void main(String[] args) {
		// 산술연산자
		// + - * / %
		
		// 나머지 연산자를 이용해서 세자리 숫자의 각 자리수의 합 구하기
		int number = 234;
		
		// 일의 자리수 구하기
		int value1 = number%10;		// 234%10 = 4
		System.out.println(value1); // + - 는 떨어뜨려서, * / 는 떨어뜨려서 적는게 관례다.
		
		// 십의 자리수 구하기
		number = (number - value1)/10;	// (234-4)/10 = 23
		int value2 = number%10;			// 23%10 = 3
		System.out.println(value2);
		
		// 백의 자리수 구하기
		int value3 = (number - value2)/10;	// (23-3)/10 = 2
		System.out.println(value3);
		
		// 일의 자리, 십의 자리, 백의 자리 숫자들의 합 출력하기
		System.out.println(value1 + value2 + value3);
	}
}
