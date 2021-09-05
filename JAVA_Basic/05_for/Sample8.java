package example_09_02_for;

import java.util.Scanner;

public class Sample8 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		
		// 두수를 입력받아서 더 큰 수를 출력하는 프로그램
		
		System.out.print("첫번째 숫자를 입력하세요: ");
		int num1 = scan.nextInt();
				
		System.out.print("두번째 숫자를 입력하세요: ");
		int num2 = scan.nextInt();
		
		if (num1 > num2) {
			System.out.println(num1);
		} else {
			System.out.println(num2);
		}
		
	}
	

}
