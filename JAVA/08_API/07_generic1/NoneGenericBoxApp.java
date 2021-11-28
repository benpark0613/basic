package example_10_05_1_generic;

public class NoneGenericBoxApp {

	public static void main(String[] args) {
		// Food객체를 여러 개 저장하는 NoneGenericBox 객체 생성
		NoneGenericBox foodBox = new NoneGenericBox();
		
		// 생성된 NoneGenericBox 객체에 Food객체 저장하기
		Food food1 = new Food("토마토", 5000);
		Food food2 = new Food("고등어", 12000);
		Food food3 = new Food("치킨", 20000);
		
		// void addItem(Object item) { ... }이 실행된다.
		foodBox.addItem(food1);	// 저장될 때 Object 타입으로 클래스 형변환 된다.
		foodBox.addItem(food2);	// 저장될 때 Object 타입으로 클래스 형변환 된다.
		foodBox.addItem(food3);	// 저장될 때 Object 타입으로 클래스 형변환 된다.

		// Food객체와 다른 타입의 객체를 저장해도 오류가 발생하지 않는다. 타입 안전성이 보장되지 않음
		Contact contact = new Contact("홍길동", "010-1111-2222", "삼성전자");
		foodBox.addItem(contact);	// 정상동작함, Food객체가 아닌 객체도 저장이 된다
		
		// NoneGenericBox 객체에 저장된 Food객체 가져오기
		// Object getItem(int index) { ... }이 실행됨
		Object obj1 = foodBox.getItem(0);
		Object obj2 = foodBox.getItem(1);
		Object obj3 = foodBox.getItem(2);
		// Food 타입으로 강제 형변환한다. 형변환연산자를 꼭 사용해야 한다.
		Food savedFood1 = (Food)obj1;
		Food savedFood2 = (Food)obj2;
		Food savedFood3 = (Food)obj3;
		
		System.out.println(savedFood1.getName() + ", " + savedFood1.getPrice());
		System.out.println(savedFood2.getName() + ", " + savedFood2.getPrice());
		System.out.println(savedFood3.getName() + ", " + savedFood3.getPrice());
	}
}
