package example_09_02_for;

import java.util.Scanner;

public class Sample13 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		// 숫자 2개를 입력받아서 두 수의 중간값을 출력하느 프로그램
		System.out.print("첫번째 숫자를 입력하세요: ");
		int num1 = scan.nextInt();		
		System.out.print("두번째 숫자를 입력하세요: ");
		int num2 = scan.nextInt();
		
		int count = (num2 - num1) + 1;
		
		if (count%2 == 1) {
			int median = (num2 + num1)/2;
			System.out.println("중간값: " + median);
		} else {
			int median1 = (num2 + num1)/2;
			int median2 = ((num2 + num1)/2) + 1;
			System.out.println("중간값: " + median1 + ", " + median2);
		}
		
	}

}
