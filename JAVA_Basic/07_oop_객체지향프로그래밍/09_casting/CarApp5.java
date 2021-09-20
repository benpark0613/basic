package example_09_16_casting;

public class CarApp5 {

	public static void main(String[] args) {
		/*
		 * 클래스 형변환 활용하기
		 * 		+ 생성된 객체가 클래스형변환 되어서 관리되고 있지만, 
		 * 		  그 객체를 사용할 때는 그 객체의 모든 기능을 사용할 수 있다.
		 * 		  (instanceof 연산자를 사용하면 참조변수가 참조하는 객체가 실제로 어떤 객체인지 조사할 수 있다.)
		 * 		  문법
		 * 				참조변수 instanceof 클래스명
		 * 					참조변수가 참조하는 객체가 지정된 클래스타입의 객체면 true를 반환하고. 아니면 false를 반환한다. 
		 */		
		
		Car car1 = new Car();
		Car car2 = new SUV();
		Car car3 = new Palisade();
		Car car4 = new RacingCar();
		
		System.out.println("### car1이 참조하는 객체는 Car객체인가? " + (car1 instanceof Car));
		System.out.println("### car1이 참조하는 객체는 SUV객체인가? " + (car1 instanceof SUV));
		System.out.println("### car1이 참조하는 객체는 RacingCar객체인가? " + (car1 instanceof RacingCar));
		System.out.println("### car1이 참조하는 객체는 Palisade객체인가? " + (car1 instanceof Palisade));
		
		System.out.println("### car2이 참조하는 객체는 Car객체인가? " + (car2 instanceof Car));
		System.out.println("### car2이 참조하는 객체는 SUV객체인가? " + (car2 instanceof SUV));
		System.out.println("### car2이 참조하는 객체는 RacingCar객체인가? " + (car2 instanceof RacingCar));
		System.out.println("### car2이 참조하는 객체는 Palisade객체인가? " + (car2 instanceof Palisade));
		
		System.out.println("### car3이 참조하는 객체는 Car객체인가? " + (car3 instanceof Car));
		System.out.println("### car3이 참조하는 객체는 SUV객체인가? " + (car3 instanceof SUV));
		System.out.println("### car3이 참조하는 객체는 RacingCar객체인가? " + (car3 instanceof RacingCar));
		System.out.println("### car3이 참조하는 객체는 Palisade객체인가? " + (car3 instanceof Palisade));
		
		System.out.println("### car4이 참조하는 객체는 Car객체인가? " + (car4 instanceof Car));
		System.out.println("### car4이 참조하는 객체는 SUV객체인가? " + (car4 instanceof SUV));
		System.out.println("### car4이 참조하는 객체는 RacingCar객체인가? " + (car4 instanceof RacingCar));
		System.out.println("### car4이 참조하는 객체는 Palisade객체인가? " + (car4 instanceof Palisade));
	}
}
