package example_09_10_static;

public class Circle {

	static final double PI = 3.141592;	// 정적변수, 클래스변수, 상수
	double r;	// 멤버변수, 인스턴스변수, 객체의 프로퍼티(Property)
	
	Circle() {}
	Circle(double r) {
		this.r = r;
	}
	
	double getArea() {
		return Circle.PI*r*r;
	}
	
	double getRoundLength() {
		return 2*Circle.PI*r;
	}
}
