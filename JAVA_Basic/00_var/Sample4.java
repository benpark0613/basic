package example_08_31_var;

public class Sample4 {

	public static void main(String[] args) {
		// 텍스트를 저장하는 변수
		
		// 한 글자를 저장하는 변수
		// char는 한 글자를 저장하는 변수의 자료형이다.
		// 정보시스템용 애플리케이션에서 한 글자로된 값은 거의 존재하지 않기 때문에, char는 거의 사용되지 않는다.
		char value1 = 'A';		// 글자 'A'가 변수에 저장된다.
		char value2 = 65;		// 아스키코드표에서 65번째 글자가 변수에 저장된다.
		char value3 = '\u0041';	// 유니코드문자표에서 0x0041번째 글자가 변수에 저장된다.
//		char value4 = 'AA';		// 오류, 두 글자 이상을 저장할 수 없다.
//		char value5 = '';		// 오류, 빈 문자를 저장할 수 없다. (공백이 아님.)
		char value6 = ' ';		// 공백은 저장 가능. 공백도 하나만 가능.
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		
		// 문자열(여러 글자)을 저장하는 변수
		// 자바는 문자열(여러 글자)을 저장하는 데이터타입을 제공하지 않는다.
		// 문자열(여러 글자)를 저장하는 String을 제공한다.
		String value7 = "";						// 빈 문자도 저장할 수 있다.
		String value8 = "A";					// 한 글자도 저장할 수 있다.
		String value9 = "안녕하세요";				// 여러 글자도 저장할 수 있다.
		String value10 = "          ";			// 한 개 이상의 공백도 저장할 수 있다.
		String value11 = "안녕하세요 반갑습니다.";		// 공백을 포함하는 여러 글자를 저장할 수 있다.
//		String value12 = 'A';					// 오류, 'A'는 char 타입의 변수에만 저장할 수 있다.
//		char value13 = "A"						// 오류, "A"는 String 타입의 변수에만 저장할 수 있다.

		System.out.println(value8);
		System.out.println(value9);
		System.out.println(value11);
		System.out.println(value11.replace("안녕", "**"));
		System.out.println(value11.length());
		
	}

}
