package example_09_06_class;

import java.util.Date;

public class BookApp {

	public static void main(String[] args) {
		// Book 클래스(설계도)로 객체 생성하기
		// 1. Book 클래스로 생성된 객체의 주소값을 담는 참조변수를 정의한다.
		// 2. Book 클래스로 객체를 생성해서 참조변수에 주소값을 대입한다.
		// 3. 주소값을 가지고 있는 참조변수를 이용해서 생성된 객체의 필드에 접근하다.
		
		// Book 클래스로 생성된 객체의 주소값을 저장하는 참조변수 정의
		Book book1;
		Book book2;
		Book book3;
		
		// new 키워드를 사용해서 Book객체를 생성하고, 각각의 참조변수에 객체의 주소값을 저장하기
		book1 = new Book();
		book2 = new Book();
		book3 = new Book();
		
		// 각각의 참조변수에 저장되어 있는 주소값 확인하기
		System.out.println("첫번째 책: " + book1);	// example_09_06_class.Book@5aaa6d82 5aaa6d82: 해쉬값
		System.out.println("두번째 책: " + book2);	// 자바에서 객체의 주소값은 알 수 없다. 객체의 일련번호(해쉬값)만 알려준다.
		System.out.println("세번째 책: " + book3);
		
		// 각각의 참조변수로 객체 사용하기
		book1.no = 100;
		book1.genre = "컴퓨터";
		book1.title = "자바의 정석";
		book1.writer = "남궁성";
		book1.publisher = "도우출판사";
		book1.price = 35000;
		book1.stock = 5;
		book1.pubDate = new Date();
		
		book2.no = 200;
		book2.genre = "시";
		book2.title = "근근";
		book2.writer = "박근성";
		book2.publisher = "도우너출판사";
		book2.price = 55000;
		book2.stock = 700;
		book2.pubDate = new Date();
		
		book3.no = 300;
		book3.genre = "우주";
		book3.title = "시간의 역사";
		book3.writer = "스티븐 호킹";
		book3.publisher = "옥스포드출판사";
		book3.price = 100_000;
		book3.stock = 1_000;
		book3.pubDate = new Date();
		
		// 참조변수로 객체의 필드에 저장도니 값을 조회해서 출력해보기
		System.out.println(book1.title);
		System.out.println(book2.title);
		System.out.println(book3.title);
		
	}
}
