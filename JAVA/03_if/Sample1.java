package example_09_01_if;

public class Sample1 {

	public static void main(String[] args) {
		// if문
		/*
		 * if (조건식) {
		 * 		수행문;
		 * 		수행문;
		 * 		수행문;
		 * }
		 * 블록내의 수행문은 조건식의 연산결과가 true일 때만 실행된다.
		 */
		
		// 점수가 60점 이상이면 "합격입니다"가 출력되는 프로그램
		int score = 70;
		if (score >= 60) {
			System.out.println("합격입니다");			
		}
		
	}

}
