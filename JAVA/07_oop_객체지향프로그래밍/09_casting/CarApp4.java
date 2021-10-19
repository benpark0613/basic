package example_09_16_casting;

public class CarApp4 {

	public static void main(String[] args) {
		/*
		 * 클래스 형변환 활용하기
		 * 		+ 실제로 사용할 기능이 구현되어 있는 클래스 타입의 변수 혹은 배열객체를 생성하면
		 * 		  특별한 형변환없이 기능을 실행할 수 있다.
		 */		
		
		// 요구사항
		// 모든 자동차들의 출발기능, 정지기능, 운전기능을 실행해주세요
		// 모든 SUV자동차들의 출발기능, 정지기능, 운전기능, 오프로드기능을 실행해주세요
		
		// car배열에 저장된 자동차들의 출발기능, 정지기능, 운전기능 실행하기
		System.out.println("### 모든 자동차의 출발기능, 정지기능, 운전기능 실행하기");
		Car[] cars = new Car[3];
		cars[0] = new Car();
		cars[1] = new SUV();
		cars[2] = new Palisade();
		
		for (Car car : cars) {
			System.out.println(car.getClass().getName() + "차량의 출발/정지/운전기능 실행하기");
			car.start();
			car.stop();
			car.drive();
		}
		
		// suvs배열에 저장된 자동차들의 오프로드기능 실행하기
		System.out.println("### 모든 SUV 자동차의 오프로드 기능 실행하기");
		SUV[] suvs = new SUV[3];
		suvs[0] = new SUV();
		suvs[1] = new Palisade();
		suvs[2] = new SUV();
		
		for (SUV suv : suvs) {
			System.out.println(suv.getClass().getName() + "차량의 오프로드 기능 실행하기");
			suv.driveOffRoad();
		}
		
		
	}
}
