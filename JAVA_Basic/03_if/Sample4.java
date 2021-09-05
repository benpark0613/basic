package example_09_01_if;

public class Sample4 {

	public static void main(String[] args) {
		// 구매금액에 따른 적립포인트 계산하기
		// 100만원 이상 구매시 구매금액의 5%를 포인트로 적립한다.
		// 50만원 이상 구매시 구매금액의 2%를 포인트로 적립한다.
		// 30만원 이상 구매시 구매금액의 1%를 포인트로 적립한다.
		int orderPrice = 800_000;
		int point = 0;
		if (orderPrice >= 1_000_000) {				// 같은 변수를 선언해도 오류가 안나네?
			point = (int)(orderPrice*0.05);			// 변수의 범위 (scope) : 변수는 변수의 범위를 가진다.
		} else if (orderPrice >= 500_000) {			// 자바에서 변수의 범위는 블록 {} 이다.
			point = (int)(orderPrice*0.02);			// 같은 범위 내에 같은 변수를 선언하면 안된다.
		} else if (orderPrice >= 300_000) {
			point = (int)(orderPrice*0.01);			
		}											
		System.out.println("적립포인트: " + point);		
	}												

}

/*
 * 식별자 정의 관례 
 * 
 * 식별자는 영어 대/소문자, 숫자, _를 사용할 수 있다.
 * 식별자는 숫자로 시작할 수 없다.
 * 식별자가 2개 이상의 단어로 구성된 경우, 두번째 단어부터 첫글자 대문자 (camel expression)
 * 
 * 클래스 이름은 대문자로 시작, 나머지는 소문자로 시작
 * 클래스 이름에는 명사를 사용한다.
 * 
 * 변수 이름은 소문자로 시작한다. 
 * 변수 이름에는 명사를 사용한다.
 * 변수 이름은 반드시 구체적으로 해야한다!
 * point, score, price, name, age ...
 * 불린타입 변수는 is, has와 같은 접두사를 붙일 수 있다.
 * hasHouse, isPassed, isExists, isEmpty ...
 */