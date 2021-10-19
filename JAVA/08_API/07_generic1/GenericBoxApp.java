package example_10_05_1_generic;

public class GenericBoxApp {

	public static void main(String[] args) {
		
		// 제네릭이 지원되는 Box객체 생성하기
		// 객체를 생성할 때 Generic<T>의 T를 구체적인 타입으로 지정한다.
		GenericBox<Food> foodBox = new GenericBox<>();
		
		Food food1 = new Food("토마토", 5000);
		Food food2 = new Food("고등어", 12000);
		Food food3 = new Food("치킨", 20000);
		
		// void addItem(T item) { ... }이 
		// void addItem(Food item) { ... }으로 실행된다.
		foodBox.addItem(food1);
		foodBox.addItem(food2);
		foodBox.addItem(food3);
		
		// 타입파라미터에 지정된 타입만 저장된다. 타입안전성이 보장됨
		//Contact contact = new Contact("홍길동", "010-1234-5678", "삼성전자");
		//foodBox.addItem(contact); // 오류 발생
		
		// 저장된 값을 가져올 때 형변환 연산자를 사용할 필요가 없다.
		// T getItem(int index) { ... }이
		// Food getItem(int index) { ... }로 실행된다.
		Food savedFood1 = foodBox.getItem(0);
		Food savedFood2 = foodBox.getItem(1);
		Food savedFood3 = foodBox.getItem(2);
		
		System.out.println(savedFood1.getName() + ", " + savedFood1.getPrice());
		System.out.println(savedFood2.getName() + ", " + savedFood2.getPrice());
		System.out.println(savedFood3.getName() + ", " + savedFood3.getPrice());
		
	}
}
