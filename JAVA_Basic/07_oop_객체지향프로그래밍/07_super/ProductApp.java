package example_09_15_super;

public class ProductApp {

	public static void main(String[] args) {
		// 할인가격이 있는 Book객체 생성
		Book book1 = new Book(100, "컴퓨터", "이것이자바다", "신용권", "한빛미디어", 35000, 32000);
		// 할인가격이 없는 book객체 생성
		Book book2 = new Book(200, "컴퓨터", "자바의정석", "남궁성", "도우출판사", 30000);
	
		book1.printInfo();
		book2.printInfo();
	}
}
