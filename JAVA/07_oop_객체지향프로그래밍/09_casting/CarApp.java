package example_09_16_casting;

public class CarApp {

	public static void main(String[] args) {
		// 클래스 형변환이 발생하지 않음
		// 생성한 객체의 타입과 참조하는 변수의 타입이 동일하다.
		System.out.println("### Car객체를 Car타입의 참조변수로 참조");
		Car car1 = new Car();
		car1.start();
		car1.drive();
		car1.speedUp();
		car1.speedDown();
		car1.stop();
		// car1 참조변수로 Car객체의 공개된 모든 속성과 공개된 모든 기능을 사용할 수 있다.
		
		System.out.println("### SUV객체를 SUV타입의 참조변수로 참조");
		SUV suv1 = new SUV();
		suv1.start();			// Car객체의 기능
		suv1.speedUp();			// Car객체의 기능
		suv1.drive();			// Car객체의 기능
		suv1.speedDown();		// Car객체의 기능
		suv1.driveOffRoad();	// SUV객체의 기능
		suv1.stop();			// Car객체의 기능
		// suv1 참조변수로 SUV객체의 공개된 모든 속성과 공개된 모든 기능을 사용할 수 있다.
		// suv1 참조변수로 상위객체인 Car객체의 공개된 모든 속성과 모든 기능을 사용할 수 있다.
		
		System.out.println("### RacingCar객체를 RacingCar타입의 참조변수로 참조");
		RacingCar racingCar1 = new RacingCar();
		racingCar1.start();		// Car객체의 기능
		racingCar1.speedUp();	// Car객체의 기능	
		racingCar1.race();		// RacingCar객체의 기능
		racingCar1.speedDown();	// Car객체의 기능
		racingCar1.stop();		// Car객체의 기능
		// racingCar 참조변수로 Racingcar객체의 공개된 모든 속성과 공개된 모든 기능을 사용할 수 있다.
		// racingCar 참조변수로 상위객체인 Car객체의 공개된 모든 속성과 모든 기능을 사용할 수 있다.

		System.out.println("### Palisade객체를 Palisade타입의 참조변수로 참조");
		Palisade palisade1 = new Palisade();
		palisade1.start();				// Car객체의 기능
		palisade1.drive();				// Car객체의 기능
		palisade1.speedUp();			// Car객체의 기능
		palisade1.changeDriveMode();	// Palisade객체의 기능
		palisade1.driveOffRoad();		// SUV객체의 기능
		palisade1.speedDown();			// Car객체의 기능
		palisade1.stop();				// Car객체의 기능
		// palisade1 참조변수로 Palisade객체의 공개된 모든 속성과 공개된 모든 기능을 사용할 수 있다.
		// palisade1 참조변수로 SUV객체의 공개된 모든 속성과 모든 기능을 사용할 수 있다.
		// palisade1 참조변수로 상위객체인 Car객체의 공개된 모든 속성과 모든 기능을 사용할 수 있다.
		
		// 클래스 형변환이 발생한다.
		// 생성한 객체의 타입과 참조하는 변수의 타입이 서로 다름
		// 생성한 객체의 타입은 하위 클래스 타입이고, 참조하는 변수의 타입은 상위 클래스 타입이다.
		System.out.println("### SUV객체를 상위 클래스인 Car타입의 참조변수로 참조");
		Car suv2 = new SUV();
		suv2.start();				// Car객체의 기능
		suv2.speedUp();				// Car객체의 기능
		suv2.drive();				// Car객체의 기능
		suv2.speedDown();			// Car객체의 기능
		//suv2.driveOffRoad();		// SUV객체의 기능	// 오류발생
		((SUV)suv2).driveOffRoad();	// 실제 생성된 SUV객체를 참조하도록 강제형변환 할 수 있다.
		suv2.stop();				// Car객체의 기능
		// Car타입의 suv2 참조변수로 SUV객체를 참조하면 SUV객체의 공개된 모든 속성과 기능을 사용할 수 없다.
		// 실제로 생성한 객체는 SUV객체지만, 참조변수가 Car객체를 참조하고 있기 때문에 Car객체의 공개된 모든 속성과 기능만 사용할 수 있다.
		// SUV객체의 공개된 속성과 공개된 기능을 사용하기 위해서는 형변환 연산자를 이용해서 SUV객체를 참조하도록 강제형변환할 수 있다.
		// 단, 강제형변환을 하더라도 suv2의 참조변수의 참조값이 변하는 것은 아니다.
		
		System.out.println("### Palisade객체를 상위 클래스인 Car타입의 참조변수로 참조");
		Car palisade2 = new Palisade();
		palisade2.start();							// Car객체의 기능
		palisade2.drive();							// Car객체의 기능
		palisade2.speedUp();						// Car객체의 기능
		//palisade2.changeDriveMode();				// Palisade객체의 기능	// 오류발생
		((Palisade)palisade2).changeDriveMode();	// 생성된 Palisade객체를 참조하도록 강제형변환 할 수 있다.
		//palisade2.driveOffRoad();					// SUV객체의 기능		// 오류발생
		((SUV)palisade2).driveOffRoad();			// 생성된 Palisade객체가 포함하고 있는 SUV객체를 참조하도록 강제형병환 할 수 있다.
		palisade2.speedDown();						// Car객체의 기능
		palisade2.stop();							// Car객체의 기능
		// Car타입의 palisade2 참조변수로 Palisade객체를 참조하면 Palisade객체의 공개된 모든 속성과 기능을 사용할 수 없다.
		// 실제로 생성한 객체는 Palisade객체지만, 참조변수가 Car객체를 참조하고 있기 때문에 Car객체의 공개된 모든 속성과 기능만 사용할 수 있다.
		// Palisade객체와 SUV객체의 공개된 속성과 공개된 기능을 사용하기 위해서는 형변환 연산자를 이용해서 
		// Palisade객체 혹은 SUV객체를 참조하도록 강제형변환할 수 있다.
		// 단, 강제형변환을 하더라도 palisade2의 참조변수의 참조값이 변하는 것은 아니다.
	}
}
