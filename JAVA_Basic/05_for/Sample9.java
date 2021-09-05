package example_09_02_for;

import java.util.Scanner;

public class Sample9 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		// 숫자 3개를 입력받아서 가장 큰 수를 출력하는 프로그램
		System.out.println("첫번째 숫자를 입력하세요: ");
		int firstNumber = scan.nextInt();		
		System.out.println("두번째 숫자를 입력하세요: ");
		int secondNumber = scan.nextInt();
		System.out.println("세번째 숫자를 입력하세요: ");
		int thirdNumber = scan.nextInt();
		
		int max = firstNumber;		// 첫번째 숫자를 가장 큰 수라고 가정한다.

		if (max < secondNumber) { 	// 두번째 숫자가 첫번째 숫자보다 크면 max에 두번째 숫자를 저장한다.
			max = secondNumber;
		}
		if (max < thirdNumber) {	// 세번째 숫자가 max보다 크면 max에 세번째 숫자를 저장한다.
			max = thirdNumber;
		}
		System.out.println("가장 큰 수:" + max); // max에 저장된 값을 출력한다.
		
	}

}
