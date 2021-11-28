package example_09_24_abstract_template;

public abstract class AbstractBankingJob {

	// 전처리 작업 구현
	private void before() {
		System.out.println("은행 전산망과 연결한다.");
		System.out.println("암호화 통신 채널을 연다.");
	}
	
	// 후처리 작업 구현
	private void after() {
		System.out.println("암호화 통신 채널을 닫는다.");
		System.out.println("은행 전산망과 연결을 끊는다.");
	}
	
	// 본작업을 추상화하기
	public abstract void job();
	
	// 전처리 > 본작업 > 후처리 순서로 실행하기
	public void process() {
		before();
		job();
		after();
	}
}
