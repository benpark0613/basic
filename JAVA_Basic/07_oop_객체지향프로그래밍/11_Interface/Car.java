package example_09_23_Interface;

/**
 * 모든 자동차 객체가 반드시 포함할 기능을 정의하는 인터페이스다.<br/>
 * 모든 자동차는 출발, 정지, 속도변경, 속도조회 기능이 있어야 한다.
 * @author 박성근
 *
 */
public interface Car {

	// 상수 정의하기
	// * 상수는 변하지 않는 값의 저장소다.
	// * 상수는 public static final 키워드를 포함한다.
	// * 상수의 이름은 전부 대문자로 쓰고, 두 단어 이상일 때는 _를 중간에 삽입한다.
	// * 인터페이스에서는 public static final을 생략할 수 있다.
	public static final int MIN_SPEED = 0;
	/*public static final*/ int MAX_SPEED = 200;
	
	// 구현부가 없는 추상메소드 정의하기
	// * 이 인터페이스를 구현하는 구현클래스가 반드시 재정의할 기능을 추상메소드로 정의한다.
	// * 추상메소드는 구현부가 없는 메소드다
	// * 추상메소드는 abstract 키워드를 포함해야 한다.
	// * 인터페이스에서는 public abstract를 생략할 수 있다.
	public abstract void start();
	public abstract void stop();
	/* public abstract */ void speedUp();
	/* public abstract */ void speedDown();
	/* public abstract */ int getCurrentSpeed();
}
