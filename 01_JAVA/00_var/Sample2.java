package example_08_31_var;

public class Sample2 {

	public static void main(String[] args) {
		/*
		 * 상품가격 구매수량 적립포인트를 계산해서 출력하기
		 * 상품가격은 35000원이다.
		 * 구매수량은 3개다.
		 * 포인트적립률은 총구매금액의 3%다.
		 * 
		 * 화면에 상품가격, 구매수량, 총구매금액, 적립포인트를 출력하기
		 */
		
		// 변수의 생성 및 초기화하기
		int price = 35000;
		int amount = 3;
		// 총구매금액을 계산해서 변수에 저장하기
		int totalPrice = price * amount;
		double pointDepositRate = 0.03;
		// 적립포인트를 계산해서 변수에 저장하기
		double depositPoint = totalPrice * pointDepositRate;
		
		// 변수에 저장된 값 출력하기
		System.out.println(price);
		System.out.println(amount);
		System.out.println(totalPrice);
		System.out.println(depositPoint);
		
//		int productPrice;
//		int purchaseQuantity;
//		int totalPurchaseAmount;
//		double earnPoint;
//		
//		productPrice = 35000;
//		purchaseQuantity = 3;
//		
//		System.out.println(productPrice);
//		System.out.println(purchaseQuantity);
//		
//		totalPurchaseAmount = productPrice * purchaseQuantity;
//		earnPoint = totalPurchaseAmount * 0.03;
//		
//		System.out.println(totalPurchaseAmount);
//		System.out.println(earnPoint);
	}

}
