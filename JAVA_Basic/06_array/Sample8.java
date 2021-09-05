package example_09_02_array;

import java.util.Scanner;

public class Sample8 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		// 학생들의 이름, 국어, 영어, 수학 점수를 배열에 저장하고, 성적정보를 출력하시오
		
		String[] names = new String[3];     
		int[][] scores = new int[3][];	
		int savePosition = 0;
		
		while(true) {
			System.out.println("-----------------------------------------------");
			System.out.println("1.조회  2.입력  3.변경  0.종료");
			System.out.println("-----------------------------------------------");
			
			System.out.print("메뉴번호를 입력하세요: ");
			int menuNo = scan.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[성적정보 조회]");
				
				System.out.println("-----------------------------------------------");
				for (int i = 0; i < 3; i++) {
					System.out.println("학생이름: " + names[i]);
					int[] score = scores[i];
					System.out.println("국어점수: " + score[0]);
					System.out.println("영어점수: " + score[1]);
					System.out.println("수학점수: " + score[2]);
					System.out.println("종합점수: " + score[3]);
					System.out.println("평균점수: " + score[4]);
					System.out.println("-----------------------------------------------");
				}
				
			} else if (menuNo == 2) {
				System.out.println("[성적정보 입력]");
				
				if (savePosition < 3) {
					
					// 학생이름과 과목별 점수를 입력받는다.
					System.out.print("학생이름을 입력하세요: ");
					String name = scan.next();
					System.out.print("국어점수를 입력하세요: ");
					int korScore = scan.nextInt();
					System.out.print("영어점수를 입력하세요: ");
					int engScore = scan.nextInt();
					System.out.print("수학점수를 입력하세요: ");
					int mathScore = scan.nextInt();
					
					// 학생이름을 names배열에 저장한다.
					// for문의 수행문 블록이 실행될 때마다 names배열의 0번째, 1번째, 2번째에 학생의 이름이 저장된다.
					names[savePosition] = name;	
					
					// 과목별 점수, 총점, 평균을 저장하는 배열을 생성한다.
					int[] score = new int[5];
					
					// 생성된 배열에 과목별점수, 총점, 평균을 순서대로 저장한다.
					score[0] = korScore;
					score[1] = engScore;
					score[2] = mathScore;
					score[3] = korScore + engScore + mathScore;
					score[4] = score[3]/3;
					
					// 생성된 배열을 2차원 배열에 연결시킨다.
					// for문의 수행문 블록이 실행될 때마다 scores배열의 0번째, 1번째, 2번째에 새로 생성한 배열이 연결(저장)된다.
					scores[savePosition] = score;				
					
					savePosition++;
					System.out.println("### 입력이 완료되었습니다.");
				} else {
					System.out.println("### 더이상 입력할 수 없습니다.");
				}
				
				
			} else if (menuNo == 3) {
				System.out.println("[성적정보 변경]");
				
			} else if (menuNo == 0) {
				System.out.println("[프로그램 종료]");
				System.exit(1);
			}
			System.out.println("\n\n\n");
		}
	}
}
