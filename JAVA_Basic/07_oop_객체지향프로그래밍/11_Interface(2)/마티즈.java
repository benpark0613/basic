package example_09_27_interface;

public class 마티즈 implements 경차 {

	@Override
	public void 출발기능() {
		System.out.println("자동차를 출발시킵니다.");
	}

	@Override
	public void 정지기능() {
		System.out.println("자동차를 정지시킵니다.");
	}

	@Override
	public void 운전기능() {
		System.out.println("자동차를 운전합니다.");		
	}

	@Override
	public void 속도변경기능() {
		System.out.println("자동차의 속도를 변경합니다.");
	}

}
