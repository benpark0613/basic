package example_09_02_for;

import java.util.Scanner;

public class Sample10 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		// 숫자 n개를 입력받아서 가장 큰 수를 출력하는 프로그램
		int max = Integer.MIN_VALUE;				// max에 int 타입의 최소값을 대입한다. (-2_147_483_648)
		for (int i = 1; i <= 10; i++) {
			System.out.print("숫자를 입력하세요: ");		// 숫자를 n번 입력받아서 읽어온다.
			int number = scan.nextInt();
			
			if (number > max) {						// 입력한 숫자가 max보다 크면 max에 입력한 숫자를 저장한다.
				max = number;
			}
		}
		System.out.print("가장 큰 수: " + max);
	}

}