package example_10_13_exception;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ExampleSampleERR {
	static Scanner scan = new Scanner(System.in);
	
	/**
	 * 키보드 입력을 읽어서 정수값으로 반환하는 메소드
	 * @return 키보드로 입력한 숫자
	 */
	static int readInt() {
		int number = 0;
		
		return number;
	}

	public static void main(String[] args) {
		// 예외처리하기
		System.out.println("### 두 수를 입력받아서 곱셈한 결과를 출력하는 프로그램");
		
		System.out.print("첫번째 숫자 입력: ");
		int value1 = ExampleSampleERR.readInt();
		
		System.out.print("두번째 숫자 입력: ");
		int value2 = ExampleSampleERR.readInt();
		
		long result = value1*value2;
		
		System.out.println("곱셈한 결과 : " + result);
	}
}
