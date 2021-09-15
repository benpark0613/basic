package example_08_31_operator;

public class Sample6 {

	public static void main(String[] args) {
		// 비교 연산자
		// >  >=  <  <=  ==  !=
		// 비교 연산자의 연산 결과는 언제나 boolean 타입의 값이다.
		
		// 운행거리
		int distance = 30000;
		// 운행거리에 따른 무상수리 기준
		int freeFixDistance = 30000;
		
		// 유상수리 여부 판정하기
		boolean result = distance > freeFixDistance;
		System.out.println("유상수리 여부: " + result);
		
		System.out.println(1000 == 1000);
		System.out.println(1000 != 1000);
		System.out.println(2000 == 1000);
		System.out.println(2000 != 1000);
		
		
	}

}
