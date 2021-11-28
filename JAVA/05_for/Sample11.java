package example_09_02_for;

import java.util.Scanner;

public class Sample11 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		
		// 숫자 2개를 입력받아서 두 수의 평균을 출력하는 프로그램
		System.out.print("숫자를 입력하세요: ");
		int num1 = scan.nextInt();
		System.out.print("숫자를 입력하세요: ");
		int num2 = scan.nextInt();

		int average = (num1 + num2)/2;
		System.out.print("두 수의 평균은 " + average + " 입니다.");
		
	}

}
