package example_09_07_method;

public class Sample1App {

	public static void main(String[] args) {
		
		// Sample1 설계도로 객체 생성하기
		Sample1 sample1 = new Sample1();
		
		// 반환값X, 매개변수X 메소드 실행
		// 참조변수.메소드명();
		// 생성된 객체의 기능 실행하기
		sample1.displayCurrentDate();	// 메소드를 호출한다. 실행한다. (메소드를 호출할 때는 () 를 해야한다.)
		
		// 반환값O, 매개변수X 메소드 실행
		// 반환타입 변수 = 참조변수.메소드명();
		for (int i = 1; i <= 6; i++) {
			int value = sample1.getRandomNumber();
			System.out.println("주사위 숫자: " + value);				
		}
		
		// 반환값O, 매개변수O 메소드 실행
		// 반환타입 변수 = 참조변수.메소드명(입력값, 입력값, ...);
		int totalScore = sample1.getTotalScore(100, 80, 90);
		System.out.println("총점: " + totalScore);
		
		totalScore = sample1.getTotalScore(10, 80, 50);
		System.out.println("총점: " + totalScore);
		
		totalScore = sample1.getTotalScore(20, 30, 50);
		System.out.println("총점: " + totalScore);
		
		totalScore = sample1.getTotalScore(50, 80, 70);
		System.out.println("총점: " + totalScore);
		
		totalScore = sample1.getTotalScore(90, 80, 60);
		System.out.println("총점: " + totalScore);
		
		// 국어, 영어, 수학점수를 전달해서 평균점수를 반환하는 기능 실행
		double average = sample1.getAverageScore(80, 70, 90);
		System.out.println("평균점수: " + average);
	}
	
}
