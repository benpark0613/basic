package example_09_01_if;

public class Sample5 {

	public static void main(String[] args) {
		// 국어, 영어, 수학점수를 입력받아서 총점과 평균을 계산해서 출력한다.
		// 평균이 60점 이상인 경우 "합격입니다" 를 출력하고, 60점 미만은 "불합격입니다" 를 출력한다.
		/*
		 * 출력예시
		 *		국어점수 : 100
		 *		영어점수 : 80
		 *		수학점수 : 90
		 *		총점 : 270
		 *		평균 : 90
		 *		합격여부 : 합격입니다.
		 */
		int korScore = 100;							// 점수입력
		int engScore = 80;
		int mathScore = 90;
		
		int totalScore = 0;							// 총점계산
		totalScore += korScore;
		totalScore += engScore;
		totalScore += mathScore;
		
		int average = totalScore/3;					// 평균
		
		String passResult = "";						// 합격여부
		if (average >= 60) {
			passResult = "합격입니다.";
		} else {
			passResult = "불합격입니다.";
		}
		
		System.out.println("국어점수: " + korScore);	// 결과출력
		System.out.println("영어점수: " + engScore);
		System.out.println("수학점수: " + mathScore);
		System.out.println("총점: " + totalScore);
		System.out.println("평균: " + average);		
	}

}
