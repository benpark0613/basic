package example_09_13_modifier;

public class BookApp2 {

	public static void main(String[] args) {
		
		// Book객체의 주소값을 3개 저장할 수 있는 배열을 생성한다.
		Book[] books = new Book[3];
		
		// 아래의 코드 3회 반복, for문 사용하지 말고 그냥 3번 코딩하세요
		// Book객체를 생성하고, setter 메소드를 사용해서 멤버변수에 책정보를 저장한다.
		// 생성된 Book객체의 주소값을 배열의 n번째에 저장한다.
		Book book1 = new Book();
		book1.setNo(100);
		book1.setTitle("우주의 역사");
		book1.setWriter("스티븐 호킹");
		book1.setPublisher("옥스포드출판사");
		book1.setPrice(50000);
		book1.setDiscountPrice(40000);
		book1.setStock(50);
		books[0] = book1;
		
		Book book2 = new Book();
		book2.setNo(101);
		book2.setTitle("호드의 역사");
		book2.setWriter("쓰랄");
		book2.setPublisher("블리자드출판사");
		book2.setPrice(30000);
		book2.setDiscountPrice(25000);
		book2.setStock(10);
		books[1] = book2;
		
		Book book3 = new Book();
		book3.setNo(102);
		book3.setTitle("코랄의 역사");
		book3.setWriter("짐 레이너");
		book3.setPublisher("스타출판사");
		book3.setPrice(50000);
		book3.setDiscountPrice(40000);
		book3.setStock(50);
		books[2] = book3;
		
		// 향상된 for문을 사용해서 배열에 저장된 책정보를 콘솔에 출력한다.
		// 제목, 저자, 출판사, 가격, 할인가격 정보를 출력한다.
		for (Book book : books) {
			System.out.println(book.getTitle());
			System.out.println(book.getWriter());
			System.out.println(book.getPublisher());
			System.out.println(book.getPrice());
			System.out.println(book.getDiscountPrice());
			System.out.println();
		}
		
		// 배열의 0번째칸이 참조하고 있는 Book객체의 책 제목을 변경하기
		book1.setTitle("자바의정석2판");
		books[0].setTitle("자바의정석2판");
		
		Book book = books[0];
		book.setTitle("자바의정석2판");
		
		// 배열의 0번째칸이 참조하고 있는 Book객체의 할인가격을 출력하기
		book1.setDiscountPrice(25000);
		books[0].setDiscountPrice(25000);
		book.setDiscountPrice(25000);
		
		// 뱌열의 0번째칸이 참조하는 Book객체의 변경된 값 출력하기
		System.out.println("### 배열의 0번째칸이 참조하는 Book객체의 변경된 제목 출력하기");
		System.out.println(book1.getTitle());
		System.out.println(books[0].getTitle());
		System.out.println(book.getTitle());
		
		// 결론 book1, books[0], book은 같은 주소값을 가지고 있다. 같은 객체를 참조하고 있다.
		System.out.println(book1);
		System.out.println(books[0]);
		System.out.println(book);
	}
}
