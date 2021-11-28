package example_10_07_3_Random;

import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class RandomSample2 {

	public static void main(String[] args) {
		Random random = new Random();
	
		// 중복을 허용하지 않음
		Set<Integer> numbers = new TreeSet<>();
		while (true) {
			if (numbers.size() == 6) {
				break;
			}
			int number = random.nextInt(45) + 1;
			numbers.add(number);
		}
		System.out.println(numbers);
	}
}
