package example_09_15_super;

public class Product {
	// 속성, 멤버변수, 인스턴스변수, 필드, 프로퍼티
	private int no;
	private int price;
	private int discountPrice;
	
	public Product() {}
	
	public Product (int no, int price) {
		// this.no = no;
		// this.price = price;
		// this.discountPrice = price;
		// 이 클래스로 생성된 객체의 생성자 메소드 중에서 Product(int, int, int) 생성자 메소드를 실행한다.
		this(no, price, price);
	}
	
	public Product (int no, int price, int discountPrice) {
		this.no = no;
		this.price = price;
		this.discountPrice = discountPrice;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}
	
	public void printInfo() {
		System.out.println("상품번호: " + no);
		System.out.println("상품가격: " + price);
		System.out.println("할인가격: " + discountPrice);		
	}
}
