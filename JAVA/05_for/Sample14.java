package example_09_02_for;

import java.util.Scanner;

public class Sample14 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		// 숫자를 입력받아서 해당 숫자에 대한 구구단을 출력하는 프로그램
		System.out.print("숫자를 입력하세요: ");
		int dan = scan.nextInt();
	
		for (int i = 1; i < 10; i++) {
			System.out.println(dan + "*" + i + "=" + (dan*i));
		}
	}
}
