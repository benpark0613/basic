package example_09_01_if;

public class Sample3 {
	
	public static void main(String[] args) {
	
		// if ~ else if ~ else ~ if else 문
		// 검사할 조건이 여러 가지인 경우 사용되는 조건문이다.
		
		// 시험점수에 맞는 학점을 출력하는 프로그램
		/*
		 * 4.6 이상		"A+"
		 * 4.0 ~ 4.5	"A"
		 * 3.6 ~ 3.9	"B+"
		 * 3.0 ~ 3.5	"B"
		 * 2.6 ~ 2.9	"C+"
		 * 2.0 ~ 2.5	"C"
		 * 1.6 ~ 1.9	"D+"
		 * 1.0 ~ 1.5	"D"
		 * 0.9 이하		"F"
		 */

		double score = 3.8;

		// if문을 사용해서 구현하기
		/*
		if (score >= 4.6) {
			System.out.println("A+");
		}
		if (score >= 4.0 && score <= 4.5) {
			System.out.println("A");
		}
		if (score >= 3.6 && score <= 3.9) {
			System.out.println("B+");
		}
		if (score >= 3.0 && score <= 3.5) {
			System.out.println("B");
		}
		if (score >= 2.6 && score <= 2.9) {
			System.out.println("C+");
		}
		if (score >= 2.0 && score <= 2.5) {
			System.out.println("C");
		}
		if (score >= 1.6 && score <= 1.9) {
			System.out.println("D+");
		}
		if (score >= 1.0 && score <= 1.5) {
			System.out.println("D");
		}
		if (score <= 0.9) {
			System.out.println("F");
		}
		*/
		
		// if ~ else if ~ else if ~ else 를 사용해서 구현하기
		if (score >= 4.6) {
			System.out.println("A+");
		} else if (score >= 4.0) {
			System.out.println("A");
		} else if (score >= 3.6 ) {
			System.out.println("B+");
		} else if (score >= 3.0) {
			System.out.println("B");
		} else if (score >= 2.6) {
			System.out.println("C+");
		} else if (score >= 2.0) {
			System.out.println("C");
		} else if (score >= 1.6) {
			System.out.println("D+");
		} else if (score >= 1.0) {
			System.out.println("D");
		} else {
			System.out.println("F");
		}
		
	}
}
