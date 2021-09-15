package example_08_31_operator;

public class Sample4 {

	public static void main(String[] args) {
		
		// 학생들의 점수를 확인하고, 총점과 평균을 계산하기
		// 자바는 명사적인 사고를 요구한다. 다른 함수형 프로그램언어는 동사적인 사고를 요구한다.
		// 명사? 관리해야할 값이라 생각하면 된다. 학생들의 점수, 총점, 평균 > 3개의 변수가 필요하다.
		
		int score1 = 80;
		int score2 = 50;
		int score3 = 90;
		int score4 = 80;
		int score5 = 100;
		int score6 = 40;
		int score7 = 70;
		
		int totalScore = 0;
		double average = 0.0;
		
		// 총점 구하기
		// totalScore = score1 + score2 + score3 + score4 + score5 + score6 + score7;
		totalScore += score1;	// totalScore : 80
		totalScore += score2;	// totalScore : 130
		totalScore += score3;	// totalScore : 220
		totalScore += score4;	// totalScore : 300
		totalScore += score5;	// totalScore : 400
		totalScore += score6;	// totalScore : 440
		totalScore += score7;	// totalScore : 510		
		System.out.println("totalScore의 값: " + totalScore);
		
		// 평균 구하기
		average = totalScore/7.0;
		System.out.println("average의 값: " + average);

		
		
	}

}
