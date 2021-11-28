package example_09_07_method;

public class Sample3App {

	public static void main(String[] args) {
		// 메소드 중복정의된 객체 생성하기
		Sample3 sample = new Sample3();
		
		// 메소드 실행시 매개변수가 서로 다른 메소드 실행해 보기
		int value1 = sample.plus(10, 20);
		System.out.println(value1);
		
		double value2 = sample.plus(10, 10.2);
		System.out.println(value2);

		int value3 = sample.plus(10, 20, 30);
		System.out.println(value3);
		
		long value4 = sample.plus(1000000000000L, 4561245152125610L);
		System.out.println(value4);
		
		// 결론
		// 메소드 실행시 전달한 값과 동일한 매개변수(타입/갯수)를 갖고 있는 메소드가 실행됨
		// 다양한 덧셈 기능을 하나의 일관된 이름으로 실행함.
		// 비슷한 기능을 하나의 일관된 이름으로 사용하기 때문에 코드의 가독성과 사용성이 높아진다.
	}
	
}
