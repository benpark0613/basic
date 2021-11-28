package example_09_15_override;

public class Iphone extends Phone {

	// Phone의 on() 메소드에는 전원버튼을 눌러서 화면을 켜지만, Iphone에서는 사용자 얼굴을 인식해서 화면을 켠다.
	// 따라서, Phone으로부터 물려받은 on() 메소드의 기능이 최신 Iphone객체에는 맞지 않는다.
	// Iphone 클래스에서는 Phone의 on() 메소드를 얼굴인식으로 화면이 켜지도록 on() 메소드를 재정의 해야 한다.
	
	/*
	 * @Override
	 * 		- 어노테이션이라고 부른다.
	 * 		- 클래스, 클래스의 각 구성요소(변수, 생성자, 메소드)에 부착할 수 있다.
	 * 		- 각각의 어노테이션은 그 어노테이션이 어느 시점까지 남아있는 지를 지정할 수 있다.
	 * 		- 각각의 어노테이션은 IDE, 컴파일러, 프로그램, 라이브러리, 프레임워크 등에게 
	 *        부가적인 정보를 제공할 목적으로 사용한다.
	 */
	@Override
	public void on() {
		System.out.println("페이스 아이디를 이용해서 얼굴인식으로 화면을 켭니다.");
	}
}
