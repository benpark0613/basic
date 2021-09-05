package example_09_01_if;

public class Sample8 {

	public static void main(String[] args) {
		// 국어, 영어, 수학점수에 대한 평균점수가 60점 이상이면 합격이다. 90점 이상이면 장학금 지급대상이다.
		// 단, 한 과목이라도 40점 미만이면 과락으로 인한 불합격이다.
		
		int korScore = 50;
		int engScore = 50;
		int mathScore = 50;
		
		/* 1. 한 과목이라도 과락이 있는지 먼저 확인한다.
		 * 2. 과락이 있으면 불합격 처리한다.
		 * 3. 과목 과락이 아닌 경우, 총점과 평균을 계산한다.
		 * 4. 평균이 60점 이상이면 합격으로 판정하고, 합격자중에서 평균이 90점 이상이면 장학금 지급대상으로 판단한다.
		 * 5. 평균이 60점 미만인 경우 불합격으로 판정한다.
		 */

		if (korScore < 40 || engScore < 40 || mathScore < 40) {
			System.out.println("과락으로 인한 불합격입니다.");
		} else {
			int totalScore = korScore + engScore + mathScore;
			int average = totalScore/3;
			
			if (average >= 60) {
				System.out.println("합격입니다.");
				if (average >= 90) {
					System.out.println("장학금 지급대상으로 선정되었습니다.");
				}
			} else {
				System.out.println("평균점수 미달로 불합격입니다.");
			}
		}
		
		
		
//		int totalScore = korScore + engScore + mathScore;
//		int average = totalScore/3;
		
//		if (korScore >= 40 && engScore >= 40 && mathScore >= 40) {
//			if (average >= 60) {
//				System.out.println("합격입니다.");
//			} if (average >= 90) {
//				System.out.println("장학금 지급대상입니다.");
//			}
//		} else {
//			System.out.println("불합격입니다.");
//		}
		
	}

}
