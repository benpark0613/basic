package example_09_02_array;

public class Sample1 {

	public static void main(String[] args) {
		// 배열 생성하기
		
		// 정수 5개를 담을 수 있는 배열을 생성함.
		// new int[5];
		
		// 정수가 여러개 저장된 배열을 담는 변수(저장소) numbers를 생성함
		// int[]
		
		// 정수 5개 담을 수 있는 배열을 생성해서, 정수를 여러 개 저장된 배열을 담은 변수 numbers에 그 배열을 저장함.
		// int[] numbers = new int[5];
		
		int[] numbers = new int[5];
		double[] numbers2 = new double[5];
		String[] names = new String[5];
		
		System.out.println("정수 배열에 저장된 값");
		System.out.println("정수배열의 0번째 값: " + numbers[0]);
		System.out.println("정수배열의 1번째 값: " + numbers[1]);
		System.out.println("정수배열의 2번째 값: " + numbers[2]);
		System.out.println("정수배열의 3번째 값: " + numbers[3]);
		System.out.println("정수배열의 4번째 값: " + numbers[4]);
		
		System.out.println("실수 배열에 저장된 값");
		System.out.println("실수배열의 0번째 값: " + numbers2[0]);
		System.out.println("실수배열의 1번째 값: " + numbers2[1]);
		System.out.println("실수배열의 2번째 값: " + numbers2[2]);
		System.out.println("실수배열의 3번째 값: " + numbers2[3]);
		System.out.println("실수배열의 4번째 값: " + numbers2[4]);

		System.out.println("문자열 배열에 저장된 값");
		System.out.println("문자열배열의 0번째 값: " + names[0]);
		System.out.println("문자열배열의 1번째 값: " + names[1]);
		System.out.println("문자열배열의 2번째 값: " + names[2]);
		System.out.println("문자열배열의 3번째 값: " + names[3]);
		System.out.println("문자열배열의 4번째 값: " + names[4]);

	}

}
