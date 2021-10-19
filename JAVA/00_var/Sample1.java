package example_08_31_var;

public class Sample1 {
	public static void main(String[] args) {
			// 변수 정의하기
			/*
			 * 국어점수,		수학점수,		영어점수,		총점,			평균을 저장하는 변수 만들기
			 * 정수			정수	  		정수     		정수  		실수
			 * int			int			int			int			double
			 * korScore		mathScore	engScore	totalScore	averageScore
			 */
			
			// 변수(값을 담는 저장소) 생성하기
			int korScore; // 정수를 저장하는 저장소를 메모리에 생성하고, 그 저장소의 이름을 korScore로 지정함.
			int mathScore;
			int engScore;
			int totalScore;
			double averageScore;
			
			// 변수의 초기화 - 변수에 값을 대입하는 것
			//			 - 초기화된 변수만 출력, 연산 등에 사용할 수 있다.
			// 생성된 변수(값은 저장하는 저장소)에 값을 대입(저장)하기
			korScore = 100; // = 같다가 아니라 "대입연산자!" > 오른쪽에 값을 왼쪽에 대입한다.
			mathScore = 80; // 같다는 "=="
			engScore = 80;  // 연산자에는 순서가 있다. 대입연산자는 우선순위가 가장 나중이다.
			
			// 변수에 저장된 값 사용하기
			// 변수에 저장된 값을 화면에 출력하기
			System.out.println("국어, 수학, 영어점수 출력하기");
			System.out.println(korScore);
			System.out.println(mathScore);
			System.out.println(engScore);
			// System.out.println(totalScore);		// 값이 들어있지 않은 변수는 사용할 수 없다.
			// System.out.println(averageScore);	// 값이 들어있지 않은 변수는 사용할 수 없다.
			
			// 변수에 저장된 값을 연산에 활용하기
			totalScore = korScore + mathScore + engScore;
			averageScore = totalScore/3;
			
			// 변수에 저장된 값을 화면에 출력하기
			System.out.println("총점, 평균 출력하기");
			System.out.println(totalScore);
			System.out.println(averageScore);
			
		}

}
