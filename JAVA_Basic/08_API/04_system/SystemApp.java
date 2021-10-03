package example_10_01_system;

import java.io.IOException;

public class SystemApp {

	public static void main(String[] args) throws IOException {
		
		System.out.println(System.err);
		System.out.println(System.in);
		System.out.println(System.out);
		
		// 아래의 수행문을 실행하면 출력결과가 매번 다르게 출력된다.
		// System.err가 사용하는 출력객체와 System.out이 사용하는 출력객체가 서로 다른 객체기 때문에
		// 각각 다른 전송통로로 메세지를 보내기 때문에 어떤 메세지가 먼저 출력될 지 매번 변하게 된다.
		// 따라서, 어떤 메세지가 먼저 출력될 지 매번 변하게 된다.
		System.err.println("표준 에러출력장치로 오류 메세지를 출력하자");
		System.err.println("표준 에러출력장치로 오류 메세지를 출력하자");
		System.out.println("표준 출력장치로 메세지를 출력하자");
		System.err.println("표준 에러출력장치로 오류 메세지를 출력하자");
		System.err.println("표준 에러출력장치로 오류 메세지를 출력하자");
		
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		
		System.out.println("표준 입력장치로부터 입력을 읽어보자");
		System.out.print("입력해보세요:");
		int value = System.in.read();
		System.out.println(value);
		System.out.println((char)value);
	}
}
