package example_09_01_if;

public class Sample2 {

	public static void main(String[] args) {
		// if ~ else 문
		/*
		 * if (조건식) {
		 * 		수행문;	// 조건식이 true로 판정되면 실행된다.
		 *		수행문;
		 * } else {
		 * 		수행문;	// 조건식이 false로 판정되면 실행된다.
		 * 		수행문;
		 * }
		 */

		// 점수가 60점 이상이면 "합격입니다."를 출력하고 아니면 "불합격입니다."를 출력하기
		int score = 56;
		if (score >= 60) {
			System.out.println("합격입니다.");
		} else {
			System.out.println("불합격입니다.");			
		}
		
		// 운행거리가 5만km 이상이거나 운행기간이 3년 이상인 경우는 "수리비를 청구합니다."를 출력하고, 아니면 "무상수리합니다"를 출력하기
		int distance = 47_000;
		int year = 4;
		
		if (distance >= 50000 || year >= 3) {
			System.out.println("수리비를 청구합니다.");
		} else {
			System.out.println("무상수리합니다");
		}
		
		// 예금액이 1억원 이상이고, 거래기간이 5년 이상이고, 급여통장이 우리 은행이면 "우수고객입니다." 를 출력하고, 아니면 "일반고객입니다." 를 출력하기
		long balance = 100_000_000;
		int tradeYear = 7;
		boolean hasSalaryAccount = true;
		if (hasSalaryAccount && balance >= 100_000_000 && tradeYear >= 5 ) {
			System.out.println("우수고객입니다.");
		} else {
			System.out.println("일반고객입니다.");
		}
		
	}

}
