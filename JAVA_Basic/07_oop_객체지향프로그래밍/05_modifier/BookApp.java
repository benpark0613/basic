package example_09_13_modifier;

import java.util.Date;

public class BookApp {

	public static void main(String[] args) {
		
		Book book1 = new Book();
		
		// book1 참조변수가 참조하는 객체의 no, title, writer, publisher, price, discount, stock, pubDate 변경하기
//		book1.no = 100;					// no 				멤버변수 완전 비공개 - 접근 불가
//		book1.title = "자바의정석";			// title 			멤버변수 완전 비공개 - 접근 불가
//		book1.writer = "남궁성";			// writer 			멤버변수 완전 비공개 - 접근 불가
//		book1.publisher = "도우출판사";		// publisher 		멤버변수 완전 비공개 - 접근 불가
//		book1.price = 30000;			// price 			멤버변수 완전 비공개 - 접근 불가
//		book1.discountPrice = 27000;	// discountPrice 	멤버변수 완전 비공개 - 접근 불가
//		book1.stock = 3;				// stock 			멤버변수 완전 비공개 - 접근 불가
//		book1.pubDate = new Date();		// pubDate 			멤버변수 완전 비공개 - 접근 불가
		
		// book1 참조변수가 참조하는 객체의 setter 메소드를 사용해서 객체의 멤버변수 값 변경하기
		book1.setNo(100);
		book1.setTitle("자바의정석");
		book1.setWriter("남궁성");
		book1.setPublisher("도우출판사");
		book1.setPrice(30000);
		book1.setDiscountPrice(27000);
		book1.setStock(3);
		book1.setPubDate(new Date());
		
		// book1 참조변수가 참조하는 객체의 멤버변수에 저장된 값 조회하기
//		System.out.println(book1.no);
//		System.out.println(book1.title);
//		System.out.println(book1.writer);
//		System.out.println(book1.publisher);
//		System.out.println(book1.price);
//		System.out.println(book1.discountPrice);
//		System.out.println(book1.stock);
//		System.out.println(book1.pubDate);
		
		// book1 참조변수가 참조하는 객체의 getter 메소드를 사용해서 객체의 멤버변수 값 조회하기
		System.out.println(book1.getNo());
		System.out.println(book1.getTitle());
		System.out.println(book1.getWriter());
		System.out.println(book1.getPublisher());
		System.out.println(book1.getPrice());
		System.out.println(book1.getDiscountPrice());
		System.out.println(book1.getStock());
		System.out.println(book1.getPubDate());

	
	}
}
