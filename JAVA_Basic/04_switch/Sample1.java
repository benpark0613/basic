package example_09_02_switch;

public class Sample1 {

	public static void main(String[] args) {
		// switch 문
		/*
		 * switch (검사대상값) {
		 * 		case 값1:
		 * 			수행문;
		 * 			break;
		 * 		case 값2:
		 * 			수행문;
		 * 			break;
		 *		default
		 * 			수행문;		
		 * }
		 */
		
		// 고객의 등급에 따라서 적립포인트를 계산해서 출력하기
		// 골드등급 - 5% 적립
		// 실버등급 - 2% 적립
		// 브론즈등급 - 1% 적립
		String customerName = "홍길동";
		String customerGrade = "실버";
		int orderPrice = 450_000;
		
		// switch문으로 구현하기
		int point = 0;
		switch(customerGrade) {
			case "골드":
				System.out.println("골드 등급의 회원에 대한 적립포인트를 계산합니다.");
				point = (int)(orderPrice*0.05);
				break;
			case "실버":
				System.out.println("실버 등급의 회원에 대한 적립포인트를 계산합니다.");
				point = (int)(orderPrice*0.02);
				break;
			case "브론즈":
				System.out.println("브론즈 등급의 회원에 대한 적립포인트를 계산합니다.");
				point = (int)(orderPrice*0.01);
				break;
			default :
			
		}
		
		System.out.println("고객명: " + customerName);
		System.out.println("고객등급: " + customerGrade);
		System.out.println("주문금액: " + orderPrice);
		System.out.println("적립포인트: " + point);
	}

}
