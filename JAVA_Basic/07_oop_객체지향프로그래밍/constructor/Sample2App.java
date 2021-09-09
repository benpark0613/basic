package example_09_09_constructor;

public class Sample2App {

	public static void main(String[] args) {
		
		Sample2 sample = new Sample2();

		boolean value1 = sample.isEvenNumber(100); 
		boolean value2 = sample.isEvenNumber(15); 
		System.out.println("100: " + value1);
		System.out.println("15: " + value2);
		
		int[] numbers1 = {10, 20, 30, 40, 50};
		int[] numbers2 = {6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
		
		int value3 = sample.getTotal(numbers1);
		int value4 = sample.getTotal(numbers2);
		System.out.println(value3);
		System.out.println(value4);
		
		int value5 = sample.max(new int[] {5, 0, 6, 4, 9, 8});
		System.out.println("최대값: " + value5);
		
		int[] numbers3 = {3, 6, 9, 2, 56, 8, 12};
		boolean value6 = sample.isExist(numbers3, 4);
		System.out.println("존재하는가? " + value6);
		
		sample.printGugudan(3);
		
		boolean value7 = sample.isPassed(70, 50, 90);
		System.out.println("합격여부: " + value7);
	}
}
