package example_09_07_method;

import java.util.Date;
import java.util.Random;

public class Sample1 {

	// 반환타입X, 매개변수X 메소드 구현하기
	// 시스템의 현재 날짜/시간을 화면에 표시하는 메소드
	void displayCurrentDate() {
		Date now = new Date();
		System.out.println(now);
	}

	// 반환타입O, 매개변수X 메소드 구현하기
	// 1 ~ 6 까지의 숫자 중 임의의 숫자를 반환하는 메소드
	int getRandomNumber() {
		Random random = new Random();
		int number = random.nextInt(45) + 1;
		return number;
	}
	
	// 반환타입O, 매개변수O 메소드 구현하기
	// 국어, 영어, 수학점수를 전달받아서 총점을 반환하는 메소드
	int getTotalScore(int kor, int eng, int math) {
		int total = kor + eng + math;
		return total;
	}
	
	// 반환타입O, 매개변수O 메소드 구현하기
	// 국어, 영어, 수학점수를 전달받아서 평균(실수값)을 반환하는 메소드
	double getAverageScore(int kor, int eng, int math) {
		int total = kor + eng + math;
		return total/3.0;
	}
}
