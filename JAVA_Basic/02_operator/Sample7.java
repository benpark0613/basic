package example_08_31_operator;

public class Sample7 {

	public static void main(String[] args) {
		// 논리 연산자
		// && || !
		// 논리 연산자의 연산결과는 언제나 boolean 값이다.
		// 논리 연산자에 참여하는 값은 boolean 타입의 값이거나, 혹은 연산결과가 boolean값인 연산식만 가능하다.
		
		// && 연산자는 좌항의 값이 false 면 우항의 값을 확인하지 않고 논리식의 연산결과를 false로 판정한다.
		// || 연산자는 좌항의 값이 true면 우항의 값을 확인하지 않고 논리식의 연산결과를 true로 판정한다.
		// 따라서 아래와 같은 코드는 잘못된 코드다.
		/*
		 * boolean result = a > b || x > ++y;
		 * int num = z + y;
		 * 
		 * a > b 의 연산결과가 true인 경우 y값을 1 증가시키는 동작이 실행되지 않는다.
		 * a > b 의 연산결과가 false인 경우 y값을 1 증가시킨다.
		 * 따라서 num의 결과는 논리식에서 a > b 의 연산결과에 따라서 다른 값이 산출될 수 있다. 
		 * 
		 * 위의 코드는 아래와 같이 변경해야 한다.
		 * ++y;
		 * boolean result = a > b || x > y;
		 * int num = z + y;
		 */
		
		System.out.println(true && true);
		System.out.println(true && false);
		System.out.println(false && false);	// Dead code
		
		System.out.println(true || true);	// Dead code
		System.out.println(true || false);	// Dead code
		System.out.println(false || false);
		
		System.out.println(!true);
		System.out.println(!false);
		
		
	}

}
