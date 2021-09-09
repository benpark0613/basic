package example_09_09_constructor;

public class Sample2 {

	// 정수(int number)를 전달받아서 짝수면 true, 홀수면 false (boolean)를 반환하는 메소드
	boolean isEvenNumber (int number) {		// boolean 타입 메소드는 is, has를 많이 사용한다.
		boolean result = false;
		
		if (number%2 == 0) {
			result = true;
		}
		return result;
	}
	
	// 정수배열객체(int[] numbers)를 전달받아서 배열에 저장된 값의 총합(int)을 반환하는 메소드
	int getTotal(int[] numbers) {
		int total = 0;
		
		for (int num : numbers) {
			total += num;
		}
		return total;
	}
	
	// 정수배열객체를 전달받아서 배열에 저장된 값 중에서 가장 큰 값을 반환하는 메소드
	int max(int[] numbers) {
		int max = 0;
		for (int num : numbers) {
			if(num > max) {
				max = num;
			}
		}
		return max;
	}
	
	// 정수배열객체(int[] numbers)와 숫자(int number)를 전달받아서 
	// 배열에 그 숫자가 포함되어 있으면 true, 없으면 false를 반환하는 메소드
	boolean isExist(int[] numbers, int number) {
		boolean isExist = false;
		for (int num : numbers) {
			if (num == number) {
				isExist = true;
				break;
			}
		}
		
		return isExist;
	}
	
	
	// 정수를 전달받아서 그 숫자에 해당하는 구구단을 표시하는 메소드
	void printGugudan(int dan) {
		for (int i = 1; i <= 9; i++) {
			System.out.printf("%d * %d = %d\n", dan, i, dan*i);
		}
		System.out.println();
	}
	
	// 국어, 영어, 수학 점수를 전달 받아서 평균이 60점 이상이면 true, 아니면 false를 반환하는 메소드

	boolean isPassed(int kor, int eng, int math) {
		boolean passed = false;
		
		int average = (kor + eng + math)/3;
		if (average >= 60) {
			passed = true;
		}
		return passed;
	}
	
	
	// 정수를 전달 받아서 그 정수의 모든 약수를 화면에 표시하는 메소드
	
	
	
}
