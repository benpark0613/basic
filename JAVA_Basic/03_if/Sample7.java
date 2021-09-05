package example_09_01_if;

public class Sample7 {

	public static void main(String[] args) {

		// 국어, 영어, 수학점수의 평균이 60점 이상이면 합격이다. 단, 평균이 90점 이상이면 장학금을 지급한다.
		int korScore = 100;
		int engScore = 90;
		int mathScore = 100;
		int totalScore = korScore + engScore + mathScore;
		int average = totalScore/3;
		
		// 내포된 if문을 사용하지 않는 경우
		if (average >= 60) {
			System.out.println("합격입니다.");
		} else {
			System.out.println("불합격입니다.");
		}
		
		if (average >= 90) {
			System.out.println("장학금 지급 대상으로 선정되었습니다.");	// 불필요한 로직, 불합격인 경우에도 장학금 대상여부를 판단하니까.
		}
		
		//내포된 if문을 사용한 경우
		if (average >= 60) {
			System.out.println("합격입니다.");
			if (average >= 90) {
				System.out.println("장학금 지급 대상으로 선정되었습니다");
			}
		} else {
			System.out.println("불합격입니다.");
		}
		
	}

}
