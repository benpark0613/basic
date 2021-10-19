package example_09_13_modifier.sub;

import example_09_13_modifier.Sample1;

// Sample4는 Sample1의 자식 클래스다.
public class Sample4 extends Sample1 {
	
	public void method() {
		a = 10;		// 사용가능
		b = 10;		// 사용가능
//		c = 10;		// 사용불가, 같은 패키지에서만 접근가능
//		d = 10;		// 사용불가, 
		
	}
}
