package example_10_01_wrapper;

public class WrapperApp {

	public static void main(String[] args) {
		
		// Wrapper 클래스 사용하기
		int a1 = 10;						// a1에는 기본자료형 타입의 정수값 10이 저장되어 있다.
		Integer a2 = new Integer(10); 		// a2는 정수 10을 포함하고 있는 Integer객체의 주소값을 가지고 있다.
		Integer a3 = new Integer("1000");	// a3는 문자열 "1000"을 1000으로 변경해서 포함하고 있는 Integer객체의 주소값을 가지고 있다.
	
		long b1 = 100000000000L;
		long b2 = new Long(100000000000L);
		long b3 = new Long("100000000000");
		
		double c1 = 3.14;
		Double c2 = new Double(3.14);
		Double c3 = new Double ("3.14");
	}
}
