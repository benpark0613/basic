package example_10_14_writer;

import java.io.IOException;
import java.io.PrintWriter;

public class PrintWriterExample2 {

	public static void main(String[] args) {
		
		/*
		 * PrintWriter
		 * 	- 텍스트를 출력하는 객체다.
		 * 	- 중복정의된 println(값) 메소드를 가지고 있다. println메소드는 줄바꿈 문자를 자동으로 추가한다.
		 * 	- csv 데이터를 기록할 때 유용하다.
		 */
		try {
			PrintWriter writer = new PrintWriter("c:/temp/doc/example2.txt");
			writer.println("홍길동,100,80,70");
			writer.println("김유신,100,80,70");
			writer.println("강감찬,100,80,70");
			writer.println("박술희,100,80,70");
			writer.println("왕건,100,80,70");
			
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
