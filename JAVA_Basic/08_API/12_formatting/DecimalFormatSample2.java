package example_10_08_formatting;

import java.text.DecimalFormat;
import java.text.ParseException;

public class DecimalFormatSample2 {

	public static void main(String[] args) throws ParseException {
		
		String text1 = "12345";
		String text2 = "12,345";
		
		// 숫자 외의 문자가 없는 경우
		int number1 = Integer.parseInt(text1); 
		// int number2 = Integer.parseInt(text2); 오류발생 java.lang.NumberFormatException 발생
		
		// 숫자 외의 문자를 전부 삭제한 다음 숫자로 바꾸기
		text2 = text2.replace(",", "");
		int number2 = Integer.parseInt(text2);
		
		// 숫자로 변경된 값으로 사칙연산 수행해보기
		System.out.println(number1 + number2);
		
		String text3 = "12,345,678";
		DecimalFormat df = new DecimalFormat("##,###");
		// Number는 Byte, Short, Integer, Long, Float, Double의 부모클래스다.
		Number number = df.parse(text3);
		int value = number.intValue();
		System.out.println(value);
		
	} 
	
}
