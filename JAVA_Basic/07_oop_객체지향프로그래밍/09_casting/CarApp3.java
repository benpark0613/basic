package example_09_16_casting;

public class CarApp3 {

	public static void main(String[] args) {
		/*
		 * 클래스 형변환 활용하기
		 * 		+ 부모타입의 배열로 다양한 자식타입객체를 저장할 수 있다.
		 * 		  (배열에 저장되는 객체의 종류들을 제한할 수 있다.)
		 */			

		// 각종 자동차 객체를 저장할 수 있는 배열을 생성하기
		Car[] carArray1 = new Car[5];
		carArray1[0] = new Car();
		carArray1[1] = new SUV();
		carArray1[2] = new RacingCar();
		carArray1[3] = new Palisade();
		carArray1[4] = new Palisade();
		
		// 각종 SUV 객체를 저장할 수 있는 배열을 생성하기
		SUV[] carArray2 = new SUV[5];
		carArray2[0] = new SUV();
		carArray2[1] = new Palisade();
		carArray2[2] = new Palisade();
		//carArray2[1] = new Car();			// 오류, SUV클래스의 하위 클래스타입 객체가 아님
		//carArray2[0] = new RacingCar();	// 오류, SUV클래스의 하위 클래스타입 객체가 아님
		

	}
}
