package example_10_07_3_Random;

import java.util.Random;

public class RandomSample1 {
	
	public static void main(String[] args) {
		
		System.out.println("### Math.random() 사용해보기");
		// Math.random()			0.0 <= x 값의 범위 < 1.0
		for (int i = 1; i <= 5; i++) {
			double randomNumber = Math.random();
			System.out.println(randomNumber);
		}
		
		Random random = new Random();
		System.out.println("### Random객체의 nextDouble() 사용해보기");
		// Random객체의 nextDouble()	0.0 <= x 값의 범위 < 1.0
		for (int i = 1; i <= 5; i++) {
			double randomNumber = random.nextDouble();
			System.out.println(randomNumber);
		}
		
		System.out.println("### Random객체의 nextInt() 사용해보기");
		// Random객체의 nextInt()		int의 최소값 <= x 값의 범위 < int의 최대값
		for (int i = 1; i <= 5; i++) {
			int randomNumber = random.nextInt();
			System.out.println(randomNumber);
		}
		
		System.out.println("### Random객체의 nextInt(int bound) 사용해보기");
		// Random객체의 nextInt(int bound)	0 <= 값의 범위 < bound				bound = 6	0,1,2,3,4,5
		// Random객체의 nextInt(int bound)	0 + 1 <= 값의 범위 < bound + 1		bound = 6	1,2,3,4,5,6
		for (int i = 1; i <= 20; i++) {
			int randomNumber = random.nextInt(10) + 1;
			System.out.println(randomNumber);
		}
	}
}
