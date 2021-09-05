package example_09_02_for;

import java.util.Scanner;

public class Sample12 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		// 숫자 n을 입력받아서 모든 수의 총합과 평균을 출력하는 프로그램
		int total = 0;
		int average = 0;
		
		System.out.print("입력할 숫자의 갯수를 입력하세요: ");
		int limit = scan.nextInt();
		
		for (int i = 1; i <= limit; i++) {		
			System.out.print("숫자를 입력하세요: ");
			int number = scan.nextInt();
			
			total += number;
		}
		average = total/limit;
		System.out.print("총합: " + total + ", 갯수: " + limit + ", 평균: " + average);
	}

}