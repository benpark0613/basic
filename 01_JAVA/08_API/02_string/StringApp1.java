package example_09_29_string;

public class StringApp1 {

	public static void main(String[] args) {
		
		String str = "Initializes a newly created String object so that it represents an empty character sequence.";
		
		// String의 int length()는 문자열의 길이를 반환한다.
		int len = str.length();
		System.out.println("문자열의 총 길이: " + len);
		
		int len2 = "Initializes a newly created".length();
		System.out.println("문자열의 총 길이: " + len2);
		
		// String의 boolean equals(Object o)은 String객체가 가지고 있는 문자열의 내용을 비교해서 내용이 같으면 true를 반환한다.
		// String의 equals(Object o)은 Object클래스의 equals(Object o)를 재정의한 것이다.
		String str1 = "홍길동";
		String str2 = "홍길동";
		String str3 = new String("홍길동");
		String str4 = new String("홍길동");
		
		System.out.println("### String객체의 동일성을 확인해보자");
		System.out.println(str1 == str2);	// 객체의 동일성을 확인하는 코드다.		true 출력됨
		System.out.println(str3 == str4);	// 객체의 동일성을 확인하는 코드다.		false 출력됨
		
		System.out.println("### String객체의 동등성을 확인해보자");
		System.out.println(str1.equals(str2));	// 객체의 동등성을 확인하는 코드다.		true 출력됨
		System.out.println(str3.equals(str4));	// 객체의 동등성을 확인하는 코드다.		true 출력됨
		System.out.println(str1.equals(str3));	// 객체의 동등성을 확인하는 코드다.		true 출력됨
		System.out.println(str2.equals(str4));	// 객체의 동등성을 확인하는 코드다.		true 출력됨
		
		// String의 boolean isEmpty()는 String 객체가 빈 문자열(길이가 0인 문자열)인 경우 true를 반환한다.
		System.out.println("### String객체의 문자열이 빈 문자열인지 확인해보자");
		str1 = "";	// 빈 문자열이다. 길이가 0인 문자열이다.
		str2 = " ";	// 공백문자 하나를 가지고 있는 문자열이다.
		System.out.println(str1.isEmpty());	// true
		System.out.println(str2.isEmpty());	// false
		
		// String의 boolean isBlank()는 String 객체가 빈 문자열이거나 공백만 포함하고 있는 문자열인 경우 true를 반환한다.
		// java 11부터 지원되는 API
		System.out.println(str1.isBlank()); // true
		System.out.println(str2.isBlank()); // true
		
		// String의 boolean contains(CharSequence str)은 String 객체가 포함하고 있는 문자열에 지정된 문자열을 포함하고 있는지 여부를 반환한다.
		System.out.println("### String객체의 문자열에 지정된 문자열이 있는가?");
		str1 = "서울,부산,광주,경기,인천";
		boolean result1 = str1.contains("부산");
		boolean result2 = str1.contains("울산");
		System.out.println(result1);
		System.out.println(result2);
		
		// String의 String substring(int beginIndex)는 String 객체가 포함하고 있는 문자열에서 지정된 시작위치부터 문자열의 끝에
		// 해당하는 문자열로 구성된 새로운 문자열을 생성해서 반환한다.
		// String의 String substring(int beginIndex, int endIndex)는 String 객체가 포함하고 있는 문자열에시 지정된 범위내의
		// 문자열로 구성된 새로운 문자열을 생성해서 반환한다.
		System.out.println("### String객체의 문자열에 대한 부분 문자열 생성하기");
		str1 = "abcdefghijklmn";
		System.out.println(str1.substring(3));			// defghijklmn
		System.out.println(str1.substring(3, 8));		// defgh
		
		String 주민등록번호 = "010304-1234567";
		System.out.println("생일: " + 주민등록번호.substring(2, 6));
		
		// String의 String toUpperCase()와 String toLowerCase()는 각각 String객체가 포함하고 있는 문자열에 대해서 대문자와 소문자로
		// 구성된 새로운 문자열를 생성해서 반환한다.
		System.out.println("### String객체의 문자열애 대해서 대문자/소문자로만 구성된 문자열을 얻기");
		str1 = "Good Morning!";
		String result3 = str1.toUpperCase();
		String result4 = str1.toLowerCase();
		System.out.println("원래문자열: " + str1);
		System.out.println("대문자로 구성된 새 문자열: " + result3);
		System.out.println("소문자로 구성된 새 문자열: " + result4);
		
		// String의 replace(CharSequence target, CharSequence replacement)은 String객체가 포함하고 있는 문자열에 대해서 
		// 첫번째 표현식에 해당하는 문자들을 찾아서 두번째 인자에 해당하는 문자열로 대체된 새로운 문자열을 생성해서 반환한다.
		System.out.println("### String객체의 문자열에 대해서 문자을 찾아서 새 문자로 구성된 문자열을 얻기");
		str1 = "나는 자바 개발자입니다. 자바 프로그램을 만듭니다.";
		result3 = str1.replace("자바", "파이썬");
		System.out.println("원본 문자열: " + str1);
		System.out.println("문자열이 변경된 새 문자열: " + result3);
		
		// String의 boolean startsWith(String prefix)와  boolean endsWith(String suffix)는 각각
		// String 객체가 포함하고 있는 문자열이 특정 글자로 시작되는지, 특정 글자로 끝나는지 여부를 반환한다.
		System.out.println("### String객체의 문자열에 대해서 특정 문자로 시작하는지, 특정 문자로 끝나는지를 확인해보자");
		str1 = "http://www.daum.net";
		str2 = "www.naver.com";
		str3 = "google.com";
		System.out.println(str1.startsWith("http://"));	// true
		System.out.println(str2.startsWith("http://"));	// false
		System.out.println(str3.startsWith("http://"));	// false
		System.out.println(str1.endsWith("com"));		// false
		System.out.println(str2.endsWith("com"));		// true
		System.out.println(str3.endsWith("com"));		// true
		
		// String의 int indexOf(String text)와 int lastIndexof(String text)는 문자열 객체가 포함하고 있는 문자열에서 
		// 지정된 문자열이 처음으로 등장하는 위치와 마지막으로 등장하는 위치를 반환한다.
		// 지정됨 문자열이 존재하지 않으면 -1을 반환한다.
		System.out.println("### String객체의 문자열에 대해서 특정 문자열이 어느 위치에 있는지 확인하기");
		String[] phones = {"02)123-4567", "051)345-907", "031)0980-2541"};
		for (String phone : phones) {
			System.out.println(phone + ", " + phone.indexOf(")"));
			System.out.println("국번: " + phone.substring(0, phone.indexOf(")")));
		}

		// String의 String[] split(String regex)은 String 객체가 포함하고 있는 문자열에서 대해서
		// 지정된 구분문자로 문자열을 자르고, 잘린 문자들을 배열에 담아서 반환한다.
		// String text = "김유신,강감찬,이순신";		
		// String[] names = text.split(",");			names = {"김유신", "강감찬", "이순신"};
		
		// str1에서 이번 강의에 신청한 사람들이다.
		// 신청자수와 신청한 사람의 이름을 화면에 출력하기
		System.out.println("### String객체의 문자열이 ,로 구분된 텍스트일 때 그 데이터를 분석해서 처리하기");
		str1 = "김유신,강감찬,이순신,유관순,안중근";
		String[] names = str1.split(",");
		int count = names.length;
		System.out.println("전체 참가자수: " + count + "명");
		for (String name : names) {
			System.out.println("참가자 이름: " + name);
		}
		
		// String의 String trim()은 String 객체가 포함하고 있는 문자열에 대해서 문자열의 좌/우에 포함된 불필요한 공백이 제거된
		// 새로운 문자열을 생성해서 반환한다.
		System.out.println("### String객체의 문자열에서 좌우 공백이 제거된 문자열을 얻기");
		str1 = "           안녕하세요                            반갑습니다.                           ";
		result3 = str1.trim();
		System.out.println("원본 문자열 ["+str1+"]");
		System.out.println("새 문자열 ["+result3+"]");
		
		
		// String의 정적 메소드 String valueOf(int value), String valueOf(long value), String valueOf(double value),
		//                   String valueOf(boolean value), String valueOf(char value) 들은 
		// 입력값에 대한 문자열을 생성해서 반환한다.
		System.out.println("### String 클래스의 valueOf(값)는 입력으로 전달받은 값에 대한 문자열을 생성한다");
		String value1 = String.valueOf(100);					// 100				-> "100"
		String value2 = String.valueOf(1000000000000000L);		// 1000000000000000 -> "1000000000000000"
		String value3 = String.valueOf(3.141592);				// 3.141592         -> "3.141592"
		String value4 = String.valueOf('A');					// 'A'              -> "A"
		String value5 = String.valueOf(true); 					// true				-> "true"
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		System.out.println(value4);
		System.out.println(value5);
		
		/*
		 * 기본자료형과 문자열간의 데이터 변환
		 * 		기본자료형을 문자열로 변환하기
		 * 			String 문자열 = String.valueOf(1234);
		 * 			String 문자열 = String.valueOf(1000000000000L);
		 * 			String 문자열 = String.valueOf(true);
		 * 			String 문자열 = String.valueOf('A');
		 * 
		 * 		문자열을 기본자료형값으로 변환하기
		 * 			int 정수 = Integer.parseInt("1234");
		 * 			long 정수 = Long.parseLong("100000000000000000");
		 * 			double 실수 = Double.parseDouble("3.141592");
		 * 			boolean 논리값 = Boolean.parseBoolean("true");
		 * 	
		 */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
