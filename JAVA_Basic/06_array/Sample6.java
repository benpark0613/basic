package example_09_02_array;

import java.util.Scanner;

public class Sample6 {

	public static void main(String[] args) {
		// 학생이름, 국어점수, 영어점수, 수학점수를 입력받아서 배열에 저장하고,
		// 학생별 총점, 평균을 계산해서 출력하시오.
		// 출력예)	김유신	100	100	100	300	100
		//			강감찬	80	70	80	230	75	
		
		Scanner scan = new Scanner(System.in);
		
		// 학생이름, 국어점수, 영어점수, 수학점수를 저장하는 배열을 정의하기
		String[] names = new String[5];
		int[] korScores = new int[5];
		int[] engScores = new int[5];
		int[] mathScores = new int[5];
		
		// 학생이름, 국어점수, 영어점수, 수학점수를 각각 입력받아서 해당 배열에 순서대로 저장한다.(0부터 시작하는 index를 사용한다.)
		for (int i = 0; i < names.length; i++) {
			System.out.print("이름을 입력하세요: ");
			String name = scan.next();	// 문자열 입력받기
			System.out.print("국어점수를 입력하세요: ");
			int korScore = scan.nextInt();
			System.out.print("영어점수를 입력하세요: ");
			int engScore = scan.nextInt();
			System.out.print("수학점수를 입력하세요: ");
			int mathScore = scan.nextInt();
			
			names[i] = name;
			korScores[i] = korScore;
			engScores[i] = engScore;
			mathScores[i] = mathScore;
		}
		
		// 학생이름, 국어점수, 영어점수, 수학점수를 출력한다. 각 점수에 대한 총점과 평균을 계산해서 출력한다.(0부터 시작하는 index를 사용한다.)
		for (int i = 0; i < names.length; i++) {
			String name = names[i];
			int korScore = korScores[i];
			int engScore = engScores[i];
			int mathScore = mathScores[i];
			int totalScore = korScore + engScore + mathScore;
			int average = totalScore/3;
			
			System.out.println(name + "\t" + korScore + "\t" + engScore + "\t" + mathScore + "\t" + totalScore + "\t" + average);
		}
		scan.close();
	}

}
