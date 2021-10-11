package example_10_08_formatting;

import java.text.DecimalFormat;

public class DecimalFormatSample1 {

	public static void main(String[] args) {
		// 정수나 실수를 지정된 패턴의 문자열로 변환하기
		long amount = 100_000_000_000L;
		
		DecimalFormat df = new DecimalFormat("##,###");
		String text1 = df.format(amount);
		System.out.println(text1);
		
		double number = 12345.67;
		df.applyPattern("##,###.#");
		String text2 = df.format(number);
		System.out.println(text2);
		
		double number2 = 1.0/3.0;
		df.applyPattern("##,###.##");
		String text3 = df.format(number2);
		System.out.println(text3);
		
		double number3 = 123.2400;
		df.applyPattern("##,###.####");
		String text4 = df.format(number3);
		System.out.println(text4);
		
		df.applyPattern("##,###.0000");
		String text5 = df.format(number3);
		System.out.println(text5);
	}
}
