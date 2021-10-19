package example_09_23_Interface;

public class Genesis implements Car {

	private int speed;
	
	@Override
	public void start() {
		System.out.println("제네시스를 출발시킨다.");
		speed = 20;
	}
	
	@Override
	public void stop() {
		System.out.println("제네시스를 정지시킨다.");
		speed = 0;
	}
	
	@Override
	public void speedUp() {
		System.out.println("제네시스의 속도를 높힌다.");
		speed += 10;
		if (speed > Car.MAX_SPEED) {
			speed = Car.MAX_SPEED;
		}
	}
	
	@Override
	public void speedDown() {
		System.out.println("제네시스의 속도를 낮춘다.");
		speed -= 10;
		if (speed < Car.MIN_SPEED) {
			speed = Car.MIN_SPEED;
		}
	}
	
	@Override
	public int getCurrentSpeed() {
		System.out.println("제네시스의 현재 속도를 반환한다.");
		return speed;
	}
	
}
