package example_09_07_method;

public class Sample3 {

	// 메소드 중복정의
	// 하나의 클래스에 같은 이름의 메소드를 여러개 정의하는 것
	// 메소드 중복정의 조건 : 매개변수의 갯수가 다를 것, 매개변수의 타입이 다를 것, 매개변수의 타입별 순서가 다를 것
	// 사용 이유 : 유사한 기능은 같은 이름으로 통일성 있게 정의하자.
	// 			 매개변수의 타입이나 갯수만 다르고, 비슷한 기능을 수행하는 것도 일관된 하나의 이름으로 정의하자.
	//			 객체에 구현된 비슷한 기능을 사용하기 쉬워진다.
	
	double plus(int x, double y) {
		System.out.println("int + double");
		double value = x + y;
		return value;
	}
	
	double plus(double x, int y) {
		System.out.println("int + double");
		double value = x + y;
		return value;
	}
	
	int plus(int x, int y) {
		System.out.println("int + int");
		int value = x + y;
		return value;
	}
	
	int plus(int x, int y, int z) {
		System.out.println("int + int + int");
		int value = x + y + z;
		return value;
	}
	
	long plus(long x, long y) {
		System.out.println("long + long");
		long value = x + y;
		return value;
	}
	
	long plus(long x, long y, long z) {
		System.out.println("long + long + long");
		long value = x + y + z;
		return value;
	}
	
	double plus(double x, double y) {
		System.out.println("double + double");
		double value = x + y;
		return value;
	}
	
	double plus(double x, double y, double z) {
		System.out.println("double + double + double");
		double value = x + y + z;
		return value;
	}

//  매개변수 이름만 다르면 안된다.
//	double plus(double a, double b, double c) {
//		System.out.println("double + double + double");
//		double value = x + y + z;
//		return value;
//	}
}
