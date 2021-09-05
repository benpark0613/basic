package example_09_02_for;

public class Sample4 {

	public static void main(String[] args) {
		// for문 안에서 조건문(if문) 사용하기
		
		// 1~10까지의 정수의 합계를 계산하기
		int sum = 0;
		for (int i = 1; i <= 10; i++) {	
			sum += i;
		}
		System.out.println("합계: " + sum);
		
		// 1~10까지의 정수 중에서 짝수의 합계를 계산하기
		int evenSum = 0;
		int oddSum = 0;
		for (int i = 1; i <= 10; i++) {
			if (i%2 == 0) {
				evenSum += i;	
			} else {
				oddSum += i;
			}
		}
		System.out.println("짝수의 합계: " + evenSum);
		System.out.println("홀수의 합계: " + oddSum);
	}

}
