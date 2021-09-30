package example_09_27_interface;

public abstract class 고급차 extends Abstract주행보조편의사양 implements 차, 기본편의사양, 고급사양 {

	@Override
	public void 에어콘기능() {
		System.out.println("고급차는 풀오토 에어콘 기능을 지원합니다.");
	}
}
