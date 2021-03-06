package example_09_23_Interface;

public class Company {

	// Company객체가 사용할 Reporter 구현객체를 참조하는 멤버변수 선언
	// * Company객체는 Reporter 인터페이스를 구현한 구현클래스로 만들어진 객체만 사용할 것이다.
	// * Company객체는 Reporter 인터페이스를 구현한 다양한 객체를 사용할 것이다.
	private Reporter reporter;
	
	// Reporter 인터페이스를 구현한 객체를 전달받는 setter 메소드를 정의
	// * Reporter 인터페이스를 구현한 객체만 전달받아서 멤버변수 reporter에 대입하는 setter메소드다.
	public void setReporter(Reporter reporter) {
		this.reporter = reporter;
	}
	
	// 부서별 총매출액과 영업이익을 리포트로 출력하는 기능
	public void displayCompanyEarnings() {
		reporter.printReport();
	}
}
