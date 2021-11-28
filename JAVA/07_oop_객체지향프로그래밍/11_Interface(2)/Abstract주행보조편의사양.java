package example_09_27_interface;

public abstract class Abstract주행보조편의사양 implements 주행보조편의사양 {

	@Override
	public void 차선유지기능() {
		System.out.println("주행 중 자동으로 차선을 유지시킵니다.");
	}
	
	@Override
	public void 차선자동변경기능() {
		System.out.println("주행 중 자동으로 변경하려는 차선으로 이동합니다.");
	}
	
	@Override
	public void 차간거리유지기능() {
		System.out.println("주행중 자동으로 앞차와의 간격을 유지합니다.");
	}
	
	@Override
	public void 자동추차기능() {
		System.out.println("운전자 개입없이 자동으로 차를 주차시킵니다.");
	}
}
