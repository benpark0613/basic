package example_09_23_Interface;

public class CarApp {

	public static void main(String[] args) {
		// 구현클래스는 인터페이스의 자식이다.
		// 인터페이스 타입의 참조변수로 자식 객체를 참조할 수 있다.
		Car car1 = new Sonata();
		Car car2 = new Genesis();
		
		car1.start();
		car1.speedUp();
		car1.speedDown();
		int car1Speed = car1.getCurrentSpeed();
		System.out.println("car1의 현재속도: " + car1Speed);
		car1.stop();
		
		car2.start();
		car2.speedUp();
		car2.speedDown();
		int car2Speed = car2.getCurrentSpeed();
		System.out.println("car2의 현재속도: " + car2Speed);
		car2.stop();
	}
	
}
