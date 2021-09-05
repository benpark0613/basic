package example_08_31_casting; // casting (형변환)

public class Sample1 {

	public static void main(String[] args) {
		
		// 자동형변환
		// 프로그램 실행시 JVM이 자동으로 처리한다.
		// 크기가 더 큰 자료형의 변수에 저장될 때 자동형변환이 일어난다.
		int num = 100;
		double value1 = num;		// double value1 = 100 -> double value1 = 100.0
									//        double   int           double   double 
		
		System.out.println(num);
		System.out.println(value1);
		
		// 연산을 수행하기 전에 같은 데이터타입으로 변환한 다음 연산이 수행된다.
		// 연산에 참여한 값의 데이터타입들 중에서 가장 정밀도가 높거나 크기가 더 큰 자료형으로 자동형변환이 일어난다.
		System.out.println(3/10);		// 정수/정수  3/10              = 0
		System.out.println(3/10.0);		// 정수/실수  3/10.0 > 3.0/10.0 = 0.3
		System.out.println(3.0/10);		// 실수/정수  3.0/10 > 3.0/10.0 = 0.3
		System.out.println(3.0/10.0);	// 실수/실수  3.0/10.0          = 0.3
		
	}
	
}
