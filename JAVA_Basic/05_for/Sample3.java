package example_09_02_for;

public class Sample3 {

	public static void main(String[] args) {
		// 정수 1부터 5까지의 합을 구해서 화면에 출력하기
		
//		int sum = 0;
//		sum += 1;
//		sum += 2;
//		sum += 3;
//		sum += 4;
//		sum += 5;
//		System.out.println("합계: " + sum);
		
		int sum = 0;
		for (int i = 1; i <= 5; i++) {
			sum += i;
		}
		System.out.println("합계: " + sum);
	}

}
