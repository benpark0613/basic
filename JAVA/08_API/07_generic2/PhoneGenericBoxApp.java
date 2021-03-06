package example_10_05_2_generic;

public class PhoneGenericBoxApp {

	public static void main(String[] args) {
		
		/*
		 * public class PhoneGenericBox<T extends Phone>
		 * 		PhoneGenericBox의 타입파라미터에 지정하는 타입을 제한한다.
		 * 		<T extends Phone>은 T의 자리에 Phone, SmartPhone, FeaturePhone만 지정할 수 있다.
		 */
		PhoneGenericBox<Phone> box1 = new PhoneGenericBox<>();
		PhoneGenericBox<SmartPhone> box2 = new PhoneGenericBox<>();
		PhoneGenericBox<FeaturePhone> box3 = new PhoneGenericBox<>();
		
		// box1은 Phone타입 객체를 전달받는다.
		box1.setItem(new SmartPhone());				// void setItem(Phone item)
		box1.setItem(new FeaturePhone());
		// box1에서 객체를 가져오면 Phone타입의 객체를 반환한다.
		Phone phone1 = box1.getItem();				// Phone getItem()	
		phone1.call("010-1234-8520");
		
		// box2는 SmartPhone타입 객체를 전달받는다.
		box2.setItem(new SmartPhone());				// void setItem(SmartPhone item)
		//box2.setItem(new FeaturePhone());	// 오류 발생, FeaturePhone은 SmartPhone이 아니다.
		// box2에서 객체를 가져오면 SmartPhone타입의 객체를 반환한다.
		SmartPhone phone2 = box2.getItem();			// SmartPhone getItem()
		phone2.call("010-1111-2222");
		phone2.sms("010-1111-2222", "오늘 합정에서 만나자");
		phone2.internet();
		
		// box3는 FeaturePhone타입 객체를 전달받는다.
		//box3.setItem(new SmartPhone());		// 오류 발생, SmartPhone은 FeaturePhone이 아니다.
		box3.setItem(new FeaturePhone());			// void setItem(FeaturePhone item)
		// box3에서 객체를 가져오면 FeaturePhone타입 객체를 반환한다.
		FeaturePhone phone3 = box3.getItem();		// FeaturePhone getItem()
		phone3.call("010-8888-7777");
		phone3.sms("010-8888-7777", "점심먹었냐?");
		
		
		/*
		 * 아래 수행문은 전부 오류가 발생한다.
		 * String, Food, Contact는 Phone의 하위타입이 아니다.
		 */
		//PhoneGenericBox<String> box4 = new PhoneGenericBox<>();  	// 오류 발생
		//PhoneGenericBox<Food> box5 = new PhoneGenericBox<>();		// 오류 발생
		//PhoneGenericBox<Contact> box6 = new PhoneGenericBox<>();	// 오류 발생
	}
}
