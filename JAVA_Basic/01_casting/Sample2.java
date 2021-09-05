package example_08_31_casting;

public class Sample2 {

	public static void main(String[] args) {
		// 수동형변환
		// 데이터의 손실이 발생하는 방향으로의 형변환은 JVM이 자동으로 형변환을 수행하지 않는다.
		// 개발자가 데이터 손실이 발생하더라도 형변환하겠다는 의사표시를 반드시 해야 한다.
		
		// 실수타입의 값을 정수형 변수에 저장하는 것은 데이터의 손실이 발생하는 방향으로의 형변환이다.
		// 형변환 연산자로 변환할 데이터타입을 지정해야 한다.
		int average = (int) 81.5; //형변환 연산자
		System.out.println(average);
		
		// 아래와 같이 int 범위를 초과하는 값을 int 타입으로 수동형변환하는 것은 잘못된 형변환이다. 
		int value1 = (int) 100000000000L; 
		System.out.println(value1); // value1에는 1215752192 이 들어있음.
		
		int korScore = 100;
		int engScore = 80;
		int mathScore = 70;
		int subjectCount = 3;
		int totalScore = korScore + engScore + mathScore;
		double averageScore1 = totalScore/subjectCount;				// 83.0 < 자동형변환 < 83 < 250/3
		double averageScore2 = (double) (totalScore/subjectCount);	// 83.0 < (double)83 < (250/3) 
		double averageScore3 = (double) totalScore/subjectCount;	// 83.3333 < 250.0/3.0 < 자동형변환 < 250.0/3 < (double)250/3
		double averageScore4 = totalScore/(double) subjectCount;	// 83.3333 < 250.0/3.0 < 자동형변환 < 250/3.0 < 250/(double)3
		
		System.out.println(averageScore1);	// 83.0
		System.out.println(averageScore2);	// 83.0
		System.out.println(averageScore3);	// 83.3333
		System.out.println(averageScore4);	// 83.3333
		
	}

}
